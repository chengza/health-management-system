# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect
from . import models
from .forms import UserForm, RegisterForm
from .models import User, Message, Person
from django.core.paginator import Paginator, InvalidPage, EmptyPage, PageNotAnInteger

# 后台路由

from django.db import connection

# 后台路由
def control(request):
    return render(request, 'control/index.html')
# 用户列表页面
def userlist(request):
    users = models.User.objects.filter()
    return render(request, 'control/userlist.html', {"users":users, 'long':len(users)})
# 增加用户页面
def adduser(request):
    if request.method == "GET":
        print('get方式访问增加用户页面')
        return render(request, 'control/adduser.html')
    else:
        username = request.POST.get("username")
        password = request.POST.get("password")
        email = request.POST.get("email")
        sex = request.POST.get("sex")

        new_user = models.User.objects.create()
        new_user.name = username
        new_user.password = password
        new_user.email = email
        if sex == 0:
            new_user.sex = "male"
        else:
            new_user.sex = "female"
        new_user.save()
    return render(request, 'control/index.html')
# 管理员管理页面
def rolelist(request):
    controls = models.Control.objects.filter()
    return render(request, 'control/rolelist.html', {"controls": controls, 'long': len(controls)})
# 增加管理员页面
def add_role(request):
    if request.method == "GET":
        print('get方式访问增加用户页面')
        return render(request, 'control/add_role.html')
    else:
        username = request.POST.get("username")
        password = request.POST.get("password")
        email = request.POST.get("email")
        sex = request.POST.get("sex")

        new_control = models.Control.objects.create()
        new_control.name = username
        new_control.password = password
        new_control.email = email
        if sex == 0:
            new_control.sex = "male"
        else:
            new_control.sex = "female"
        new_control.save()
    return render(request, 'control/index.html')
# 基本信息
def control_Base_info(request):
    persons = models.Person.objects.filter()
    return render(request, 'control/Base_info.html', {"persons": persons, 'long': len(persons)})
# 一般信息
def control_Normal(request):
    return render(request, 'control/Normal.html')
# 内科信息
def control_Internal(request):
    return render(request, 'control/Normal.html')
# 外科信息
def control_Surgical(request):
    return render(request, 'control/Normal.html')
# 内科新闻管理
def internal_new(request):
    return render(request, 'control/Internal_new.html')
# 增加内科新闻
def add_Internal_news(request):
    return render(request, 'control/add_Internal_news.html')
# 外科新闻管理
def surgery_new(request):
    return render(request, 'control/surgery_new.html')
# 增加外科新闻
def add_surgery_news(request):
    return render(request, 'control/add_surgery_news.html')


# 前台路由
def index(request):
    return render(request, 'index/index.html')


def internal_knowledge(request):
    return render(request, './knowledge/internal_knowledge.html')

def surgery_knowledge(request):
    return render(request, './knowledge/surgery_knowledge.html')

def person(request):
    if request.method == "GET":
        print('get请求个人信息页面')
        return render(request, 'health/person.html')
    else:
        print('Post请求个人信息页面')
        sex = request.POST.get('gender')
        number = request.POST.get('number')
        name = request.POST.get('username')
        age = request.POST.get('age')
        height = request.POST.get('height')
        weight = request.POST.get('weight')
        # birthday = request.POST.get('birthday')
        # print(sex, number, name, age, height, weight, birthday)
        item = Person(number=number, name=name, height=height, weight=weight, age=age, sex=sex)
        item.save()
        return render(request, 'health/result.html')

def login(request):

    if request.method == "POST":
        login_form = UserForm(request.POST)
        message = "请检查填写的内容！"
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            print("账号密码是：", username, password)
            try:
                user = models.User.objects.get(name=username)
                if user.password == password:
                    request.session['is_login'] = True
                    request.session['user_id'] = user.id
                    request.session['user_name'] = user.name
                    return redirect('/index')
                else:
                    message = "密码不正确！"
            except:
                message = "用户不存在！"
        return render(request, 'login/login.html', locals())

    login_form = UserForm()
    return render(request, 'login/login.html', locals())


