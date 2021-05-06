# -*- coding:utf-8 -*-
# Generated by Django 2.0.2 on 2021-05-06 14:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0003_auto_20210406_1636'),
    ]

    operations = [
        migrations.CreateModel(
            name='Control',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, unique=True)),
                ('password', models.CharField(max_length=256)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('sex', models.CharField(choices=[('male', '男'), ('female', '女')], default='男', max_length=32)),
                ('c_time', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
