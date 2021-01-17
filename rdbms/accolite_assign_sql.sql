CREATE DATABASE cric;
USE cric;

SET SQL_SAFE_UPDATES = 0;


CREATE TABLE cric_batsman (
    PlayerId int,
    Player_name varchar(255),
    runs integer
);

insert into cric_batsman(PlayerId,Player_name,runs) values(1,'Virat',123);
insert into cric_batsman(PlayerId,Player_name,runs) values(2,'Rohit',13);
insert into cric_batsman(PlayerId,Player_name,runs) values(21,'steve',33);
insert into cric_batsman(PlayerId,Player_name,runs) values(13,'raina',63);
insert into cric_batsman(PlayerId,Player_name,runs) values(14,'sachin',11);
insert into cric_batsman(PlayerId,Player_name,runs) values(19,'jadeja',76);
insert into cric_batsman(PlayerId,Player_name,runs) values(21,'rahul',44);
insert into cric_batsman(PlayerId,Player_name,runs) values(3,'nehra',50);
insert into cric_batsman(PlayerId,Player_name,runs) values(7,'yuvi',37);

select Player_name,PlayerId,runs from cric_batsman order by runs desc limit 5;

CREATE TABLE cric_bowler (
    PlayerId int,
    Player_name varchar(255),
    wickets integer
);

insert into cric_bowler(PlayerId,Player_name,wickets) values(1,'Virat',34);
insert into cric_bowler(PlayerId,Player_name,wickets) values(12,'Rohit',12);
insert into cric_bowler(PlayerId,Player_name,wickets) values(13,'Nehra',62);
insert into cric_bowler(PlayerId,Player_name,wickets) values(2,'Bumrah',7);
insert into cric_bowler(PlayerId,Player_name,wickets) values(4,'saini',92);
insert into cric_bowler(PlayerId,Player_name,wickets) values(7,'yuvi',35);
insert into cric_bowler(PlayerId,Player_name,wickets) values(8,'siraj',37);
insert into cric_bowler(PlayerId,Player_name,wickets) values(19,'chahal',73);
insert into cric_bowler(PlayerId,Player_name,wickets) values(21,'chawla',88);
insert into cric_bowler(PlayerId,Player_name,wickets) values(15,'yadav',34);

select Player_name,PlayerId,wickets from cric_bowler order by wickets desc limit 5;


CREATE TABLE cric (
    TeamId int,
    Team_name varchar(255),
    runs integer,
    matches integer
);

insert into cric(TeamId,Team_name,runs,matches) values(1,'India',333,33);
insert into cric(TeamId,Team_name,runs,matches) values(2,'USA',444,2);
insert into cric(TeamId,Team_name,runs,matches) values(3,'AUS',334,7);
insert into cric(TeamId,Team_name,runs,matches) values(4,'PAK',34,3);
insert into cric(TeamId,Team_name,runs,matches) values(5,'NW',216,6);
insert into cric(TeamId,Team_name,runs,matches) values(6,'SA',343,7);
insert into cric(TeamId,Team_name,runs,matches) values(7,'ENG',100,10);



select Team_name,TeamId,(runs/matches) as avgruns from cric; 

CREATE TABLE new_tab1 (
    Player_name varchar(255),
    Player_score integer,
    Team_runs integer,
    matches integer
);

insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('Virat',79,100,10);
insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('Rohit',42,100,10);
insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('Nehra',51,100,10);
insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('Steve',72,216,36);
insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('Green',744,216,36);
insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('david',73,216,36);
insert into new_tab1(Player_name,Player_score,Team_runs,matches) values('Cook',7,1000,5);

select min(Team_runs/matches) into @a from new_tab1;
UPDATE new_tab1 SET Player_score = Player_score + 10 where (Team_runs/matches) in (@a);



CREATE TABLE Country1 (
    Country_Name varchar(255),
    score Integer
);

insert into Country1(Country,score) values('India',333);
insert into Country1(Country,score) values('India',1003);
insert into Country1(Country,score) values('India',104334);
insert into Country1(Country,score) values('UK',55);
insert into Country1(Country,score) values('NW',73);

CREATE PROCEDURE SelectCountry @Country nvarchar(30)
AS
SELECT Country_Name,MAX(score) FROM Country1 WHERE Country_Name = @Country
GO;

EXECUTE SelectCountry @Country = 'India';

