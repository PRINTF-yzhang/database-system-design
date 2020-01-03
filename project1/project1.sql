/*Ying Zhang
Yujia Qiu*/
drop table Transplant;
drop table Organ;
drop table Patient;
drop table Surgeon;
drop table OP;
drop table PCP;
drop table Doctors;
drop sequence TransplantID_seq;
drop sequence DoctorsID_seq;
drop sequence PatientID_seq;
drop sequence OrganID_seq;


create table Doctors(
   DoctorsID number(5),
   firstName VARCHAR(25),
   lastName VARCHAR(25),
   Role varchar2(10),
   constraint Doctors_pk primary key (DoctorsID),
    constraint DoctorsID_un unique (DoctorsID, Role)
);

create sequence DoctorsID_seq
start with 100
increment by 5;


insert into Doctors values(DoctorsID_seq.nextval,'Daniel ', 'O Leary', 'PCP');
insert into Doctors values(DoctorsID_seq.nextval,'Joshua', 'Neal', 'PCP');
insert into Doctors values(DoctorsID_seq.nextval,'Benjamin', 'Pacheco Colon', 'PCP');
insert into Doctors values(DoctorsID_seq.nextval,'Kenneth', 'Perro', 'PCP');
insert into Doctors values(DoctorsID_seq.nextval,'Ronald', 'Peterson', 'PCP');
insert into Doctors values(DoctorsID_seq.nextval,'Sally', 'Phenix', 'OP');
insert into Doctors values(DoctorsID_seq.nextval,'Linda', 'Reynolds', 'OP');
insert into Doctors values(DoctorsID_seq.nextval,'Katherine', 'Whitney', 'OP');
insert into Doctors values(DoctorsID_seq.nextval,'Charles', 'Alberda','Surgeon');
insert into Doctors values(DoctorsID_seq.nextval,'Joan', 'Antonio','Surgeon');
insert into Doctors values(DoctorsID_seq.nextval,'Muriel', 'Bacon','Surgeon');
insert into Doctors values(DoctorsID_seq.nextval,'Angie', 'Bageris','Surgeon');
insert into Doctors values(DoctorsID_seq.nextval,'Dana', 'Bain','Surgeon');

select * from Doctors;

create table PCP(
   DoctorsID number(5),
   Specialty VARCHAR(25),
   Facility VARCHAR(25),
   Role varchar2(10) default 'PCP' not null,
   constraint PCP_pk primary key (DoctorsID),
	constraint PCPRoleVal check (Role in ('PCP')),
	constraint PCP_fk foreign key (DoctorsID, Role) references Doctors (DoctorsID, Role)
);

insert into PCP values(100,'Physiology','Ventilator','PCP');
insert into PCP values(105,'Medical Ethics','Treatment Car','PCP');
insert into PCP values(110,'Psychology','Care Car','PCP');
insert into PCP values(115,'Diagnostics','Medical Record Car','PCP');
insert into PCP values(120,'Pharmacology','Medicine Cabinet','PCP');

select * from PCP;

create table OP(
   DoctorsID number(5),
   Role varchar2(10) default 'OP' not null,
   organBank VARCHAR(25),
   type VARCHAR(25),
   constraint OP_pk primary key (DoctorsID),
	constraint OPRoleVal check (Role in ('OP')),
	constraint OP_fk foreign key (DoctorsID, Role) references Doctors (DoctorsID, Role)
);

insert into OP values(125,'OP', 'Phenix', 'Livers');
insert into OP values(130,'OP', 'Reynolds', 'Kidneys');
insert into OP values(135,'OP', 'Whitney', 'Kidneys');

select * from OP;

create table Surgeon(
   DoctorsID number(5),
   Role varchar2(10) default 'Surgeon' not null,
   IsBoardCertified char(1),
   constraint Surgeon_pk primary key (DoctorsID),
	constraint SurgeonRoleVal check (Role in ('Surgeon')),
	constraint Surgeon_fk foreign key (DoctorsID, Role) references Doctors (DoctorsID, Role),
   constraint SurgeonIDRoleVal check (IsBoardCertified in ('Y', 'N'))
);
insert into Surgeon values(140,'Surgeon', 'Y');
insert into Surgeon values(145,'Surgeon', 'Y');
insert into Surgeon values(150,'Surgeon', 'N');
insert into Surgeon values(155,'Surgeon', 'Y');
insert into Surgeon values(160,'Surgeon', 'N');

select * from Surgeon;

