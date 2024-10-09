from django.urls import path, include, re_path

from mysql_admin import views

urlpatterns = [
    # 后台
    path('admin_home/', views.admin_home, name='admin_home'),
    path('admin_login/', views.admin_login, name='admin_login'),
    path('add_user/', views.add_user, name='add_user'),
    path('edit_user/', views.edit_user, name='edit_user'),
    path('delete_user/', views.delete_user, name='delete_user'),
    path("logout/", views.logout, name="logout"),

    # 项目管理
    path('com_home/', views.com_home, name='com_home'),
    path('com_add/', views.com_add, name='com_add'),
    path('com_edit/', views.com_edit, name='com_edit'),
    path('com_delete/', views.com_delete, name='com_delete'),
    # 学院管理
    path('com_home_type/', views.com_home_type, name='com_home_type'),
    path('com_add_type/', views.com_add_type, name='com_add_type'),
    path('com_edit_type/', views.com_edit_type, name='com_edit_type'),
    path('com_delete_type/', views.com_delete_type, name='com_delete_type'),

    # 评论
    path('comment_home/', views.comment_home, name='comment_home'),
    path('comment_add/', views.comment_add, name='comment_add'),
    path('comment_edit/', views.comment_edit, name='comment_edit'),
    path('comment_delete/', views.comment_delete, name='comment_delete'),
    # 申请记录
    path('apply_for_change/', views.apply_for_change, name='apply_for_change'),
    path('apply_for_add/', views.apply_for_add, name='apply_for_add'),
    path('apply_for_edit/', views.apply_for_edit, name='apply_for_edit'),
    path('apply_for_delete/', views.apply_for_delete, name='apply_for_delete'),
]
