from django.db import connection

def dictfetchall(cursor):
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]

cursor = connection.cursor()
cursor.execute("EXEC DangKiUser_Proc 'duckhai', 'duckhai@gmail.com', '123456'")
print([cursor.fetchall()])
dictfetchall(cursor)