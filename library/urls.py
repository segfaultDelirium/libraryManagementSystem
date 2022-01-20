from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('view1/', views.v1, name='view1'),
    path('countries/', views.viewCoutriesFromDatabase, name='countries'),
    path('books/', views.books, name='books'),
    path('books/category/<booksCategory>/', views.booksInCategory, name='bio'),
    path('librarians/', views.viewLibrarians, name='view-librarians'),
    path('readers/', views.viewReaders, name='view-readers'),
]