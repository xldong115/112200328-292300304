from django.urls import path, include, re_path
from mysql.views import account, home

urlpatterns = [
    # 用户
    path('user_login/', account.user_login, name='user_login'),
    path('user_register/', account.user_register, name='user_register'),
    path('login_out/', account.login_out, name='login_out'),
    path('ajax_change_files/', account.ajax_change_icon_view, name='ajax_change_files'),
    # 首页
    path('home/', home.home, name='home'),
    # 图书详情
    path('mysql_detail/', home.com_detail, name='mysql_detail'),
    # 评论
    path('comment/', home.comment, name='comment'),
    # 收藏
    path('add_collection/', home.add_collection, name='add_collection'),

    # 申请
    path('apply_for/', home.apply_for, name='apply_for'),
    # 收藏
    path('mysql_shelf/', home.com_shelf, name='mysql_shelf'),
    # 申请记录
    path('apply_reg/', home.apply_reg, name='apply_reg'),

]
