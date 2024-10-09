from django import forms

from mysql import models
from utils.boot import BootStrapForm


class AdminComTypeModelForm(BootStrapForm, forms.ModelForm):
    """
    社团类型form
    """
    except_bootstrap_styles = ['is_active']

    class Meta:
        model = models.Community_Type
        fields = ['name']
