# -*- coding:utf-8 -*-

# 将密码散列功能写成单元测试
import unittest
from app.models import User
from app import create_app, db
from app.models import AnonymousUser, Role, Permission

class UserModelTestCase(unittest.TestCase):
    # 初始化设置
    def setUp(self):
        self.app = create_app('testing')
        self.app_context = self.app.app_context()
        self.app_context.push()
        db.create_all()
        Role.insert_roles()
    # 返回原设置
    def tearDown(self):
        db.session.remove()
        db.drop_all()
        self.app_context.pop()
    # 测试密码
    def test_password_setter(self):
        u = User(password = 'cat')
        self.assertTrue(u.password_hash is not None)
    # 测试密码不能获取
    def test_no_password_getter(self):
        u = User(password = 'cat')
        with self.assertRaises(AttributeError):
            u.password
    # 测试密码验证
    def test_password_verification(self):
        u = User(password = 'cat')
        self.assertTrue(u.verify_password('cat'))
        self.assertFalse(u.verify_password('dog'))
    # 测试同一密码加密后不同
    def test_password_salts_are_random(self):
        u = User(password = 'cat')
        u2 = User(password = 'cat')
        self.assertTrue(u.password_hash != u2.password_hash)
    # 测试有效登录
    def test_valid_confirmation_token(self):
        u = User(password='cat')
        db.session.add(u)
        db.session.commit()
        token = u.generate_confirmation_token()
        self.assertTrue(u.confirm(token))
    # 测试无效登录
    def test_invalid_confirmation_token(self):
        u1 = User(password='cat')
        u2 = User(password='dog')
        db.session.add(u1)
        db.session.add(u2)
        db.session.commit()
        token = u1.generate_confirmation_token()
        self.assertFalse(u2.confirm(token))
    # 测试角色允许
    def test_anonymous_user(self):
        u = AnonymousUser()
        self.assertFalse(u.can(Permission.FOLLOW))