def register(request):
    # if request.session.get('is_login', None):
    #     # 登录状态不允许注册。你可以修改这条原则！
    #     return redirect("/index/")
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = "请检查填写的内容！"
        if register_form.is_valid():  # 获取数据
            username = register_form.cleaned_data['username']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            sex = register_form.cleaned_data['sex']
            if password1 != password2:  # 判断两次密码是否相同
                message = "两次输入的密码不同！"
                return render(request, 'login/register.html', locals())
            else:
                same_name_user = models.User.objects.filter(name=username)
                if same_name_user:  # 用户名唯一
                    message = '用户已经存在，请重新选择用户名！'
                    return render(request, 'login/register.html', locals())
                same_email_user = models.User.objects.filter(email=email)
                if same_email_user:  # 邮箱地址唯一
                    message = '该邮箱地址已被注册，请使用别的邮箱！'
                    return render(request, 'login/register.html', locals())

                # 当一切都OK的情况下，创建新用户

                new_user = models.User.objects.create()
                new_user.name = username
                new_user.password = password1
                new_user.email = email
                new_user.sex = sex
                new_user.save()
                return redirect('/login/')  # 自动跳转到登录页面
    register_form = RegisterForm()
    return render(request, 'login/register.html', locals())


def logout(request):
    if not request.session.get('is_login', None):
        # 如果本来就未登录，也就没有登出一说
        return redirect("/index/")
    request.session.flush()
    # 或者使用下面的方法
    # del request.session['is_login']
    # del request.session['user_id']
    # del request.session['user_name']
    return redirect("/index/")



def questionnaire(request):
    # print 1
    return render(request, 'health/questionnaire.html')
    # return render(request,'health/questionnaire.html')



def normal(request):
    if request.method == "GET":
        return render(request, 'health/normal.html')
    else:
        name = request.POST.get('name')
        height = request.POST.get('height')
        weight = request.POST.get('weight')
        rvision = request.POST.get('right_vision')
        lvision = request.POST.get('left_vision')
        pulmonary = request.POST.get('pulmonary')
        item = Normal(name=name, height=height, weight=weight, right_vision=rvision, left_vision=lvision,
                      pulmonary=pulmonary)
        item.save()
        return render(request, 'health/result.html')


def internal(request):
    return render(request, 'health/internal.html')



def surgery(request):
    return render(request, 'health/surgery.html')


