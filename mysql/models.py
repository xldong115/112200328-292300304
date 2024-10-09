from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser

from utils.models import BaseModel


class UserInfo(AbstractUser):
    """用户模型类"""
    user_type_choices = (
        (1, '用户'),
        (2, '管理员')
    )

    # 用户类型
    user_type = models.SmallIntegerField(verbose_name='用户类型', choices=user_type_choices, default=1)
    # 手机号
    telephone = models.CharField(max_length=11, verbose_name='手机号码', null=True, blank=True)
    avatar = models.ImageField(upload_to="avatar", verbose_name="头像图片", default='avatar/avatar.jpg')
    addr = models.TextField(verbose_name='学生来源', null=True, blank=True)
    community = models.ForeignKey(verbose_name='项目', to="Community", on_delete=models.DO_NOTHING, db_constraint=False,
                                  related_name='u_com', null=True, blank=True)

    class Meta:
        db_table = 'mysql_userinfo'  # 创建的表名，如果不写，默认app_userinfo
        # 下面两个是配套的，用来在admin中表名显示汉字
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class Community(BaseModel):
    """
    项目
    """
    name = models.CharField(verbose_name='项目名称', null=True, blank=True, max_length=225)
    # 12l
    com_img = models.ImageField(upload_to="mysql", verbose_name="项目图片", default='mysql/mysql.jpg')
    desc = models.TextField(verbose_name='更多介绍', null=True, blank=True)

    hot = models.FloatField(verbose_name='热度', default=0.00528)
    community_type = models.ForeignKey(verbose_name='项目类型', to="Community_Type", on_delete=models.DO_NOTHING,
                                       db_constraint=False,
                                       related_name='c_ct', null=True, blank=True)

    class Meta:
        db_table = 'mysql_community'
        verbose_name = '项目'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Community_Type(BaseModel):
    """
    二级学院
    """
    name = models.CharField(verbose_name='分类名称', max_length=64)

    class Meta:
        db_table = 'mysql_community_type'
        verbose_name = '项目分类'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Comment(BaseModel):
    """
    评论
    """
    """评论表"""
    comment = models.CharField(verbose_name='评论内容', max_length=225, null=True, blank=True)
    userinfo = models.ForeignKey(verbose_name='用户', to=UserInfo, on_delete=models.DO_NOTHING, db_constraint=False,
                                 null=True, blank=True, related_name='comment_userinfo')

    reply = models.ForeignKey(verbose_name='父评论', to='self', on_delete=models.DO_NOTHING, db_constraint=False,
                              null=True, blank=True, related_name='comment_reply')

    depth = models.PositiveIntegerField(verbose_name='评论深度', default=1)

    root = models.PositiveIntegerField(verbose_name='父id', null=True, blank=True)
    community = models.ForeignKey(verbose_name='项目', to='Community', on_delete=models.DO_NOTHING,
                                  db_constraint=False, related_name='c_b')

    class Meta:
        db_table = "mysql_comment"


class Shelf(BaseModel):
    """
    收藏
    """
    community = models.ForeignKey(verbose_name='项目', to='Community', on_delete=models.DO_NOTHING, db_constraint=False,
                                  related_name='cs_c', null=True, blank=True)
    userinfo = models.ForeignKey(verbose_name='用户', to=UserInfo, on_delete=models.DO_NOTHING, db_constraint=False,
                                 related_name='cs_u', null=True, blank=True)
    is_start = models.BooleanField(verbose_name='收藏字段', default=False)


class Apply(BaseModel):
    """
    申请记录
    """
    apply_type_choices = (
        (1, '未处理'),
        (2, '同意'),
        (3, '拒绝'),
        (4, '剔除'),
    )
    community = models.ForeignKey(verbose_name='项目', to='Community', on_delete=models.DO_NOTHING, db_constraint=False,
                                  related_name='ap_c', null=True, blank=True)
    userinfo = models.ForeignKey(verbose_name='用户', to=UserInfo, on_delete=models.DO_NOTHING, db_constraint=False,
                                 related_name='ap_u', null=True, blank=True)
    apply_type = models.SmallIntegerField(verbose_name='进度', choices=apply_type_choices, default=1)

    class Meta:
        db_table = 'mysql_apply'
        verbose_name = '申请记录'
        verbose_name_plural = verbose_name


class Active(BaseModel):
    """
    项目
    """
    name = models.CharField(verbose_name='活动名称', max_length=64, null=True, blank=True)
    community = models.ForeignKey(verbose_name='项目', to='Community', on_delete=models.DO_NOTHING, db_constraint=False,
                                  related_name='act_c', null=True, blank=True)
    desc = models.TextField(verbose_name='项目介绍', max_length=64, null=True, blank=True)

    class Meta:
        db_table = 'mysql_active'  # 创建的表名，如果不写，默认app_userinfo
        # 下面两个是配套的，用来在admin中表名显示汉字
        verbose_name = '项目'
        verbose_name_plural = verbose_name
