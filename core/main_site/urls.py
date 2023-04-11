from django.urls import path
from . import views

urlpatterns = [
    path('test', views.test, name='test'),
    path('',views.home_page, name='index'),
    path('user/<pk>', views.page_user_login, name='user_login')
]