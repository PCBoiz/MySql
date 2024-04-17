# rằng buộc not null, tác dụng trên cột chỉ định giá trị không được null
# tạo bảng mới với giá trị của cột đã chỉ định là user_name không được null

CREATE TABLE human5 (
                        id int(20) primary key auto_increment,
                        user_name varchar(200) not null,
                        phone_number varchar(20)
);

# tạo rằng buộc not null khi bảng đã có sẵn và chỉ sửa đổi
alter table human5
    modify column user_name int not null;

# đổi lại thành có cho phép giá trị null trên cột đó
alter table human5
    modify column user_name int null;


# rằng buộc not null, tác dụng trên cột chỉ định giá trị không được null khi không insert giá trị vào
CREATE TABLE human5 (
                        id int(20) primary key auto_increment,
                        user_name varchar(200) not null default 'Long',
                        phone_number varchar(20)
);

# set giá trị mặc định khi đã tạo bảng
alter table human5
    alter user_name set default '15';

# xóa giá trị mặc định khỏi cột đó
alter table human5
    alter user_name drop default;

# kiểm tra giá trị đầu vào trước khi được insert xuống database ( rằng buộc check )
CREATE TABLE human5 (
                        id int(20) primary key auto_increment,
                        user_name varchar(200),
                        phone_number varchar(20),
                        age int(100)
                            constraint CHK_PersonAge check (age >= 18)
);

# thêm điều kiện cho cột đã có sẵn, CHK_PersonAge có thể hiểu là tên của rằng buộc (có thể thay đổi), trong database sẽ không có rằng buộc nào giống tên như thế mà phải đặt tên khác
alter table orders
    add constraint CHK_PersonAge check (age >= 18);

alter table orders
    drop check CHK_PersonAge;

# rằng buộc unique kiểm tra các giá trị trong cột đó có trùng nhau hay không, khi thêm rằng buộc này giá trị trong cột đó phải không được giống nhau
CREATE TABLE human5 (
                        id int(20) primary key auto_increment,
                        user_name varchar(200) unique,
                        phone_number varchar(20),
                        age int(100)
                            check (age >= 18)
);

# tạo rằng buộc unique của cột khi đã tạo bảng
alter table human5
    add constraint UC_Person unique (user_name);

# xóa rằng buộc unique bằng key( giống như tên của 1 hàm UC_Person) giống với check
alter table human5
    drop index UC_Person;

# tạo khóa phụ liên kết giữa 2 bảng với nhau
CREATE TABLE human6 (
                        id_human6 int(20) primary key auto_increment,
                        user_name varchar(200) unique,
                        phone_number varchar(20),
                        age int(100) check (age >= 18),
                        constraint test foreign key (id_human6) references human6(id_human6)
);

# thêm khóa phụ vào bảng đã được tạo
alter table orders
    add constraint FK_PersonOrder
        foreign key (personId) references persons(personId);

# xóa khóa phụ
alter table orders
    drop foreign key test;

insert into human5 (user_name ,phone_number, age)
values ('son', '42343243242','19');

create table orders (
                        orderId int not null,
                        orderNumber int not null,
                        personId int,
                        primary key (orderId)
);


create table persons (
                         personId int not null,
                         primary key (personId)
);

alter table orders
    add constraint FK_PersonOrder
        foreign key (personId) references persons(personId);

alter table orders
    drop foreign key FK_PersonOrder;

alter table orders
    add constraint UC_Person unique (orderNumber);

alter table orders
    drop index UC_Person;

alter table orders
    add constraint CHK_PersonAge check (age >= 18);

alter table orders
    drop check CHK_PersonAge;

alter table orders
    alter orderNumber set default '15';

alter table orders
    alter orderNumber drop default;

alter table orders
    modify column orderNumber int not null;

alter table orders
    modify column orderNumber int null;


/* Nối các bảng với nhau (Join) */

/* Inner Join */