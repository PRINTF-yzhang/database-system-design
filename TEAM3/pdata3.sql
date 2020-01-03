/*Ying Zhang
Yujia Qiu
Team3*/

create sequence physicianID_seq
start with 3000
increment by 10;

insert into Doctor values(physicianID_seq.nextval,'PCP','Daniel ', 'O Leary');
insert into Doctor values(physicianID_seq.nextval,'PCP','Joshua', 'Neal');
insert into Doctor values(physicianID_seq.nextval,'PCP','Benjamin', 'Pacheco Colon');
insert into Doctor values(physicianID_seq.nextval,'PCP','Kenneth', 'Perro');
insert into Doctor values(physicianID_seq.nextval,'PCP','Ronald', 'Peterson');
insert into Doctor values(physicianID_seq.nextval,'OP','Sally', 'Phenix');
insert into Doctor values(physicianID_seq.nextval,'OP','Linda', 'Reynolds');
insert into Doctor values(physicianID_seq.nextval,'OP','Katherine', 'Whitney');
insert into Doctor values(physicianID_seq.nextval,'Surgeon','Charles', 'Alberda');
insert into Doctor values(physicianID_seq.nextval,'Surgeon','Joan', 'Antonio');
insert into Doctor values(physicianID_seq.nextval,'Surgeon','Muriel', 'Bacon');
insert into Doctor values(physicianID_seq.nextval,'Surgeon','Angie', 'Bageris');
insert into Doctor values(physicianID_seq.nextval,'Surgeon','Dana', 'Bain');



insert into OP values(3050,'OP', 'Livers','Phenix');
insert into OP values(3060,'OP','Kidneys', 'Reynolds');
insert into OP values(3070,'OP', 'Kidneys','Whitney');



insert into PCP values(3000,'PCP','Physiology','Ventilator');
insert into PCP values(3010,'PCP','Medical Ethics','Treatment Car');
insert into PCP values(3020,'PCP','Psychology','Care Car');
insert into PCP values(3030,'PCP','Diagnostics','Medical Record Car');
insert into PCP values(3040,'PCP','Pharmacology','Medicine Cabinet');





insert into Surgeon values(3080,'Surgeon', 'Y');
insert into Surgeon values(3090,'Surgeon', 'Y');
insert into Surgeon values(3100,'Surgeon', 'N');
insert into Surgeon values(3110,'Surgeon', 'Y');
insert into Surgeon values(3120,'Surgeon', 'N');




create sequence healthCareID_seq
start with 3000
increment by 10;

insert into Patient values(healthCareID_seq.nextval,'Penguin',' Group', 'Montgornery','AL','9-Nov-99', 'A',3000);
insert into Patient values(healthCareID_seq.nextval,'Bloomsbury','Dana','Juneau','AK','9-Nov-00','B',3010);
insert into Patient values(healthCareID_seq.nextval,'Greenleaf',' Book Group','Phoenix', 'AZ', '9-Nov-01','O',3020);
insert into Patient values(healthCareID_seq.nextval,'Wordsworth',' Editions','Little Rock', 'AR', '9-Nov-02','AB',3030);
insert into Patient values(healthCareID_seq.nextval,'Verlag',' Antje Kunstmann','Sacramento', 'CA','9-Nov-03', 'A',3040);
insert into Patient values(healthCareID_seq.nextval,'Ouroboros',' Press','Denver', 'CO', '9-Nov-04','B',3000);
insert into Patient values(healthCareID_seq.nextval,'Grup','62','Hartford', 'CT','9-Nov-05', 'O',3010);
insert into Patient values(healthCareID_seq.nextval,'Rhemalda','Publishing', 'Dover','DE','9-Nov-06', 'AB',3020);
insert into Patient values(healthCareID_seq.nextval,'Antonio',' Machado Libros','Tallahassee', 'FL','9-Nov-07', 'A',3030);
insert into Patient values(healthCareID_seq.nextval,'Simon',' and Schuster','Atlanta', 'GA','9-Nov-08', 'B',3040);
insert into Patient values(healthCareID_seq.nextval,'MIT',' Press','Honolulu', 'HI','9-Nov-09', 'O',3000);
insert into Patient values(healthCareID_seq.nextval,'Scholastic','Simon','Boise', 'ID','9-Nov-10', 'AB',3010);
insert into Patient values(healthCareID_seq.nextval,'Bernice',' Barry','Springfield', 'IL','9-Nov-11', 'A',3020);
insert into Patient values(healthCareID_seq.nextval,'Carrie',' Colby','Indianapolis', 'IN','9-Nov-12', 'B',3030);
insert into Patient values(healthCareID_seq.nextval,'Kathleen','Book','Des Moines', 'IA','9-Nov-13', 'O',3040);
insert into Patient values(healthCareID_seq.nextval,'Eugene',' Courtney', 'Topeka','KS','9-Nov-14', 'AB',3000);
insert into Patient values(healthCareID_seq.nextval,'Joseph',' Fortier','Frankfort', 'KY','9-Nov-15','A',3010);
insert into Patient values(healthCareID_seq.nextval,'Alice',' Lynn','Baton Rouge', 'LA','9-Nov-16', 'B',3020);
insert into Patient values(healthCareID_seq.nextval,'George',' Maloney','Augusta', 'ME', '9-Nov-17','O',3030);
insert into Patient values(healthCareID_seq.nextval,'Anthony',' Murgo Sr.', 'Annapolis','MD', '9-Nov-18','AB',3040);





