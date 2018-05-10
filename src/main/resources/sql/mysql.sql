--alter user 'root'@'localhost' identified by 'root';
create user 'eventbooking'@'%' identified by 'eventbooking';
grant all on *.* to 'eventbooking'@'%';
flush privileges;