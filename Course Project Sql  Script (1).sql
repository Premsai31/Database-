create database bankingsystem;
use bankingsystem;
create table customer(customer_Id int primary key, name varchar(20), dob date, address varchar(50), SSN varchar(9));
insert into customer(customer_Id,name,dob,address,SSN)
values(111,'kaushik','1999-08-11','ayyappa nagar,Jaggaiahpet',123456762),
(112,'joel','1987-01-18',' genesse dr,naper',456129537),
(113,'sarah','1997-03-28','srinagar,khammam',642947831);
select * from customer;

create table account(accountnumber int primary key, customer_Id int, foreign key(customer_Id) references customer(customer_Id), balance double, acc_type varchar(15), opening_date date, closing_date date,apr double, credit_limit double, cash_adv_limit double);
insert into account(accountnumber,customer_Id,balance,acc_type,opening_date,closing_date,apr, credit_limit, cash_adv_limit)
values(43218764,'111','5000','savings','2018-09-12','2099-01-01','0.0','0.0','0.0'),
(43218765,'112','20900','checking','2017-11-08','2099-01-01','0.0','0.0','0.0'),
(54318764,'111','5000','silver','2018-09-12','2099-01-01','0.99','7000','2000'),
(54318765,'112','1000','gold','2017-11-08','2099-01-01','1.99','14000','4000'),
(54318766,'113','2000','platinum','2019-11-08','2099-01-01','2.99','21000','6000');
select * from account;

create table transactiondetails(transaction_Id int primary key, accountnumber int, foreign key(accountnumber) references account(accountnumber), amount_debit double, amount_credit double, transaction_time datetime);
insert into transactiondetails(transaction_Id,accountnumber,amount_debit,amount_credit,transaction_time)
values(001,54318764,'5000','0','2018-09-12 12:30:15'),
(002,54318765,'0','3000','2017-11-08 12:30:15'),
(003,54318766,'2500','0','2019-11-08 12:30:15'),
(004,43218764,'5000','0','2018-07-12 12:30:15'),
(005,43218765,'0','3000','2017-11-08 12:30:15');
select * from transactiondetails;

create table zelletransfer(transfer_Id int primary key, accountnumber int, foreign key(accountnumber) references account(accountnumber), recipients_account int, amount double, transfer_time datetime);
insert into zelletransfer(transfer_Id,accountnumber,recipients_account,amount,transfer_time)
values(001,43218764,43218765,'3000','2018-09-12 12:30:15'),
(002,43218765,43218764,'2000','2017-11-08 11:30:15'),
(003,43218765,43218764,'1000','2017-11-08 10:30:15');
select * from zelletransfer;

create table upgradeaccount(upgrade_Id int primary key, accountnumber int, foreign key(accountnumber) references account(accountnumber), upgrade_date date, acc_type_from varchar(15), acc_type_to varchar(15));
insert into upgradeaccount(upgrade_Id,accountnumber,upgrade_date,acc_type_from,acc_type_to)
values(001,54318765,'2018-09-12','silver','gold'),
(002,54318766,'2017-09-12','silver','gold'),
(003,54318766,'2019-09-12','gold','platinum');
select * from upgradeaccount;

insert into customer(customer_Id, name, dob, address, SSN)
values(114, 'Alex', '1990-05-22', 'Maple Street, Springfield', '789654123');


