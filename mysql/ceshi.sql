# 删除表中所有原数据
delete from users;
delete from class_info;
delete from major_info;
delete from sc;
delete from cs;
delete from ce;
delete from cer;
delete from count_result;
delete from cr;
delete from pr;

# 插入数据到数据库

# 在users中插入数据
# 注意：users表独立与设计的表之外，不用服从班级的参照完整性
insert into users
values(19,'t','t',null,1);       # 评选负责人
insert into users
values(1,'s1300','s','试验132',0);
insert into users
values(2,'s1301','s','计算131',0);
insert into users
values(3,'s1302','s','地信131',0);
insert into users
values(4,'s1303','s','自动化131',0);
insert into users
values(5,'s1304','s','电子131',0);
insert into users
values(6,'s1305','s','电气131',0);
insert into users
values(7,'s1400','s','试验142',0);
insert into users
values(8,'s1401','s','计算141',0);
insert into users
values(9,'s1402','s','地信141',0);
insert into users
values(10,'s1403','s','自动化141',0);
insert into users
values(11,'s1404','s','电子141',0);
insert into users
values(12,'s1405','s','电气141',0);
insert into users
values(13,'s1500','s','试验152',0);
insert into users
values(14,'s1501','s','计算151',0);
insert into users
values(15,'s1502','s','地信151',0);
insert into users
values(16,'s1503','s','自动化151',0);
insert into users
values(17,'s1504','s','电子151',0);
insert into users
values(18,'s1505','s','电气151',0);
commit;

# pr创建各学年权重
insert into pr
values(2014,0.5,0.5,1);
insert into pr
values(2015,0.8,0.2,0);
commit;

# major_info创建信电专业
insert into major_info
values('计算机科学与技术','信息与电气工程学院');
insert into major_info
values('电气工程及其自动化','信息与电气工程学院');
insert into major_info
values('电子信息工程','信息与电气工程学院');
insert into major_info
values('地理信息系统','信息与电气工程学院');
insert into major_info
values('自动化','信息与电气工程学院');
insert into major_info
values('信息科学理科试验班','信息与电气工程学院');
commit;

# class_info创建信电班级
insert into class_info
values('试验132','信息科学理科试验班',2013,null);
insert into class_info
values('试验142','信息科学理科试验班',2014,null);
insert into class_info
values('试验152','信息科学理科试验班',2015,null);
insert into class_info
values('计算131','计算机科学与技术',2013,null);
insert into class_info
values('计算141','计算机科学与技术',2014,null);
insert into class_info
values('计算151','计算机科学与技术',2015,null);
insert into class_info
values('地信131','地理信息系统',2013,null);
insert into class_info
values('地信141','地理信息系统',2014,null);
insert into class_info
values('地信151','地理信息系统',2015,null);
insert into class_info
values('自动化131','自动化',2013,null);
insert into class_info
values('自动化141','自动化',2014,null);
insert into class_info
values('自动化151','自动化',2015,null);
insert into class_info
values('电子131','电子信息工程',2013,null);
insert into class_info
values('电子141','电子信息工程',2014,null);
insert into class_info
values('电子151','电子信息工程',2015,null);
insert into class_info
values('电气131','电气工程及其自动化',2013,null);
insert into class_info
values('电气141','电气工程及其自动化',2014,null);
insert into class_info
values('电气151','电气工程及其自动化',2015,null);
commit;