insert into Organ values(1,3050,'AB','19-Sep-19',3000);
insert into Organ values(2,3060, 'A','19-Sep-19',3010);
insert into Organ values(3,3070, 'B','19-Sep-19',3020);
insert into Organ values(4,3050, 'AB','19-Sep-19',3030);
insert into Organ values(5,3060,'A','19-Sep-19',3040);
insert into Organ values(6,3070, 'B','19-Sep-19',3050);
insert into Organ values(7,3050,'O','19-Sep-19',3060);
insert into Organ values(8,3060,'AB','19-Sep-19',3070);
insert into Organ values(9,3070,'A','19-Sep-19',3080);
insert into Organ values(10,3050, 'B','19-Sep-19',3090);
insert into Organ values(11,3060,'O','19-Sep-19',3100);
insert into Organ values(12,3070,'AB','19-Sep-19',3110);
insert into Organ values(13,3050,'A','19-Sep-19',3120);
insert into Organ values(14,3060, 'B','19-Sep-19',3130);
insert into Organ values(15,3070, 'O','19-Sep-19',3140);
insert into Organ values(16,3050,'AB','19-Sep-19',3150);
insert into Organ values(17,3060,'A','19-Sep-19',3160);
insert into Organ values(18,3070,'B','19-Sep-19',3170);
insert into Organ values(19,3050,'O','19-Sep-19',3180);
insert into Organ values(20,3060,'AB','19-Sep-19',3190);




create sequence invoiceNumber_seq
start with 3000
increment by 10;

insert into Operation values(invoiceNumber_seq.nextval,'21-Sep-19', 'Y',6500.75,3080,3000);
insert into Operation values(invoiceNumber_seq.nextval,'21-Sep-19', 'N',5795.75,3090,3010);
insert into Operation values(invoiceNumber_seq.nextval,'22-Sep-19', 'Y',442.75,3100,3020);
insert into Operation values(invoiceNumber_seq.nextval,'22-Sep-19', 'N',5250.75,3110,3030);
insert into Operation values(invoiceNumber_seq.nextval,'23-Sep-19', 'Y',7522.75,3120,3040);
insert into Operation values(invoiceNumber_seq.nextval,'23-Sep-19', 'N',7068.75,3080,3050);
insert into Operation values(invoiceNumber_seq.nextval,'24-Sep-19', 'Y',4923.75,3090,3060);
insert into Operation values(invoiceNumber_seq.nextval,'24-Sep-19', 'N',3109.75,3100,3070);
insert into Operation values(invoiceNumber_seq.nextval,'25-Sep-19', 'Y',7826.75,3110,3080);
insert into Operation values(invoiceNumber_seq.nextval,'25-Sep-19', 'N',9679.75,3120,3090);
insert into Operation values(invoiceNumber_seq.nextval,'26-Sep-19', 'Y',3451.75,3080,3100);
insert into Operation values(invoiceNumber_seq.nextval,'26-Sep-19', 'N',3608.75,3090,3110);
insert into Operation values(invoiceNumber_seq.nextval,'27-Sep-19', 'Y',9903.75,3100,3120);
insert into Operation values(invoiceNumber_seq.nextval,'27-Sep-19', 'N',2307.75,3110,3130);
insert into Operation values(invoiceNumber_seq.nextval,'28-Sep-19', 'Y',8404.75,3120,3140);
insert into Operation values(invoiceNumber_seq.nextval,'28-Sep-19', 'N',9720.75,3080,3150);
insert into Operation values(invoiceNumber_seq.nextval,'29-Sep-19', 'Y',4709.75,3090,3160);
insert into Operation values(invoiceNumber_seq.nextval,'29-Sep-19', 'N',1826.75,3100,3170);
insert into Operation values(invoiceNumber_seq.nextval,'30-Sep-19', 'Y',3581.75,3110,3180);
insert into Operation values(invoiceNumber_seq.nextval,'30-Sep-19', 'N',7841.75,3120,3190);



insert into SurgeonPatient values(3080,3000);
insert into SurgeonPatient values(3090,3010);
insert into SurgeonPatient values(3100,3020);
insert into SurgeonPatient values(3110,3030);
insert into SurgeonPatient values(3120,3040);
insert into SurgeonPatient values(3080,3050);
insert into SurgeonPatient values(3090,3060);
insert into SurgeonPatient values(3100,3070);
insert into SurgeonPatient values(3110,3080);
insert into SurgeonPatient values(3120,3090);
insert into SurgeonPatient values(3080,3100);
insert into SurgeonPatient values(3090,3110);
insert into SurgeonPatient values(3100,3120);
insert into SurgeonPatient values(3110,3130);
insert into SurgeonPatient values(3120,3140);
insert into SurgeonPatient values(3080,3150);
insert into SurgeonPatient values(3090,3160);
insert into SurgeonPatient values(3100,3170);
insert into SurgeonPatient values(3110,3180);
insert into SurgeonPatient values(3120,3190);



