from django.urls import path
from . import views

urlpatterns = [
    path('test', views.test, name='test'),
    path('',views.home_page, name='index'),
    path('user/<pk>', views.page_user_login, name='user_login'),
    path('all-courses/<slug:slug>', views.list_all_courses, name='all_courses'),
    path('user-profile', views.profile, name='profile'),
    path('mentors', views.list_all_mentors,name='all-mentors')
]