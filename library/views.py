# Create your views here.
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import redirect
from .commonFunctions import *
import datetime


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
    conn = connectToDB()
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
    result = getLibrariansAsJson()
    print(result)
    context['librarians'] = result
    template = loader.get_template('library/show-librarians.html')
    return HttpResponse(template.render(context, request))

def getLibrariansAsJson():
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(
        "select bibliotekarz_id, imie, nazwisko, email, telefon, aktywny, login, biblioteka_id, miejscowosc  from bibliotekarz join biblioteka_bibliotekarz using(bibliotekarz_id) join biblioteka using(biblioteka_id) join adres on biblioteka.adres_id = adres.adres_id join miejscowosc using(miejscowosc_id)")
    values = cursor.fetchall()
    valuesAsStringLists = convertTupleListToStringList(values)
    keys = ['bibliotekarz_id', 'imie', 'nazwisko', 'email', 'telefon', 'aktywny', 'login', 'biblioteka_id',
            'miejscowosc']
    jsonObj = jsonFromKeysAndStringLists(keys, valuesAsStringLists)
    conn.close()
    return jsonObj

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
    if not context['isLibrarian'] and not context['isAdmin']: return redirect('/index/')
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute("""prepare deleteReader(int) as
    delete from czytelnik where czytelnik_id = $1; 
    """)
    cursor.execute(f"""execute deleteReader('{reader_id}');""")
    if cursor.statusmessage == "DELETE 1":
        context['message'] = f"czytelnik o id = {reader_id} zostal usuniety"
    else:
        context['message'] = f"nie udalo sie usunac czytelnika o id = {reader_id}"
    conn.commit()
    conn.close()
    context['readers'] = getReadersAsJson()
    template = loader.get_template('library/show-readers.html')
    return HttpResponse(template.render(context, request))

