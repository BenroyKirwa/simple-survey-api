from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Survey(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.title

class Question(models.Model):
    SURVEY_TYPES = [
        ('short_text', 'Short Text'),
        ('long_text', 'Long Text'),
        ('choice', 'Choice'),
        ('file', 'File Upload'),
    ]

    survey = models.ForeignKey(Survey, on_delete=models.CASCADE, related_name="questions")
    question_text = models.TextField()
    type = models.CharField(max_length=50, choices=SURVEY_TYPES)  # Dropdown of available question types
    is_required = models.BooleanField(default=True)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.question_text


class Option(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE, related_name="options")
    option_text = models.CharField(max_length=100)
    is_multiple = models.BooleanField(default=False)

    def __str__(self):
        return self.option_text
    

class Response(models.Model):
    survey = models.ForeignKey(Survey, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    submitted_at = models.DateTimeField(auto_now_add=True)


class ResponseDetail(models.Model):
    response = models.ForeignKey(Response, related_name="details", on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    answer_text = models.TextField(blank=True, null=True)
    answer_option = models.ForeignKey(Option, on_delete=models.SET_NULL, null=True, blank=True)


class Certificate(models.Model):
    response = models.ForeignKey(Response, on_delete=models.CASCADE, related_name='certificates')
    question = models.ForeignKey('Question', on_delete=models.CASCADE, null=True, blank=True)
    file_upload = models.FileField(upload_to='certificates/', null=True, blank=True)
    uploaded_at = models.DateTimeField(auto_now_add=True)