# 在cs中插入数据
# 试验班
insert into cs
values('1300000001','试验132','李四',1);
insert into cs
values('1300000002','试验132','王五',0);
insert into cs
values('1300000003','试验132','小明',1);
insert into cs
values('1300000004','试验132','大牛',0);
insert into cs
values('1300000005','试验132','二花',0);
insert into cs
values('1300000006','试验132','赵六',1);
insert into cs
values('1300000007','试验132','张三',0);
insert into cs
values('1300000008','试验132','呵呵',0);
insert into cs
values('1300000009','试验132','嘿嘿',1);
insert into cs
values('1300000010','试验132','张张',0);
insert into cs
values('1300000011','试验132','薇薇',0);
insert into cs
values('1300000012','试验132','小马哥',0);
insert into cs
values('1300000013','试验132','甲',0);
insert into cs
values('1300000014','试验132','乙',0);
insert into cs
values('1300000015','试验132','丙',0);
insert into cs
values('1400000001','试验142','李四',1);
insert into cs
values('1400000002','试验142','王五',0);
insert into cs
values('1400000003','试验142','小明',1);
insert into cs
values('1400000004','试验142','大牛',0);
insert into cs
values('1400000005','试验142','二花',0);
insert into cs
values('1400000006','试验142','赵六',1);
insert into cs
values('1400000007','试验142','张三',0);
insert into cs
values('1400000008','试验142','呵呵',0);
insert into cs
values('1400000009','试验142','嘿嘿',1);
insert into cs
values('1400000010','试验142','张张',0);
insert into cs
values('1400000011','试验142','薇薇',0);
insert into cs
values('1400000012','试验142','小马哥',0);
insert into cs
values('1400000013','试验142','甲',0);
insert into cs
values('1400000014','试验142','乙',0);
insert into cs
values('1400000015','试验142','丙',0);
insert into cs
values('1500000001','试验152','李四',1);
insert into cs
values('1500000002','试验152','王五',0);
insert into cs
values('1500000003','试验152','小明',1);
insert into cs
values('1500000004','试验152','大牛',0);
insert into cs
values('1500000005','试验152','二花',0);
insert into cs
values('1500000006','试验152','赵六',1);
insert into cs
values('1500000007','试验152','张三',0);
insert into cs
values('1500000008','试验152','呵呵',0);
insert into cs
values('1500000009','试验152','嘿嘿',1);
insert into cs
values('1500000010','试验152','张张',0);
insert into cs
values('1500000011','试验152','薇薇',0);
insert into cs
values('1500000012','试验152','小马哥',0);
insert into cs
values('1500000013','试验152','甲',0);
insert into cs
values('1500000014','试验152','乙',0);
insert into cs
values('1500000015','试验152','丙',0);
# 计算机班
insert into cs
values('1301000001','计算131','李四',1);
insert into cs
values('1301000002','计算131','王五',0);
insert into cs
values('1301000003','计算131','小明',1);
insert into cs
values('1301000004','计算131','大牛',0);
insert into cs
values('1301000005','计算131','二花',0);
insert into cs
values('1301000006','计算131','赵六',1);
insert into cs
values('1301000007','计算131','张三',0);
insert into cs
values('1301000008','计算131','呵呵',0);
insert into cs
values('1301000009','计算131','嘿嘿',1);
insert into cs
values('1301000010','计算131','张张',0);
insert into cs
values('1401000001','计算141','李四',1);
insert into cs
values('1401000002','计算141','王五',0);
insert into cs
values('1401000003','计算141','小明',1);
insert into cs
values('1401000004','计算141','大牛',0);
insert into cs
values('1401000005','计算141','二花',0);
insert into cs
values('1401000006','计算141','赵六',1);
insert into cs
values('1401000007','计算141','张三',0);
insert into cs
values('1401000008','计算141','呵呵',0);
insert into cs
values('1401000009','计算141','嘿嘿',1);
insert into cs
values('1401000010','计算141','张张',0);
insert into cs
values('1501000001','计算151','李四',1);
insert into cs
values('1501000002','计算151','王五',0);
insert into cs
values('1501000003','计算151','小明',1);
insert into cs
values('1501000004','计算151','大牛',0);
insert into cs
values('1501000005','计算151','二花',0);
insert into cs
values('1501000006','计算151','赵六',1);
insert into cs
values('1501000007','计算151','张三',0);
insert into cs
values('1501000008','计算151','呵呵',0);
insert into cs
values('1501000009','计算151','嘿嘿',1);
insert into cs
values('1501000010','计算151','张张',0);
# 地理信息系统
insert into cs
values('1302000001','地信131','李四',1);
insert into cs
values('1302000002','地信131','王五',0);
insert into cs
values('1302000003','地信131','小明',1);
insert into cs
values('1302000004','地信131','大牛',0);
insert into cs
values('1302000005','地信131','二花',0);
insert into cs
values('1302000006','地信131','赵六',1);
insert into cs
values('1302000007','地信131','张三',0);
insert into cs
values('1302000008','地信131','呵呵',0);
insert into cs
values('1302000009','地信131','嘿嘿',1);
insert into cs
values('1302000010','地信131','张张',0);
insert into cs
values('1402000001','地信141','李四',1);
insert into cs
values('1402000002','地信141','王五',0);
insert into cs
values('1402000003','地信141','小明',1);
insert into cs
values('1402000004','地信141','大牛',0);
insert into cs
values('1402000005','地信141','二花',0);
insert into cs
values('1402000006','地信141','赵六',1);
insert into cs
values('1402000007','地信141','张三',0);
insert into cs
values('1402000008','地信141','呵呵',0);
insert into cs
values('1402000009','地信141','嘿嘿',1);
insert into cs
values('1402000010','地信141','张张',0);
insert into cs
values('1502000001','地信151','李四',1);
insert into cs
values('1502000002','地信151','王五',0);
insert into cs
values('1502000003','地信151','小明',1);
insert into cs
values('1502000004','地信151','大牛',0);
insert into cs
values('1502000005','地信151','二花',0);
insert into cs
values('1502000006','地信151','赵六',1);
insert into cs
values('1502000007','地信151','张三',0);
insert into cs
values('1502000008','地信151','呵呵',0);
insert into cs
values('1502000009','地信151','嘿嘿',1);
insert into cs
values('1502000010','地信151','张张',0);
# 自动化
insert into cs
values('1303000001','自动化131','李四',1);
insert into cs
values('1303000002','自动化131','王五',0);
insert into cs
values('1303000003','自动化131','小明',1);
insert into cs
values('1303000004','自动化131','大牛',0);
insert into cs
values('1303000005','自动化131','二花',0);
insert into cs
values('1303000006','自动化131','赵六',1);
insert into cs
values('1303000007','自动化131','张三',0);
insert into cs
values('1303000008','自动化131','呵呵',0);
insert into cs
values('1303000009','自动化131','嘿嘿',1);
insert into cs
values('1303000010','自动化131','张张',0);
insert into cs
values('1403000001','自动化141','李四',1);
insert into cs
values('1403000002','自动化141','王五',0);
insert into cs
values('1403000003','自动化141','小明',1);
insert into cs
values('1403000004','自动化141','大牛',0);
insert into cs
values('1403000005','自动化141','二花',0);
insert into cs
values('1403000006','自动化141','赵六',1);
insert into cs
values('1403000007','自动化141','张三',0);
insert into cs
values('1403000008','自动化141','呵呵',0);
insert into cs
values('1403000009','自动化141','嘿嘿',1);
insert into cs
values('1403000010','自动化141','张张',0);
insert into cs
values('1503000001','自动化151','李四',1);
insert into cs
values('1503000002','自动化151','王五',0);
insert into cs
values('1503000003','自动化151','小明',1);
insert into cs
values('1503000004','自动化151','大牛',0);
insert into cs
values('1503000005','自动化151','二花',0);
insert into cs
values('1503000006','自动化151','赵六',1);
insert into cs
values('1503000007','自动化151','张三',0);
insert into cs
values('1503000008','自动化151','呵呵',0);
insert into cs
values('1503000009','自动化151','嘿嘿',1);
insert into cs
values('1503000010','自动化151','张张',0);
# 电子信息工程
insert into cs
values('1304000001','电子131','李四',1);
insert into cs
values('1304000002','电子131','王五',0);
insert into cs
values('1304000003','电子131','小明',1);
insert into cs
values('1304000004','电子131','大牛',0);
insert into cs
values('1304000005','电子131','二花',0);
insert into cs
values('1304000006','电子131','赵六',1);
insert into cs
values('1304000007','电子131','张三',0);
insert into cs
values('1304000008','电子131','呵呵',0);
insert into cs
values('1304000009','电子131','嘿嘿',1);
insert into cs
values('1304000010','电子131','张张',0);
insert into cs
values('1404000001','电子141','李四',1);
insert into cs
values('1404000002','电子141','王五',0);
insert into cs
values('1404000003','电子141','小明',1);
insert into cs
values('1404000004','电子141','大牛',0);
insert into cs
values('1404000005','电子141','二花',0);
insert into cs
values('1404000006','电子141','赵六',1);
insert into cs
values('1404000007','电子141','张三',0);
insert into cs
values('1404000008','电子141','呵呵',0);
insert into cs
values('1404000009','电子141','嘿嘿',1);
insert into cs
values('1404000010','电子141','张张',0);
insert into cs
values('1504000001','电子151','李四',1);
insert into cs
values('1504000002','电子151','王五',0);
insert into cs
values('1504000003','电子151','小明',1);
insert into cs
values('1504000004','电子151','大牛',0);
insert into cs
values('1504000005','电子151','二花',0);
insert into cs
values('1504000006','电子151','赵六',1);
insert into cs
values('1504000007','电子151','张三',0);
insert into cs
values('1504000008','电子151','呵呵',0);
insert into cs
values('1504000009','电子151','嘿嘿',1);
insert into cs
values('1504000010','电子151','张张',0);
# 电气工程及其自动化
insert into cs
values('1305000001','电气131','李四',1);
insert into cs
values('1305000002','电气131','王五',0);
insert into cs
values('1305000003','电气131','小明',1);
insert into cs
values('1305000004','电气131','大牛',0);
insert into cs
values('1305000005','电气131','二花',0);
insert into cs
values('1305000006','电气131','赵六',1);
insert into cs
values('1305000007','电气131','张三',0);
insert into cs
values('1305000008','电气131','呵呵',0);
insert into cs
values('1305000009','电气131','嘿嘿',1);
insert into cs
values('1305000010','电气131','张张',0);
insert into cs
values('1405000001','电气141','李四',1);
insert into cs
values('1405000002','电气141','王五',0);
insert into cs
values('1405000003','电气141','小明',1);
insert into cs
values('1405000004','电气141','大牛',0);
insert into cs
values('1405000005','电气141','二花',0);
insert into cs
values('1405000006','电气141','赵六',1);
insert into cs
values('1405000007','电气141','张三',0);
insert into cs
values('1405000008','电气141','呵呵',0);
insert into cs
values('1405000009','电气141','嘿嘿',1);
insert into cs
values('1405000010','电气141','张张',0);
insert into cs
values('1505000001','电气151','李四',1);
insert into cs
values('1505000002','电气151','王五',0);
insert into cs
values('1505000003','电气151','小明',1);
insert into cs
values('1505000004','电气151','大牛',0);
insert into cs
values('1505000005','电气151','二花',0);
insert into cs
values('1505000006','电气151','赵六',1);
insert into cs
values('1505000007','电气151','张三',0);
insert into cs
values('1505000008','电气151','呵呵',0);
insert into cs
values('1505000009','电气151','嘿嘿',1);
insert into cs
values('1505000010','电气151','张张',0);
commit;





