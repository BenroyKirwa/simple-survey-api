from django.urls import path, include
from rest_framework.routers import DefaultRouter
from django.conf import settings
from django.conf.urls.static import static
from . import views
from .views import SurveyViewSet, QuestionViewSet, OptionViewSet, ResponseViewSet, ResponseDetailViewSet, CertificateViewSet

# API routers
router = DefaultRouter()
router.register(r'surveys', SurveyViewSet)
router.register(r'questions', QuestionViewSet)
router.register(r'options', OptionViewSet)
router.register(r'responses', ResponseViewSet)
router.register(r'response-details', ResponseDetailViewSet)
router.register(r'certificates', CertificateViewSet)

urlpatterns = [
    # API endpoints
    path('api/', include(router.urls)),
    
    # Frontend views
    path('', views.home, name='home'),
    path('login/', views.login_view, name='login'),
    path('signup/', views.signup, name='signup'),
    path('logout/', views.logout_view, name='logout'),
   
    # Survey related paths
    path('surveys/', views.survey_list, name='survey_list'),
    path('surveys/<int:survey_id>/', views.survey_detail, name='survey_detail'),
    path('surveys/<int:survey_id>/submit/', views.submit_survey, name='submit_survey'),
    path('responses/', views.survey_responses, name='survey_responses'),
]

# Add media URLs in debug mode
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)