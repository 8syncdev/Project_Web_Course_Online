
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse_lazy
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
# Global Variable For home_page:
mess_error = False
log_decision = True
object_data = None
# Set up for maintaining Get request:
def home_page(request): #
    global mess_error, log_decision, object_data
    if request.method == 'POST':
        data = request.POST
        # See all data from request POST.
        data = convertDataReqToDict(data)
        print(data)
        data_POST = [val.strip() for key, val in data.items() if key in ['username', 'email',  'password','passwordAgain']]
        print(data_POST)
        # Analysis data to decide data out/in.
        len_data_before_register = Users.objects.count()
        if len(data) == 6:
            if data['role'] == 'user':
                with connection.cursor() as cursor:
                    query_proc_regiser_user = """
                        exec DangKiUser_Proc %s,%s,%s,%s
                    """
                    cursor.execute(query_proc_regiser_user,data_POST)
                    len_data_after_update = Users.objects.count()
                    if len_data_after_update == len_data_before_register:
                        mess_error = True
                    else: mess_error = False
                return redirect('/')
            elif data['role'] == 'admin':
                with connection.cursor() as cursor:
                    query_proc_regiser_admin = """
                        exec DangKiAdmin_Proc %s,%s,%s,%s
                    """
                    cursor.execute(query_proc_regiser_admin,data_POST)
                    cursor.execute(query_proc_regiser_admin,data_POST)
                    len_data_after_update = Users.objects.count()
                    if len_data_after_update == len_data_before_register:
                        mess_error = True
                    else: mess_error = False
                return redirect('/')
           
        elif len(data) == 3:
            with connection.cursor() as cursor:
                query_func_login_user = """
                    select dbo.LoginUser_Func(%s, %s) as check_log_in
                """
                cursor.execute(query_func_login_user,data_POST)
                check_log_in = dictfetchall(cursor)[0] # convert data query to dict (like Objects).
            if check_log_in['check_log_in'] == 1: # Functions Check Login Return 0 Or 1:
                print('Success')
                log_decision = False
                mess_error = False
                print(data_POST) # Check data, we see ['email]
                user = get_object_or_404(Users, email=data_POST[0])
                object_data = user
                return redirect(f'/user/{user.user_id}')
            else:
                log_decision = True
                mess_error = True
                object_data = None
                return redirect('/')
    if request.method == 'GET': # GET http:
        log_decision = True
        object_data = None
        if mess_error == True:
            mess_error = True
        else:
            mess_error = False
    print('Data:',object_data,log_decision, mess_error)
    return render(request, 'index.html', {
        'log_decision': log_decision,
        'mess_error': mess_error,
        'object_data': object_data
    })
# User After Login:
def page_user_login(request, pk):
    # page for each each user
    global object_data # update object when log in user.
    print(object_data.user_id)
    object_data = get_object_or_404(Users, pk=pk)
    return render(request, 'index.html',{
                    'log_decision': log_decision,
                    'object_data': object_data
                })

def profile(request):
    global object_data
    print(object_data)
    return render(request, 'templates/user/profile/profile.html',{
        'object_data': object_data
    })

# End Set up For User:

# Views For User:

# Views About Courses:
def list_all_courses(request, slug):
    global object_data # remain data for user when using website.
    if request.method == 'GET':
        with connection.cursor() as cursor:
            if slug == 'all':
                # Data Origin:
                query = """
                    select * from all_courses_info
                """
                cursor.execute(query)
                data_origin = dictfetchall(cursor)
                data = data_origin
            elif slug == 'prices_asc':
                # Prices_Asc
                query = """
                    SELECT * FROM v_courses_price_asc
                """
                cursor.execute(query)
                data_prices_asc = dictfetchall(cursor)
                data = data_prices_asc
            elif slug == 'prices_desc':
                # Price_Desc:
                query = """
                    SELECT * FROM v_course_price_descending
                    ORDER BY price DESC
                """
                cursor.execute(query)
                data_prices_desc = dictfetchall(cursor)
                data = data_prices_desc

            elif slug == 'beginner':
                query = """
                    SELECT * FROM v_beginner_courses_info
                """
                cursor.execute(query)
                data_beginner = dictfetchall(cursor)
                data = data_beginner
            elif slug == 'intermediate':
                query = """
                    SELECT * FROM v_intermediate_courses_info
                """
                cursor.execute(query)
                data_intermediate = dictfetchall(cursor)
                data = data_intermediate

            elif slug == 'expert':
                query = """
                    SELECT * FROM v_expert_courses_info
                """
                cursor.execute(query)
                data_expert = dictfetchall(cursor)
                data = data_expert

            elif slug == 'master':
                query = """
                    SELECT * FROM v_master_courses_info
                """
                cursor.execute(query)
                data_master = dictfetchall(cursor)
                data = data_master

            elif slug == 'advanced':
                query = """
                    SELECT * FROM v_advanced_courses_info
                """
                cursor.execute(query)
                data_advanced = dictfetchall(cursor)
                data = data_advanced
    print(data)
    return render(request, 'templates/courses/listAllCourses.html',{
        'data': data,
        'log_decision': log_decision,
        'mess_error': mess_error,
        'object_data': object_data
    })

def test(request):
    obj = Users.objects.all()
    return render(request, 'test.html', {
        'objs' : obj,
        'len' : obj.__len__
    })


