from django.shortcuts import render, redirect

# Create your views here.
from mysql import models
from mysql_admin.form.admin_boos_form import AdminBoosModelForm
from mysql_admin.form.admin_change_form import AdminChangeModelForm
from mysql_admin.form.admin_com_type_form import AdminComTypeModelForm
from mysql_admin.form.admin_comment_form import AdminCommentModelForm
from mysql_admin.form.admin_user_form import AdminUserModelForm
from utils import page
from utils.md5 import md5


def admin_home(request):
    """
    后台首页
    :param request:
    :return:
    """
    q = request.GET.get('q')
    # print(len(adv_query), '---------->')
    # 工作渲染
    if q:
        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.UserInfo.objects.filter(username__icontains=q,
                                                                               is_active=True).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.UserInfo.objects.filter(username__icontains=q, is_active=True).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.UserInfo.objects.filter(is_active=True).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.UserInfo.objects.filter(is_active=True).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()
    return render(request, 'mysql_admin/home.html', locals())


def admin_login(request):
    """
    管理员登录
    :param request:
    :return:
    """
    if request.method == 'GET':
        return render(request, 'user/login.html')

    # form = LoginModelForm(request.POST)
    form_error = '账号错误或密码错误'
    # 查询当前用户是否存在
    username = request.POST.get('username')
    password = request.POST.get('password')
    print(username, password)
    # 查询当前用户是否存在
    user_query = models.UserInfo.objects.filter(username=username, password=md5(password), is_active=True,
                                                user_type=2)
    # 如果不存在
    if not user_query.exists():
        return render(request, 'user/login.html', {'form_error': form_error})
    # 修改状态
    user_obj = user_query.first()
    # 存session
    # 保存session ,
    request.session['user_dic'] = {'id': user_obj.id, 'username': user_obj.username,
                                   'user_type': user_obj.user_type,
                                   'avatar': user_obj.avatar.url,
                                   'addr': user_obj.addr,
                                   'telephone': user_obj.telephone,
                                   }
    return redirect('admin_home')


def logout(request):
    request.session.clear()
    return redirect("admin_login")


