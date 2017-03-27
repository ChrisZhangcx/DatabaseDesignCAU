# 定义参照完整性

# 定义外码
# 班级学生信息表中的班级对应班级基本信息表中的班级，
# 当基本信息表中的班级被删除、更新后，班级学生信息表中的级联更新
alter table cs add constraint f1 foreign key (Class) references class_info(Class) on delete cascade on update cascade;
# 项目评分结果表中的班级同样级联操作
alter table cer add constraint f2 foreign key (Class) references class_info(Class) on delete cascade on update cascade;
# 项目评分结果表中的项目编号同样级联操作
alter table cer add constraint f3 foreign key (Eno) references ce(Eno) on delete cascade on update cascade;
# 该表已经删除。附加分申请表中的班级同样级联操作
# alter table add_score add constraint f4 foreign key (Class) references class_info(Class) on delete cascade on update cascade;
# 班级统计结果表中的班级同样级联操作
alter table count_result add constraint f4 foreign key (Class) references class_info(Class) on delete cascade on update cascade;
# 班级评选结果表中的班级同样级联操作
alter table cr add constraint f5 foreign key (Class) references class_info(Class) on delete cascade on update cascade;


# 定义触发器
# (避免多重级联删除)

# classtomajor_u:在major_info表中专业被更新时，在班级基本信息表中做出相应更新
drop trigger if exists classtomajor_u;
delimiter |
create trigger classtomajor_u before update on major_info
for each row
begin
     update class_info set class_info.Major=new.Major where class_info.Major=old.Major;
end;|
delimiter ;
# classtomajor_d：在major_info表中专业被删除时，在班级基本信息表中做出相应删除
drop trigger if exists classtomajor_d;
delimiter |
create trigger classtomajor_d before delete on major_info
for each row
begin
    delete from class_info where class_info.Major=old.Major;
end;|
delimiter ;
# classtomajor_i：在班级基本信息表中插入时，判断major_info表中是否有对应的专业，若没有则拒绝执行
drop trigger if exists classtomajor_i;
delimiter |
create trigger classtomajor_i before insert on class_info
for each row
begin
    if (new.Major not in(select Major from major_info)) then
        delete from class_info;
    end if;
end;|
delimiter ;


# sctocs_i：在学生成绩统计表中插入时，判断cs表中是否有对应的学号，若没有则拒绝执行
drop trigger if exists sctocs_i;
delimiter |
create trigger sctocs_i before insert on sc
for each row
begin
    if (new.Sno not in(select Sno from cs)) then
        delete from sc;
    end if;
end;|
delimiter ;
# sctocs_u：在cs表中学号被更新时，在学生成绩统计表中做出相应更新
drop trigger if exists sctocs_u;
delimiter |
create trigger sctocs_u before update on cs
for each row
begin
    update sc set sc.Sno=new.Sno where sc.Sno=old.Sno;
end;|
delimiter ;
# sctocs_d：在cs表中学号被删除时，在学生成绩统计表中做出相应删除
drop trigger if exists sctocs_d;
delimiter |
create trigger sctocs_d before delete on cs
for each row
begin
    delete from sc where sc.Sno=old.Sno;
end;|
delimiter ;


