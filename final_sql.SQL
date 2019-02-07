REM UTSAV GOEL DENI AVINASH - TEAM 2
REM USERINSC521FA18_UJG5001

SPOOL C:\temp\outputfile.txt
alter session set nls_date_format = 'mm-dd-yyyy';

create table USERINSC521FA18_UJG5001.User_PSU(
PSU_ID char(9) PRIMARY KEY,
F_Name varchar2(10) NOT NULL,
L_Name varchar2(10) NOT NULL,
Sex char NOT NULL,
status varchar2(8) NOT NULL,
Apt_num varchar2(5) NOT NULL,
street varchar2(10) NOT NULL,
city varchar2(9) NOT NULL,
state char(2) NOT NULL,
country varchar2(10) NOT NULL,
phn_num char(10) NOT NULL,
discount real NOT NULL,
check (discount >= 0.0 and discount < 10.0),
check (Sex in ('m','f')),
check (status in ('active','inactive'))
);

INSERT INTO USERINSC521FA18_UJG5001.User_PSU values('999999999','Utsav','Goel','m','active','223','45Creeksid','Malvern','PA','USA','4843189042',6.0);
INSERT INTO USERINSC521FA18_UJG5001.User_PSU values('999999998','Deni','Avinash','m','active','223','45Creeksid','Malvern','PA','USA','4843189041',6.0);
INSERT INTO USERINSC521FA18_UJG5001.User_PSU values('999999997','Aaqil','Rahman','m','active','223','45Creeksid','Malvern','PA','USA','4843189040',6.0);
INSERT INTO USERINSC521FA18_UJG5001.User_PSU values('999999967','Kavin','Rahman','m','active','112','Exton St.','Malvern','PA','USA','4843189030',6.0);
INSERT INTO USERINSC521FA18_UJG5001.User_PSU values('999999957','Acchyuta','Goel','m','active','211','Paoli St.','Malvern','PA','USA','4843189020',6.0);
INSERT INTO USERINSC521FA18_UJG5001.User_PSU values('999999947','Dhanjeet','Vardhan','m','active','299','West St.','Malvern','PA','USA','4843189010',6.0);


create table USERINSC521FA18_UJG5001.Dependant(
PSU_ID char(9) NOT NULL,
Name varchar2(20) NOT NULL,
email varchar2(30) NOT NULL,
Sex char NOT NULL,
phn_num char(10) NOT NULL,
relationship varchar2(10) NOT NULL,
PRIMARY KEY (PSU_ID,Name),
FOREIGN KEY (PSU_ID) references USERINSC521FA18_UJG5001.User_PSU(PSU_ID),
check (Sex in ('m','f'))
);

INSERT INTO USERINSC521FA18_UJG5001.Dependant values ('999999999','RAJ','abcdefg@gmail.com','m','4841221324','son');
INSERT INTO USERINSC521FA18_UJG5001.Dependant values ('999999998','Sharmila','sharmila.balaji@gmail.com','f','4841221325','mother');
INSERT INTO USERINSC521FA18_UJG5001.Dependant values ('999999997','Aaqil Jr.','redmpsdm@gmail.com','m','4841221328','son');

create table USERINSC521FA18_UJG5001.User_PSU_email(
PSU_ID char(9) NOT NULL,
email varchar2(20) NOT NULL,
PRIMARY KEY(PSU_ID,email),
FOREIGN KEY (PSU_ID) REFERENCES USERINSC521FA18_UJG5001.User_PSU(PSU_ID)
);

INSERT into USERINSC521FA18_UJG5001.User_PSU_email values('999999999','utsav96@gmail.com');
INSERT INTO USERINSC521FA18_UJG5001.user_psu_email values('999999999','ujg5001@psu.edu');
INSERT into USERINSC521FA18_UJG5001.User_PSU_email values('999999998','deni@gmail.com');

create table USERINSC521FA18_UJG5001.Employee(
ssn char(9) UNIQUE NOT NULL,
post varchar2(10) NOT NULL,
PSU_ID char(9) PRIMARY KEY,
Dept_ID char(5) NOT NULL,
type varchar2(7) NOT NULL,
FOREIGN KEY (PSU_ID) references USERINSC521FA18_UJG5001.User_PSU(PSU_ID),
check (type in ('faculty','staff'))
);

INSERT into USERINSC521FA18_UJG5001.employee values('123456789','prof','999999999','5001','faculty');
INSERT Into USERINSC521FA18_UJG5001.employee values('123456788','prof','999999998','5003','faculty');
INSERT Into USERINSC521FA18_UJG5001.employee values('123456787','clerk','999999997','5001','staff');


create table USERINSC521FA18_UJG5001.Department(
Dept_name varchar2(10) NOT NULL UNIQUE,
Dept_ID char(5) PRIMARY KEY,
PSU_ID char(9) UNIQUE,
FOREIGN KEY (PSU_ID) REFERENCES USERINSC521FA18_UJG5001.Employee(PSU_ID)
);

insert into USERINSC521FA18_UJG5001.department values('DaAn', '50101', '999999999');
insert into USERINSC521FA18_UJG5001.department values('INSC','50103','999999998');

