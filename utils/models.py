from django.db import models

class BaseModel(models.Model):
    is_active = models.BooleanField(verbose_name='是否激活，用作用户操作', default=True)
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    update_time = models.DateTimeField(verbose_name='更新时间', auto_now=True)
    is_delete = models.BooleanField(verbose_name='是否删除，用作管理员操作', default=False)

    class Meta:
        # 抽象表
        abstract = True
