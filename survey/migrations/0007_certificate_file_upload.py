# Generated by Django 5.1.3 on 2024-11-16 13:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('survey', '0006_remove_certificate_file_upload_certificate_question_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='certificate',
            name='file_upload',
            field=models.FileField(blank=True, null=True, upload_to='certificates/'),
        ),
    ]
