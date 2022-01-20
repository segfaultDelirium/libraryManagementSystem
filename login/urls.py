from django.urls import path

from . import views

urlpatterns = [
    path('', views.login, name='index'),
    path('asReader/', views.loginAsReader, name='as-reader'),
    path('asLibrarian/', views.loginAsLibrarian, name='as-librarian'),
]