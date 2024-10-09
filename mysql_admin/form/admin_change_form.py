from django import forms

from mysql import models
from utils.boot import BootStrapForm


class AdminChangeModelForm(BootStrapForm, forms.ModelForm):
    """
    社团form
    """
    except_bootstrap_styles = ['is_active']

    class Meta:
        model = models.Apply
        fields = ['community', 'userinfo', 'apply_type']