def question(request):
    if request.method == 'GET':
        return render(request, 'health/question.html')
    else:
        id1 = request.POST.get('rdoSCL90_1')
        id2 = request.POST.get('rdoSCL90_2')
        id3 = request.POST.get('rdoSCL90_3')
        id4 = request.POST.get('rdoSCL90_4')
        id5 = request.POST.get('rdoSCL90_5')
        id6 = request.POST.get('rdoSCL90_6')
        id7 = request.POST.get('rdoSCL90_7')
        id8 = request.POST.get('rdoSCL90_8')
        id9 = request.POST.get('rdoSCL90_9')
        id10 = request.POST.get('rdoSCL90_10')
        id11 = request.POST.get('rdoSCL90_11')
        id12 = request.POST.get('rdoSCL90_12')
        id13 = request.POST.get('rdoSCL90_13')
        id14 = request.POST.get('rdoSCL90_14')
        id15 = request.POST.get('rdoSCL90_15')
        id16 = request.POST.get('rdoSCL90_16')
        id17 = request.POST.get('rdoSCL90_17')
        id18 = request.POST.get('rdoSCL90_18')
        id19 = request.POST.get('rdoSCL90_19')
        id20 = request.POST.get('rdoSCL90_20')
        id21 = request.POST.get('rdoSCL90_21')
        id22 = request.POST.get('rdoSCL90_22')
        id23 = request.POST.get('rdoSCL90_23')
        id24 = request.POST.get('rdoSCL90_24')
        id25 = request.POST.get('rdoSCL90_25')
        id26 = request.POST.get('rdoSCL90_26')
        id27 = request.POST.get('rdoSCL90_27')
        id28 = request.POST.get('rdoSCL90_28')
        id29 = request.POST.get('rdoSCL90_29')
        id30 = request.POST.get('rdoSCL90_30')
        id31 = request.POST.get('rdoSCL90_31')
        id32 = request.POST.get('rdoSCL90_32')
        id33 = request.POST.get('rdoSCL90_33')
        id34 = request.POST.get('rdoSCL90_34')
        id35 = request.POST.get('rdoSCL90_35')
        id36 = request.POST.get('rdoSCL90_36')
        id37 = request.POST.get('rdoSCL90_37')
        id38 = request.POST.get('rdoSCL90_38')
        id39 = request.POST.get('rdoSCL90_39')
        id40 = request.POST.get('rdoSCL90_40')
        id41 = request.POST.get('rdoSCL90_41')
        id42 = request.POST.get('rdoSCL90_42')
        id43 = request.POST.get('rdoSCL90_43')
        id44 = request.POST.get('rdoSCL90_44')
        id45 = request.POST.get('rdoSCL90_45')
        id46 = request.POST.get('rdoSCL90_46')
        id47 = request.POST.get('rdoSCL90_47')
        id48 = request.POST.get('rdoSCL90_48')
        id49 = request.POST.get('rdoSCL90_49')
        id50 = request.POST.get('rdoSCL90_50')
        id51 = request.POST.get('rdoSCL90_51')
        id52 = request.POST.get('rdoSCL90_52')
        id53 = request.POST.get('rdoSCL90_53')
        id54 = request.POST.get('rdoSCL90_54')
        id55 = request.POST.get('rdoSCL90_55')
        id56 = request.POST.get('rdoSCL90_56')
        id57 = request.POST.get('rdoSCL90_57')
        id58 = request.POST.get('rdoSCL90_58')
        id59 = request.POST.get('rdoSCL90_59')
        id60 = request.POST.get('rdoSCL90_60')
        id61 = request.POST.get('rdoSCL90_61')
        id62 = request.POST.get('rdoSCL90_62')
        id63 = request.POST.get('rdoSCL90_63')
        id64 = request.POST.get('rdoSCL90_64')
        id65 = request.POST.get('rdoSCL90_65')
        id66 = request.POST.get('rdoSCL90_66')
        id67 = request.POST.get('rdoSCL90_67')
        id68 = request.POST.get('rdoSCL90_68')
        id69 = request.POST.get('rdoSCL90_69')
        id70 = request.POST.get('rdoSCL90_70')
        id71 = request.POST.get('rdoSCL90_71')
        id72 = request.POST.get('rdoSCL90_72')
        id73 = request.POST.get('rdoSCL90_73')
        id74 = request.POST.get('rdoSCL90_74')
        id75 = request.POST.get('rdoSCL90_75')
        id76 = request.POST.get('rdoSCL90_76')
        id77 = request.POST.get('rdoSCL90_77')
        id78 = request.POST.get('rdoSCL90_78')
        id79 = request.POST.get('rdoSCL90_79')
        id80 = request.POST.get('rdoSCL90_80')
        id81 = request.POST.get('rdoSCL90_81')
        id82 = request.POST.get('rdoSCL90_82')
        id83 = request.POST.get('rdoSCL90_83')
        id84 = request.POST.get('rdoSCL90_84')
        id85 = request.POST.get('rdoSCL90_85')
        id86 = request.POST.get('rdoSCL90_86')
        id87 = request.POST.get('rdoSCL90_87')
        id88 = request.POST.get('rdoSCL90_88')
        id89 = request.POST.get('rdoSCL90_89')
        id90 = request.POST.get('rdoSCL90_90')
        name = request.POST.get('name')
        item1 = Message(name=name, item1=id1, item2=id2, item3=id3, item4=id4, item5=id5, item6=id6, item7=id7,
                        item8=id8, item9=id9, item10=id10, item11=id11
                        , item12=id12, item13=id13, item14=id14, item15=id15, item16=id16, item17=id17, item18=id18,
                        item19=id19, item20=id20, item21=id21, item22=id22, item23=id23
                        , item24=id24, item25=id25, item26=id26, item27=id27, item28=id28, item29=id29, item30=id30,
                        item31=id31, item32=id32, item33=id33, item34=id34, item35=id35
                        , item36=id36, item37=id37, item38=id38, item39=id39, item40=id40, item41=id41, item42=id42,
                        item43=id43, item44=id44, item45=id45, item46=id46, item47=id47
                        , item48=id48, item49=id49, item50=id50, item51=id51, item52=id52, item53=id53, item54=id54,
                        item55=id55, item56=id56, item57=id57, item58=id58, item59=id59
                        , item60=id60, item61=id61, item62=id62, item63=id63, item64=id64, item65=id65, item66=id66,
                        item67=id67, item68=id68, item69=id69, item70=id70, item71=id71
                        , item72=id72, item73=id73, item74=id74, item75=id75, item76=id76, item77=id77, item78=id78,
                        item79=id79, item80=id80, item81=id81, item82=id82, item83=id83
                        , item84=id84, item85=id85, item86=id86, item87=id87, item88=id88, item89=id89, item90=id90)
        item1.save()
        return render(request,'health/wenjuantiaozhuan.html')