# 在sc中插入学生数据
insert into sc values('1300000001',2015,3.80653813148,11,1,10,0);
insert into sc values('1300000002',2015,2.95238738761,15,0,15,0);
insert into sc values('1300000003',2015,3.44613492896,11,0,10,0);
insert into sc values('1300000004',2015,3.80405567342,14,0,13,0);
insert into sc values('1300000005',2015,3.12287980981,12,0,11,0);
insert into sc values('1300000006',2015,3.47547844688,11,0,10,1);
insert into sc values('1300000007',2015,3.52819675973,13,0,12,0);
insert into sc values('1300000008',2015,3.2098021948,9,0,8,0);
insert into sc values('1300000009',2015,3.61724848349,15,0,14,0);
insert into sc values('1300000010',2015,3.18845603601,13,0,13,0);
insert into sc values('1301000001',2015,3.65401054081,13,1,12,0);
insert into sc values('1301000002',2015,3.45436622064,13,0,12,0);
insert into sc values('1301000003',2015,2.83050644766,14,0,14,0);
insert into sc values('1301000004',2015,3.75749742764,11,0,11,0);
insert into sc values('1301000005',2015,3.46885035677,15,0,14,1);
insert into sc values('1301000006',2015,3.20514372537,15,0,15,0);
insert into sc values('1301000007',2015,3.07127509158,15,0,15,0);
insert into sc values('1301000008',2015,3.43300433502,13,1,12,0);
insert into sc values('1301000009',2015,3.25685066032,12,0,11,1);
insert into sc values('1301000010',2015,3.10292039875,10,0,10,0);
insert into sc values('1302000001',2015,3.20099610718,11,0,10,0);
insert into sc values('1302000002',2015,3.38932418864,13,0,13,0);
insert into sc values('1302000003',2015,3.22049965639,10,0,9,0);
insert into sc values('1302000004',2015,3.11242310389,13,0,13,0);
insert into sc values('1302000005',2015,3.09646550623,9,1,8,0);
insert into sc values('1302000006',2015,3.49765511511,10,1,9,0);
insert into sc values('1302000007',2015,2.85265754179,11,0,10,0);
insert into sc values('1302000008',2015,3.57868672837,9,0,9,0);
insert into sc values('1302000009',2015,3.20848470223,12,0,11,0);
insert into sc values('1302000010',2015,3.68570080183,10,0,9,0);
insert into sc values('1303000001',2015,2.97193580888,9,0,8,0);
insert into sc values('1303000002',2015,3.50472543905,11,0,10,0);
insert into sc values('1303000003',2015,2.86676032536,11,0,11,0);
insert into sc values('1303000004',2015,3.0408390868,12,0,12,0);
insert into sc values('1303000005',2015,3.7487023992,11,0,11,0);
insert into sc values('1303000006',2015,2.88332816707,12,0,11,0);
insert into sc values('1303000007',2015,3.72434332619,11,0,11,0);
insert into sc values('1303000008',2015,2.9767561836,9,1,8,0);
insert into sc values('1303000009',2015,3.68482236467,15,0,14,0);
insert into sc values('1303000010',2015,3.85424622069,9,0,9,0);
insert into sc values('1304000001',2015,3.71161137208,14,0,13,0);
insert into sc values('1304000002',2015,3.09180244253,15,0,15,0);
insert into sc values('1304000003',2015,3.67714949287,10,1,9,0);
insert into sc values('1304000004',2015,3.35534938991,14,0,14,0);
insert into sc values('1304000005',2015,3.75090203133,14,0,13,0);
insert into sc values('1304000006',2015,3.56389524336,11,1,10,0);
insert into sc values('1304000007',2015,2.90955470829,10,1,9,0);
insert into sc values('1304000008',2015,3.18909778577,11,1,10,0);
insert into sc values('1304000009',2015,3.69485237376,13,0,13,0);
insert into sc values('1304000010',2015,3.15673342344,9,1,8,0);
insert into sc values('1305000001',2015,3.47527470796,15,1,14,0);
insert into sc values('1305000002',2015,2.95799590744,9,1,8,0);
insert into sc values('1305000003',2015,3.31097191612,9,1,8,0);
insert into sc values('1305000004',2015,3.43223962456,10,0,9,0);
insert into sc values('1305000005',2015,3.41676064864,11,0,10,0);
insert into sc values('1305000006',2015,3.64560567433,14,0,14,0);
insert into sc values('1305000007',2015,2.95698492264,14,0,13,0);
insert into sc values('1305000008',2015,3.32237029297,15,0,15,1);
insert into sc values('1305000009',2015,3.13201165782,12,1,11,0);
insert into sc values('1305000010',2015,3.75280226556,9,0,8,1);
insert into sc values('1300000011',2015,3.34384323239,10,0,9,0);
insert into sc values('1300000012',2015,3.16337189288,11,0,10,0);
insert into sc values('1300000013',2015,3.74766852745,10,1,9,0);
insert into sc values('1300000014',2015,2.98476088572,14,0,13,0);
insert into sc values('1300000015',2015,3.06077445892,13,0,13,0);

