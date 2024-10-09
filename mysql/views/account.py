from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from mysql import models
from utils.md5 import md5


def user_register(request):
    """
    注册
    :param request:
    :return:
    """
    if request.method == 'GET':
        return render(request, 'user/register.html')
    form_error = '账号错误或密码错误'

    username = request.POST.get('username')
    password = request.POST.get('password')
    data = {
        'username': username,
        'password': md5(password),
    }
    print('data', data)
    if not username or not password:
        return render(request, 'user/register.html', locals())
    exist = models.UserInfo.objects.filter(username=username).exists()
    if exist:
        form_error = '用户名已存在'
        return render(request, 'user/register.html', locals())
    try:
        models.UserInfo.objects.create(**data)
        return redirect('user_login')
    except Exception:
        form_error = '创建失败,信息不合法'
        return render(request, 'user/register.html', locals())


def user_login(request):
    """
    登录
    :param request:
    :return:
    """
    if request.method == 'GET':
        return render(request, 'user/login.html')

    form_error = '账号错误或密码错误'

    # 查询当前用户是否存在
    username = request.POST.get('username')
    password = request.POST.get('password')
    # print(username)
    # print(password)
    # 查询当前用户是否存在
    user_query = models.UserInfo.objects.filter(username=username, password=md5(password), is_active=True)
    # 如果不存在
    if not user_query.exists():
        return render(request, 'user/login.html', {'form_error': form_error})
    # 修改状态
    user_obj = user_query.first()
    # 存session
    request.session['user_dic'] = {'id': user_obj.id, 'username': user_obj.username,
                                   'user_type': user_obj.user_type,
                                   'avatar': user_obj.avatar.url,
                                   'addr': user_obj.addr,
                                   'telephone': user_obj.telephone,
                                   }
    # /media/avatar/avatar.jpg
    # print(user_obj.avatar)
    # print(request.session.get('user_dic').get('user_type'))
    return redirect('home')


def login_out(request):
    """
    退出
    :param request:
    :return:
    """
    # 退出
    user_id = request.session.get('user_dic')['id']
    user_obj = models.UserInfo.objects.get(id=user_id)
    # print(user_obj, '------------')
    user_obj.is_login = False
    user_obj.save()
    # 清楚session
    request.session.clear()
    return redirect('user_login')


def ajax_change_icon_view(request):
    """
    个人信息修改
    :param request:
    :return:
    """
    user_id = request.session.get('user_dic')['id']

    user_obj = models.UserInfo.objects.get(id=user_id)

    # 获取新的图片对象
    new_img = request.FILES.get('icon')
    telephone = request.POST.get('telephone')
    addr = request.POST.get('addr')
    # print(telephone, '---------手机号')
    if new_img:
        user_obj.avatar = new_img
    if telephone:
        user_obj.telephone = telephone
    if addr:
        user_obj.addr = addr
    try:
        user_obj.save()
    except Exception:
        pass
    img_url = user_obj.avatar.url
    return JsonResponse({'status': 200, 'url': img_url})
