from rest_framework import viewsets
from .models import Survey, Question, Option, Response, ResponseDetail, Certificate
from .serializers import SurveySerializer, QuestionSerializer, OptionSerializer, ResponseSerializer, ResponseDetailSerializer, CertificateSerializer
from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
# from .forms import ResponseForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.urls import reverse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.files.storage import default_storage
import os
from django.db import transaction

# Create your views here.


class SurveyViewSet(viewsets.ModelViewSet):
    queryset = Survey.objects.all()
    serializer_class = SurveySerializer

class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer

class OptionViewSet(viewsets.ModelViewSet):
    queryset = Option.objects.all()
    serializer_class = OptionSerializer

class ResponseViewSet(viewsets.ModelViewSet):
    queryset = Response.objects.all()
    serializer_class = ResponseSerializer

class ResponseDetailViewSet(viewsets.ModelViewSet):
    queryset = ResponseDetail.objects.all()
    serializer_class = ResponseDetailSerializer

class CertificateViewSet(viewsets.ModelViewSet):
    queryset = Certificate.objects.all()
    serializer_class = CertificateSerializer



# View to display all surveys
def survey_list(request):
    surveys = Survey.objects.all()
    return render(request, 'survey/survey_list.html', {'surveys': surveys})

# View to display the questions of a specific survey
def survey_detail(request, survey_id):
    survey = get_object_or_404(Survey, id=survey_id)
    questions = survey.questions.all()
    
    # Check if user has already submitted this survey
    if Response.objects.filter(survey=survey, user=request.user).exists():
        return render(request, 'survey/survey_detail.html', {
            'survey': survey,
            'already_submitted': True
        })
    
    page = request.GET.get('page', 1)
    
    # Handle summary page
    if str(page) == 'summary':
        stored_answers = request.session.get(f'survey_{survey_id}_answers', {})
        
        question_answers = {}
        for question in questions:
            if str(question.id) in stored_answers:
                answer_data = stored_answers[str(question.id)]
                # If it's a file upload, get the stored filename
                if isinstance(answer_data, dict) and 'type' in answer_data and answer_data['type'] == 'file':
                    question_answers[question.id] = {
                        'type': 'file',
                        'filename': answer_data.get('filename')
                    }
                else:
                    question_answers[question.id] = answer_data
        
        return render(request, 'survey/survey_summary.html', {
            'survey': survey,
            'questions': questions,
            'question_answers': question_answers
        })
    
    try:
        page_number = int(page)
    except (TypeError, ValueError):
        page_number = 1
    
    paginator = Paginator(questions, 1)
    
    try:
        page_obj = paginator.page(page_number)
    except:
        page_obj = paginator.page(1)
    
    # Handle form submission
    if request.method == 'POST':
        current_question = page_obj.object_list[0]
        
        # Handle file upload for certificate type questions
        if current_question.type == 'file' and request.FILES.get('certificate'):
            certificate_file = request.FILES['certificate']
            
            # Generate a unique temporary path for the file
            temp_path = f'temp_certificates/user_{request.user.id}/survey_{survey_id}/{certificate_file.name}'
            
            # Save the file to temporary storage
            if default_storage.exists(temp_path):
                default_storage.delete(temp_path)
            default_storage.save(temp_path, certificate_file)
            
            # Store the file path and metadata in session
            survey_answers = request.session.get(f'survey_{survey_id}_answers', {})
            survey_answers[str(current_question.id)] = {
                'type': 'file',
                'filename': certificate_file.name,
                'temp_path': temp_path
            }
            request.session[f'survey_{survey_id}_answers'] = survey_answers
        else:
            answer = request.POST.get('answer', '')
            survey_answers = request.session.get(f'survey_{survey_id}_answers', {})
            survey_answers[str(current_question.id)] = answer
            request.session[f'survey_{survey_id}_answers'] = survey_answers
        
        request.session.modified = True
        
        # Handle navigation
        if 'next' in request.POST:
            if page_obj.has_next():
                return redirect(f"{reverse('survey_detail', args=[survey_id])}?page={page_obj.next_page_number()}")
            else:
                return redirect(f"{reverse('survey_detail', args=[survey_id])}?page=summary")
        elif 'prev' in request.POST and page_obj.has_previous():
            return redirect(f"{reverse('survey_detail', args=[survey_id])}?page={page_obj.previous_page_number()}")
    
    # Get stored answer for current question if it exists
    stored_answers = request.session.get(f'survey_{survey_id}_answers', {})
    current_question_id = str(page_obj.object_list[0].id)
    stored_answer = stored_answers.get(current_question_id, '')
    
    return render(request, 'survey/survey_detail.html', {
        'survey': survey,
        'page_obj': page_obj,
        'stored_answer': stored_answer,
        'question': page_obj.object_list[0],
    })

