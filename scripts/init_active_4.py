import os
import sys
import django

base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(base_dir)

# 替换下面这一句即可，在manage.py里面找
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'community_management.settings')

django.setup()
from mysql import models

models.Active.objects.create(name='联欢晚会', desc='星期六，欢迎新生', community_id=1)
models.Active.objects.create(name='化妆晚会', desc='星期五，欢迎新生', community_id=2)
models.Active.objects.create(name='滑板晚会', desc='星期一，欢迎新生', community_id=3)
models.Active.objects.create(name='联欢晚会', desc='星期六，欢迎新生', community_id=1)
models.Active.objects.create(name='化妆晚会', desc='星期五，欢迎新生', community_id=2)
models.Active.objects.create(name='滑板晚会', desc='星期一，欢迎新生', community_id=3)
models.Active.objects.create(name='联欢晚会', desc='星期六，欢迎新生', community_id=1)
models.Active.objects.create(name='化妆晚会', desc='星期五，欢迎新生', community_id=2)
models.Active.objects.create(name='滑板晚会', desc='星期一，欢迎新生', community_id=3)
