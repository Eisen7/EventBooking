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
  max_people     int default '0'        null,
  flag           tinyint(1) default '1' null,
  create_user_id int                    not null
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

