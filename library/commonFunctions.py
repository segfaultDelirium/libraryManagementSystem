
import psycopg2

def isUserLoggedIn(request):
    try:
        sessionUser = request.session['user_login']
        return True
    except:
        return False

def addAdminContext(request, context):
    if not isUserLoggedIn(request): return
    sessionUser = request.session['user_login']
    if sessionUser == 'admin': context['isAdmin'] = True

def addAdminContextFromSessionUser(sessionUser, context):
    if sessionUser == 'admin': context['isAdmin'] = True

def addLibrarianContext(request, context):
    if not isUserLoggedIn(request): return
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    sessionUser = request.session['user_login']
    cursor.execute(f'select login from bibliotekarz where login = {sessionUser};')
    if cursor.fetchall() == []:
        print('the user is not librarian')
    else:
        print('the user is librarian')
        context['isLibrarian'] = True
    conn.close()

def addLibrarianContextFromSessionUser(sessionUser, context):
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute(f'select login from bibliotekarz where login = {sessionUser};')
    if cursor.fetchall() == []:
        print('the user is not librarian')
    else:
        print('the user is librarian')
        context['isLibrarian'] = True
    conn.close()