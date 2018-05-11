/*alter user 'root'@'localhost' identified by 'root';
create user 'eventbooking'@'%' identified by 'eventbooking';
grant all on *.* to 'eventbooking'@'%';
flush privileges;
create database eventbooking
*/
use eventbooking;
create table t_user (
  id              int auto_increment primary key
  comment '用户id',
  username        varchar(32) comment '用户id',
  password        varchar(32) comment '用户密码',
  email           varchar(64) comment '用户邮箱',
  mobile_phone    varchar(32) comment '用户手机号码',
  address         varchar(256) comment '用户住址',
  last_login_date date comment '上次登陆时间',
  login_count     int comment '登陆次数',
  user_type   int comment '用户标识 0：系统用户 1：普通用户（学生） 2：老师用户，'
);

