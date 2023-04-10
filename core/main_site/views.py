
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from .models import Users
from django.db import connection


def convertDataReqToDict(data):
    data = dict(data)
    for key, value in data.items():
        data[f'{key}'] = value[0]
    return data


def dictfetchall(cursor):
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]

# Create your views here.
mess_error = False
def home_page(request): # 
    global mess_error
    if request.method == 'POST':
        data = request.POST
        # See all data from request POST.
        data = convertDataReqToDict(data)
        data_POST = [val.strip() for key, val in data.items() if key in ['username', 'password', 'email']]
        print()
        # Analysis data to decide data out/in.
        if len(data) == 5:
            with connection.cursor() as cursor:
                query_proc_regiser_user = """
                    exec DangKiUser_Proc %s,%s,%s
                """
                cursor.execute(query_proc_regiser_user,data_POST)
            return redirect('/')
        
        elif len(data) == 3:
            with connection.cursor() as cursor:
                query_proc_regiser_user = """
                    select dbo.LoginUser_Func(%s, %s) as check_log_in
                """
                cursor.execute(query_proc_regiser_user,data_POST)
                check_log_in = dictfetchall(cursor)[0]
            if check_log_in['check_log_in'] == 1:
                print('Success')
                return render(request, 'index.html', {
                    'log_decision': False,
                    'user' : Users.objects.filter(username=data_POST[0])
                })
            else:
                mess_error = True
                return redirect('/')
                
    return render(request, 'index.html', {
        'log_decision': True,
        'mess_error': mess_error
    })
    

# Views For User:




def test(request):
    obj = Users.objects.all()
    return render(request, 'test.html', {
        'objs' : obj,
        'len' : obj.__len__
    })