create table Patient (
   PatientID number(5),
   DoctorsID number(5),
   firstName varchar2(25),
   lastName varchar2(25),
   City varchar2(25),
   State char(2),
   birthDate DATE,
   BloodType VARCHAR2(2),
   CONSTRAINT Patient_PK Primary key (PatientID),
   CONSTRAINT Patient_PCP_FK Foreign Key (DoctorsID) REFERENCES PCP(DoctorsID)
);


create sequence PatientID_seq
start with 100
increment by 5;

insert into Patient values(PatientID_seq.nextval,100,'Penguin',' Group', 'Montgornery','AL','9-Nov-99', 'A');
insert into Patient values(PatientID_seq.nextval,105,'Bloomsbury','Dana','Juneau','AK','9-Nov-00','B');
insert into Patient values(PatientID_seq.nextval,110,'Greenleaf',' Book Group','Phoenix', 'AZ', '9-Nov-01','O');
insert into Patient values(PatientID_seq.nextval,115,'Wordsworth',' Editions','Little Rock', 'AR', '9-Nov-02','AB');
insert into Patient values(PatientID_seq.nextval,120,'Verlag',' Antje Kunstmann','Sacramento', 'CA','9-Nov-03', 'A');
insert into Patient values(PatientID_seq.nextval,100,'Ouroboros',' Press','Denver', 'CO', '9-Nov-04','B');
insert into Patient values(PatientID_seq.nextval,105,'Grup','62','Hartford', 'CT','9-Nov-05', 'O');
insert into Patient values(PatientID_seq.nextval,110,'Rhemalda','Publishing', 'Dover','DE','9-Nov-06', 'AB');
insert into Patient values(PatientID_seq.nextval,115,'Antonio',' Machado Libros','Tallahassee', 'FL','9-Nov-07', 'A');
insert into Patient values(PatientID_seq.nextval,120,'Simon',' and Schuster','Atlanta', 'GA','9-Nov-08', 'B');
insert into Patient values(PatientID_seq.nextval,100,'MIT',' Press','Honolulu', 'HI','9-Nov-09', 'O');
insert into Patient values(PatientID_seq.nextval,105,'Scholastic','Simon','Boise', 'ID','9-Nov-10', 'AB');
insert into Patient values(PatientID_seq.nextval,110,'Bernice',' Barry','Springfield', 'IL','9-Nov-11', 'A');
insert into Patient values(PatientID_seq.nextval,115,'Carrie',' Colby','Indianapolis', 'IN','9-Nov-12', 'B');
insert into Patient values(PatientID_seq.nextval,120,'Kathleen','Book','Des Moines', 'IA','9-Nov-13', 'O');
insert into Patient values(PatientID_seq.nextval,100,'Eugene',' Courtney', 'Topeka','KS','9-Nov-14', 'AB');
insert into Patient values(PatientID_seq.nextval,105,'Joseph',' Fortier','Frankfort', 'KY','9-Nov-15','A');
insert into Patient values(PatientID_seq.nextval,110,'Alice',' Lynn','Baton Rouge', 'LA','9-Nov-16', 'B');
insert into Patient values(PatientID_seq.nextval,115,'George',' Maloney','Augusta', 'ME', '9-Nov-17','O');
insert into Patient values(PatientID_seq.nextval,120,'Anthony',' Murgo Sr.', 'Annapolis','MD', '9-Nov-18','AB');

select * from Patient;

create table Organ (
   OrganID number(5),
   DoctorsID number(5) NOT Null,
   RemoveDate date,
   BloodType varchar2(2),
   CONSTRAINT Organ_UQ UNIQUE (OrganID),
   CONSTRAINT Organ_OP_FK Foreign Key (DoctorsID) REFERENCES OP(DoctorsID)
);

create sequence OrganID_seq
start with 100
increment by 5;

insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'AB');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'A');
insert into Organ values(OrganID_seq.nextval,135,'19-Sep-19', 'B');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'AB');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'A');
insert into Organ values(OrganID_seq.nextval,135,'19-Sep-19', 'B');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'O');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'AB');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'A');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'B');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'O');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'AB');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'A');
insert into Organ values(OrganID_seq.nextval,135,'19-Sep-19', 'B');
insert into Organ values(OrganID_seq.nextval,135,'19-Sep-19', 'O');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'AB');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'A');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'B');
insert into Organ values(OrganID_seq.nextval,135,'19-Sep-19', 'O');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'AB');
insert into Organ values(OrganID_seq.nextval,130,'19-Sep-19', 'A');
insert into Organ values(OrganID_seq.nextval,125,'19-Sep-19', 'B');
insert into Organ values(OrganID_seq.nextval,135,'19-Sep-19', 'O');

select * from Organ;

