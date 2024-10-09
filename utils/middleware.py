from django.utils.deprecation import MiddlewareMixin
from django.http import HttpResponse
from django.shortcuts import HttpResponse, redirect
from django.conf import settings

class AuthMiddleware(MiddlewareMixin):

    # 设置白名单，有些url无需登录就能访问
    def is_white_url_by_path_info(self, request):
        if request.path_info in settings.WHITE_LIST:
            return True

    def process_request(self, request):

        if self.is_white_url_by_path_info(request):
            return
        # 判断用户是否已经登录
        user_dic = request.session.get('user_dic')
        if not user_dic:
            return redirect('user_login')

        # path_url = request.path_info
        # if not path_url in settings.WHITE_LIST:
        #
        #     if not user_dic:
        #         return redirect('user_login')
        #     pass
