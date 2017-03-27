# -*- coding:utf-8 -*-
import os
from sqlalchemy.orm import sessionmaker

# 在3个子类中，SQLALCHEMY_DATABASE_URI变量被指定了不同值
# 这样程序就可以在不同的配置环境中运行，每个环境都使用不同的数据库
basedir = "mysql://root:"+os.environ.get('MYSQL_PASSWORD')+"@localhost/"


# 基类，包含通用配置
class Config:
    SECRET_KEY = 'hard to guess string'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    FLASKY_MAIL_SUBJECT_PREFIX = '[Flasky]'
    FLASKY_MAIL_SENDER = '759087748@qq.com'
    FLASKY_ADMIN = os.environ.get('FLASKY_ADMIN')
    # 可以执行对当前环境的配置初始化
    @staticmethod
    def init_app(app):
        pass


# 子类：分别定义专用的配置
# 默认配置：使用myProject数据库
class DevelopmentConfig(Config):
    DEBUG = True
    MAIL_SERVER = 'smtp.qq.com'
    MAIL_PORT = 587
    MAIL_USE_TLS = True
    MAIL_USERNAME = os.environ.get('MAIL_USERNAME')
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD')
    SQLALCHEMY_DATABASE_URI = basedir+"myProject"


class TestingConfig(Config):
    TESTING = True
    SQLALCHEMY_DATABASE_URI = basedir+"data_test"


class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = basedir+"data"


# 字典：注册不同的配置环境，且注册默认配置
config = {
    'development': DevelopmentConfig,
    'testing': TestingConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}
