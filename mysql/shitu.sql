# 定义视图

# 视图v1：从cer表中获取除了附加分、答辩分数以外的所有分数总和(只获取最近一年的班级主观成绩)
drop view if exists v1;
create view v1 (Class, Score1)
as select Class, sum(Eresult) from cer where Eno!='0031' and Eno!='0041' and Syear=(select max(Syear) from cer) group by Class;

# 视图v2：从count_result表中获得各班的统计成绩(注：只获取最近一年的班级统计成绩)
drop view if exists v2;
create view v2 (Class, Score2)
as select Class, CountRes from count_result where Syear=(select max(Syear) from count_result) group by Class;

# 视图v3：从cer表中获取各班的附加分（注：只获取最近一年的附加分）
drop view if exists v3;
create view v3 (Class, Score3)
as select Class, Eresult from cer where Eno='0041' and Syear=(select max(Syear) from cer) group by Class;

# 视图v4：从cer表中获取各班的答辩分数（注：只获取最近一年的答辩分）
drop view if exists v4;
create view v4 (Class, Score4)
as select Class, Eresult from cer where Eno='0031' and Syear=(select max(Syear) from cer) group by Class;