# 14级
insert into sc values('1400000001',2015,2.88508025862,11,0,10,0);
insert into sc values('1400000002',2015,3.82760207242,9,0,8,0);
insert into sc values('1400000003',2015,3.10164227742,13,0,12,0);
insert into sc values('1400000004',2015,3.23536224643,15,0,15,0);
insert into sc values('1400000005',2015,3.30174937829,15,0,14,0);
insert into sc values('1400000006',2015,2.93836245776,13,1,12,0);
insert into sc values('1400000007',2015,3.06921710855,10,0,9,0);
insert into sc values('1400000008',2015,3.29676299646,13,1,12,1);
insert into sc values('1400000009',2015,3.16799959216,12,0,12,0);
insert into sc values('1400000010',2015,3.21400090416,14,0,13,0);
insert into sc values('1401000001',2015,3.49935797997,10,0,9,0);
insert into sc values('1401000002',2015,3.84618161671,9,0,9,0);
insert into sc values('1401000003',2015,2.8421356697,10,0,10,0);
insert into sc values('1401000004',2015,2.95921083507,11,0,10,0);
insert into sc values('1401000005',2015,3.4565276054,14,0,13,0);
insert into sc values('1401000006',2015,3.18639230514,10,0,9,0);
insert into sc values('1401000007',2015,3.58032011542,10,0,10,0);
insert into sc values('1401000008',2015,3.30011026833,12,0,11,0);
insert into sc values('1401000009',2015,3.02797022925,9,1,8,0);
insert into sc values('1401000010',2015,2.84845284823,13,0,12,0);
insert into sc values('1402000001',2015,2.93398584242,9,0,9,0);
insert into sc values('1402000002',2015,3.8764121002,14,0,14,0);
insert into sc values('1402000003',2015,3.76247451315,9,0,9,0);
insert into sc values('1402000004',2015,3.4769744773,15,0,15,1);
insert into sc values('1402000005',2015,3.37345516955,9,1,8,0);
insert into sc values('1402000006',2015,3.04095709747,11,0,10,0);
insert into sc values('1402000007',2015,2.84423126122,14,0,14,1);
insert into sc values('1402000008',2015,3.6055028025,13,1,12,0);
insert into sc values('1402000009',2015,3.83647326712,15,1,14,0);
insert into sc values('1402000010',2015,2.86029509391,9,0,9,1);
insert into sc values('1403000001',2015,3.53138676156,9,0,9,0);
insert into sc values('1403000002',2015,2.83698432461,9,0,8,0);
insert into sc values('1403000003',2015,3.86242314674,14,0,14,0);
insert into sc values('1403000004',2015,3.10855642188,14,1,13,0);
insert into sc values('1403000005',2015,3.86018743947,14,0,14,0);
insert into sc values('1403000006',2015,3.36297944635,14,0,14,0);
insert into sc values('1403000007',2015,3.31999957285,15,0,15,0);
insert into sc values('1403000008',2015,3.79516270927,9,1,8,0);
insert into sc values('1403000009',2015,2.8835882877,14,0,13,0);
insert into sc values('1403000010',2015,3.30869542789,13,0,12,0);
insert into sc values('1404000001',2015,3.38103302101,11,0,11,0);
insert into sc values('1404000002',2015,3.01958513069,10,0,10,0);
insert into sc values('1404000003',2015,2.89146787995,15,1,14,0);
insert into sc values('1404000004',2015,3.32483115069,15,1,14,0);
insert into sc values('1404000005',2015,3.41461973774,12,0,11,0);
insert into sc values('1404000006',2015,3.5113936066,11,0,11,0);
insert into sc values('1404000007',2015,3.73265486901,15,0,15,0);
insert into sc values('1404000008',2015,3.41746302863,12,0,11,0);
insert into sc values('1404000009',2015,3.22070087628,9,0,8,0);
insert into sc values('1404000010',2015,3.5010678063,12,0,11,0);
insert into sc values('1405000001',2015,2.96906084015,13,0,12,1);
insert into sc values('1405000002',2015,2.81628268598,15,0,15,0);
insert into sc values('1405000003',2015,3.74641014203,11,0,11,0);
insert into sc values('1405000004',2015,3.57232392161,11,0,10,0);
insert into sc values('1405000005',2015,3.2090729612,9,0,8,0);
insert into sc values('1405000006',2015,3.6565254439,9,0,8,0);
insert into sc values('1405000007',2015,3.38852725767,12,0,12,0);
insert into sc values('1405000008',2015,2.83081958085,15,0,15,0);
insert into sc values('1405000009',2015,3.03530244453,10,1,9,0);
insert into sc values('1405000010',2015,3.41495137305,10,0,10,0);
insert into sc values('1400000011',2015,3.29696815208,14,0,13,0);
insert into sc values('1400000012',2015,3.89058125052,14,0,13,0);
insert into sc values('1400000013',2015,3.42323633871,12,0,12,0);
insert into sc values('1400000014',2015,3.60666499334,14,0,13,0);
insert into sc values('1400000015',2015,3.55828548857,12,0,12,0);
# 15级
insert into sc values('1500000001',2016,3.32768297344,12,0,11,0);
insert into sc values('1500000002',2016,3.53590496658,11,0,11,0);
insert into sc values('1500000003',2016,3.52237091761,14,0,13,0);
insert into sc values('1500000004',2016,3.57036229705,11,0,10,0);
insert into sc values('1500000005',2016,2.85129912154,14,0,13,0);
insert into sc values('1500000006',2016,2.83092162878,11,0,11,0);
insert into sc values('1500000007',2016,3.75378332278,9,0,8,0);
insert into sc values('1500000008',2016,2.86997217662,10,1,9,0);
insert into sc values('1500000009',2016,3.25383654773,14,0,13,1);
insert into sc values('1500000010',2016,3.01371400552,15,0,15,0);
insert into sc values('1501000001',2016,2.87264473542,12,0,12,0);
insert into sc values('1501000002',2016,3.73982082,9,0,9,0);
insert into sc values('1501000003',2016,2.96269455,12,0,11,0);
insert into sc values('1501000004',2016,3.31431041424,11,0,11,1);
insert into sc values('1501000005',2016,3.08393610176,11,1,10,0);
insert into sc values('1501000006',2016,3.64661175096,10,1,9,0);
insert into sc values('1501000007',2016,3.5966047596,13,1,12,0);
insert into sc values('1501000008',2016,3.80597799965,9,0,8,0);
insert into sc values('1501000009',2016,3.74307659327,10,0,10,0);
insert into sc values('1501000010',2016,2.86695959402,14,0,14,0);
insert into sc values('1502000001',2016,3.85403328582,15,0,15,0);
insert into sc values('1502000002',2016,2.92011723694,9,0,8,0);
insert into sc values('1502000003',2016,3.5646485429,14,0,14,0);
insert into sc values('1502000004',2016,3.29315428232,15,0,14,0);
insert into sc values('1502000005',2016,2.95738716662,15,0,14,0);
insert into sc values('1502000006',2016,3.67584214326,9,0,9,0);
insert into sc values('1502000007',2016,3.57997420097,13,0,12,0);
insert into sc values('1502000008',2016,3.71177085856,9,0,9,0);
insert into sc values('1502000009',2016,3.39727242772,13,0,13,0);
insert into sc values('1502000010',2016,3.6097825915,11,0,10,0);
insert into sc values('1503000001',2016,2.86006113928,9,0,8,0);
insert into sc values('1503000002',2016,3.0894799658,10,0,10,0);
insert into sc values('1503000003',2016,3.11829386276,9,1,8,1);
insert into sc values('1503000004',2016,3.50340555226,11,0,10,0);
insert into sc values('1503000005',2016,3.58286086296,12,0,11,0);
insert into sc values('1503000006',2016,3.34713162657,9,0,9,0);
insert into sc values('1503000007',2016,3.02330880221,10,0,9,0);
insert into sc values('1503000008',2016,3.65474456692,10,0,10,0);
insert into sc values('1503000009',2016,3.09486124201,9,0,9,0);
insert into sc values('1503000010',2016,3.1785435598,10,0,9,1);
insert into sc values('1504000001',2016,3.54906749597,13,0,13,0);
insert into sc values('1504000002',2016,3.3237407499,12,0,12,0);
insert into sc values('1504000003',2016,3.53198401955,12,0,11,0);
insert into sc values('1504000004',2016,3.21881672227,9,0,9,0);
insert into sc values('1504000005',2016,3.40820897513,14,0,13,0);
insert into sc values('1504000006',2016,2.92315889057,15,1,14,0);
insert into sc values('1504000007',2016,3.70071246933,15,0,14,0);
insert into sc values('1504000008',2016,3.25051519455,14,0,14,0);
insert into sc values('1504000009',2016,3.13988384741,11,0,10,0);
insert into sc values('1504000010',2016,3.06431097598,11,0,11,1);
insert into sc values('1505000001',2016,3.22266611191,11,1,10,0);
insert into sc values('1505000002',2016,3.26524562212,14,0,13,0);
insert into sc values('1505000003',2016,3.75750627465,9,0,8,0);
insert into sc values('1505000004',2016,3.684421673,12,0,12,0);
insert into sc values('1505000005',2016,3.51521527892,11,0,10,1);
insert into sc values('1505000006',2016,3.42986017629,11,0,11,0);
insert into sc values('1505000007',2016,3.69990534121,12,0,11,0);
insert into sc values('1505000008',2016,3.03835204292,12,1,11,1);
insert into sc values('1505000009',2016,3.41012353287,13,0,12,0);
insert into sc values('1505000010',2016,3.31057904092,13,0,13,0);
insert into sc values('1500000011',2016,3.02511639904,15,0,15,0);
insert into sc values('1500000012',2016,3.76081975243,12,0,12,0);
insert into sc values('1500000013',2016,3.47968183852,14,0,13,0);
insert into sc values('1500000014',2016,2.95546752884,15,1,14,1);
insert into sc values('1500000015',2016,3.62941689868,9,0,9,0);
commit;

