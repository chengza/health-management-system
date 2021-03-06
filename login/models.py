# -*- coding: utf-8 -*-
# login/models.py

from django.db import models


class User(models.Model):
    '''用户表'''
    gender = (
        ('male','男'),
        ('female','女'),
    )

    name = models.CharField(max_length=128)
    password = models.CharField(max_length=256)
    email = models.EmailField()
    sex = models.CharField(max_length=32,choices=gender,default='男')
    c_time = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.name

    class Meta:
        ordering = ['c_time']
        verbose_name = '用户'
        verbose_name_plural = '用户'

class Control(models.Model):
    '''管理员'''
    gender = (
        ('male','男'),
        ('female','女'),
    )

    name = models.CharField(max_length=128,unique=True)
    password = models.CharField(max_length=256)
    email = models.EmailField(unique=True)
    sex = models.CharField(max_length=32,choices=gender,default='男')
    c_time = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.name

    class Meta:
        ordering = ['c_time']
        verbose_name = '管理员'
        verbose_name_plural = '管理员'


class Person(models.Model):
    gender = (
        ('male', '男'),
        ('female', '女'),
    )
    number = models.CharField(max_length=128)
    name = models.CharField(max_length=128)
    height = models.IntegerField()
    weight = models.IntegerField()
    age = models.IntegerField()
    sex = models.CharField(max_length=32,choices=gender,default='男')
    birthday = models.DateField(auto_now=False)

    def __str__(self):
        return self.name

class Message(models.Model):
    name = models.CharField(max_length=128)
    item1 = models.IntegerField()
    item2 = models.IntegerField()
    item3 = models.IntegerField()
    item4 = models.IntegerField()
    item5 = models.IntegerField()
    item6 = models.IntegerField()
    item7 = models.IntegerField()
    item8 = models.IntegerField()
    item9 = models.IntegerField()
    item10 = models.IntegerField()
    item11 = models.IntegerField()
    item12 = models.IntegerField()
    item13 = models.IntegerField()
    item14 = models.IntegerField()
    item15 = models.IntegerField()
    item16 = models.IntegerField()
    item17 = models.IntegerField()
    item18 = models.IntegerField()
    item19 = models.IntegerField()
    item20 = models.IntegerField()
    item21 = models.IntegerField()
    item22 = models.IntegerField()
    item23 = models.IntegerField()
    item24 = models.IntegerField()
    item25 = models.IntegerField()
    item26 = models.IntegerField()
    item27 = models.IntegerField()
    item28 = models.IntegerField()
    item29 = models.IntegerField()
    item30 = models.IntegerField()
    item31 = models.IntegerField()
    item32 = models.IntegerField()
    item33 = models.IntegerField()
    item34 = models.IntegerField()
    item35 = models.IntegerField()
    item36 = models.IntegerField()
    item37 = models.IntegerField()
    item38 = models.IntegerField()
    item39 = models.IntegerField()
    item40 = models.IntegerField()
    item41 = models.IntegerField()
    item42 = models.IntegerField()
    item43 = models.IntegerField()
    item44 = models.IntegerField()
    item45 = models.IntegerField()
    item46 = models.IntegerField()
    item47 = models.IntegerField()
    item48 = models.IntegerField()
    item49 = models.IntegerField()
    item50 = models.IntegerField()
    item51 = models.IntegerField()
    item52 = models.IntegerField()
    item53 = models.IntegerField()
    item54 = models.IntegerField()
    item55 = models.IntegerField()
    item56 = models.IntegerField()
    item57 = models.IntegerField()
    item58 = models.IntegerField()
    item59 = models.IntegerField()
    item60 = models.IntegerField()
    item61 = models.IntegerField()
    item62 = models.IntegerField()
    item63 = models.IntegerField()
    item64 = models.IntegerField()
    item65 = models.IntegerField()
    item66 = models.IntegerField()
    item67 = models.IntegerField()
    item68 = models.IntegerField()
    item69 = models.IntegerField()
    item70 = models.IntegerField()
    item71 = models.IntegerField()
    item72 = models.IntegerField()
    item73 = models.IntegerField()
    item74 = models.IntegerField()
    item75 = models.IntegerField()
    item76 = models.IntegerField()
    item77 = models.IntegerField()
    item78 = models.IntegerField()
    item79 = models.IntegerField()
    item80 = models.IntegerField()
    item81 = models.IntegerField()
    item82 = models.IntegerField()
    item83 = models.IntegerField()
    item84 = models.IntegerField()
    item85 = models.IntegerField()
    item86 = models.IntegerField()
    item87 = models.IntegerField()
    item88 = models.IntegerField()
    item89 = models.IntegerField()
    item90 = models.IntegerField()

    def __str__(self):
        return self.name

class Normal(models.Model):
    name = models.CharField(max_length=128)
    height = models.IntegerField()
    weight = models.IntegerField()
    right_vision = models.CharField(max_length=128)
    left_vision = models.CharField(max_length=128)
    pulmonary = models.CharField(max_length=128)
    date = models.DateField(auto_now=True)

    def __str__(self):
        return self.name

class Internal(models.Model):
    name = models.CharField(max_length=128)
    # 脉搏
    pulse = models.CharField(max_length=128)
    # 血压
    bloodpressure = models.CharField(max_length=128)
    # 心率
    heart = models.CharField(max_length=128)
    # 肝脏
    liver = models.IntegerField()
    # 脾脏
    spleen = models.IntegerField()
    # 肾脏
    kidney = models.IntegerField()
    # 腹部
    abdomen = models.IntegerField()
    def __str__(self):
        return self.name

class Surgery(models.Model):
    name = models.CharField(max_length=128)
    # 甲状腺
    thyroid = models.CharField(max_length=128)
    # 淋巴结
    lymphgland = models.CharField(max_length=128)
    # 乳腺
    breast = models.CharField(max_length=128)
    # 脊柱
    spine = models.CharField(max_length=128)
    # 四肢关节
    Limbjoints = models.CharField(max_length=128)
    def __str__(self):
        return self.name

class InternalNews(models.Model):
    # 发布者
    Publisher = models.CharField(max_length=128)
    # 标题
    Internaltitle = models.CharField(max_length=128)
    # 日期
    Internaldate = models.DateField(auto_now=True)
    # 关键字
    Internalkeywords = models.CharField(max_length=128)
    # 导读
    Internalpreread = models.CharField(max_length=128)
    # 正文
    Internalarticle = models.TextField()

    def __str__(self):
        return self.name

class SurgeryNews(models.Model):
    Publisher = models.CharField(max_length=128)
    Surgerytitle = models.CharField(max_length=128)
    Surgerydate = models.DateField(auto_now=True)
    Surgerykeywords = models.CharField(max_length=128)
    Surgerypreread = models.CharField(max_length=128)
    Surgeryarticle = models.TextField()
    def __str__(self):
        return self.name