create table USERINSC521FA18_UJG5001.Student(
PSU_ID char(9) PRIMARY KEY,
GPA real,
Degree varchar2(10) NOT NULL,
Dept_ID char(5) NOT NULL,
FOREIGN KEY (PSU_ID) references USERINSC521FA18_UJG5001.User_PSU(PSU_ID),
FOREIGN KEY (Dept_ID) references USERINSC521FA18_UJG5001.Department(Dept_ID),
check (Degree in ('bachelor','master','phd'))
);

insert into USERINSC521FA18_UJG5001.student values('999999967',4.0,'bachelor','50101');
insert into USERINSC521FA18_UJG5001.student values('999999957',4.0,'master','50101');
insert into USERINSC521FA18_UJG5001.student values('999999947',4.0,'phd','50103');

create table USERINSC521FA18_UJG5001.Product(
price real NOT NULL,
size_p char(2) NOT NULL,
stock number NOT NULL,
p_ID char(7) PRIMARY KEY,
check (stock>0),
check (size_p in ('xs','s','m','l','xl')),
check (price >=0.0)
);

insert into USERINSC521FA18_UJG5001.product values(19.99,'xs',20,'H_543');
insert into USERINSC521FA18_UJG5001.product values(19.99,'s',20,'H_544');
insert into USERINSC521FA18_UJG5001.product values(29.99,'xl',20,'H_546');
insert into USERINSC521FA18_UJG5001.product values(24.99,'l',20,'H_545');

create table USERINSC521FA18_UJG5001.Order_t(
Feed_back varchar2(20),
Discount real NOT NULL,
Pickup_date Date,
cost_o real,
count_p number,
pay_mode char(4),
C_ID char(9),
O_ID char(10) PRIMARY KEY,
check (count_p>0),
check (cost_o>0)
);

insert into USERINSC521FA18_UJG5001.order_t values('',6.0,'10-28-2018',18.79,1,'cash','999999967','C_11111111');
insert into USERINSC521FA18_UJG5001.order_t values('',6.0,'10-28-2018',18.79,1,'cash','999999947','C_11111112');
insert into USERINSC521FA18_UJG5001.order_t values('',6.0,'10-28-2018',18.79,1,'cash','999999947','C_11111113');
insert into USERINSC521FA18_UJG5001.order_t values('',6.0,'10-28-2018',18.79,1,'cash','999999957','C_11111114');

create table USERINSC521FA18_UJG5001.O_Contains(
O_ID char(10) NOT NULL,
p_ID char(7) NOT NULL,
PRIMARY KEY (O_ID, p_ID),
FOREIGN KEY (p_ID) references USERINSC521FA18_UJG5001.Product(p_ID),
foreign key (o_id) references USERINSC521FA18_UJG5001.Order_t(o_id)
);


insert into USERINSC521FA18_UJG5001.o_contains values('C_11111111','H_544');
insert into USERINSC521FA18_UJG5001.o_contains values('C_11111112','H_543');
insert into USERINSC521FA18_UJG5001.o_contains values('C_11111113','H_546');
insert into USERINSC521FA18_UJG5001.o_contains values('C_11111114','H_545');

create table USERINSC521FA18_UJG5001.Color(
color varchar2(10) NOT NULL,
p_ID char (7) NOT NULL,
PRIMARY KEY (p_ID,color),
FOREIGN KEY (p_ID) REFERENCES USERINSC521FA18_UJG5001.Product(p_ID)
);

insert into USERINSC521FA18_UJG5001.Color values('Blue', 'H_544');
insert into USERINSC521FA18_UJG5001.Color values('Red', 'H_543');
insert into USERINSC521FA18_UJG5001.Color values('Green', 'H_545');
insert into USERINSC521FA18_UJG5001.Color values('Yellow', 'H_546');

create table USERINSC521FA18_UJG5001.Dependent_orders(
O_ID char(10) NOT NULL,
Name varchar2(20) NOT NULL,
PSU_ID char(9) NOT NULL,
PRIMARY KEY (O_ID, Name, PSU_ID),
FOREIGN KEY (O_ID) references USERINSC521FA18_UJG5001.Order_t(O_ID),
FOREIGN KEY (PSU_ID,Name) references USERINSC521FA18_UJG5001.Dependant(PSU_ID,Name)
);

INSERT INTO USERINSC521FA18_UJG5001.Dependent_orders values ('C_11111111','RAJ','999999999');
INSERT INTO USERINSC521FA18_UJG5001.Dependent_orders values ('C_11111112','Sharmila','999999998');


create table USERINSC521FA18_UJG5001.User_PSU_orders(
O_ID char(10) NOT NULL,
PSU_ID char(9) NOT NULL,
PRIMARY KEY (O_ID,PSU_ID),
FOREIGN KEY (O_ID) REFERENCES USERINSC521FA18_UJG5001.Order_t(O_ID),
FOREIGN KEY (PSU_ID) REFERENCES USERINSC521FA18_UJG5001.User_PSU(PSU_ID)
);

INSERT INTO USERINSC521FA18_UJG5001.User_PSU_orders values ('C_11111113','999999999');
INSERT INTO USERINSC521FA18_UJG5001.User_PSU_orders values ('C_11111114','999999998');