def books(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute("select kategoria, count(ksiazka_id) as amount from kategoria join ksiazka_kategoria using(kategoria_id) join ksiazka using(ksiazka_id) group by kategoria_id order by kategoria")
    result = cursor.fetchall()
    print(result)
    categories = [{'category_name': row[0], 'book_amount': row[1] } for row in result]
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
        select * from ksiazkaInfo
                where kategoria_id = $1;""")
    cursor.execute(f"""execute plan('{category_id}');""")
    values = cursor.fetchall()
    valuesAsStringLists = convertTupleListToStringList(values)
    keys = [ 'niedostepna', 'kategoria_id', 'ksiazka_id', 'tytul', 'opis', 'data_wydania', 'czas_wypozyczenia_dni', 'ilosc_stron', 'cena', 'ocena',
            'imie', 'nazwisko', 'biblioteka_id']
    jsonObj = jsonFromKeysAndStringLists(keys, valuesAsStringLists)
    conn.close()
    return jsonObj

def getInwentarzId(book_id, biblioteka_id):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(
        """prepare plan(int, int) as 
        select inwentarz_id from inwentarz
        where ksiazka_id = $1
        and biblioteka_id = $2;""")
    cursor.execute(f"""execute plan('{book_id}', '{biblioteka_id}');""")
    inwentarzId = cursor.fetchone()
    if inwentarzId == None:
        conn.close()
        return -1
    print(inwentarzId)
    conn.close()
    return inwentarzId[0]

def getBibliotekarzId(login):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(f"select bibliotekarz_id from bibliotekarz where login = '{login}'")
    bibliotekarz_id = cursor.fetchone()
    if bibliotekarz_id == None:
        conn.close()
        return -1
    conn.close()
    return bibliotekarz_id[0]

def getBiliotekaIdFromLogin(login):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(f"""select biblioteka_id from bibliotekarz
    join biblioteka_bibliotekarz using(bibliotekarz_id) 
    join biblioteka using(biblioteka_id) where login = '{login}';
        """)
    biblioteka_id = cursor.fetchone()[0]
    conn.close()
    return biblioteka_id

def lendBookPost(request, book_id, context ):
    print('request was post')
    requestData = request.POST
    czytelnik_id = requestData['czytelnik_id']
    print(czytelnik_id)
    bibliotekarz_id = getBibliotekarzId(context['sessionUser'])
    print(bibliotekarz_id)
    if bibliotekarz_id == -1:
        context['message'] = "bibliotekarz o takim id nie istnieje"
        return -1
    biblioteka_id = getBiliotekaIdFromLogin(context['sessionUser'])
    print(f'biblioteka id = {biblioteka_id}')
    inwentarz_id = getInwentarzId(book_id, biblioteka_id)
    print(f'{inwentarz_id=}')
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(f"""insert into wypozyczenie (data_wypozyczenia, czytelnik_id, bibliotekarz_id, inwentarz_id) values
    (CURRENT_DATE, {czytelnik_id}, {bibliotekarz_id}, {inwentarz_id});
    """)
    conn.commit()
    conn.close()
    return 0
def getBookDetails(book_id):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(
        """prepare plan(int) as 
        select ksiazka_id, tytul, opis, data_wydania, czas_wypozyczenia_dni, ilosc_stron, cena, ocena, imie, nazwisko, kategoria from ksiazka 
                join ksiazka_kategoria using(ksiazka_id)
                join kategoria using(kategoria_id)
                join ksiazka_autor using(ksiazka_id)
                join autor using(autor_id)
                where ksiazka_id = $1""")
    cursor.execute(f"""execute plan('{book_id}');""")
    values = cursor.fetchall()
    book = convertTupleListToStringList(values)
    keys = ['ksiazka_id', 'tytul', 'opis', 'data_wydania', 'czas_wypozyczenia_dni', 'ilosc_stron', 'cena', 'ocena',
            'imie', 'nazwisko', 'kategoria']
    book = jsonFromKeysAndStringList(keys, book[0])
    conn.close()
    return book

def lendBook(request, book_id):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    if not context['isLibrarian'] and not context['isAdmin']: return redirect('/index/')
    if request.method == "POST":
        if lendBookPost(request, book_id, context) == 0:
            context['message'] = "wypozyczenie pomyslne"
        else:
            context['message'] = 'nie udalo sie wypozyczyc'
    else:
        conn = connectToDB()
        cursor = conn.cursor()
        biblioteka_id = getBiliotekaIdFromLogin(context['sessionUser'])
        cursor.execute(
            f"""prepare isBookInLibrary(int, int) as 
            select count(*) from wypozyczenie 
            join inwentarz using(inwentarz_id)
            join ksiazka using(ksiazka_id)
            where ksiazka_id = $1 and data_oddania is null and biblioteka_id = $2;""")
        # cursor.execute(
        #     f"""prepare isBookInLibrary(int, int) as select count(*) from inwentarz where ksiazka_id = $1 and biblioteka_id = $2;""")
        cursor.execute(f"""execute isBookInLibrary('{book_id}', '{biblioteka_id}');""")
        context['available'] = cursor.fetchone()[0] == 0
        context['book'] = getBookDetails(book_id)
        keys = ['czytelnik_id', 'imie', 'nazwisko', 'email', 'login']
        cursor.execute("""select czytelnik_id, imie, nazwisko, email, login from czytelnik where aktywny = true""")
        context['czytelnicy'] = jsonFromKeysAndStringLists(keys, convertTupleListToStringList(cursor.fetchall()))
        conn.close()
    template = loader.get_template('library/lend-book.html')
    return HttpResponse(template.render(context, request))

def getCzytelnikId(login):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(f"select czytelnik_id from czytelnik where login = '{login}'")
    czytelnik_id = cursor.fetchone()
    conn.close()
    return czytelnik_id

def getUserBooks(login):
    conn = connectToDB()
    cursor = conn.cursor()
    czytelnik_id = getCzytelnikId(login)
    if czytelnik_id is None:
        return []
    cursor.execute(f"""
        select data_wypozyczenia, data_oddania, tytul, autor.imie, autor.nazwisko, kategoria  from wypozyczenie
        join inwentarz using(inwentarz_id)
        join ksiazka using(ksiazka_id)
        join ksiazka_autor using(ksiazka_id)
        join autor using(autor_id)
        join ksiazka_kategoria using(ksiazka_id)
        join kategoria using(kategoria_id)
        where czytelnik_id = '{czytelnik_id[0]}';
    """)
    values = cursor.fetchall()
    valuesAsStringLists = convertTupleListToStringList(values)
    keys = ['data_wypozyczenia', 'data_oddania', 'tytul', 'autor_imie', 'autor_nazwisko', 'kategoria']
    jsonObj = jsonFromKeysAndStringLists(keys, valuesAsStringLists)
    print(jsonObj)
    conn.close()
    return jsonObj

def viewBorrowedBooks(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    context['booksList'] = getUserBooks(context['sessionUser'])
    template = loader.get_template('library/borrowedBooks.html')
    return HttpResponse(template.render(context, request))

def acceptReturnedBook_chooseBook(request):
    print('hello im in accept returned book ')
    requestData = request.POST
    czytelnik_id = requestData['czytelnik']
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(f"""
            select wypozyczenie_id, inwentarz_id, data_wypozyczenia, data_oddania, tytul, autor.imie, autor.nazwisko, kategoria  from wypozyczenie
            join inwentarz using(inwentarz_id)
            join ksiazka using(ksiazka_id)
            join ksiazka_autor using(ksiazka_id)
            join autor using(autor_id)
            join ksiazka_kategoria using(ksiazka_id)
            join kategoria using(kategoria_id)
            where czytelnik_id = '{czytelnik_id[0]}' and data_oddania is null;
        """)
    values = cursor.fetchall()
    valuesAsStringLists = convertTupleListToStringList(values)
    keys = [ 'wypozyczenie_id', 'inwentarz_id', 'data_wypozyczenia', 'data_oddania', 'tytul', 'autor_imie', 'autor_nazwisko', 'kategoria']
    jsonObj = jsonFromKeysAndStringLists(keys, valuesAsStringLists)
    print(jsonObj)
    conn.close()
    return jsonObj

def getCzytelnikInfo(czytelnik_id):
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute("""prepare plan(int) as
    select czytelnik_id, imie, nazwisko, email, telefon from czytelnik where czytelnik_id = $1;""")
    cursor.execute(f"execute plan({czytelnik_id})")
    keys = ['czytelnik_id', 'imie', 'nazwisko', 'email', 'telefon']
    czytelnikData = jsonFromKeysAndStringList(keys, cursor.fetchone())
    conn.close()
    return czytelnikData

def acceptReturnedBook(request):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    if not context['isLibrarian'] and not context['isAdmin']: return redirect('/index/')
    if request.method == "POST":
        czytelnik_id = request.POST['czytelnik']
        context['czytelnik'] = getCzytelnikInfo(czytelnik_id)
        context["booksList"] = acceptReturnedBook_chooseBook(request)
        template = loader.get_template('library/accept-returned-book_choose_book.html')
        return HttpResponse(template.render(context, request))

    elif request.method == "GET":
        conn = connectToDB()
        cursor = conn.cursor()
        keys = ['czytelnik_id', 'imie', 'nazwisko', 'email', 'login']
        cursor.execute("""select czytelnik_id, imie, nazwisko, email, login from czytelnik where aktywny = true""")
        context['czytelnicy'] = jsonFromKeysAndStringLists(keys, convertTupleListToStringList(cursor.fetchall()))
        conn.close()
    template = loader.get_template('library/accept-returned-book_choose_reader.html')
    return HttpResponse(template.render(context, request))

def acceptReturnedBook_checkFee(request, wypozyczenie_id):
    if not isUserLoggedIn(request): return redirect('/login/')
    context = {}
    addRolesToContext(request, context)
    if not context['isLibrarian'] and not context['isAdmin']: return redirect('/index/')
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(
        f"""prepare getDataWypozyczenia(int) as 
            select data_wypozyczenia, current_date from wypozyczenie where wypozyczenie_id = $1;""")
    cursor.execute(f"""execute getDataWypozyczenia('{wypozyczenie_id}');""")
    result = cursor.fetchone()
    borrowDate = result[0]
    returnDate = result[1]
    print(f'{borrowDate=}, {returnDate=}')
    days = (returnDate - borrowDate).days
    cursor.execute("""prepare getCzasWypozyczenia_dni(int) as 
        select czas_wypozyczenia_dni from wypozyczenie join inwentarz using(inwentarz_id) join ksiazka using(ksiazka_id)
    where wypozyczenie_id = $1
        """)
    cursor.execute(f"execute getCzasWypozyczenia_dni('{wypozyczenie_id}')")
    maxborrowDays = cursor.fetchone()[0]

    if request.method == "POST":
        cursor.execute(f"""prepare getCzytelnikId(int) as
        select czytelnik_id, current_date from wypozyczenie where wypozyczenie_id = $1
        """)
        cursor.execute(f"execute getCzytelnikId({wypozyczenie_id});")
        czytelnik_and_date = cursor.fetchone()
        czytelnik_id = czytelnik_and_date[0]
        data_zaplaty = czytelnik_and_date[1]
        print(czytelnik_id)
        print(data_zaplaty)
        bibliotekarz_id = getBibliotekarzId(context['sessionUser'])
        print(bibliotekarz_id)

        oplata = calculateBorrowFee(days - maxborrowDays)
        cursor.execute(f""" prepare addOplata(int, int, int, numeric, date) as
        insert into oplata (czytelnik_id, bibliotekarz_id, wypozyczenie_id, oplata, data_zaplaty) values
        ($1, $2, $3, $4, $5);""")
        cursor.execute(f"execute addOplata({czytelnik_id}, {bibliotekarz_id}, {wypozyczenie_id}, {oplata}, '{data_zaplaty}')")
        conn.commit()

        cursor.execute(f"""prepare acceptBook(int) as
            update wypozyczenie
            set data_oddania = '{returnDate}' where wypozyczenie_id = $1;
            """)
        cursor.execute(f"execute acceptBook({wypozyczenie_id});")
        conn.commit()
        conn.close()
        context['status'] = "received"
        template = loader.get_template('library/accept-returned-book_receive-fee.html')
        return HttpResponse(template.render(context, request))

    context['wypozyczenie_id'] = wypozyczenie_id
    if days > maxborrowDays:
        conn.close()
        context['fee'] = calculateBorrowFee(days - maxborrowDays)
        template = loader.get_template('library/accept-returned-book_receive-fee.html')
        return HttpResponse(template.render(context, request))
    sqlText = f"""prepare acceptBook(int) as
    update wypozyczenie 
    set data_oddania = '{returnDate}' where wypozyczenie_id = $1;
    """
    print(sqlText)
    print(wypozyczenie_id)
    cursor.execute(f"""prepare acceptBook(int) as
    update wypozyczenie 
    set data_oddania = '{returnDate}' where wypozyczenie_id = $1;
    """)
    cursor.execute(f"execute acceptBook({wypozyczenie_id});")
    conn.commit()
    conn.close()
    context['message'] = "pomyslnie przyjeto ksiazke"
    template = loader.get_template('library/accept-returned-book_receive-fee.html')
    return HttpResponse(template.render(context, request))

def calculateBorrowFee(daysOverDeadline):
    return daysOverDeadline * 0.3