create table Transplant (
   TransplantID number(5),
   DoctorsID number(5) not NULL,
   PatientID number(5) not NULL,
   OrganID number(5) not NUll,
   transDate DATE,
   IsSuccessful char(1),
   Charge number(7,2),
   constraint Transplant_PK primary key (TransplantID),
   CONSTRAINT Transplant_Surgeon_FK Foreign Key (DoctorsID) REFERENCES Surgeon(DoctorsID),
   CONSTRAINT Transplant_Patient_FK Foreign Key (PatientID) REFERENCES Patient(PatientID),
   CONSTRAINT Transplant_Organ_FK Foreign Key (OrganID) REFERENCES Organ(OrganID),
   CONSTRAINT TransplantVal check (IsSuccessful in ('Y', 'N'))
);

create sequence TransplantID_seq
start with 100
increment by 5;

insert into Transplant values(TransplantID_seq.nextval,140,100,100,'21-Sep-19', 'Y',6500.75);
insert into Transplant values(TransplantID_seq.nextval,145,105,105,'21-Sep-19', 'N',5795.75);
insert into Transplant values(TransplantID_seq.nextval,155,110,110,'22-Sep-19', 'Y',442.75);
insert into Transplant values(TransplantID_seq.nextval,145,115,115,'22-Sep-19', 'N',5250.75);
insert into Transplant values(TransplantID_seq.nextval,145,120,120,'23-Sep-19', 'Y',7522.75);
insert into Transplant values(TransplantID_seq.nextval,150,125,125,'23-Sep-19', 'N',7068.75);
insert into Transplant values(TransplantID_seq.nextval,155,130,130,'24-Sep-19', 'Y',4923.75);
insert into Transplant values(TransplantID_seq.nextval,155,135,135,'24-Sep-19', 'N',3109.75);
insert into Transplant values(TransplantID_seq.nextval,150,140,140,'25-Sep-19', 'Y',7826.75);
insert into Transplant values(TransplantID_seq.nextval,155,145,145,'25-Sep-19', 'N',9679.75);
insert into Transplant values(TransplantID_seq.nextval,150,150,150,'26-Sep-19', 'Y',3451.75);
insert into Transplant values(TransplantID_seq.nextval,150,155,155,'26-Sep-19', 'N',3608.75);
insert into Transplant values(TransplantID_seq.nextval,150,160,160,'27-Sep-19', 'Y',9903.75);
insert into Transplant values(TransplantID_seq.nextval,145,165,165,'27-Sep-19', 'N',2307.75);
insert into Transplant values(TransplantID_seq.nextval,155,170,170,'28-Sep-19', 'Y',8404.75);
insert into Transplant values(TransplantID_seq.nextval,155,175,175,'28-Sep-19', 'N',9720.75);
insert into Transplant values(TransplantID_seq.nextval,150,180,180,'29-Sep-19', 'Y',4709.75);
insert into Transplant values(TransplantID_seq.nextval,150,185,185,'29-Sep-19', 'N',1826.75);
insert into Transplant values(TransplantID_seq.nextval,160,190,190,'30-Sep-19', 'Y',3581.75);
insert into Transplant values(TransplantID_seq.nextval,140,195,195,'30-Sep-19', 'N',7841.75);

select * from Transplant;

/*relational schema
Books(ISBN, title, publisherID)
Foreign key (Books.publisherID) references (Publishers.publisherID)

Doctor(DoctorsID,firstName,lastName,Role)

PCP(DoctorsID, Specialty,Facility, Role)
Foreign key (PCP.DoctorsID, PCP.Role) references (Doctors.DoctorsID, Doctors.Role)

OP(DoctorsID,Role,organBank,type)
Foreign key (OP.DoctorsID, OP.Role) references (Doctors.DoctorsID, Doctors.Role)

Surgeon(DoctorsID,Role,IsBoardCertified)
Foreign key (Surgeon.DoctorsID, Surgeon.Role) references (Doctors.DoctorsID, Doctors.Role)

Patient (PatientID,DoctorsID,firstName,lastName,City,State,birthDate,BloodType)
Foreign key (Patient.DoctorsID) references (Doctors.DoctorsID)

Organ (OrganID,DoctorsID,RemoveDate,BloodType)
Foreign key (Organ.DoctorsID) references (Doctors.DoctorsID)

Transplant (TransplantID,DoctorsID,PatientID,OrganID,transDate,IsSuccessful,Charge)
Foreign key (Transplant.DoctorsID) references (Surgeon.DoctorsID)
Foreign key (Transplant.PatientID) references (Patient.PatientID)
Foreign key (Transplant.OrganID) references (Organ.OrganID)*/