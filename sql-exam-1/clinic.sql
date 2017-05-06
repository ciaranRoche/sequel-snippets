create database bloodclinic;
use bloodclinic;
create table Donor(
	donorId int,
    donorName varchar(100) not null,
    donorAddress varchar(200),
    donorDOB date,
    donorGender char(1) check (donorGender in ('F','f','M','m')),
    donorPhone char(10),
    donorEmail varchar(50),
    donorSMS char(1) check (donorSMS in ('Y','y','N','n')),
    donorBloodGroup char(15) default 'O RhD Positive',
    constraint donor_pk primary key (donorId)
)engine innodb;

create table Clinic(
	clinicId int,
    clinicDate date check (clinicDate < '3-3-17'),
    clinicCenter varchar(100),
    regionServed varchar(50),
    supervisor varchar(100),
    constraint clinic_pk primary key (clinicID)
)engine innodb;

create table Donation(
	referenceNum int4,
    Id_Donor int,
    Id_Clinic int,
    success char(1) not null check (success in ('Y','y','N','n')),
    failureReason varchar(50),
    constraint donation_pk primary key (referenceNum),
    constraint donor_fk foreign key (Id_Donor) references Donor(donorId),
    constraint clinic_fk foreign key (Id_Clinic) references Clinic(clinicId)
)engine innodb;