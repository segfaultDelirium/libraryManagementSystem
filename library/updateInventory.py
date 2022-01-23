import psycopg2
import random

conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
cursor = conn.cursor()

for i in range(122, 240):
    if random.random() < 0.5:
        cursor.execute(f"""insert into inwentarz (ksiazka_id, biblioteka_id) values({i}, 2);""")
        conn.commit()
    if random.random() < 0.5:
        cursor.execute(f"""insert into inwentarz (ksiazka_id, biblioteka_id) values({i}, 3);""")
        conn.commit()


conn.close()