# -*- coding:utf-8 -*-
import unittest
from flask import current_app
from app import create_app, db

# 以test_作为开头的函数都作为测试运行

class BasicsTestCase(unittest.TestCase):
    # 在测试前运行
    # 尝试创建一个测试环境
    def setUp(self):
        self.app = create_app('testing')
        self.app_context = self.app.app_context()
        self.app_context.push()
        db.create_all()
    # 在测试后运行
    def tearDown(self):
        db.session.remove()
        db.drop_all()
        self.app_context.pop()
    # 测试1：确认实例存在
    def test_app_exists(self):
        self.assertFalse(current_app is None)
    # 测试2：确保程序在测试配置中运行
    def test_app_is_testing(self):
        self.assertTrue(current_app.config['TESTING'])
