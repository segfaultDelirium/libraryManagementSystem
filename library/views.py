# Create your views here.
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import redirect

import psycopg2
from .commonFunctions import *

def index(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    sessionUser = request.session['user_login']
    context = {'sessionUser': sessionUser}
    if sessionUser == 'admin':
        context['isAdmin'] = True
    template = loader.get_template('library/index.html')
    return HttpResponse(template.render(context, request))
    # return HttpResponse("Hello, world. You're at the library index.")

def v1(request):
    return HttpResponse("view 1")


def viewCoutriesFromDatabase(request):
    if not isUserLoggedIn(request): return redirect('/login/')
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

def viewLibrarians(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute("select imie, nazwisko, email, aktywny from public.bibliotekarz;")
    result = cursor.fetchall()
    print(result)
    conn.close()
    context['librarians'] = result
    template = loader.get_template('library/show-librarians.html')
    return HttpResponse(template.render(context, request))

def viewReaders(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute("select imie, nazwisko, email, aktywny from public.czytelnik;")
    result = cursor.fetchall()
    print(result)
    conn.close()
    context['readers'] = result
    template = loader.get_template('library/show-readers.html')
    return HttpResponse(template.render(context, request))


def books(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    sessionUser = request.session['user_login']
    context = {'sessionUser': sessionUser}
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
    context['categories'] = categories
    template = loader.get_template('library/books.html')
    return HttpResponse(template.render(context, request))

def booksInCategory(request, booksCategory):
    if not isUserLoggedIn(request): return redirect('/login/')
    sessionUser = request.session['user_login']
    context = {'sessionUser': sessionUser}
    print(booksCategory)
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute("select kategoria from public.kategoria")
    result = cursor.fetchall()
    # print(result)
    categories = [row[0] for row in result]
    categoryid = 1
    try:
        categoryid = categories.index(booksCategory) + 2
    except ValueError:
        # print('there is no such book category as ', booksCategory)
        conn.close()
        context = {'message': f'nie ma takiej kategorii {booksCategory}'}
        template = loader.get_template('library/books.html')
        return HttpResponse(template.render(context, request))
    cursor.execute(
        """prepare plan(int) as 
        select ksiazka_id, tytul, cena, imie, nazwisko from ksiazka 
                join ksiazka_kategoria using(ksiazka_id)
                join ksiazka_autor using(ksiazka_id)
                join autor using(autor_id)
                where kategoria_id = $1;""")
    cursor.execute(f"""execute plan('{categoryid}');""")

    booksList = cursor.fetchall()
    conn.close()
    if booksList == []:
        print("nie ma ksiazek w tej kategorii")
        context['message'] = "nie ma ksiazek w tej kategorii"
    else:
        print(f'wyswietlanie ksiazek z kategorii{booksCategory}')
        context['message'] = f'wyswietlanie ksiazek z kategorii {booksCategory}'
    # print(booksList)
    context['booksList'] = booksList
    template = loader.get_template('library/books.html')
    return HttpResponse(template.render(context, request))