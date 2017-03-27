# -*- encoding:utf-8 -*-
import os
from flask import render_template, session, redirect
from flask import url_for, current_app
from flask import request
from .. import db
from ..models import User, CS, CountResult, ClassInfo, SC, CE, CER, ClassResult, Principle
from ..email import send_email
from . import main
from flask import abort
from .forms import LoginForm, YearChooseForm, NumberChooseForm, WeightForm, PublishForm
from flask import flash
from flask_login import current_user
from flask_login import login_user, logout_user, login_required
# 使用SQL语句
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


# 数据库连接（以使用SQL语句）
engine = create_engine("mysql://root:"+os.environ.get('MYSQL_PASSWORD')+"@localhost/myProject")
db_session = sessionmaker(bind=engine)
session = db_session()


# 当前学年
current_year = 2000

# 设置的权重
wb = 1
wd = 0.5

# 当前统计成绩的换算规则
global pass_rate, pass_rate_full    # 各年级最低满分及格率：1-80,2-85,3、4-95（满分20分）
pass_rate = {1:80, 2:85, 3:95, 4:95}
pass_rate_full = 20
global exce_rate, exce_rate_full    # 各年级最低满分优秀率：1-15,2-20,3、4-25（满分15分）
exce_rate = {1:15, 2:20, 3:25, 4:25}
exce_rate_full = 15
global pe_rate, pr_rate_full        # 英语成绩通过最低满分率：1-90,2-80,3、4-90（满分10分）
pe_rate = {1:90, 2:80, 3:90, 4:90}
pe_rate_full = 10
# 班干部优秀率与及格率规则不随年级改变，在此不做记录

# 传入指定年份，生成所有班级的客观成绩
def objective_scores_generate():
    # 删除当前年份所有班级的客观成绩
    data = CountResult.query.filter_by(Syear=current_year).all()
    for each_data in data:
        db.session.delete(each_data)
        db.session.commit()
    # 计算当前年份所有班级的客观成绩
    classes = ClassInfo.query.group_by(ClassInfo.Class).all()
    for each_class in classes:
        # 及格人数pass_num，优秀人数exce_num，班干部及格人数cc_pass_num，班干部优秀人数cc_exce_num，
        # 英语成绩通过人数pe_num，班级总人数class_num，班干部人数cc_num
        pass_num = 0
        exce_num = 0
        cc_pass_num = 0
        cc_exce_num = 0
        pe_num = 0
        class_num = CS.query.filter_by(Class=each_class.Class).count()
        cc_num = CS.query.filter_by(Class=each_class.Class, IsCC=1).count()
        if class_num==0:
            continue
        # 找到当前班级所有学生集合
        persons = CS.query.filter_by(Class=each_class.Class).all()
        # 对每个学生，在SC表中获得其统计信息
        for each_person in persons:
            # 找到该学生的统计信息
            person_info = SC.query.filter_by(Sno=each_person.Sno, Syear=current_year).first()
            # 当成功找到统计信息时，计算其他统计数据
            if person_info is not None:
                if person_info.FailedCourse == 0:
                    pass_num = pass_num+1
                    if each_person.IsCC:
                        cc_pass_num = cc_pass_num+1
                if person_info.TotalCourse == person_info.ExceCourse:
                    exce_num = exce_num+1
                    if each_person.IsCC:
                        cc_exce_num = cc_exce_num+1
                if person_info.IsPE:
                    pe_num = pe_num+1
        # 计算该班级的统计结果值
        print(u'\n\nclass:'+each_class.Class)
        print(u'班级人数:'+str(class_num))
        print(u'班干部人数:'+str(cc_num))
        print(u'及格人数:'+str(pass_num))
        print(u'优秀人数:'+str(exce_num))
        print(u'班干部及格人数:'+str(cc_pass_num))
        print(u'班干部优秀人数:'+str(cc_exce_num))
        print(u'英语通过人数:'+str(pe_num))
        # 当前班级的年级
        grade = current_year-each_class.Grade
        print(u'当前年级:'+str(grade)+u'\n')
        # 只有当当前年级在1-3之间时，才能将成绩写入统计表中，表示该班级能参评
        if grade<=3 and grade>=1:
            value = 0
            # 增加及格率成绩
            pass_rate_num = pass_rate_full+(round(pass_num*1.0)/class_num)*100-pass_rate[grade]
            if pass_rate_num>pass_rate_full:
                value = value+pass_rate_full
            elif pass_rate_num>=0:
                value = value+pass_rate_num
            print(u'及格率成绩:'+str(value))
            # 增加优秀率成绩
            exce_rate_num = exce_rate_full+(round(exce_num*1.0)/class_num)*100-exce_rate[grade]
            if exce_rate_num>exce_rate_full:
                value = value+exce_rate_full
            elif exce_rate_num>=0:
                value = value+exce_rate_num
            # 增加英语通过率成绩
            pe_rate_num = pe_rate_full+(round(pe_num*1.0)/class_num)*100-pe_rate[grade]
            if pe_rate_num>pe_rate_full:
                value = value+pe_rate_full
            elif pe_rate_num>=0:
                value = value+pe_rate_num
            if cc_num != 0:
                # 增加班干部及格率成绩
                if cc_pass_num == cc_num:
                    value = value + 5
                # 增加班干部优秀率成绩
                cc_exce_rate = round(cc_exce_num * 1.0 / cc_num) * 100
                if cc_exce_num >= 30:
                    value = value + 5
                elif cc_exce_num >= 20:
                    value = value + 4
                elif cc_exce_num >= 10:
                    value = value + 2
            print(u'班级最终客观成绩得分为:'+str(value)+'\n')
            # 将班级客观成绩写入数据库
            class_count_result = CountResult(Class=each_class.Class, Syear=current_year, CountRes=int(value))
            db.session.add(class_count_result)
            db.session.commit()


