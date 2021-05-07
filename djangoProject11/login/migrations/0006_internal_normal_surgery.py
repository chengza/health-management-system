# Generated by Django 2.0.2 on 2021-05-07 09:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0005_auto_20210506_1603'),
    ]

    operations = [
        migrations.CreateModel(
            name='Internal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('pulse', models.CharField(max_length=128)),
                ('bloodpressure', models.CharField(max_length=128)),
                ('heart', models.CharField(max_length=128)),
                ('liver', models.CharField(max_length=128)),
                ('spleen', models.CharField(max_length=128)),
                ('kidney', models.CharField(max_length=128)),
                ('abdomen', models.CharField(max_length=128)),
            ],
        ),
        migrations.CreateModel(
            name='Normal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('height', models.IntegerField()),
                ('weight', models.IntegerField()),
                ('right_vision', models.CharField(max_length=128)),
                ('left_vision', models.CharField(max_length=128)),
                ('pulmonary', models.CharField(max_length=128)),
                ('date', models.DateField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Surgery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('thyroid', models.CharField(max_length=128)),
                ('lymphgland', models.CharField(max_length=128)),
                ('breast', models.CharField(max_length=128)),
                ('spine', models.CharField(max_length=128)),
                ('Limbjoints', models.CharField(max_length=128)),
            ],
        ),
    ]
