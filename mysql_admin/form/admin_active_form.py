from django import forms

from com import models
from utils.boot import BootStrapForm


class AdminActiveModelForm(BootStrapForm, forms.ModelForm):
    """
    社团form
    """
    except_bootstrap_styles = ['is_active']

    class Meta:
        model = models.Community
        fields = ['name', 'community', 'desc']