# 使用修饰器app.route，把修饰的函数注册为路由
    # 路由：处理URL和函数之间关系的程序
@main.route('/', methods=['GET','POST'])
def index():
    global current_year
    current_year = get_current_year()
    loginForm = LoginForm()
    # 当用户提交登录信息时，检查该用户是否存在
    if loginForm.validate_on_submit():
        usr = loginForm.username.data
        pwd = loginForm.password.data
        queryResult = User.query.filter_by(username=usr, password=pwd).first()
        if queryResult is not None:
            login_user(queryResult, loginForm.remember_me.data)
        if queryResult is not None:
            return render_template('index.html', username=usr, ce_info=get_ce_info())
        else:
            flash(u'您的帐号或密码输入有误，请重试。')
    return render_template('index.html',form=loginForm, ce_info=get_ce_info())


# 班级负责人：班干部选择页面
@main.route('/cadre', methods=['GET', 'POST'])
@login_required
def cadre():
    global current_year
    current_year = get_current_year()
    # 查询班级中的同学
    info = CS.query.filter_by(Class=current_user.Class).all()
    return render_template('cadre.html', infos=info)


# 班级负责人：结果查询页面
@main.route('/select', methods=['GET', 'POST'])
def select():
    global current_year
    current_year = get_current_year()
    # 查询当前学年是否已经公布结果
    published = Principle.query.filter_by(Syear=current_year).first()
    if published and published.IsPB:
        result = ClassResult.query.filter_by(Syear=current_year).order_by(ClassResult.Rank.asc()).all()
    else:
        result = None
    return render_template('select.html', current_year=current_year, result=result)


# 评选负责人：权重设置页面
@main.route('/weight', methods=['GET', 'POST'])
@login_required
def weight():
    global current_year
    current_year = get_current_year()
    global wb, wd
    wr = Principle.query.filter_by(Syear=current_year).first()
    wb = wr.wb
    wd = wr.wd
    weightForm = WeightForm()
    if weightForm.validate_on_submit():
        # 获得提交的权重
        wb = weightForm.wb.data
        wd = weightForm.wd.data
        # 将权重结果存取数据库
        wr = Principle.query.filter_by(Syear=current_year).first()
        wr.wb = wb
        wr.wd = wd
        db.session.add(wr)
        db.session.commit()
        return redirect(url_for('main.weight', wb=wb, wd=wd, form=weightForm, ce_info=get_ce_info()))
    return render_template('weight.html', wb=wb, wd=wd, form=weightForm, ce_info=get_ce_info())


# 评选负责人：评选评分界面
@main.route('/evaluate/<eno>', methods=['GET', 'POST'])
@login_required
def evaluate(eno):
    global current_year
    current_year = get_current_year()
    # 查找当前学年，当前项目编号的班级评分结果
    evaluate_info = CER.query.filter_by(Syear=current_year, Eno=eno).all()
    # 查找所有在基本表中的班级
    class_info = ClassInfo.query.all()
    # 获得当前项目的名称与描述信息
    e_info = CE.query.filter_by(Eno=eno).first()
    ename = e_info.Ename
    edesc = e_info.Edesc
    if request.method == 'POST':
        for each_class in class_info:
            if current_year-each_class.Grade>=1 and current_year-each_class.Grade<=3:
                # 删除cer表中对应的成绩，并将当前提交的成绩写入cer表
                value = request.form[each_class.Class]
                if str(value) != "" :
                    print (u'提交成绩的班级为:'+each_class.Class)
                    print (u'成绩为:'+value)
                    old = CER.query.filter_by(Eno=eno, Syear=current_year, Class=each_class.Class).first()
                    if old is not None:
                        db.session.delete(old)
                    new = CER(Eno=eno, Syear=current_year, Class=each_class.Class, Eresult=int(value))
                    db.session.add(new)
                    db.session.commit()
    return render_template('evaluate.html', evaluate_info=evaluate_info, class_info=class_info, ename=ename,
                           edesc=edesc, current_year=current_year, eno=eno, ce_info=get_ce_info())


