# -*- coding:utf-8 -*-

# 此处为表单的定义
from flask_wtf import Form
from wtforms import StringField, SubmitField, PasswordField, BooleanField, IntegerField, FloatField
from wtforms.validators import DataRequired, Length, NumberRange


# 表单类
# 用户登录表单
class LoginForm(Form):
    # 输入帐号
    username = StringField(u'帐号',validators=[DataRequired(), Length(1,64)])
    # 输入密码
    password = PasswordField(u'密码',validators=[DataRequired()])
    # 记住登录者
    remember_me = BooleanField(u'记住我')
    submit = SubmitField(u'登录')


# 评选负责人：学年选择表单
class YearChooseForm(Form):
    # 选择学年
    year = IntegerField(u'在此输入要查询的学年')
    # 提交
    submit = SubmitField(u'查询')


# 评选负责人：评选名额选择表单：
class NumberChooseForm(Form):
    # 选择评选班级数
    number = IntegerField(u'待评选的优良学风班数量', validators=[DataRequired()])
    # 提交
    submit = SubmitField(u'查看评选结果')


# 评选负责人：项目权重设置表单：
class WeightForm(Form):
    wb = FloatField(u'客观成绩权重', validators=[DataRequired(), NumberRange(0,1,u'请输入合理的权重！(0-1)')])
    wd = FloatField(u'答辩成绩权重', validators=[DataRequired(), NumberRange(0,1,u'请输入合理的权重！(0-1)')])
    submit = SubmitField(u'修改权重')


# 评选负责人：提交结果表单：
class PublishForm(Form):
    submit = SubmitField(u'公布评选结果')