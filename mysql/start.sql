# 在重置数据库后，按序执行以下操作

# 修改表的默认字符集
source ~/mysql/zifuji.sql;
commit;
# 设置参照完整性
source ~/mysql/canzhao.sql;
commit;
# 完善用户自定义完整性
source ~/mysql/yonghu.sql
commit;
# 创建测试数据
source ~/mysql/ceshi.sql;
commit;
# 创建视图
source ~/mysql/shitu.sql
commit;