# 在ce中插入数据
# 以当前的评选标准为准
insert into ce
values('0001','政治思想','分数范围：0-6','Integer');
insert into ce
values('0002','道德品质','分数范围：0-6','Integer');
insert into ce
values('0003','工作效果','分数范围：0-6','Integer');
insert into ce
values('0004','身心状况','分数范围：0-6','Integer');
insert into ce
values('0005','班级形象','分数范围：0-6','Integer');
insert into ce
values('0011','班级学风情况','分数范围：0-10','Integer');
insert into ce
values('0021','班级活动情况','分数范围：1-5','Integer');
insert into ce
values('0031','答辩得分','分数范围：0-100','Integer');
insert into ce
values('0041','附加分','分数无上限','Integer');
commit;

# 在cer中插入数据
insert into cer values('0001',2015,'试验132',6);
insert into cer values('0002',2015,'试验132',6);
insert into cer values('0003',2015,'试验132',6);
insert into cer values('0004',2015,'试验132',6);
insert into cer values('0005',2015,'试验132',4);
insert into cer values('0001',2015,'试验142',6);
insert into cer values('0002',2015,'试验142',6);
insert into cer values('0003',2015,'试验142',5);
insert into cer values('0004',2015,'试验142',6);
insert into cer values('0005',2015,'试验142',6);
insert into cer values('0001',2015,'试验152',5);
insert into cer values('0002',2015,'试验152',4);
insert into cer values('0003',2015,'试验152',6);
insert into cer values('0004',2015,'试验152',6);
insert into cer values('0005',2015,'试验152',6);
insert into cer values('0001',2015,'计算131',5);
insert into cer values('0002',2015,'计算131',6);
insert into cer values('0003',2015,'计算131',6);
insert into cer values('0004',2015,'计算131',5);
insert into cer values('0005',2015,'计算131',6);
insert into cer values('0001',2015,'计算141',5);
insert into cer values('0002',2015,'计算141',6);
insert into cer values('0003',2015,'计算141',5);
insert into cer values('0004',2015,'计算141',6);
insert into cer values('0005',2015,'计算141',6);
insert into cer values('0001',2015,'计算151',5);
insert into cer values('0002',2015,'计算151',4);
insert into cer values('0003',2015,'计算151',6);
insert into cer values('0004',2015,'计算151',5);
insert into cer values('0005',2015,'计算151',5);
insert into cer values('0001',2015,'地信131',4);
insert into cer values('0002',2015,'地信131',6);
insert into cer values('0003',2015,'地信131',5);
insert into cer values('0004',2015,'地信131',6);
insert into cer values('0005',2015,'地信131',5);
insert into cer values('0001',2015,'地信141',6);
insert into cer values('0002',2015,'地信141',5);
insert into cer values('0003',2015,'地信141',6);
insert into cer values('0004',2015,'地信141',6);
insert into cer values('0005',2015,'地信141',6);
insert into cer values('0001',2015,'地信151',4);
insert into cer values('0002',2015,'地信151',6);
insert into cer values('0003',2015,'地信151',5);
insert into cer values('0004',2015,'地信151',6);
insert into cer values('0005',2015,'地信151',4);
insert into cer values('0001',2015,'自动化131',6);
insert into cer values('0002',2015,'自动化131',6);
insert into cer values('0003',2015,'自动化131',5);
insert into cer values('0004',2015,'自动化131',4);
insert into cer values('0005',2015,'自动化131',6);
insert into cer values('0001',2015,'自动化141',6);
insert into cer values('0002',2015,'自动化141',6);
insert into cer values('0003',2015,'自动化141',5);
insert into cer values('0004',2015,'自动化141',5);
insert into cer values('0005',2015,'自动化141',5);
insert into cer values('0001',2015,'自动化151',5);
insert into cer values('0002',2015,'自动化151',5);
insert into cer values('0003',2015,'自动化151',6);
insert into cer values('0004',2015,'自动化151',6);
insert into cer values('0005',2015,'自动化151',6);
insert into cer values('0001',2015,'电子131',6);
insert into cer values('0002',2015,'电子131',6);
insert into cer values('0003',2015,'电子131',4);
insert into cer values('0004',2015,'电子131',4);
insert into cer values('0005',2015,'电子131',6);
insert into cer values('0001',2015,'电子141',6);
insert into cer values('0002',2015,'电子141',5);
insert into cer values('0003',2015,'电子141',4);
insert into cer values('0004',2015,'电子141',6);
insert into cer values('0005',2015,'电子141',6);
insert into cer values('0001',2015,'电子151',5);
insert into cer values('0002',2015,'电子151',6);
insert into cer values('0003',2015,'电子151',6);
insert into cer values('0004',2015,'电子151',5);
insert into cer values('0005',2015,'电子151',6);
insert into cer values('0001',2015,'电气131',6);
insert into cer values('0002',2015,'电气131',6);
insert into cer values('0003',2015,'电气131',6);
insert into cer values('0004',2015,'电气131',6);
insert into cer values('0005',2015,'电气131',6);
insert into cer values('0001',2015,'电气141',6);
insert into cer values('0002',2015,'电气141',6);
insert into cer values('0003',2015,'电气141',6);
insert into cer values('0004',2015,'电气141',6);
insert into cer values('0005',2015,'电气141',6);
insert into cer values('0001',2015,'电气151',6);
insert into cer values('0002',2015,'电气151',6);
insert into cer values('0003',2015,'电气151',5);
insert into cer values('0004',2015,'电气151',6);
insert into cer values('0005',2015,'电气151',5);
commit;

# 在count_result中插入数据
insert into count_result
values('试验142',2015,0);
insert into count_result
values('电子141',2015,25);
insert into count_result
values('计算141',2015,40);

# 在cr中插入数据
insert into cr
values('试验132',2014,99,1);
insert into cr
values('计算131',2014,70,3);
insert into cr
values('电子131',2014,80,2);
