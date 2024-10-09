from django.conf import settings
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render, redirect, HttpResponse

# Create your views here.
from mysql import models
from utils import page
from utils.md5 import md5


def home(request):
    """
    首页
    :param request:
    :return:
    """
    userinfo_id = request.session.get('user_dic').get('id')
    user_obj = models.UserInfo.objects.get(id=userinfo_id)
    # 获取种类
    type_query = models.Community_Type.objects.filter(is_delete=False, is_active=True)
    # 获取热度最高的前3图书，
    hot = models.Community.objects.filter(is_delete=False, is_active=True).order_by('-hot', '-id')[
          settings.HOT_START:settings.HOT_END]
    hot_com = models.Community.objects.filter(is_delete=False, is_active=True).order_by('-hot', '-id').first()

    q = request.GET.get('q')
    # print(q)
    # 项目渲染
    if q:
        # print(q)

        # 查询数据+分页
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Community.objects.filter(
                                          Q(name__icontains=q) | Q(community_type__name=q),
                                          is_active=True,
                                          is_delete=False,
                                      ).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=settings.BOOK_NUM,
                                      )
        query = models.Community.objects.filter(Q(name__icontains=q) | Q(community_type__name=q), is_active=True,
                                                is_delete=False,
                                                ).order_by('-hot',
                                                           '-id').select_related(
            'community_type')[
                page_object.start:page_object.end]
        # print(query, '--------')
        page_html = page_object.page_html()

    else:
        current_page = request.GET.get('page')
        page_object = page.Pagination(current_page=current_page,
                                      all_count=models.Community.objects.filter(is_active=True,
                                                                                is_delete=False).count(),
                                      base_url=request.path_info,
                                      query_params=request.GET,
                                      per_page=settings.BOOK_NUM,
                                      )
        query = models.Community.objects.filter(is_active=True, is_delete=False).order_by('-hot',
                                                                                          '-id').select_related(
            'community_type')[
                page_object.start:page_object.end]
        # print(query, '--------')
        # for item in query:
        #     # print(item.community_type__name)
        #     print(item.community_type.all())
        page_html = page_object.page_html()
    return render(request, 'q_home/index.html', locals())


def com_detail(request):
    """
    项目详情
    :param request:
    :return:
    """
    # 项目
    id = request.GET.get('id')

    userinfo_id = request.session.get('user_dic').get('id')
    # 评论
    comment_query = models.Comment.objects.filter(community_id=id, is_active=True, is_delete=False)
    # 查询项目
    query = models.Community.objects.filter(id=id, is_delete=False, is_active=True).first()
    # 查询是否收藏过
    start_query = models.Com_Shelf.objects.filter(community_id=id, userinfo_id=userinfo_id, is_delete=False,
                                                  is_active=True)
    if start_query.exists():
        my_start = start_query.first().is_start
    else:
        my_start = ''
    # print(my_start, 'my_start')
    # print(query_book)
    # 热力值增加
    hot_num = settings.HOT_NUM
    query.hot = '%.5f' % (query.hot + ((1 + hot_num) * 1.000000001))
    query.save()
    # print(query.hot, 'new_hot_num')
    # 获取数量
    count = models.Apply.objects.filter(community_id=id, apply_type=1, is_active=True, is_delete=False).count()
    # 获取项目,获取最新的前三个
    active = models.Active.objects.filter(community_id=id, is_active=True, is_delete=False).order_by('-id')[0:3]
    return render(request, 'q_home/detail.html', locals())


def add_collection(request):
    """
    添加收藏
    :param request:
    :return:
    """
    data = {
        'status': 200
    }
    id = request.POST.get('id')
    userinfo_id = request.session.get('user_dic').get('id')
    # 第一个值是查到或者创建的数据，第二个值是一个布尔，表示是否执行了创建操作。创建为True，未创建为False
    obj, bol = models.Com_Shelf.objects.get_or_create(community_id=id, userinfo_id=userinfo_id, is_delete=False,
                                                      is_active=True)
    # 如果是新建的，肯定是收藏，修改is_start
    is_start = obj.is_start
    if is_start:
        obj.is_start = False
    else:
        obj.is_start = True
    obj.save()
    return JsonResponse(data)


def comment(request):
    """
    评论
    :param request:
    :return:


    """
    data = {

        'status': 200,
    }
    userinfo_id = request.session.get('user_dic').get('id')

    id = request.POST.get('id')
    # print(book_id)
    comment = request.POST.get('comment')

    comment = comment.strip()
    if not comment:
        data['status'] = 201
        return JsonResponse(data)
    userinfo = models.UserInfo.objects.get(id=userinfo_id)
    # 创建评论记录
    models.Comment.objects.create(comment=comment, userinfo=userinfo, depth=1, community_id=id)
    return JsonResponse(data)


def apply_for(request):
    """
    申请
    :param request:
    :return:
    """
    data = {

        'status': 200,
    }
    userinfo_id = request.session.get('user_dic').get('id')

    id = request.POST.get('id')
    # 第一个值是查到或者创建的数据，第二个值是一个布尔，表示是否执行了创建操作。创建为True，未创建为False
    obj, bol = models.Apply.objects.get_or_create(community_id=id, userinfo_id=userinfo_id)
    if bol:
        # 新建
        data['msg'] = '申请成功，请耐心等待'
    else:
        # 查询到了
        data['status'] = 201
        data['msg'] = '您已经申请过了，请耐心等待'

    return JsonResponse(data)


def com_shelf(request):
    """
    收藏
    :param request:
    :return:
    """
    userinfo_id = request.session.get('user_dic').get('id')
    query = models.Com_Shelf.objects.filter(userinfo_id=userinfo_id, is_delete=False, is_active=True,
                                            is_start=True).order_by(
        '-id').select_related('userinfo', 'community')
    return render(request, 'others/com_shelf.html', locals())


def apply_reg(request):
    """
    申请记录
    :param request:
    :return:
    """
    userinfo_id = request.session.get('user_dic').get('id')
    query = models.Apply.objects.filter(userinfo_id=userinfo_id, is_delete=False, is_active=True).order_by(
        '-id').select_related('userinfo', 'community')
    return render(request, 'others/apply_reg.html', locals())