# 评选负责人：结果公布页面
@main.route('/publish', methods=['GET', 'POST'])
@login_required
def publish():
    global current_year
    current_year = get_current_year()
    published = Principle.query.order_by(Principle.Syear.desc()).first()
    if published.IsPB == 1:
        classes = ClassResult.query.filter_by(Syear=current_year).order_by(ClassResult.Rank.asc()).all()
    else:
        classes = None
    #　重新生成当前年份的统计结果
    objective_scores_generate()
    # 获得前n名的评选成绩
    numberChooseForm = NumberChooseForm()
    publishForm = PublishForm()
    if numberChooseForm.submit.data and numberChooseForm.validate_on_submit():
        print ('\n\nget validate1\n\n')
        # 获得待评选的班级数
        number = numberChooseForm.number.data
        # 删除当前学年所有评选结果
        old_result = ClassResult.query.filter_by(Syear=current_year).all()
        for each_old_result in old_result:
            db.session.delete(each_old_result)
            db.session.commit()
        # 重新计算评选结果
        # 获得能参加评选的班级
        session.execute("set names 'utf8';")
        resultProxy = session.execute('select * from v1 natural join v2 natural join v3 natural join v4;')
        session.close()
        for each_result in resultProxy:
            # 获得标准成绩
            scoreb = int(each_result.Score1)+int(each_result.Score2)
            print ('\n\n\n标准成绩:'+str(scoreb)+'\n\n\n')
            # 获得答辩成绩
            scored = int(each_result.Score4)
            # 获得附加分
            scorea = int(each_result.Score3)
            # 得到最终成绩
            value = scoreb*1.0*wb + scored*1.0*wd + scorea*0.1
            new_result = ClassResult(Class=each_result.Class, Syear=current_year, Score=value)
            print ('\n\n\n\n班级:'+str(new_result.Class)+'\n\n\n')
            db.session.add(new_result)
            db.session.commit()
        classes = write_rank(number)
        publishForm.submit.data = None
        redirect(url_for('main.publish', form=numberChooseForm, current_year=current_year,
                         wb=wb, wd=wd, classes=classes, publishForm=publishForm, published=published,
                         ce_info=get_ce_info()))
    # 当公布表单提交后，公布页面结果，不允许再次提交
    if publishForm.submit.data and publishForm.validate_on_submit():
        # 当前学年的公布标志
        print ('\n\nget validate2\n\n')
        published.IsPB = 1
        db.session.add(published)
        db.session.commit()
        classes = ClassResult.query.filter_by(Syear=current_year).order_by(ClassResult.Rank.asc()).all()
        redirect(url_for('main.publish', form=numberChooseForm, current_year=current_year,
                         wb=wb, wd=wd, classes=classes, publishForm=publishForm, published=published,
                         ce_info=get_ce_info()))
    return render_template('publish.html', form=numberChooseForm, current_year=current_year,
                           wb=wb, wd=wd, classes=classes, publishForm=publishForm, published=published,
                           ce_info=get_ce_info())


# 评选负责人：往届评选结果页面
@main.route('/search', methods=['GET', 'POST'])
@login_required
def search():
    yearChooseForm = YearChooseForm()
    result = None
    if yearChooseForm.validate_on_submit():
        # 获得要查看的年级
        year = yearChooseForm.year.data
        # 查询结果
        result = ClassResult.query.filter_by(Syear=year).order_by(ClassResult.Rank.asc()).all()
        if result:
            pass
        else:
            flash(u'未查询到该学年的评选结果，请重新输入！')
        redirect(url_for('main.search', form=yearChooseForm, result=result))
    return render_template('search.html', form=yearChooseForm, result=result)


# 用户退出登陆
@main.route('/logout')
@login_required
def logout():
    logout_user()
    # 显示提示信息，并返回主页
    flash(u'您已成功退出。')
    return redirect(url_for('main.index'))


# 取消指定学号同学的班干部身份
@main.route('/cadre/cancel/<sno>')
@login_required
def cancel_cadre(sno):
    # 用传入的学号信息找到对应的同学
    student = CS.query.filter_by(Sno=sno).first()
    student.IsCC = 0
    db.session.add(student)
    db.session.commit()
    return redirect(url_for('.cadre'))


# 确认指定学号同学的班干部身份
@main.route('/cadre/define/<sno>')
@login_required
def define_cadre(sno):
    # 用传入的学号信息找到对应的同学
    student = CS.query.filter_by(Sno=sno).first()
    student.IsCC = 1
    db.session.add(student)
    db.session.commit()
    return redirect(url_for('.cadre'))

# 查找所有项目信息
def get_ce_info():
    # 查找ce_info
    ce_info = CE.query.all()
    return ce_info

# 写入班级的排名
def write_rank(num):
    # 查找当前学年评定的所有班级，并以分数降序排名
    classes = ClassResult.query.filter_by(Syear=current_year).order_by(ClassResult.Score.desc())
    if classes.count()<num:
        num = classes.count()
    rank = 0
    while rank<num:
        classes[rank].Rank = rank+1
        db.session.add(classes[rank])
        db.session.commit()
        rank = rank+1
    return classes


# 获得当前学年
def get_current_year():
    year = int(Principle.query.order_by(Principle.Syear.desc()).first().Syear)
    return year