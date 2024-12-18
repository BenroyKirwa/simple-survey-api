# Generated by Django 5.1.3 on 2024-11-13 12:44

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('survey', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='survey',
            name='created_at',
        ),
        migrations.AlterField(
            model_name='option',
            name='question',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='options', to='survey.question'),
        ),
        migrations.AlterField(
            model_name='question',
            name='survey',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='questions', to='survey.survey'),
        ),
        migrations.AlterField(
            model_name='survey',
            name='title',
            field=models.CharField(max_length=255),
        ),
    ]
