# Create your views here.
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import redirect

import psycopg2
from .commonFunctions import *

def index(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    template = loader.get_template('library/index.html')
    return HttpResponse(template.render(context, request))

def viewCoutriesFromDatabase(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
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
    context['countries'] = countries
    template = loader.get_template('library/countries.html')
    return HttpResponse(template.render(context, request))

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
    context['readers'] = getReadersAsJson()
    template = loader.get_template('library/show-readers.html')
    return HttpResponse(template.render(context, request))

def getReadersAsJson():
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute("select czytelnik_id, imie, nazwisko, email, aktywny from public.czytelnik;")
    values = cursor.fetchall()
    valuesAsStringLists = convertTupleListToStringList(values)
    keys = ['czytelnik_id', 'imie', 'nazwisko', 'email', 'aktywny']
    jsonObj = jsonFromKeysAndStringLists(keys, valuesAsStringLists)
    conn.close()
    return jsonObj

def readerDelete(request, reader_id):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute("""prepare deleteReader(int) as
    delete from czytelnik where czytelnik_id = $1; 
    """)
    cursor.execute(f"""execute deleteReader('{reader_id}');""")
    if cursor.statusmessage == "DELETE 1": context['message'] = f"czytelnik o id = {reader_id} zostal usuniety"
    else: context['message'] = f"nie udalo sie usunac czytelnika o id = {reader_id}"
    conn.commit()
    conn.close()

    context['readers'] = getReadersAsJson()

    template = loader.get_template('library/show-readers.html')
    return HttpResponse(template.render(context, request))

def books(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
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
    context = {}
    addRolesToContext(request, context)
    print(booksCategory)
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute("select kategoria from public.kategoria")
    result = cursor.fetchall()
    categories = [row[0] for row in result]
    try:
        categoryid = categories.index(booksCategory) + 2
    except ValueError:
        conn.close()
        context['message'] = f'nie ma takiej kategorii {booksCategory}'
        template = loader.get_template('library/books.html')
        return HttpResponse(template.render(context, request))
    booksList = getBooksAsJson(categoryid)
    print(booksList)

    conn.close()
    if booksList == []:
        print("nie ma ksiazek w tej kategorii")
        context['message'] = "nie ma ksiazek w tej kategorii"
    else:
        print(f'wyswietlanie ksiazek z kategorii{booksCategory}')
        context['message'] = f'wyswietlanie ksiazek z kategorii {booksCategory}'
    context['booksList'] = booksList
    template = loader.get_template('library/books.html')
    return HttpResponse(template.render(context, request))

def getBooksAsJson(category_id):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(
        """prepare plan(int) as 
        select ksiazka_id, tytul, opis, data_wydania, czas_wypozyczenia_dni, ilosc_stron, cena, ocena, imie, nazwisko from ksiazka 
                join ksiazka_kategoria using(ksiazka_id)
                join ksiazka_autor using(ksiazka_id)
                join autor using(autor_id)
                where kategoria_id = $1;""")
    cursor.execute(f"""execute plan('{category_id}');""")
    values = cursor.fetchall()
    valuesAsStringLists = convertTupleListToStringList(values)
    keys = ['ksiazka_id', 'tytul', 'opis', 'data_wydania', 'czas_wypozyczenia_dni', 'ilosc_stron', 'cena', 'ocena', 'imie', 'nazwisko']
    jsonObj = jsonFromKeysAndStringLists(keys, valuesAsStringLists)
    conn.close()
    return jsonObj

def lendBook(request, book_id):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    conn = connectToDB()
    cursor = conn.cursor()

    if request.method == "POST":
        print('request was post')
        requestData = request.POST
        print(requestData)


    cursor.execute(
        """prepare plan(int) as 
        select ksiazka_id, tytul, opis, data_wydania, czas_wypozyczenia_dni, ilosc_stron, cena, ocena, imie, nazwisko from ksiazka 
                join ksiazka_kategoria using(ksiazka_id)
                join ksiazka_autor using(ksiazka_id)
                join autor using(autor_id)
                where ksiazka_id = $1;""")
    cursor.execute(f"""execute plan('{book_id}');""")
    values = cursor.fetchall()
    book = convertTupleListToStringList(values)
    keys = ['ksiazka_id', 'tytul', 'opis', 'data_wydania', 'czas_wypozyczenia_dni', 'ilosc_stron', 'cena', 'ocena', 'imie', 'nazwisko']
    book = jsonFromKeysAndStringList(keys, book[0])
    context['book'] = book

    cursor.execute("""select czytelnik_id, imie, nazwisko, email, login from czytelnik where aktywny = true""")
    czytelnicy = cursor.fetchall()
    keys = ['czytelnik_id', 'imie', 'nazwisko', 'email', 'login']
    czytelnicy = jsonFromKeysAndStringLists(keys, convertTupleListToStringList(czytelnicy))
    context['czytelnicy'] = czytelnicy
    conn.close()
    template = loader.get_template('library/lend-book.html')
    return HttpResponse(template.render(context, request))