@login_required
def submit_survey(request, survey_id):
    survey = get_object_or_404(Survey, id=survey_id)
    
    # Check if user has already submitted this survey
    if Response.objects.filter(survey=survey, user=request.user).exists():
        messages.warning(request, 'You have already submitted this survey.')
        return redirect('survey_list')
    
    if request.method == "POST":
        try:
            with transaction.atomic():  # Use transaction to ensure data consistency
                # Create the main response
                response = Response.objects.create(
                    survey=survey,
                    user=request.user
                )
                
                # Get stored answers from session
                stored_answers = request.session.get(f'survey_{survey_id}_answers', {})
                temp_files_to_delete = []  # Track temporary files for cleanup
                
                # Process each question and save responses
                for question in survey.questions.all():
                    answer_data = stored_answers.get(str(question.id))
                    
                    if not answer_data and question.is_required:
                        raise ValueError(f"Required question '{question.question_text}' was not answered.")
                    
                    if question.type == 'file':
                        if isinstance(answer_data, dict) and answer_data.get('type') == 'file':
                            temp_path = answer_data.get('temp_path')
                            if temp_path and default_storage.exists(temp_path):
                                try:
                                    # Create the certificate entry
                                    with default_storage.open(temp_path, 'rb') as temp_file:
                                        certificate = Certificate.objects.create(
                                            response=response,
                                            question=question
                                        )
                                        # Save the file to its permanent location
                                        certificate.file_upload.save(
                                            answer_data['filename'],
                                            temp_file
                                        )
                                    
                                    # Create response detail for the file upload
                                    ResponseDetail.objects.create(
                                        response=response,
                                        question=question,
                                        answer_text=f"File uploaded: {answer_data['filename']}"
                                    )
                                    
                                    # Mark temp file for deletion
                                    temp_files_to_delete.append(temp_path)
                                except Exception as e:
                                    raise ValueError(f"Error processing file upload for question '{question.question_text}': {str(e)}")
                            else:
                                raise ValueError(f"File upload not found for question '{question.question_text}'")
                                
                    elif question.type == 'choice':
                        if answer_data:
                            try:
                                option = Option.objects.get(id=answer_data)
                                ResponseDetail.objects.create(
                                    response=response,
                                    question=question,
                                    answer_option=option,
                                    answer_text=option.option_text
                                )
                            except Option.DoesNotExist:
                                raise ValueError(f"Invalid option selected for question '{question.question_text}'")
                        elif question.is_required:
                            raise ValueError(f"Required question '{question.question_text}' was not answered.")
                    
                    else:
                        # Handle other question types (text, etc.)
                        if answer_data or question.is_required:
                            ResponseDetail.objects.create(
                                response=response,
                                question=question,
                                answer_text=answer_data if answer_data else ''
                            )
                
                # Clean up temporary files
                for temp_path in temp_files_to_delete:
                    try:
                        if default_storage.exists(temp_path):
                            default_storage.delete(temp_path)
                    except Exception as e:
                        # Log the error but don't fail the submission
                        print(f"Error deleting temporary file {temp_path}: {str(e)}")
                
                # Clear session data for this survey
                keys_to_delete = [key for key in request.session.keys() 
                                if key.startswith(f'survey_{survey_id}')]
                for key in keys_to_delete:
                    del request.session[key]
                
                messages.success(request, 'Survey submitted successfully!')
                return redirect('survey_list')
                
        except ValueError as e:
            # Handle validation errors
            messages.error(request, str(e))
            return redirect(f"{reverse('survey_detail', args=[survey_id])}?page=summary")
        except Exception as e:
            # Handle unexpected errors
            messages.error(request, f"An error occurred while submitting the survey: {str(e)}")
            return redirect(f"{reverse('survey_detail', args=[survey_id])}?page=summary")
    
    return redirect('survey_detail', survey_id=survey_id)

# View to display all responses for all surveys
@login_required
def survey_responses(request):
    # Get all responses for the logged-in user
    responses = Response.objects.filter(
        user=request.user
    ).select_related(
        'survey'
    ).prefetch_related(
        'details__question',
        'details__answer_option',
        'certificates'
    ).order_by('-submitted_at')
    
    # Paginate - show one response per page
    paginator = Paginator(responses, 1)
    page_number = request.GET.get('page', 1)
    
    try:
        page_obj = paginator.page(page_number)
    except (PageNotAnInteger, EmptyPage):
        page_obj = paginator.page(1)
    
    return render(request, 'survey/survey_responses.html', {
        'page_obj': page_obj,
    })


# Home page view
def home(request):
    return render(request, 'survey/home.html')  # Render the home page template

# Login view
def login_view(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('survey_list')  # Redirect to survey list after successful login
        else:
            # Invalid credentials, re-render login page with error
            return render(request, 'login.html', {'error': 'Invalid credentials'})
    return render(request, 'survey/login.html')  # GET method

# Signup view
def signup(request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')  # Redirect to login page after successful signup
    else:
        form = UserCreationForm()
    return render(request, 'survey/signup.html', {'form': form})



# Logout view
def logout_view(request):
    logout(request)
    return redirect('home')  # Redirect to home after logout
