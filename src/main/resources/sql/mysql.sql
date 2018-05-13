/*alter user 'root'@'localhost' identified by 'root';
create user 'eventbooking'@'%' identified by 'eventbooking';
grant all on *.* to 'eventbooking'@'%';
flush privileges;
create database eventbooking
*/
use eventbooking;
-- auto-generated definition
create table t_class
(
  id             int auto_increment
    primary key,
  teacher        varchar(64)            not null,
  address        varchar(128)           null,
  date           datetime               null,
  class_name     varchar(64)            null,
  price          double default '0'     null,
  max_people     int default '100'      null,
  flag           tinyint(1) default '1' null,
  create_user_id int                    null
)
  engine = InnoDB;

-- auto-generated definition
create table t_user
(
  id              int auto_increment
  comment '用户id'
    primary key,
  username        varchar(32)     not null
  comment '用户id',
  password        varchar(32)     null
  comment '用户密码',
  email           varchar(64)     null
  comment '用户邮箱',
  mobile_phone    varchar(32)     null
  comment '用户手机号码',
  address         varchar(256)    null
  comment '用户住址',
  last_login_date datetime        null
  comment '上次登陆时间',
  login_count     int             null
  comment '登陆次数',
  user_type       int default '1' not null
  comment '用户标识 0：系统用户 1：普通用户（学生） 2：老师用户，',
  login_date      datetime        null,
  constraint t_user_username_uindex
  unique (username)
)
  engine = InnoDB;

-- auto-generated definition
create table t_user_class_booking
(
  user_id      int                    null,
  class_id     int                    null,
  booking_date datetime               null,
  flag         tinyint(1) default '1' null
)
  engine = InnoDB;

