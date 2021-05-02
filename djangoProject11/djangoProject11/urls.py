# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.contrib import admin
from login import views



urlpatterns = [
    # 后台
    # url(r'^control/', control.site.urls),
    url(r'^control/', views.control),
    url(r'^authstr/', views.authstr),
    url(r'^launch/', views.launch),
    # 首页
    url(r'^index/', views.index),
    url(r'^knowledge/', views.knowledge),
    url(r'^login/', views.login),
    url(r'^register/', views.register),
    url(r'^logout/', views.logout),
    # 健康问卷
    url(r'^questionnaire/',views.questionnaire),
    url(r'^question/', views.question),
    url(r'^result/', views.result),
    url(r'^questionresult/', views.questionresult),
    # 内科检查
    url(r'^internal/',views.internal),
    # 外科
    url(r'^surgery/',views.surgery),
    # 一般检查
    url(r'^normal/', views.normal),
    # 个人中心
    url(r'^person/',views.person),
    # 健康评价
    url(r'^comment/',views.comment),
    url(r'^base/',views.base),
    url(r'^test/', views.test),
]
