# 体检健康管理系统

### 项目依赖

1. 项目使用MySQL5.7数据库
2. 项目使用python2.7，而不是python3
3. 安装r.txt中的依赖即可
4. Windows上安装以来可能无法安装MySQL_python，使用离线安装包whl安装即可

```
certifi==2020.6.20
Django==1.11.29
MySQL-python==1.2.5
pytz==2022.1
wincertstore==0.2
```

### 部署和运行

1. python manage.py migrate
2. python manage.py runserver
3. 在浏览器中访问/add_role地址来添加后台管理员
4. 后台管理登录地址是/control
5. 前台用户自己注册即可
6. 可以使用health-dump.sql导入数据库来排除数据库导致的错误