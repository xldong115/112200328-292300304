from django import forms

from mysql import models
from utils.boot import BootStrapForm
from utils.md5 import md5


class AdminUserModelForm(BootStrapForm, forms.ModelForm):
    """
    用户form
    """
    except_bootstrap_styles = ['is_active', 'is_superuser']

    class Meta:
        model = models.UserInfo
        fields = ['username', 'telephone', 'addr', 'community', 'is_active', 'is_superuser']

    def clean_password(self):
        password = self.cleaned_data.get("password")
        if password == md5(md5('123456')):
            password = md5('123456')
        else:
            password = md5(password)
        return password
