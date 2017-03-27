# -*- coding:utf-8 -*-

# 程序中实例的所有模型实现

from . import db
# 实现密码散列
from werkzeug.security import generate_password_hash, check_password_hash
# 支持用户登录
from flask_login import UserMixin
from . import login_manager
# 实现邮箱确认
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from flask import current_app
# 数据库角色权限验证
from flask_login import AnonymousUserMixin
# 实现时间显示
from datetime import datetime


# 创建数据库中的表
# 定义User模型
class User(UserMixin, db.Model):
    __tablename__ = 'users'
    # 用户名与密码
    """
    用户编号为主码；
    用户名、密码与用户属性不允许为空；用户名与密码唯一；
    班级唯一，当用户属性为班级负责人（0）时，必须填写班级字段（用触发器实现）；
    用户属性：0-班级负责人；1-评选负责人。
    """
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    password = db.Column(db.String(20), nullable=False)
    Class = db.Column(db.String(10), unique=True, nullable=True)
    role = db.Column(db.Boolean, nullable=False)

    # 返回一个具有可读性的字符表示模型，可在调试和测试时使用
    def __repr__(self):
        return '<User %r>' % self.username


# 定义专业归属表
class MajorInfo(db.Model):
    __tablename__ = 'major_info'
    # 专业，学院
    """
    专业为主码；
    学院不允许为空。
    """
    Major = db.Column(db.String(20), primary_key=True)
    College = db.Column(db.String(20), nullable=False)

    def __repr__(self):
        return '<MajorInfo %r>' % self.Major


# 定义班级信息表
class ClassInfo(db.Model):
    __tablename__ = 'class_info'
    # 专业，年级，班主任，班级（名）
    """
    班级名为主码；
    年级、专业不允许为空；班主任允许为空；
    专业为专业归属表中的外码（注：为避免多重级联，将该外码设置为触发器）。
    """
    Class = db.Column(db.String(10), primary_key=True)
    Major = db.Column(db.String(20), nullable=False)
    Grade = db.Column(db.Integer, nullable=False)
    Teacher = db.Column(db.String(10), nullable=True)

    def __repr__(self):
        return '<ClassInfo %r>' % self.Class


# 定义学生成绩统计表
class SC(db.Model):
    __tablename__ = 'sc'
    # 学号，学年，绩点，修读门数，未通过门数，优秀门数，是否通过英语
    """
    学号、学年为主码；
    绩点、修读门数、未通过门数、优秀门数、是否通过英语都允许为空；
    学号为班级学生信息表的外码（注：为避免多重级联，将该外码设置为触发器）。
    """
    Sno = db.Column(db.String(20), primary_key=True)
    Syear = db.Column(db.Integer, primary_key=True)
    Credit = db.Column(db.Float, nullable=True)
    TotalCourse = db.Column(db.Integer, nullable=True)
    FailedCourse = db.Column(db.Integer, nullable=True)
    ExceCourse = db.Column(db.Integer, nullable=True)
    IsPE = db.Column(db.Boolean, nullable=True)

    def __repr__(self):
        return '<SC (%r,%r)>' % (self.Sno,self.Syear)


# 定义班级学生信息表
class CS(db.Model):
    __tablename__ = 'cs'
    # 学号，班级，是否为班干部
    """
    学号为主码；
    班级不允许为空；班干部不允许为空，默认值为False；
    班级是班级信息表中的外码。
    """
    Sno = db.Column(db.String(20), primary_key=True)
    Class = db.Column(db.String(10), nullable=False)
    Sname = db.Column(db.String(10), nullable=False)
    IsCC =db.Column(db.Boolean, nullable=False)

    def __repr__(self):
        return '<CS %r>' % self.Sno


# 定义班级评估项目表
class CE(db.Model):
    __tablename__ = 'ce'
    # 项目号，项目名，项目说明，项目结果类型
    """
    项目编号为主码；
    项目结果类型不能为空；项目名称、项目说明允许为空；
    注：在数据库中定义Etype属性的可选范围（即check字段）
    """
    Eno = db.Column(db.String(4), primary_key=True)
    Ename = db.Column(db.String(10), nullable=True)
    Edesc = db.Column(db.String(40), nullable=True)
    Etype = db.Column(db.String(10), nullable=False)

    def __repr__(self):
        return '<CE %r>' % self.Eno


# 定义班级评估结果表
class CER(db.Model):
    __tablename__ = 'cer'
    # 班级，项目号，评估结果
    """
    班级、项目编号为主码；
    评估结果不能为空；
    班级是班级基本信息表的外码，项目编号是班级评估项目表的外码。
    注：评估结果为CHAR类型，在实际读取时需要先从CE表中得到相应字段的类型，
    再通过程序转码
    """
    Eno = db.Column(db.String(4), primary_key=True)
    Syear = db.Column(db.Integer, primary_key=True)
    Class = db.Column(db.String(20), primary_key=True)
    Eresult = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return '<CER (%r,%r)>' % (self.Eno, self.Class)


# 定义班级统计结果表
class CountResult(db.Model):
    __tablename__ = 'count_result'
    # 班级，学年，统计结果
    """
    班级，学年为主码；
    班级为班级基本信息表的主码
    统计结果不能为空，
    """
    Class = db.Column(db.String(10), primary_key=True)
    Syear = db.Column(db.Integer, primary_key=True)
    CountRes = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return '<CountResult (%r,%r)>' % (self.Class, self.Syear)


# 定义班级评选结果表
class ClassResult(db.Model):
    __tablename__ = 'cr'
    # 班级，学年，成绩，名次
    Class = db.Column(db.String(10), primary_key=True)
    Syear = db.Column(db.Integer, primary_key=True)
    Score = db.Column(db.Integer, nullable=False)
    Rank = db.Column(db.Integer, nullable=True)

    def __repr__(self):
        return '<ClassResult (%r,%r)>' % (self.Class, self.Syear)


# 定义评选规则记录表
class Principle(db.Model):
    __tablename__ = 'pr'
    # 学年，客观权重，答辩权重
    Syear = db.Column(db.Integer, primary_key=True)
    wb = db.Column(db.Float, nullable=False, server_default='0.5')
    wd = db.Column(db.Float, nullable=False, server_default='0.5')
    IsPB = db.Column(db.Boolean, nullable=True, server_default='0')

    def __repr__(self):
        return '<Principle %r>' % self.Syear


# 回调函数：使用指定的标识符加载用户
@login_manager.user_loader
def load_user(user_id):
    return User.query.get((user_id))