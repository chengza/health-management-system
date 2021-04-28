"""djangoProject11 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from login import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
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