def result(request):
    return render(request, 'health/result.html')


def test(request):
    return render(request, 'health/result.html')


def comment(request):
    username = request.session['user_name']
    normal = models.Person.objects.filter(number=username)
    cursor = connection.cursor()
    cursor.execute("select weight/((height/100)*(height/100)) from login_person where number = %s",username)
    BMI = cursor.fetchone()
    return render(request, 'health/comment.html',{'normal':normal,'BMI':BMI})


def questionresult(request):
    username = request.session['user_name']
    # message = models.Message.objects.get(name=username)
    # return render(request, 'health/questionresult.html',{'message':message})
    cursor = connection.cursor()
    cursor.execute("select (item1+item4+item12+item27+item40+item42+item48+item49+item52+item53+item56+item58)/12 from login_message")
    F1 = cursor.fetchone()
    cursor.execute("select (item3+item9+item10+item28+item38+item45+item46+item51+item55+item65)/10 from login_message")
    F2 = cursor.fetchone()
    cursor.execute("select (item6+item21+item34+item36+item37+item41+item61+item69+item73)/9 from login_message")
    F3 = cursor.fetchone()
    cursor.execute("select (item5+item14+item15+item20+item22+item26+item29+item30+item31+item32+item54+item71+item79)/13 from login_message")
    F4 = cursor.fetchone()
    cursor.execute("select (item2+item17+item23+item33+item39+item57+item72+item78+item80+item86)/10 from login_message")
    F5 = cursor.fetchone()
    cursor.execute("select (item11+item24+item63+item67+item74+item81)/6 from login_message")
    F6 = cursor.fetchone()
    cursor.execute("select (item13+item25+item47+item50+item70+item75+item82)/7 from login_message")
    F7 = cursor.fetchone()
    cursor.execute("select (item8+item18+item43+item68+item76+item83)/6 from login_message")
    F8 = cursor.fetchone()
    cursor.execute("select (item7+item16+item35+item62+item77+item84+item85+item87+item88+item90)/10 from login_message")
    F9 = cursor.fetchone()
    cursor.execute("select (item19+item44+item59+item60+item64+item66+item89)/7 from login_message")
    F10 = cursor.fetchone()
    obj = models.Message.objects.get(name=username)
    obj.delete()
    return render(request,'health/questionresult.html',
                  {'F1':F1,'F2':F2,'F3':F3,'F4':F4,'F5':F5,'F6':F6,'F7':F7,'F8':F8,'F9':F9,'F10':F10})

def wenjuantiaozhuan(request):
    return render(request,'wenjuantiaozhuan.html')