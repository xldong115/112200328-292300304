import os
import sys
import django

base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(base_dir)

# 替换下面这一句即可，在manage.py里面找
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'community_management.settings')

django.setup()
from mysql import models

models.Community.objects.create(name='羽毛球', desc='我们不错', community_type_id=1)
models.Community.objects.create(name='大学生联欢社', desc='我们爱好', community_type_id=2)
models.Community.objects.create(name='机器人', desc='我们都行', community_type_id=3)
models.Community.objects.create(name='足球', desc='我们不太好', community_type_id=4)
