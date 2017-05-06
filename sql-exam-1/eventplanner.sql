create database eventplanner;
use eventplanner;
create table client(
	clientId int,
    clientName varchar(100) not null,
    clientAddress varchar(50),
    clientDOB date,
    clentGender char(1) check (clientGender in ('F','M','O')),
    clientPhone char(10),
    clientEmail varchar(50),
    clientSMS char(1) check (clientSMS in ('Y','N')),
    constraint client_pk primary key (clientId)
)engine innodb;

create table catEvent(
	catEventId int,
    catName varchar(50) default 'Birthday',
    catDescription varchar(100),
    constraint catEvent_pk primary key (catEventId)
)engine innodb;

create table Event(
	eventId int,
    eventDate date check (eventDate < '2-10-17'),
    eventName varchar(50),
    eventTheme varchar(50) default 'Celebration',
    eventDescription varchar(100),
    locationBooked char(1) check (locationBooked in ('Y','N')),
    Id_client int,
    Id_catevent int,
    constraint event_pk primary key (eventId),
    constraint client_fk foreign key (Id_client) references client(clientId),
    constraint catevent_fk foreign key (Id_catevent) references catEvent(catEventId)
)engine innodb;