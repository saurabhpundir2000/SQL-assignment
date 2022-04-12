create database 8_build_schema;
use 8_build_schema;

create table physician(employeeID int primary key,name text,position text,ssn int);

create table department(departmentID int primary key, name text, head int,
		foreign key(head) references physician(employeeID));
        
create table affiliated_with(physician int,department int,primaryaffiliation boolean,
	primary key(physician,department),foreign key(physician) references physician(employeeID),
    foreign key(department) references department(departmentID));
    
create table procedures(code int primary key,name text,cost real);

create table trained_in(physician int,treatment int,certificationDate datetime,certificationExpires datetime,
		primary key(physician,treatment),
        foreign key(physician) references physician(employeeID),
    foreign key(treatment) references procedures(code));
    
create table patient(ssn int primary key, name text,address text,phone text,InsuranceId int,PCP int,
	foreign key(PCP) references physician(employeeID));
    
create table nurse(EmployeeID int primary key,name text,position text,Registered boolean,ssn int);

create table Appointment(AppointmentID int primary key,patient int,PrepNurse int,Physician int,start datetime,end datetime,examinationRoom text,
		foreign key(patient) references patient(ssn),
    foreign key(prepNurse) references nurse(EmployeeID),
    foreign key(physician) references physician(employeeID));
    
create table medication(code int primary key,Name text,Brand text,Description text);
create table Prescribes(physician int,patient int,medication int,date datetime,Appointment int,Dose text,
			primary key(physician,patient,medication,Date),
            foreign key(physician) references physician(employeeID),
            foreign key(patient) references patient(ssn),
            foreign key(medication) references medication(code),
            foreign key(Appointment) references Appointment(AppointmentID));
            
create table Block(floor int,code int, primary key(floor,code));

create table on_call(nurse int ,BlockFloor int,Blockcode int,start datetime,end datetime,
				foreign key(BlockFloor,Blockcode) references Block(Floor,code),
                foreign key(nurse) references Nurse(employeeID));
create table room(RoomNumber int primary key,type text,BlockFloor int,BlockCode int,Unavailable boolean,
			foreign key(BlockFloor,Blockcode) references Block(Floor,code));
            
create table stay(StayID int primary key, Patient int,room int,strat datetime,end datetime,
		foreign key(patient) references patient(ssn),
        foreign key(room) references room(roomnumber));

