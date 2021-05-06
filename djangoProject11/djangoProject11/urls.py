# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.contrib import admin
from login import views



urlpatterns = [
    # 后台
    # url(r'^control/', control.site.urls),
    url(r'^control/', views.control),  # 后台路由
    url(r'^userlist/', views.userlist),  # 用户管理
    url(r'^adduser/', views.adduser),  # 新增用户
    url(r'^rolelist/', views.rolelist),  # 管理员管理
    url(r'^add_role/', views.add_role),  # 新增管理员
    url(r'^Base_info/', views.control_Base_info),  # 基本信息
    url(r'^Normal/', views.control_Normal),  # 一般检查
    url(r'^Internal/', views.control_Internal),  # 内科检查
    url(r'^Surgical/', views.control_Surgical),  # 外科检查
    url(r'^internal_new/', views.internal_new),  # 内科新闻
    url(r'^add_Internal_news/', views.add_Internal_news),  # 增加内科新闻
    url(r'^surgery_new/', views.surgery_new),  # 外科新闻
    url(r'^add_surgery_news/', views.add_surgery_news),  # 增加外科新闻

    # 首页
    url(r'^index/', views.index),
    url(r'^internal_knowledge/', views.internal_knowledge),
    url(r'^surgery_knowledge/', views.surgery_knowledge),
    url(r'^logout/', views.logout),
    url(r'^login/', views.login),
    url(r'^register/', views.register),
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
    # 个人信息
    url(r'^person/',views.person),
    # 健康评价
    url(r'^comment/',views.comment),


    # url(r'^base/',views.base),
    # url(r'^test/', views.test),
]
