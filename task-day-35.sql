CREATE DATABASE MovieDtails; 
CREATE TABLE  MovieDtails (
    ID int NOT NULL PRIMARY KEY,
    MovieName varchar(255) NOT NULL,
    Director varchar(255)
 
);
alter table MovieDtails Add Column Language varchar(255) ;
alter table MovieDtails ADD Column  Hero_ID int ;
alter table MovieDtails ADD Column  Villan_ID int ;
ALTER TABLE MovieDtails
ADD FOREIGN KEY (Hero_ID) REFERENCES ARTISTS(ARTIST_ID);
ALTER TABLE MovieDtails
ADD FOREIGN KEY (Villan_ID) REFERENCES ARTISTS(ARTIST_ID);
Insert into  MovieDtails values (1,'PS1','manirathnam');
Insert into  MovieDtails values (2,'Vikram','Lokesh');
update moviedtails set Language='Tamil', Hero_ID=1,Villan_ID=3 where  ID =1;
update moviedtails set Language='Tamil', Hero_ID=2,Villan_ID=4 where  ID =2;
select * from MovieDtails;
-- media table 
CREATE TABLE Media (
    ID int NOT NULL PRIMARY KEY,
   Name varchar(255) NOT NULL,
   Type varchar(255),
   size  varchar(255)
   );
   alter table Media add Column Movie_ID int ;
   ALTER TABLE Media
ADD FOREIGN KEY (Movie_ID) REFERENCES MovieDtails(ID);
update Media set Movie_ID=1 where  ID =1;
update Media set Movie_ID=1 where  ID =2;
Insert into  Media values (1,'Video1','Video','50Mb');
Insert into  Media values (2,'image1','manirathnam','2.5mb');
select * from Media;
-- Genre
CREATE TABLE  Genre (
    ID int NOT NULL PRIMARY KEY,
     GenreName varchar(255) NOT NULL
  );  
Insert into  Genre values (1,'Love');
Insert into  Genre values (2,'Action');
Insert into  Genre values (3,'Crime');
Insert into  Genre values (4,'Historical');
select * from Genre;
 -- Movie_Genre
 CREATE TABLE  Movie_Genre (
    ID int NOT NULL PRIMARY KEY,
    Movie_ID int,
    Genre_ID int,
    FOREIGN KEY ( Movie_ID) REFERENCES MovieDtails(ID),
     FOREIGN KEY ( Genre_ID) REFERENCES Genre(ID)
 );
 Insert into  Movie_Genre  values (1,1,2);
Insert into   Movie_Genre values (2,1,4);
Insert into   Movie_Genre values (3,2,2);
Insert into  Movie_Genre values (4,2,3);
select * from  Movie_Genre;

-- User 
CREATE TABLE Reviewver (
    ID int NOT NULL PRIMARY KEY,
   Name varchar(255) NOT NULL,
    Review varchar(255)
 );
 Insert into  Reviewver values (1,'XXX','GreatMovie');
Insert into  Reviewver  values (2,'Action','Action Needed');
select * from Reviewver;

-- REview Table 
CREATE TABLE Review (
    ID int NOT NULL PRIMARY KEY,
    Movie_ID int,
    Reviewver_ID int,
     FOREIGN KEY (Movie_ID) REFERENCES  MovieDtails (ID),
     FOREIGN KEY (Reviewver_ID) REFERENCES Reviewver(ID)
      
 );
 select * from Review; 
 Alter Table review ADD column Rating int;
 Insert into review  values (1,1,2,7);
Insert into  Review values (2,2,1,10);
-- Artist Table 
CREATE TABLE ARTISTS (
    ARTIST_ID int NOT NULL PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Experience varchar(255) not null,
    Average_Salary Double NOT NULL,
     CONTACT DOUBLE NOT NULL
    );
select * from ARTISTS;
alter table ARTISTS Modify column Average_Salary Varchar(255);
insert into ARTISTS Values (1,'Vikram','10years','2 crore','12345678') ;
insert into ARTISTS Values (2,'KamalHasan','20years','10 crore','12345678') ;
insert into ARTISTS Values (3,'Karthi','8 years','6 crore','12345678') ;
insert into ARTISTS Values (4,'VJS','7 years','5 crore','12345678') ;
 
 -- Artist Skills 
 CREATE TABLE Skill_Sets (
    Skill_ID int NOT NULL PRIMARY KEY,
    Skill varchar(255) NOT NULL
    );
    select * from Skill_Sets;
insert into Skill_Sets values (1,'Dancer');
insert into Skill_Sets values (2,'Fighter');
insert into Skill_Sets values (3,'Mimcry');
insert into Skill_Sets values (4,'Politician');
insert into Skill_Sets values (5,'Villanism');

-- Artist and Skill Set 
CREATE TABLE Skill_match (
    MATCH_ID int NOT NULL PRIMARY KEY,
   Artist_Id int,
   Skill_Id int,
   FOREIGN KEY (Artist_Id) REFERENCES  ARTISTS ( ARTIST_ID),
    FOREIGN KEY ( Skill_Id) REFERENCES Skill_Sets( Skill_ID)
   );
 select * from Skill_match;
insert into Skill_match values (1,1,2);
insert into Skill_match values (2,1,1);
insert into Skill_match values (3,2,3);
insert into Skill_match values (4,2,4);
insert into Skill_match values (5,3,1);
insert into Skill_match values (6,3,2);
insert into Skill_match values (7,4,5);


 