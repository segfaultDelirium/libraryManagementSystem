from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('countries/', views.viewCoutriesFromDatabase, name='countries'),
    path('books/', views.books, name='books'),
    path('books/category/<booksCategory>/', views.booksInCategory, name='bio'),
    path('librarians/', views.viewLibrarians, name='view-librarians'),
    path('readers/', views.viewReaders, name='view-readers'),
    path('reader/delete/<int:reader_id>/', views.readerDelete, name='reader'),
    path('books/<int:book_id>/', views.lendBook, name='lend-book'),
]