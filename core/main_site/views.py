
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse_lazy
from .models import Users, Courses
from . import models
from django.db import connection
from .data_files.images_data import images_data


# Convert data from request.data :
def convertDataReqToDict(data):
    data = dict(data)
    for key, value in data.items():
        data[f'{key}'] = value[0]
    return data

# Convert data from query sel server:
def dict_fetch_all(cursor):
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]

def getNumUserRegisterCourses(user_id):
    with connection.cursor() as cursor:
        query = '''
            select dbo.getNumUserRegisterCourses(%s) as num_cart
        '''
        cursor.execute(query, [user_id])
        data = dict_fetch_all(cursor)
    return data
# Create your views here.
# Global Variable For home_page:
mess_error = False
log_decision = True
object_data = None
images_data = images_data
num_cart = None
# Set up for maintaining Get request:
def home_page(request): #
    global mess_error, log_decision, object_data, num_cart
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
                check_log_in = dict_fetch_all(cursor)[0] # convert data query to dict (like Objects).
            if check_log_in['check_log_in'] == 1: # Functions Check Login Return 0 Or 1:
                print('Success')
                log_decision = False
                mess_error = False
                print(data_POST) # Check data, we see ['email]
                user = get_object_or_404(Users, email=data_POST[0])
                object_data = user
                num_cart = getNumUserRegisterCourses(user.user_id)[0]['num_cart']
                print('Num of cart:',num_cart)
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
    global mess_error, log_decision, object_data, num_cart # update object when log in user.
    object_data = get_object_or_404(Users, pk=pk)
    return render(request, 'index.html',{
                    'log_decision': log_decision,
                    'object_data': object_data,
                    'mess_error': mess_error,
                    'num_cart':num_cart
                })

def profile(request):
    global mess_error, log_decision, object_data, num_cart
    print(object_data)
    return render(request, 'templates/user/profile/profile.html',{
        'log_decision': log_decision,
        'object_data': object_data,
        'mess_error': mess_error,
        'num_cart': num_cart
    })

# End Set up For User:

# Views For User:

# Views About Courses:
def list_all_courses(request, slug):
    global mess_error, log_decision, object_data, num_cart # remain data for user when using website.
    global images_data
    print(images_data)
    if request.method == 'GET':
        with connection.cursor() as cursor:
            if slug == 'all':
                # Data Origin:
                query = """
                    select * from all_courses_info
                """
                cursor.execute(query)
                data_origin = dict_fetch_all(cursor)
                data = data_origin
            elif slug == 'prices_asc':
                # Prices_Asc
                query = """
                    SELECT * FROM v_courses_price_asc
                """
                cursor.execute(query)
                data_prices_asc = dict_fetch_all(cursor)
                data = data_prices_asc
            elif slug == 'prices_desc':
                # Price_Desc:
                query = """
                    SELECT * FROM v_course_price_descending
                    ORDER BY price DESC
                """
                cursor.execute(query)
                data_prices_desc = dict_fetch_all(cursor)
                data = data_prices_desc

            elif slug == 'beginner':
                query = """
                    SELECT * FROM v_beginner_courses_info
                """
                cursor.execute(query)
                data_beginner = dict_fetch_all(cursor)
                data = data_beginner
            elif slug == 'intermediate':
                query = """
                    SELECT * FROM v_intermediate_courses_info
                """
                cursor.execute(query)
                data_intermediate = dict_fetch_all(cursor)
                data = data_intermediate

            elif slug == 'expert':
                query = """
                    SELECT * FROM v_expert_courses_info
                """
                cursor.execute(query)
                data_expert = dict_fetch_all(cursor)
                data = data_expert

            elif slug == 'master':
                query = """
                    SELECT * FROM v_master_courses_info
                """
                cursor.execute(query)
                data_master = dict_fetch_all(cursor)
                data = data_master

            elif slug == 'advanced':
                query = """
                    SELECT * FROM v_advanced_courses_info
                """
                cursor.execute(query)
                data_advanced = dict_fetch_all(cursor)
                data = data_advanced
    key = [key for key, val in images_data.items()]
    for item in data:
        idx = item.get('title')
        if idx in key:
            print(images_data.get(f'{idx}'))
    print(object_data)
    return render(request, 'templates/courses/listAllCourses.html',{
        'data': data,
        'log_decision': log_decision,
        'mess_error': mess_error,
        'object_data': object_data,
        'images_data': images_data,
        'num_cart':num_cart
    })




# View for mentors:
def list_all_mentors(request):
    global mess_error, log_decision, object_data, num_cart
    with connection.cursor() as cursor:
        query = """
            SELECT * FROM v_instructor
        """
        cursor.execute(query)
        mentors = dict_fetch_all(cursor)
    print(object_data)
    return render(request, 'templates/mentors/listAllMentors.html',{
        'mentors':mentors,
        'log_decision': log_decision,
        'mess_error': mess_error,
        'object_data': object_data,
        'images_data': images_data,
        'num_cart':num_cart
    })

def register_courses(request, pk):
    global mess_error, log_decision, object_data
    try:
        id = object_data.user_id
        with connection.cursor() as cursor:
            query = """
                exec RegisterUserCourse %s,%s
            """
            cursor.execute(query,[id, pk])
        print('Success')
        return redirect(f'/all-courses/all')
    except:
        print('Error Register')
        return redirect('/')

def cart_bill(request, slug, reg_id):
    global mess_error, log_decision, object_data, num_cart
    if slug == 'get-registered-course' and reg_id == '0':
        try:
            id = object_data.user_id
            print(id)
            with connection.cursor() as cursor:
                query = """
                    select * from dbo.getUserRegisteredCourses(%s)
                """
                cursor.execute(query,[id])
                data = dict_fetch_all(cursor)
                query = '''
                    select dbo.getTotalMoneyUserRegisterCourses(%s) as total_cost
                '''
                cursor.execute(query,[id])
                total_cost = dict_fetch_all(cursor)[0]['total_cost']
            print(data)
            print('Success')
            return render(request, 'templates/user/cart/cart.html',{
                'log_decision': log_decision,
                'mess_error': mess_error,
                'object_data': object_data,
                'cart': data,
                'num_cart':num_cart,
                'total_cost':total_cost
            })
        except:
            print('Error Access Bill')
            return redirect('/')
    if slug == 'delete-course':
        id = object_data.user_id
        with connection.cursor() as cursor:
            query = '''
                exec deleteUserCourseRegistry %s,%s
            '''
            cursor.execute(query,[id, reg_id])
        print(id, reg_id)
        return redirect('/cart-and-bill/get-registered-course/0')

            
    return redirect('/')
    # return render(request, 'templates/user/cart/cart.html',{
    #     'log_decision': log_decision,
    #     'mess_error': mess_error,
    #     'object_data': object_data,
    # })



def test(request):
    obj = Users.objects.all()
    return render(request, 'test.html', {
        'objs' : obj,
        'len' : obj.__len__
    })