create table undergoes(Patient int,procedures int,stay int,date datetime,physician int,Assisting_nurse int,
	primary key(Patient,Procedures,Stay,Date),
    foreign key(patient) references patient(ssn),
    foreign key(physician) references physician(employeeID),
    foreign key(procedures) references procedures(code),
    foreign key(Stay) references stay(StayID));
 
 /*inserted elements
INSERT INTO Physician VALUES(1,'John Dorian','Staff Internist',111111111);
INSERT INTO Physician VALUES(2,'Elliot Reid','Attending Physician',222222222);
INSERT INTO Physician VALUES(3,'Christopher Turk','Surgical Attending Physician',333333333);
INSERT INTO Physician VALUES(4,'Percival Cox','Senior Attending Physician',444444444);
INSERT INTO Physician VALUES(5,'Bob Kelso','Head Chief of Medicine',555555555);
INSERT INTO Physician VALUES(6,'Todd Quinlan','Surgical Attending Physician',666666666);
INSERT INTO Physician VALUES(7,'John Wen','Surgical Attending Physician',777777777);
INSERT INTO Physician VALUES(8,'Keith Dudemeister','MD Resident',888888888);
INSERT INTO Physician VALUES(9,'Molly Clock','Attending Psychiatrist',999999999);

INSERT INTO Department VALUES(1,'General Medicine',4);
INSERT INTO Department VALUES(2,'Surgery',7);
INSERT INTO Department VALUES(3,'Psychiatry',9);

INSERT INTO Affiliated_With VALUES(1,1,1);
INSERT INTO Affiliated_With VALUES(2,1,1);
INSERT INTO Affiliated_With VALUES(3,1,0);
INSERT INTO Affiliated_With VALUES(3,2,1);
INSERT INTO Affiliated_With VALUES(4,1,1);
INSERT INTO Affiliated_With VALUES(5,1,1);
INSERT INTO Affiliated_With VALUES(6,2,1);
INSERT INTO Affiliated_With VALUES(7,1,0);
INSERT INTO Affiliated_With VALUES(7,2,1);
INSERT INTO Affiliated_With VALUES(8,1,1);
INSERT INTO Affiliated_With VALUES(9,3,1);

INSERT INTO Procedures VALUES(1,'Reverse Rhinopodoplasty',1500.0);
INSERT INTO Procedures VALUES(2,'Obtuse Pyloric Recombobulation',3750.0);
INSERT INTO Procedures VALUES(3,'Folded Demiophtalmectomy',4500.0);
INSERT INTO Procedures VALUES(4,'Complete Walletectomy',10000.0);
INSERT INTO Procedures VALUES(5,'Obfuscated Dermogastrotomy',4899.0);
INSERT INTO Procedures VALUES(6,'Reversible Pancreomyoplasty',5600.0);
INSERT INTO Procedures VALUES(7,'Follicular Demiectomy',25.0);

INSERT INTO Patient VALUES(100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1);
INSERT INTO Patient VALUES(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2);
INSERT INTO Patient VALUES(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2);
INSERT INTO Patient VALUES(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);

INSERT INTO Nurse VALUES(101,'Carla Espinosa','Head Nurse',1,111111110);
INSERT INTO Nurse VALUES(102,'Laverne Roberts','Nurse',1,222222220);
INSERT INTO Nurse VALUES(103,'Paul Flowers','Nurse',0,333333330);

INSERT INTO Appointment VALUES(13216584,100000001,101,1,'2008-04-24 10:00','2008-04-24 11:00','A');
INSERT INTO Appointment VALUES(26548913,100000002,101,2,'2008-04-24 10:00','2008-04-24 11:00','B');
INSERT INTO Appointment VALUES(36549879,100000001,102,1,'2008-04-25 10:00','2008-04-25 11:00','A');
INSERT INTO Appointment VALUES(46846589,100000004,103,4,'2008-04-25 10:00','2008-04-25 11:00','B');
INSERT INTO Appointment VALUES(59871321,100000004,NULL,4,'2008-04-26 10:00','2008-04-26 11:00','C');
INSERT INTO Appointment VALUES(69879231,100000003,103,2,'2008-04-26 11:00','2008-04-26 12:00','C');
INSERT INTO Appointment VALUES(76983231,100000001,NULL,3,'2008-04-26 12:00','2008-04-26 13:00','C');
INSERT INTO Appointment VALUES(86213939,100000004,102,9,'2008-04-27 10:00','2008-04-21 11:00','A');
INSERT INTO Appointment VALUES(93216548,100000002,101,2,'2008-04-27 10:00','2008-04-27 11:00','B');

INSERT INTO Medication VALUES(1,'Procrastin-X','X','N/A');
INSERT INTO Medication VALUES(2,'Thesisin','Foo Labs','N/A');
INSERT INTO Medication VALUES(3,'Awakin','Bar Laboratories','N/A');
INSERT INTO Medication VALUES(4,'Crescavitin','Baz Industries','N/A');
INSERT INTO Medication VALUES(5,'Melioraurin','Snafu Pharmaceuticals','N/A');

INSERT INTO Prescribes VALUES(1,100000001,1,'2008-04-24 10:47',13216584,'5');
INSERT INTO Prescribes VALUES(9,100000004,2,'2008-04-27 10:53',86213939,'10');
INSERT INTO Prescribes VALUES(9,100000004,2,'2008-04-30 16:53',NULL,'5');

INSERT INTO Block VALUES(1,1);
INSERT INTO Block VALUES(1,2);
INSERT INTO Block VALUES(1,3);
INSERT INTO Block VALUES(2,1);
INSERT INTO Block VALUES(2,2);
INSERT INTO Block VALUES(2,3);
INSERT INTO Block VALUES(3,1);
INSERT INTO Block VALUES(3,2);
INSERT INTO Block VALUES(3,3);
INSERT INTO Block VALUES(4,1);
INSERT INTO Block VALUES(4,2);
INSERT INTO Block VALUES(4,3);

INSERT INTO Room VALUES(101,'Single',1,1,0);
INSERT INTO Room VALUES(102,'Single',1,1,0);
INSERT INTO Room VALUES(103,'Single',1,1,0);
INSERT INTO Room VALUES(111,'Single',1,2,0);
INSERT INTO Room VALUES(112,'Single',1,2,1);
INSERT INTO Room VALUES(113,'Single',1,2,0);
INSERT INTO Room VALUES(121,'Single',1,3,0);
INSERT INTO Room VALUES(122,'Single',1,3,0);
INSERT INTO Room VALUES(123,'Single',1,3,0);
INSERT INTO Room VALUES(201,'Single',2,1,1);
INSERT INTO Room VALUES(202,'Single',2,1,0);
INSERT INTO Room VALUES(203,'Single',2,1,0);
INSERT INTO Room VALUES(211,'Single',2,2,0);
INSERT INTO Room VALUES(212,'Single',2,2,0);
INSERT INTO Room VALUES(213,'Single',2,2,1);
INSERT INTO Room VALUES(221,'Single',2,3,0);
INSERT INTO Room VALUES(222,'Single',2,3,0);
INSERT INTO Room VALUES(223,'Single',2,3,0);
INSERT INTO Room VALUES(301,'Single',3,1,0);
INSERT INTO Room VALUES(302,'Single',3,1,1);
INSERT INTO Room VALUES(303,'Single',3,1,0);
INSERT INTO Room VALUES(311,'Single',3,2,0);
INSERT INTO Room VALUES(312,'Single',3,2,0);
INSERT INTO Room VALUES(313,'Single',3,2,0);
INSERT INTO Room VALUES(321,'Single',3,3,1);
INSERT INTO Room VALUES(322,'Single',3,3,0);
INSERT INTO Room VALUES(323,'Single',3,3,0);
INSERT INTO Room VALUES(401,'Single',4,1,0);
INSERT INTO Room VALUES(402,'Single',4,1,1);
INSERT INTO Room VALUES(403,'Single',4,1,0);
INSERT INTO Room VALUES(411,'Single',4,2,0);
INSERT INTO Room VALUES(412,'Single',4,2,0);
INSERT INTO Room VALUES(413,'Single',4,2,0);
INSERT INTO Room VALUES(421,'Single',4,3,1);
INSERT INTO Room VALUES(422,'Single',4,3,0);
INSERT INTO Room VALUES(423,'Single',4,3,0);

INSERT INTO On_Call VALUES(101,1,1,'2008-11-04 11:00','2008-11-04 19:00');
INSERT INTO On_Call VALUES(101,1,2,'2008-11-04 11:00','2008-11-04 19:00');
INSERT INTO On_Call VALUES(102,1,3,'2008-11-04 11:00','2008-11-04 19:00');
INSERT INTO On_Call VALUES(103,1,1,'2008-11-04 19:00','2008-11-05 03:00');
INSERT INTO On_Call VALUES(103,1,2,'2008-11-04 19:00','2008-11-05 03:00');
INSERT INTO On_Call VALUES(103,1,3,'2008-11-04 19:00','2008-11-05 03:00');

INSERT INTO Stay VALUES(3215,100000001,111,'2008-05-01','2008-05-04');
INSERT INTO Stay VALUES(3216,100000003,123,'2008-05-03','2008-05-14');
INSERT INTO Stay VALUES(3217,100000004,112,'2008-05-02','2008-05-03');

INSERT INTO Undergoes VALUES(100000001,6,3215,'2008-05-02',3,101);
INSERT INTO Undergoes VALUES(100000001,2,3215,'2008-05-03',7,101);
INSERT INTO Undergoes VALUES(100000004,1,3217,'2008-05-07',3,102);
INSERT INTO Undergoes VALUES(100000004,5,3217,'2008-05-09',6,NULL);
INSERT INTO Undergoes VALUES(100000001,7,3217,'2008-05-10',7,101);
INSERT INTO Undergoes VALUES(100000004,4,3217,'2008-05-13',3,103);

INSERT INTO Trained_In VALUES(3,1,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(3,2,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(3,5,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(3,6,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(3,7,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(6,2,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(6,5,'2007-01-01','2007-12-31');
INSERT INTO Trained_In VALUES(6,6,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,1,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,2,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,3,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,4,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,5,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,6,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(7,7,'2008-01-01','2008-12-31');
*/

