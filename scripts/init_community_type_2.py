import os
import sys
import django

base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(base_dir)

# 替换下面这一句即可，在manage.py里面找
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'community_management.settings')

django.setup()
from mysql import models
from utils.md5 import md5

models.Community_Type.objects.create(name='校级')
models.Community_Type.objects.create(name='院级')
models.Community_Type.objects.create(name='专业级')
models.Community_Type.objects.create(name='业余级')
models.Community_Type.objects.create(name='其它')
