from django import forms

from mysql import models
from utils.boot import BootStrapForm


class AdminCommentModelForm(BootStrapForm, forms.ModelForm):
    """
    新闻form
    """
    except_bootstrap_styles = ['is_active']

    class Meta:
        model = models.Comment
        fields = ['comment', 'userinfo', 'community']
