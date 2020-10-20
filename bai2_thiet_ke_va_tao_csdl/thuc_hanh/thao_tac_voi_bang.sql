create database thaotacvoibang;
create table contacts(
contact_id int(11) not null auto_increment,
last_name varchar(30) not null,
first_name varchar(25),
birthday date,
constraint contacts_pk primary key(contact_id)
);
create table suppliers(
suppilier_id int(11) not null auto_increment,
suppiler_name varchar(30) not null,
account_rep varchar(30) not null default 'TBD',
constraint suppilier_pk primary key (suppilier_id)
);
drop table suppliers;
ALTER TABLE contacts
  ADD last_name varchar(40) NOT NULL
    AFTER contact_id,
  ADD first_name varchar(35) NULL
    AFTER last_name;
ALTER TABLE contacts
  modify last_name varchar(50) NULL;
ALTER TABLE contacts
  DROP COLUMN contact_type;
  ALTER TABLE contacts
  RENAME TO people;