# -*- coding:utf-8 -*-
from app import create_app, db
from app.models import User, MajorInfo, ClassInfo, SC, CS, CE, CER, CountResult, ClassResult
from flask_script import Manager, Shell
from flask_migrate import Migrate, MigrateCommand


app = create_app('default')
manager = Manager(app)
migrate = Migrate(app,db)

def make_shell_context():
    return dict(app=app,db=db,User=User, MajorInfo=MajorInfo, ClassInfo=ClassInfo, SC=SC, CS=CS, CE=CE,\
                CER=CER, CountResult=CountResult, ClassResult=ClassResult)
manager.add_command("shell",Shell(make_context=make_shell_context))
manager.add_command('db',MigrateCommand)


@manager.command
def test():
    """ 进行单元测试 """
    import unittest
    tests = unittest.TestLoader().discover('tests')
    unittest.TextTestRunner(verbosity=2).run(tests)


if __name__ == '__main__':
    manager.run()
