from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import redirect

import psycopg2

# conn = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
#                               'Server=DESKTOP-D0VHNET;'
#                               'Database=SQL_tutorial;'
#                               'UID=admin;PWD=EVEXlD6bggamLr3LXSymLHtF;'
#                               'Trusted_Connection=yes;', timeout=3)
import login.views

def isUserLoggedIn(request):
    try:
        sessionUser = request.session['user_login']
        return True
    except:
        return False

def index(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    sessionUser = request.session['user_login']
    context = {'sessionUser': sessionUser}
    template = loader.get_template('library/index.html')
    return HttpResponse(template.render(context, request))
    return HttpResponse("Hello, world. You're at the library index.")

def v1(request):
    return HttpResponse("view 1")

def viewCoutriesFromDatabase(request):
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute("select kraj from public.kraj")
    result = cursor.fetchall()
    print(result)
    countries = [row[0] for row in result]
    print(countries)
    conn.close()
    context = {'countries' : countries}
    template = loader.get_template('library/countries.html')
    return HttpResponse(template.render(context, request))
    # return HttpResponse("viewing countries:")

def books(request):
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute("select kategoria from public.kategoria")
    result = cursor.fetchall()
    print(result)
    categories = [row[0] for row in result]
    categories.sort()
    print(categories)
    conn.close()
    context = {'categories': categories}
    template = loader.get_template('library/books.html')
    return HttpResponse(template.render(context, request))

def booksInCategory(request, booksCategory):
    print(booksCategory)
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    # TODO select all books from this category
    # cursor.execute("select kategoria from public.kategoria")
    # result = cursor.fetchall()
    # print(result)
    # categories = [row[0] for row in result]
    # categories.sort()
    # print(categories)
    conn.close()

    context = {}
    template = loader.get_template('library/books.html')
    return HttpResponse(template.render(context, request))