# Generated by Django 2.0.2 on 2021-05-11 14:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0009_internalnews_surgerynews'),
    ]

    operations = [
        migrations.AlterField(
            model_name='internal',
            name='abdomen',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='internal',
            name='kidney',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='internal',
            name='liver',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='internal',
            name='spleen',
            field=models.IntegerField(),
        ),
    ]