select name from physician where employeeid in(select physician from undergoes where not
			exists(select * from trained_in where treatment=procedures and physician=undergoes.physician));
            
select p.name as physician, pr.name as procedures, u.date, pt.name as patient 
  from physician p, undergoes u, patient pt, procedures pr
  where u.patient = pt.ssn and u.procedures = pr.code and u.physician = p.employeeid
    and not exists (select * from trained_in t where t.treatment = u.procedures and t.physician = u.physician);
              
select name from physician where employeeid in 
       (select physician from undergoes u where 
         date > (select certificationexpires from trained_in t where t.physician = u.physician and t.treatment = u.procedures));
  
  select p.name as physician, pr.name as procedures, u.date, pt.name as patient, t.certificationexpires
  from physician p, undergoes u, patient pt, procedures pr, trained_in t
  where u.patient = pt.ssn and u.procedures = pr.code and u.physician = p.employeeid and pr.code = t.treatment
    and p.employeeid = t.physician and u.date > t.certificationexpires;
    
  
select pt.name as patient, ph.name as physician, n.name as nurse, a.start, a.end, a.examinationroom, phpcp.name as pcp
  from patient pt, physician ph, physician phpcp, appointment a left join nurse n on a.prepnurse = n.employeeid
 where a.patient = pt.ssn and pt.pcp = phpcp.employeeid and a.physician = ph.employeeid and a.physician!= pt.pcp;
   
   select * from undergoes where patient<>(select patient from Stay where undergoes.stay=stay.stayId);

select n.name from nurse n where employeeid in(select oc.nurse from on_call oc, room r
      where oc.blockcode = r.blockcode and oc.blockfloor = r.blockfloor and r.roomnumber = 123);
      

select examinationroom, count(appointmentID) as number from appointment group by examinationroom;




   

    
    


               
	


            
