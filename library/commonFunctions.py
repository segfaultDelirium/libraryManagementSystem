
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
    conn = connectToDB()
    cursor = conn.cursor()
    cursor.execute(
        """prepare getLibrarians(text) as 
        select login from bibliotekarz where login = $1;""")
    cursor.execute(f"""execute getLibrarians('{sessionUser}');""")
    context['isLibrarian'] = cursor.fetchall() != []

    cursor.execute(
        """prepare getReaders(text) as 
        select login from czytelnik where login = $1;""")
    cursor.execute(f"""execute getReaders('{sessionUser}');""")
    context['isReader'] = cursor.fetchall() != []
    conn.close()

def getSessionUser(request):
    return request.session['user_login']

def jsonFromKeysAndStringLists(keys, stringLists):
    jsonObj = []
    for stringList in stringLists:
        innerJson = {}
        for i, v in enumerate(stringList):
            innerJson[keys[i]] = v
        jsonObj.append(innerJson)
    return jsonObj

def jsonFromKeysAndStringList(keys, stringList):
    jsonObj = {}
    for i, v in enumerate(stringList):
        jsonObj[keys[int(i)]] = v
    return jsonObj

def convertTupleListToStringList(tupleList):
    stringList = []
    for value in tupleList:
        valueAsStringList = []
        for val in value:
            valueAsStringList.append(f'{val}')
        stringList.append(valueAsStringList)
    return stringList

def connectToDB():
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    return conn
