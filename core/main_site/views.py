from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from .models import Users
from datetime import datetime







# Create your views here.
def home_page(request): # 
    try:
        if request.method == 'POST':
            data = request.POST
            print(dict(data.list()))
            user = Users.objects.filter(email = request.POST.get('email'))
            if not user.exists():
                form = Users.objects.create(user_id = Users.objects.count() + 1, username = request.POST.get('full_name'), email = request.POST.get('email'), password = request.POST.get('password'), created_at = datetime.now(), updated_at = datetime.now())
                print('error')
                return HttpResponseRedirect('/test')
            else:
                return HttpResponseRedirect('/')
            
        return render(request, 'index.html')
    except:
        return HttpResponseRedirect('/')
    



# Views For User:
def 






def test(request):
    obj = Users.objects.all()
    return render(request, 'test.html', {
        'objs' : obj,
        'len' : obj.__len__
    })


