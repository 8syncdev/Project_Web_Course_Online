# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Categories(models.Model):
    category_id = models.IntegerField(primary_key=True)
    category_name = models.CharField(max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS')

    class Meta:
        managed = False
        db_table = 'categories'


class CourseCategories(models.Model):
    course = models.OneToOneField('Courses', models.DO_NOTHING, primary_key=True)
    category = models.ForeignKey(Categories, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'course_categories'
        unique_together = (('course', 'category'),)


class Courses(models.Model):
    course_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=255, db_collation='SQL_Latin1_General_CP1_CI_AS')
    description = models.TextField(db_collation='SQL_Latin1_General_CP1_CI_AS')  # This field type is a guess.
    price = models.DecimalField(max_digits=10, decimal_places=2)
    instructor = models.CharField(max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    level = models.ForeignKey('LevelCourses', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'courses'


class LevelCourses(models.Model):
    level_id = models.IntegerField(primary_key=True)
    level_name = models.CharField(max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS')

    class Meta:
        managed = False
        db_table = 'level_courses'


class OrderItems(models.Model):
    item_id = models.IntegerField(primary_key=True)
    order = models.ForeignKey('Orders', models.DO_NOTHING)
    course = models.ForeignKey(Courses, models.DO_NOTHING)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'order_items'


class Orders(models.Model):
    order_id = models.IntegerField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    order_date = models.DateTimeField()
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_status = models.ForeignKey('PaymentStatus', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'orders'


class PaymentStatus(models.Model):
    payment_status_id = models.IntegerField(primary_key=True)
    status_name = models.CharField(max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS')

    class Meta:
        managed = False
        db_table = 'payment_status'


class RegisterCourse(models.Model):
    register_id = models.IntegerField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    course = models.ForeignKey(Courses, models.DO_NOTHING)
    register_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'register_course'


class Sysdiagrams(models.Model):
    name = models.CharField(max_length=128, db_collation='SQL_Latin1_General_CP1_CI_AS')
    principal_id = models.IntegerField()
    diagram_id = models.AutoField(primary_key=True)
    version = models.IntegerField(blank=True, null=True)
    definition = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sysdiagrams'
        unique_together = (('principal_id', 'name'),)


class Users(models.Model):
    user_id = models.IntegerField(primary_key=True)
    username = models.CharField(unique=True, max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS')
    email = models.CharField(unique=True, max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')
    password = models.CharField(max_length=255, db_collation='SQL_Latin1_General_CP1_CI_AS')
    created_at = models.DateTimeField(blank=True, null=True, auto_now_add=True)
    updated_at = models.DateTimeField(blank=True, null=True, auto_now= True)

    class Meta:
        managed = False
        db_table = 'users'