def add_user(request):
    """
    用户添加
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = AdminUserModelForm()
        return render(request, 'user/add_user.html', locals())
    form = AdminUserModelForm(request.POST)
    if form.is_valid():
        form.save()
    return redirect('admin_home')


def edit_user(request):
    """
    人员编辑
    :param request:
    :return:
    """
    user_id = request.GET.get('user_id')
    obj = models.UserInfo.objects.filter(id=user_id).first()
    if request.method == 'GET':
        form = AdminUserModelForm(instance=obj)
        return render(request, 'user/add_user.html', locals())
    form = AdminUserModelForm(instance=obj, data=request.POST)
    if form.is_valid():
        form.save()
    return redirect('admin_home')


def delete_user(request):
    """删除用户"""
    user_id = request.GET.get('user_id')
    user_obj = models.UserInfo.objects.get(id=user_id)
    user_obj.is_active = False
    user_obj.save()
    return redirect('admin_home')


def comment_home(request):
    """
    评论渲染
    :param request:
    :return:
    """
    q = request.GET.get('q')
    # print(len(adv_query), '---------->')
    # 工作渲染
    if q:
        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Comment.objects.filter(comment__icontains=q,
                                                                              is_active=True,
                                                                              is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.Comment.objects.filter(comment__icontains=q, is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Comment.objects.filter(is_active=True,
                                                                              is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.Comment.objects.filter(is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()
    return render(request, 'comment/comment_home.html', locals())


def comment_add(request):
    """
    评论添加
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = AdminCommentModelForm()
        return render(request, 'comment/add_comment.html', locals())
    form_error = '请遵守规则'
    form = AdminCommentModelForm(request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect('comment_home')
    return render(request, 'comment/add_comment.html', locals())


def comment_edit(request):
    """
    评论编辑
    :param request:
    :return:
    """
    # 如果是get请求，渲染数据
    id = request.GET.get('id')
    obj = models.Comment.objects.filter(id=id).first()

    if request.method == 'GET':
        form = AdminCommentModelForm(instance=obj)
        return render(request, 'comment/add_comment.html', locals())

    form = AdminCommentModelForm(instance=obj, data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
    return redirect('comment_home')


def comment_delete(request):
    """评论"""
    id = request.GET.get('id')
    obj = models.Comment.objects.get(id=id)

    obj.is_active = False
    obj.save()
    return redirect('comment_home')


def com_home(request):
    """
    社团渲染
    :param request:
    :return:
    """
    q = request.GET.get('q')
    # print(len(adv_query), '---------->')
    # 工作渲染
    if q:
        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Community.objects.filter(name__icontains=q,
                                                                                is_active=True,
                                                                                is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=4,
                                      )
        query = models.Community.objects.filter(name__icontains=q, is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Community.objects.filter(is_active=True,
                                                                                is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.Community.objects.filter(is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()
    return render(request, 'mysql/com_home.html', locals())


def com_add(request):
    """
    公司添加
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = AdminBoosModelForm()
        return render(request, 'mysql/add_com.html', locals())
    form_error = '请遵守规则'
    form = AdminBoosModelForm(request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect('com_home')
    return render(request, 'mysql/add_com.html', locals())


def com_edit(request):
    """
    公司编辑
    :param request:
    :return:
    """
    # 如果是get请求，渲染数据
    id = request.GET.get('id')
    obj = models.Community.objects.filter(id=id).first()

    if request.method == 'GET':
        form = AdminBoosModelForm(instance=obj)
        return render(request, 'mysql/add_com.html', locals())

    form = AdminBoosModelForm(instance=obj, data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
    return redirect('com_home')


def com_delete(request):
    """删除公司"""
    id = request.GET.get('id')
    obj = models.Community.objects.get(id=id)

    obj.is_active = False
    obj.save()
    return redirect('com_home')


def com_home_type(request):
    """
    社团类型渲染
    :param request:
    :return:
    """
    q = request.GET.get('q')
    # print(len(adv_query), '---------->')
    # 工作渲染
    if q:
        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Community_Type.objects.filter(name__icontains=q,
                                                                                     is_active=True,
                                                                                     is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=4,
                                      )
        query = models.Community_Type.objects.filter(name__icontains=q, is_active=True, is_delete=False).order_by(
            '-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Community_Type.objects.filter(is_active=True,
                                                                                     is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.Community_Type.objects.filter(is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()
    return render(request, 'com_type/com_home.html', locals())


def com_add_type(request):
    """
    公司类型添加
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = AdminComTypeModelForm()
        return render(request, 'com_type/add_com_type.html', locals())
    form_error = '请遵守规则'
    form = AdminComTypeModelForm(request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect('com_home_type')
    return render(request, 'com_type/add_com_type.html', locals())


def com_edit_type(request):
    """
    公司类型编辑
    :param request:
    :return:
    """
    # 如果是get请求，渲染数据
    id = request.GET.get('id')
    obj = models.Community_Type.objects.filter(id=id).first()

    if request.method == 'GET':
        form = AdminComTypeModelForm(instance=obj)
        return render(request, 'com_type/add_com_type.html', locals())

    form = AdminComTypeModelForm(instance=obj, data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
    return redirect('com_home_type')


def com_delete_type(request):
    """删除类型"""
    id = request.GET.get('id')
    obj = models.Community_Type.objects.get(id=id)

    obj.is_active = False
    obj.save()
    return redirect('com_home_type')


def com_active_home(request):
    """
    社团活动渲染
    :param request:
    :return:
    """
    q = request.GET.get('q')
    # print(len(adv_query), '---------->')
    # 工作渲染
    if q:
        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Active.objects.filter(name__icontains=q,
                                                                             is_active=True,
                                                                             is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=4,
                                      )
        query = models.Active.objects.filter(name__icontains=q, is_active=True, is_delete=False).order_by(
            '-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Active.objects.filter(is_active=True,
                                                                             is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.Active.objects.filter(is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()
    return render(request, 'active/com_active.html', locals())


def com_add_active(request):
    """
    活动类型添加
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = AdminComTypeModelForm()
        return render(request, 'active/add_active.html', locals())
    form_error = '请遵守规则'
    form = AdminComTypeModelForm(request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect('com_active_home')
    return render(request, 'active/add_active.html', locals())


def com_edit_active(request):
    """
    活动类型编辑
    :param request:
    :return:
    """
    # 如果是get请求，渲染数据
    id = request.GET.get('id')
    obj = models.Active.objects.filter(id=id).first()

    if request.method == 'GET':
        form = AdminComTypeModelForm(instance=obj)
        return render(request, 'active/add_active.html', locals())

    form = AdminComTypeModelForm(instance=obj, data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
    return redirect('com_active_home')


def com_delete_active(request):
    """删除活动"""
    id = request.GET.get('id')
    obj = models.Active.objects.get(id=id)

    obj.is_active = False
    obj.save()
    return redirect('com_active_home')


def apply_for_change(request):
    """
    申请记录修改
    :param request:
    :return:
    """
    """
        社团活动渲染
        :param request:
        :return:
        """
    q = request.GET.get('q')
    # print(len(adv_query), '---------->')
    # 工作渲染
    if q:
        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Apply.objects.filter(community__name__icontains=q,
                                                                            is_active=True,
                                                                            is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=4,
                                      )
        query = models.Apply.objects.filter(community__name__icontains=q, is_active=True, is_delete=False).order_by(
            '-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Apply.objects.filter(is_active=True,
                                                                            is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=10,
                                      )
        query = models.Apply.objects.filter(is_active=True, is_delete=False).order_by('-id')[
                page_object.start:page_object.end]
        # print(user_query, '--------')
        page_html = page_object.page_html()
    return render(request, 'apply_change/apply_change.html', locals())


def apply_for_add(request):
    """
    申请记录添加
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = AdminChangeModelForm()
        return render(request, 'apply_change/add_change.html', locals())
    form_error = '请遵守规则'
    form = AdminChangeModelForm(request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect('apply_for_change')
    return render(request, 'apply_change/add_change.html', locals())


def apply_for_edit(request):
    """
    申请记录编辑
    :param request:
    :return:
    """
    # 如果是get请求，渲染数据
    id = request.GET.get('id')
    obj = models.Apply.objects.filter(id=id).first()

    if request.method == 'GET':
        form = AdminChangeModelForm(instance=obj)
        return render(request, 'apply_change/add_change.html', locals())

    form = AdminChangeModelForm(instance=obj, data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
    return redirect('apply_for_change')


def apply_for_delete(request):
    """删除申请记录"""
    id = request.GET.get('id')
    obj = models.Apply.objects.get(id=id)

    obj.is_active = False
    obj.save()
    return redirect('com_active_home')
