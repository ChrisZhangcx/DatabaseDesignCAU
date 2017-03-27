# 定义触发器
# 在插入users时，如果role=0，则必须给出班级，否则拒绝执行
# 实现拒绝执行：让触发器删除触发自己的表，以抛出一个异常
drop trigger if exists users_i;
delimiter |
create trigger users_i before insert on users
for each row
begin
    if (new.role=0 and new.Class is null) then
        delete from users;
    end if;
end;|
delimiter ;
