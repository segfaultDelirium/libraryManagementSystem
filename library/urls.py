from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('view1/', views.v1, name='view1'),
    path('countries/', views.viewCoutriesFromDatabase, name='countries'),
]