/*alter user 'root'@'localhost' identified by 'root';
create user 'eventbooking'@'%' identified by 'eventbooking';
grant all on *.* to 'eventbooking'@'%';
flush privileges;
create database eventbooking
*/
use eventbooking;
create table d_user (
  id              bigint auto_increment primary key
  comment '用户id',
  username        varchar(32) comment '用户id',
  password        varchar(32) comment '用户密码',
  email           varchar(64) comment '用户邮箱',
  mobile_phone    varchar(32) comment '用户手机号码',
  address         varchar(256) comment '用户住址',
  last_login_date date comment '上次登陆时间',
  login_count     int comment '登陆次数',
  user_group_id   bigint comment '用户组id'
);

create table d_user_group (
  id         bigint auto_increment primary key
  comment '用户组id',
  group_name varchar(50)
);

create table d_user_right (
  id           bigint auto_increment primary key
  comment '权限id',
  right_name   varchar(32) comment '权限名',
  right_detail varchar(512) comment '权限描述'
);

create table d_user_group_right (
  id       bigint auto_increment primary key
  comment 'id',
  group_id bigint,
  right_id bigint
);
