from rest_framework import serializers
from .models import Survey, Question, Option, Response, ResponseDetail, Certificate

class OptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Option
        fields = ['option_text', 'is_multiple']

class QuestionSerializer(serializers.ModelSerializer):
    options = OptionSerializer(many=True)  # Embed options within each question

    class Meta:
        model = Question
        fields = ['id', 'question_text', 'type', 'is_required', 'description', 'options']

class SurveySerializer(serializers.ModelSerializer):
    questions = QuestionSerializer(many=True, read_only=True)  # Embed questions within each survey

    class Meta:
        model = Survey
        fields = ['id', 'title', 'description', 'questions']

class ResponseDetailSerializer(serializers.ModelSerializer):
    question = serializers.StringRelatedField()  # Show question text in response details
    answer_option = serializers.StringRelatedField()  # Show option text if an option is selected

    class Meta:
        model = ResponseDetail
        fields = ['question', 'answer_text', 'answer_option']  # Use correct field names

class ResponseSerializer(serializers.ModelSerializer):
    details = ResponseDetailSerializer(many=True, read_only=True)  # Embed ResponseDetails within each Response
    survey = serializers.StringRelatedField()  # Show survey title in response

    class Meta:
        model = Response
        fields = ['id', 'survey', 'submitted_at', 'details']  # Use appropriate fields from the model

class CertificateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Certificate
        fields = ['id', 'file_upload', 'uploaded_at']  # Use correct field names from model
