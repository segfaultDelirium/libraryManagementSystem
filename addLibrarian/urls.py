from django.urls import path

from . import views

urlpatterns = [
    path('new-librarian/', views.addNewLibrarian, name='addNewLibrarian'),
    path('new-reader/', views.addNewReader, name='addNewReader'),
]