
import psycopg2

def isUserLoggedIn(request):
    try:
        request.session['user_login']
        return True
    except:
        return False

def addRolesToContext(request, context):
    if not isUserLoggedIn(request): return
    sessionUser = request.session['user_login']
    context['sessionUser'] = sessionUser
    context['isAdmin'] = sessionUser == 'admin'
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute(
        """prepare plan(text) as 
        select login from bibliotekarz where login = $1;""")
    cursor.execute(f"""execute plan('{sessionUser}');""")
    context['isLibrarian'] = cursor.fetchall() != []

    cursor.execute(
        """prepare plan(text) as 
        select login from czytelnik where login = $1;""")
    cursor.execute(f"""execute plan('{sessionUser}');""")
    context['isReader'] = cursor.fetchall() != []
    conn.close()

def getSessionUser(request):
    return request.session['user_login']