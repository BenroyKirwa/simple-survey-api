from django import forms
from django.contrib import admin
from .models import Survey, Question, Option, Response, ResponseDetail, Certificate

class OptionInline(admin.TabularInline):
    model = Option
    extra = 1  # Show 1 empty option row by default
    show_change_link = True  # Link to edit options

    # Remove the restriction of only one option
    def has_add_permission(self, request, obj=None):
        return True  # Allow adding more than one option


class QuestionInline(admin.TabularInline):
    model = Question
    extra = 1  # Show 1 empty question row by default
    inlines = [OptionInline]

    def get_form(self, request, obj=None, **kwargs):
        """
        Override to dynamically show or hide the options field based on the question type.
        """
        form = super().get_form(request, obj, **kwargs)

        if obj and obj.type != 'choice':
            # Hide options if the question type is not 'choice'
            form.base_fields['options'].widget = forms.HiddenInput()
        else:
            # Otherwise, show the options field
            form.base_fields['options'].widget = forms.SelectMultiple()

        return form


class SurveyAdmin(admin.ModelAdmin):
    inlines = [QuestionInline]
    list_display = ('title', 'description')
    search_fields = ('title',)

admin.site.register(Survey, SurveyAdmin)
admin.site.register(Question)
admin.site.register(Option)
admin.site.register(Response)
admin.site.register(ResponseDetail)
admin.site.register(Certificate)
