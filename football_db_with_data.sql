# Authors: Matthew Olker, Spencer Peters, Chad Sigmon, Rahul
# Class: CSC3210


CREATE TABLE `divisions` (
	DIV_CODE int(11) NOT NULL UNIQUE,
	DIV_NAME varchar(40) NOT NULL,
	PRIMARY KEY(DIV_CODE)
	);


DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
	TEAM_CODE int(11) NOT NULL UNIQUE,
	DIV_CODE int(11) NOT NULL,
	TEAM_NAME varchar(25) NOT NULL,
	TEAM_STATE char(2) NOT NULL,
	TEAM_CITY varchar(20) NOT NULL,
	TEAM_WINS int(3) NOT NULL,
	TEAM_LOSSES int(3) NOT NULL,
	TEAM_TIES int(3) NOT NULL,
	TEAM_SALARY int(16) NOT NULL,
	PRIMARY KEY(TEAM_CODE),
	FOREIGN KEY(DIV_CODE) REFERENCES `divisions` (DIV_CODE) ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
	SCHED_CODE int(11) NOT NULL UNIQUE,
	TEAM_CODE int(11) NOT NULL,
	HOME_TEAM varchar(25),
	AWAY_TEAM varchar(25),
	PRIMARY KEY(SCHED_CODE),
	FOREIGN KEY(TEAM_CODE) REFERENCES `teams` (TEAM_CODE) ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `sponsors`;

CREATE TABLE `sponsors` (
	SPON_CODE int(11) NOT NULL UNIQUE,
	TEAM_CODE int(11) NOT NULL,
	SPON_NAME varchar(25) NOT NULL,
	SPON_STARTDATE date NOT NULL,
	SPON_ENDDATE date,
	SPON_RANK int(3) NOT NULL,
	PRIMARY KEY(SPON_CODE),
	FOREIGN KEY(TEAM_CODE) REFERENCES `teams` (TEAM_CODE) ON UPDATE CASCADE
);



DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
	MEMBER_NUM int(11) NOT NULL UNIQUE,
	TEAM_CODE int(11) NOT NULL,
	MEMBER_FNAME varchar(25) NOT NULL,
	MEMBER_LNAME varchar(25) NOT NULL,
	MEMBER_ADDRESS varchar(25) NOT NULL,
	MEMBER_STATE varchar(2) NOT NULL,
	MEMBER_PHONE varchar(11) NOT NULL,
	PRIMARY KEY(MEMBER_NUM),
	FOREIGN KEY(TEAM_CODE) REFERENCES `teams` (TEAM_CODE) ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
	MEMBER_NUM int(11) NOT NULL REFERENCES `members`,
	COACH_REPORTSTO int(11),
	COACH_ROLE varchar(20) NOT NULL,
	PRIMARY KEY(MEMBER_NUM),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `members` (MEMBER_NUM)
);


DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
	MEMBER_NUM int(11) NOT NULL UNIQUE REFERENCES `members`,
	PLAYER_DOB DATE NOT NULL,
	PLAYER_HEIGHT int(3) NOT NULL,
	PLAYER_WEIGHT int(3) NOT NULL,
	PLAYER_COLLEGE varchar(40) NOT NULL,
	PLAYER_POSITION varchar(40) NOT NULL,
	PLAYER_NUM int(3) NOT NULL,
	PLAYER_TERM int(2) NOT NULL,
	PRIMARY KEY(MEMBER_NUM),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `members` (MEMBER_NUM)
);



DROP TABLE IF EXISTS `owners`;

CREATE TABLE `owners` (
	MEMBER_NUM int(11) NOT NULL UNIQUE REFERENCES `members`,
	OWNER_HIREDATE date NOT NULL,
	OWNER_STARTDATE date NOT NULL,
	OWNER_BUYPRICE int(12) NOT NULL, 
	OWNER_TEAMNAME varchar(25) NOT NULL,
	PRIMARY KEY(MEMBER_NUM),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `members` (MEMBER_NUM)
);



DROP TABLE IF EXISTS `statistics`;

CREATE TABLE `statistics` (
	STAT_CODE int(11) NOT NULL UNIQUE,
	MEMBER_NUM int(3) NOT NULL REFERENCES `players`,
	STAT_RECEIVINGYD int(4),
	STAT_RUSHINGYD int(4),
	STAT_TDS int(3),
	STAT_TACKLES int(3),
	STAT_SACKS int(3),
	STAT_PASSYD int(4),
	STAT_QBR int(3),
	PRIMARY KEY(STAT_CODE),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `players` (MEMBER_NUM)
);

 # Insert Divisions Data
insert into divisions (DIV_CODE, DIV_NAME) values (1, 'NFC East');
insert into divisions (DIV_CODE, DIV_NAME) values (2, 'NFC North');
insert into divisions (DIV_CODE, DIV_NAME) values (3, 'NFC West');
insert into divisions (DIV_CODE, DIV_NAME) values (4, 'NFC South');
insert into divisions (DIV_CODE, DIV_NAME) values (5, 'AFC South');
insert into divisions (DIV_CODE, DIV_NAME) values (6, 'AFC North');
insert into divisions (DIV_CODE, DIV_NAME) values (7, 'AFC East');
insert into divisions (DIV_CODE, DIV_NAME) values (8, 'AFC West');

 # Insert Teams Data
 insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (10, 1, 'Patriots', 'MA', 'Foxboro', 182, 493, 46, 5826209);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (11, 2, 'Ravens', 'MD', 'Baltimore', 149, 409, 97, 3183940);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (12, 3, 'Chargers', 'CA', 'San Diego', 87, 403, 76, 4195865);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (13, 4, 'Jaguars', 'FL', 'Jacksonville', 337, 182, 71, 14935361);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (14, 5, 'Saints', 'LA', 'New Orleans', 177, 24, 58, 7110920);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (15, 6, 'Packers', 'WI', 'Green Bay', 377, 256, 67, 10549951);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (16, 7, 'Cowboys', 'TX', 'Dallas', 367, 364, 83, 13890279);
insert into teams (TEAM_CODE, DIV_CODE, TEAM_NAME, TEAM_STATE, TEAM_CITY, TEAM_WINS, TEAM_LOSSES, TEAM_TIES, TEAM_SALARY) values (17, 8, 'Seahawks', 'WA', 'Seattle', 117, 356, 53, 14080903);

 # Insert Schedules Data
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (1, 15, 'Seahawks', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (2, 17, 'Saints', 'Chargers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (3, 15, 'Saints', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (4, 16, 'Packers', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (5, 10, 'Seahawks', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (6, 15, 'Jaguars', 'Seahawks');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (7, 10, 'Cowboys', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (8, 15, 'Jaguars', 'Saints');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (9, 12, 'Saints', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (10, 13, 'Patriots', 'Seahawks');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (11, 14, 'Ravens', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (12, 10, 'Cowboys', 'Packers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (13, 17, 'Cowboys', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (14, 15, 'Saints', 'Ravens');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (15, 13, 'Cowboys', 'Jaguars');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (16, 13, 'Patriots', 'Packers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (17, 12, 'Saints', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (18, 17, 'Saints', 'Packers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (19, 10, 'Packers', 'Ravens');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (20, 16, 'Saints', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (21, 17, 'Chargers', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (22, 14, 'Cowboys', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (23, 16, 'Chargers', 'Saints');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (24, 16, 'Saints', 'Packers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (25, 14, 'Saints', 'Chargers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (26, 17, 'Jaguars', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (27, 11, 'Chargers', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (28, 16, 'Packers', 'Ravens');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (29, 17, 'Packers', 'Jaguars');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (30, 10, 'Saints', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (31, 11, 'Packers', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (32, 12, 'Packers', 'Chargers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (33, 12, 'Seahawks', 'Ravens');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (34, 17, 'Jaguars', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (35, 14, 'Packers', 'Jaguars');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (36, 17, 'Jaguars', 'Ravens');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (37, 10, 'Patriots', 'Saints');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (38, 11, 'Jaguars', 'Ravens');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (39, 11, 'Seahawks', 'Jaguars');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (40, 13, 'Saints', 'Seahawks');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (41, 11, 'Cowboys', 'Packers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (42, 17, 'Seahawks', 'Cowboys');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (43, 12, 'Packers', 'Seahawks');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (44, 16, 'Ravens', 'Chargers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (45, 10, 'Cowboys', 'Saints');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (46, 13, 'Jaguars', 'Saints');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (47, 13, 'Patriots', 'Jaguars');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (48, 11, 'Saints', 'Packers');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (49, 10, 'Packers', 'Patriots');
insert into schedules (SCHED_CODE, TEAM_CODE, HOME_TEAM, AWAY_TEAM) values (50, 17, 'Ravens', 'Jaguars');

 # Insert Sponsors Data
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (1, 11, 'Stamm, Reichel and Cole', '2009-09-07', '2019-03-07', 3);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (2, 17, 'Berge Group', '2005-11-02', '2019-01-21', 15);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (3, 15, 'Adams-Schowalter', '2018-03-26', '2019-03-14', 17);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (4, 12, 'Beier LLC', '2003-02-12', '2019-02-15', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (5, 11, 'McGlynn Group', '2009-10-11', '2019-02-05', 13);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (6, 12, 'Towne, Gutmann and Harvey', '2002-08-07', '2019-02-20', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (7, 11, 'Breitenberg and Sons', '2008-09-10', '2019-01-16', 13);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (8, 11, 'Hilll, Orn and Hilll', '2012-11-01', '2019-01-29', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (9, 12, 'Cassin, Reichert and Prohaska', '2015-08-10', '2019-03-23', 9);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (10, 15, 'Hermiston-Rosenbaum', '2002-03-18', '2019-01-22', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (11, 14, 'Rohan-Larson', '2009-10-08', '2019-02-13', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (12, 10, 'Bruen, Ziemann and Strosin', '2015-01-08', '2019-04-19', 17);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (13, 14, 'Wilderman and Sons', '2008-10-15', '2019-03-30', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (14, 14, 'Cronin-Anderson', '2003-07-02', '2019-02-08', 14);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (15, 15, 'Shields-Gorczany', '2016-05-22', '2019-04-04', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (16, 13, 'Hagenes-Lang', '2000-10-21', '2019-04-03', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (17, 16, 'Smith-Wolff', '2014-10-31', '2019-03-09', 20);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (18, 14, 'Prohaska-O''Hara', '2012-09-23', '2019-01-03', 18);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (19, 11, 'Nitzsche LLC', '2008-11-25', '2019-02-08', 14);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (20, 13, 'Wolff, Parker and Larson', '2011-07-13', '2019-03-18', 20);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (21, 17, 'Ratke Group', '2005-07-30', '2019-02-23', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (22, 14, 'Greenholt-Bechtelar', '2013-11-01', '2019-04-04', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (23, 10, 'Hickle LLC', '2008-08-19', '2019-03-09', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (24, 17, 'Bauch, Roberts and Harber', '2012-11-01', '2019-03-13', 20);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (25, 17, 'King, Wyman and Rath', '2008-09-22', '2019-03-11', 16);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (26, 14, 'Murray, VonRueden and Spinka', '2014-07-02', '2019-04-08', 8);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (27, 11, 'Kling-Reynolds', '2006-06-30', '2019-02-01', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (28, 15, 'Mraz Inc', '2015-03-27', '2019-01-13', 9);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (29, 13, 'Sipes, Marquardt and Volkman', '2003-02-19', '2019-04-19', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (30, 11, 'Cummings, Jaskolski and Kessler', '2001-11-21', '2019-04-13', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (31, 10, 'Heller-Auer', '2018-08-20', '2019-04-20', 13);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (32, 10, 'Boyer-Kirlin', '2018-03-11', '2019-01-17', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (33, 15, 'Haley, Cormier and Price', '2016-05-14', '2019-02-18', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (34, 13, 'Kunde, Herzog and Reynolds', '2014-06-05', '2019-02-05', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (35, 11, 'Bahringer-Sanford', '2011-06-01', '2019-01-08', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (36, 16, 'Hyatt-Kuhic', '2016-05-22', '2019-02-28', 19);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (37, 16, 'Johns-Wehner', '2011-10-16', '2019-01-11', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (38, 10, 'Prosacco-Casper', '2013-04-04', '2019-04-19', 17);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (39, 10, 'D''Amore, Mayer and Heidenreich', '2002-01-03', '2019-04-16', 16);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (40, 12, 'Wehner, Hettinger and Johns', '2000-10-30', '2019-03-17', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (41, 10, 'Ernser-Dach', '2001-05-28', '2019-03-29', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (42, 13, 'Heaney, Casper and Anderson', '2000-07-17', '2019-01-22', 18);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (43, 16, 'Buckridge, Douglas and Balistreri', '2017-02-04', '2019-03-16', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (44, 14, 'Mante, Thiel and Becker', '2008-09-06', '2019-01-15', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (45, 17, 'Emmerich-Lehner', '2014-11-20', '2019-04-24', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (46, 10, 'Rogahn, Nienow and Stokes', '2001-07-01', '2019-04-09', 13);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (47, 13, 'Quitzon, Breitenberg and Hyatt', '2002-12-21', '2019-02-07', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (48, 10, 'Greenholt-Marks', '2012-03-07', '2019-01-05', 5);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (49, 15, 'Littel and Sons', '2007-01-08', '2019-01-28', 12);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (50, 14, 'Wunsch LLC', '2009-01-07', '2019-03-16', 9);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (51, 16, 'Carroll and Sons', '2015-12-10', '2019-03-06', 12);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (52, 14, 'Koepp, Moen and Fahey', '2012-09-07', '2019-02-27', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (53, 14, 'Graham, Rodriguez and Hilpert', '2009-06-24', '2019-02-09', 9);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (54, 12, 'Bruen, Bailey and Morar', '2001-11-26', '2019-02-21', 16);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (55, 13, 'Abernathy, Jaskolski and Terry', '2008-03-25', '2019-04-23', 1);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (56, 15, 'Kihn-Bode', '2008-07-28', '2019-02-15', 14);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (57, 13, 'Cummings and Sons', '2007-02-27', '2019-04-04', 3);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (58, 15, 'Ortiz Group', '2016-01-04', '2019-04-07', 18);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (59, 10, 'Cartwright-Bosco', '2002-10-21', '2019-04-28', 14);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (60, 11, 'Klein Group', '2018-02-13', '2019-01-28', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (61, 16, 'Borer-Mertz', '2018-06-09', '2019-01-26', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (62, 14, 'Donnelly, Schamberger and Volkman', '2010-03-15', '2019-03-15', 16);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (63, 11, 'Gislason-White', '2014-07-26', '2019-02-11', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (64, 10, 'Rohan-Jakubowski', '2003-03-01', '2019-03-21', 18);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (65, 10, 'Lind-Douglas', '2011-03-25', '2019-01-19', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (66, 10, 'Heidenreich Inc', '2006-05-22', '2019-02-01', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (67, 17, 'Volkman LLC', '2010-02-26', '2019-04-21', 16);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (68, 13, 'Witting LLC', '2007-05-25', '2019-03-13', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (69, 13, 'Sauer-Schiller', '2009-08-12', '2019-01-29', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (70, 16, 'Huel-Yost', '2014-04-03', '2019-02-24', 12);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (71, 16, 'Crona, McCullough and Barrows', '2007-10-16', '2019-02-25', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (72, 15, 'Gusikowski, Rosenbaum and Harber', '2003-01-24', '2019-04-28', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (73, 11, 'Padberg, Jakubowski and Hessel', '2000-08-29', '2019-01-28', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (74, 16, 'Skiles Group', '2018-02-22', '2019-02-01', 15);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (75, 12, 'Rutherford, Ferry and Pfannerstill', '2015-08-06', '2019-02-07', 14);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (76, 11, 'Yundt, Bernhard and Mann', '2010-02-17', '2019-01-21', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (77, 16, 'Zemlak-Nitzsche', '2000-01-30', '2019-02-18', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (78, 10, 'Schuster-Greenfelder', '2002-02-01', '2019-01-21', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (79, 16, 'Upton, Schimmel and Lockman', '2012-06-12', '2019-04-16', 19);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (80, 12, 'Fadel-Hahn', '2018-01-08', '2019-01-24', 2);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (81, 15, 'Bailey, Wiegand and Harber', '2007-06-18', '2019-03-06', 18);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (82, 11, 'Rath-Lang', '2015-06-30', '2019-03-18', 16);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (83, 17, 'Gottlieb, Mills and Conroy', '2011-01-19', '2019-04-07', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (84, 17, 'Gleichner-Kovacek', '2017-08-13', '2019-03-15', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (85, 16, 'Hand, Macejkovic and Windler', '2017-04-22', '2019-03-22', 20);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (86, 16, 'Runte Group', '2006-10-31', '2019-01-13', 10);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (87, 10, 'Oberbrunner, McCullough and Hintz', '2012-02-17', '2019-02-22', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (88, 10, 'Bode LLC', '2001-09-16', '2019-03-20', 17);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (89, 17, 'Hudson, Ziemann and Monahan', '2013-05-08', '2019-02-07', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (90, 17, 'O''Keefe, Runolfsdottir and Cormier', '2009-05-29', '2019-03-23', 13);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (91, 16, 'Kihn and Sons', '2002-02-25', '2019-02-03', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (92, 10, 'Smith-Wiza', '2000-07-12', '2019-03-20', 20);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (93, 16, 'Littel, Barton and Kemmer', '2005-10-04', '2019-02-16', 7);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (94, 15, 'Medhurst, Aufderhar and Sporer', '2015-05-19', '2019-04-18', 14);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (95, 15, 'Satterfield-Bins', '2015-07-05', '2019-03-29', 9);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (96, 11, 'Blick, Gulgowski and Simonis', '2017-03-12', '2019-04-13', 8);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (97, 13, 'Roob LLC', '2018-01-14', '2019-03-21', 8);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (98, 13, 'Pollich-Nienow', '2002-11-15', '2019-04-03', 11);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (99, 14, 'Anderson and Sons', '2013-07-24', '2019-02-05', 4);
insert into sponsors (SPON_CODE, TEAM_CODE, SPON_NAME, SPON_STARTDATE, SPON_ENDDATE, SPON_RANK) values (100, 17, 'Maggio and Sons', '2008-03-01', '2019-04-13', 15);


 # Insert Members Data
 insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (1, 15, 'Alejoa', 'Hanwell', '06553 Quincy Hill', 'WA', '509-271-6754');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (2, 13, 'Cash', 'Menel', '9 Weeping Birch Court', 'IA', '319-794-3050');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (3, 11, 'Otes', 'Stoacley', '1439 Dawn Trail', 'MT', '406-579-4059');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (4, 14, 'Clay', 'Bonny', '5 Park Meadow Plaza', 'WI', '414-789-5758');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (5, 16, 'Faber', 'Imison', '915 Linden Parkway', 'CO', '719-664-9994');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (6, 10, 'Mac', 'Forte', '36 Iowa Drive', 'TX', '972-399-2021');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (7, 11, 'Bogart', 'Gandy', '820 Bonner Crossing', 'CA', '818-505-4941');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (8, 13, 'Winifield', 'Culter', '94300 Garrison Place', 'DC', '202-944-1246');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (9, 17, 'Farley', 'Klimas', '6045 Onsgard Junction', 'IL', '312-750-8822');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (10, 16, 'Jessey', 'Otridge', '08561 Twin Pines Way', 'MN', '612-844-2204');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (11, 11, 'Jeramie', 'Boriston', '3 Esker Drive', 'FL', '386-626-5998');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (12, 16, 'Damien', 'Garrad', '0 Thackeray Hill', 'VA', '804-395-8370');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (13, 15, 'Riordan', 'Arnett', '8 Kim Park', 'CA', '510-369-5293');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (14, 16, 'Bradford', 'Lightbourn', '60298 Nancy Place', 'KY', '859-356-3688');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (15, 15, 'Bartolemo', 'Ausher', '6 Transport Plaza', 'FL', '407-380-4796');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (16, 17, 'Alphonse', 'Malcolm', '526 Fremont Drive', 'AL', '251-214-4070');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (17, 13, 'Marlo', 'Tethacot', '8098 Hayes Junction', 'SC', '864-102-6020');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (18, 14, 'Creighton', 'Rizzini', '63 New Castle Circle', 'FL', '352-361-5327');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (19, 13, 'Waylin', 'Nower', '8005 Schiller Trail', 'CO', '719-983-7578');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (20, 16, 'Yorke', 'Gallandre', '1845 Kensington Court', 'OH', '234-231-2432');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (21, 17, 'Daven', 'Sedman', '035 Red Cloud Road', 'MD', '301-158-1552');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (22, 11, 'Aksel', 'Utteridge', '33525 Park Meadow Lane', 'TX', '903-597-6063');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (23, 17, 'Jeremiah', 'Ditchfield', '0 Talmadge Point', 'IN', '812-355-3756');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (24, 13, 'Hayden', 'Ozelton', '92471 5th Park', 'LA', '225-966-1190');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (25, 14, 'Reider', 'Barlass', '20 Lake View Park', 'NY', '716-873-4488');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (26, 10, 'Wat', 'Cristoforetti', '8 Stang Hill', 'FL', '813-277-9076');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (27, 17, 'Englebert', 'Lambertson', '9 Sutherland Pass', 'CA', '510-172-0715');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (28, 12, 'Courtney', 'Collin', '6 Esch Crossing', 'MN', '763-833-8950');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (29, 14, 'Matthias', 'Moy', '1 Northport Circle', 'GA', '404-630-0965');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (30, 11, 'Bennett', 'Lowery', '5 Dawn Street', 'CA', '805-155-5146');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (31, 17, 'Zared', 'Mainston', '657 Monica Alley', 'PA', '215-941-5569');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (32, 11, 'Lionel', 'Amery', '65 Farwell Point', 'AZ', '520-548-4311');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (33, 17, 'Faber', 'Blacklidge', '08 Blaine Park', 'NV', '702-350-8386');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (34, 10, 'Walker', 'MacTrustram', '1676 Oakridge Junction', 'PA', '717-607-4955');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (35, 12, 'Alisander', 'Fearby', '33140 Dayton Center', 'DC', '202-232-0829');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (36, 14, 'Allard', 'Keyzman', '9207 Becker Hill', 'SC', '864-745-9144');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (37, 11, 'Dom', 'Enochsson', '779 Grayhawk Way', 'OH', '330-223-6828');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (38, 17, 'Archaimbaud', 'Petrou', '82 Scott Park', 'CO', '719-529-3758');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (39, 17, 'Pyotr', 'Maruszewski', '474 Cambridge Pass', 'DC', '202-610-6694');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (40, 14, 'Jarred', 'Kynman', '83 Vermont Center', 'TX', '903-723-5106');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (41, 14, 'Ase', 'Ikin', '26918 Duke Parkway', 'MO', '314-278-7733');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (42, 11, 'Clevie', 'Newbury', '7 Evergreen Crossing', 'FL', '352-899-8370');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (43, 13, 'Todd', 'Armstrong', '34 Badeau Junction', 'FL', '786-966-2834');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (44, 15, 'Udale', 'Capehorn', '36 Corry Park', 'TX', '512-388-5946');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (45, 16, 'Spencer', 'Huggard', '1 Gale Center', 'FL', '727-954-3684');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (46, 15, 'Burk', 'Pritchard', '28 Bartillon Hill', 'FL', '561-809-9598');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (47, 16, 'Gualterio', 'Brislen', '3419 Briar Crest Point', 'CO', '303-176-9001');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (48, 10, 'Omero', 'Shakesby', '9122 Colorado Point', 'FL', '941-685-7456');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (49, 15, 'Cesare', 'Balogh', '2041 Packers Plaza', 'FL', '754-920-2215');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (50, 14, 'Leonid', 'Jorck', '90436 Victoria Center', 'OH', '614-628-5364');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (51, 16, 'Denis', 'Arger', '5248 Tennyson Junction', 'NV', '702-436-5223');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (52, 13, 'Ulises', 'Grieg', '78116 Saint Paul Center', 'IL', '630-320-4500');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (53, 14, 'Olvan', 'Pauleit', '093 Miller Alley', 'CA', '831-348-8079');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (54, 15, 'Emelen', 'Nowakowski', '52183 Jenna Place', 'ND', '701-888-8732');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (55, 14, 'Jamil', 'Burner', '62 Hovde Terrace', 'KS', '785-363-9061');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (56, 15, 'Richy', 'Jelf', '1 Fallview Pass', 'PA', '570-276-4885');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (57, 11, 'Nels', 'Strasse', '8 Birchwood Court', 'NE', '402-867-1872');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (58, 10, 'Andrea', 'Evesque', '8 Blue Bill Park Pass', 'KS', '316-681-3281');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (59, 10, 'Leighton', 'Revey', '0981 Express Park', 'WI', '414-600-2485');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (60, 10, 'Gardner', 'Gayther', '1 Columbus Street', 'MN', '952-327-9189');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (61, 10, 'Howie', 'Durant', '6 Carberry Way', 'UT', '801-762-2345');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (62, 16, 'Ivan', 'Paddeley', '984 Maple Way', 'WV', '304-935-6510');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (63, 16, 'Dennie', 'Hopfer', '84 Leroy Avenue', 'LA', '337-137-8912');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (64, 15, 'Sheridan', 'Chorley', '1 Dakota Circle', 'CO', '719-425-6881');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (65, 15, 'Bo', 'Paul', '8 Towne Court', 'FL', '727-368-4687');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (66, 12, 'Reinaldos', 'Canet', '25237 Bartillon Parkway', 'PA', '570-970-0540');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (67, 17, 'Bron', 'Angliss', '261 Doe Crossing Junction', 'CA', '916-199-9809');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (68, 11, 'Michale', 'Mantz', '85 Roth Junction', 'VA', '571-972-3245');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (69, 16, 'Timothee', 'Riquet', '32699 Banding Place', 'CA', '562-663-1739');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (70, 16, 'Marshal', 'Burdytt', '5050 Rowland Center', 'CA', '909-722-0306');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (71, 10, 'Chaddie', 'Eddowes', '2608 Atwood Hill', 'LA', '504-379-1483');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (72, 15, 'Ulysses', 'Rolfini', '035 Magdeline Terrace', 'TX', '713-564-1017');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (73, 11, 'Nathaniel', 'Arling', '8 Maple Wood Hill', 'FL', '813-461-2417');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (74, 13, 'Wendall', 'Espina', '0336 Almo Lane', 'CA', '408-891-5761');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (75, 14, 'Andonis', 'Orrill', '7449 Luster Terrace', 'WA', '206-792-4571');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (76, 14, 'Ettore', 'Keasy', '8 Eliot Hill', 'IA', '319-290-1729');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (77, 11, 'Patin', 'Fishenden', '60468 Bowman Avenue', 'FL', '813-831-9880');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (78, 17, 'Markos', 'Hurd', '93600 8th Avenue', 'VA', '202-189-0843');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (79, 10, 'Dougie', 'Madgett', '28 Eagle Crest Center', 'SC', '864-639-4077');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (80, 10, 'Fletch', 'Reeve', '8436 Stephen Circle', 'DC', '202-160-8484');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (81, 11, 'Jock', 'Beamish', '544 Anzinger Center', 'MD', '202-838-0741');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (82, 12, 'Mickie', 'Alder', '03 Eastlawn Lane', 'IL', '217-156-3980');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (83, 14, 'Yuma', 'Bedberry', '61447 Loomis Point', 'FL', '786-660-8131');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (84, 13, 'Elwin', 'Garrould', '80384 Briar Crest Avenue', 'MO', '573-644-3735');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (85, 11, 'Trip', 'Wase', '8589 Saint Paul Crossing', 'RI', '401-968-3791');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (86, 17, 'Garek', 'Pinching', '1643 Garrison Parkway', 'WA', '206-304-9173');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (87, 15, 'Abbey', 'Batterton', '6782 Brickson Park Street', 'CA', '213-452-7319');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (88, 13, 'Patrizius', 'Clac', '4291 Texas Trail', 'DC', '202-923-1005');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (89, 13, 'Piggy', 'Grzegorzewski', '1 Coolidge Lane', 'IL', '773-689-1485');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (90, 15, 'Patin', 'Wyson', '7 Sherman Hill', 'FL', '239-980-6561');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (91, 12, 'Nikos', 'Kerfut', '20173 Burning Wood Plaza', 'LA', '225-923-1157');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (92, 14, 'Cesaro', 'Miko', '441 Dennis Plaza', 'CT', '203-822-6425');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (93, 14, 'Kelley', 'Townsend', '34341 Mallard Circle', 'NY', '716-296-4490');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (94, 15, 'Abran', 'Allchorn', '0 Shoshone Park', 'LA', '504-830-1798');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (95, 13, 'Dev', 'Tolomelli', '70683 Vahlen Circle', 'CA', '213-275-3835');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (96, 16, 'Isaiah', 'Turn', '63166 Hudson Hill', 'CA', '530-232-8011');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (97, 16, 'Lockwood', 'Robecon', '159 Ludington Point', 'OK', '918-769-3595');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (98, 10, 'Cullie', 'Camous', '2 Dryden Road', 'NY', '212-816-3085');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (99, 17, 'Franz', 'Dyball', '4 Butternut Drive', 'NY', '212-488-2273');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (100, 17, 'Jessie', 'Wakeford', '0404 Sloan Trail', 'OR', '971-111-0594');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (101, 12, 'Gavan', 'Vize', '969 Montana Drive', 'TX', '713-736-4058');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (102, 14, 'Cull', 'Piotrowski', '525 Gina Street', 'DC', '202-428-6855');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (103, 13, 'Iggie', 'Nyles', '59018 Onsgard Junction', 'CA', '619-811-2834');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (104, 16, 'Fernando', 'Blondelle', '0446 Fulton Court', 'WV', '304-569-0546');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (105, 15, 'Gene', 'Rait', '447 Hagan Terrace', 'CA', '805-752-4213');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (106, 10, 'Nickola', 'Gibb', '0 Mallory Street', 'DC', '202-882-7563');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (107, 11, 'Orazio', 'Capron', '35689 Pankratz Plaza', 'CA', '909-450-5360');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (108, 13, 'Dionysus', 'Breche', '25698 Dakota Drive', 'CA', '408-117-1569');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (109, 16, 'Siffre', 'Faill', '7560 Crescent Oaks Avenue', 'CO', '719-402-7712');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (110, 17, 'Garrett', 'Haquin', '956 Sugar Terrace', 'OH', '937-425-6863');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (111, 16, 'Sinclare', 'Collingwood', '365 International Center', 'IN', '812-684-2151');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (112, 13, 'Richmound', 'Vasilechko', '054 Anderson Terrace', 'TN', '615-532-3120');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (113, 17, 'Dominique', 'Denisovich', '5 Fallview Trail', 'WI', '414-725-0190');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (114, 14, 'Cirilo', 'Broek', '34 Blaine Pass', 'OH', '216-265-5051');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (115, 16, 'Stavros', 'Lindenbluth', '50814 Becker Avenue', 'PA', '215-387-6862');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (116, 11, 'Stuart', 'Saer', '11 Pawling Alley', 'CA', '408-533-7479');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (117, 16, 'Sebastiano', 'Shoppee', '90 Schlimgen Pass', 'AZ', '602-484-5257');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (118, 12, 'Konstantin', 'Dax', '6 Corry Road', 'OK', '405-445-1043');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (119, 17, 'Howard', 'Jeanenet', '4895 Tennyson Trail', 'FL', '305-405-7157');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (120, 12, 'Bryon', 'Boatwright', '1 Village Green Drive', 'VA', '540-716-3113');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (121, 14, 'Nicko', 'Craigmyle', '456 Rusk Plaza', 'TX', '806-657-1832');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (122, 12, 'Isidore', 'Golsworthy', '1 Novick Crossing', 'KY', '502-641-5943');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (123, 11, 'Cornall', 'Scudamore', '1821 Mesta Center', 'MS', '601-928-3283');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (124, 15, 'Leslie', 'Lissemore', '38487 North Parkway', 'CA', '415-766-4817');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (125, 11, 'Amby', 'Margaritelli', '003 Porter Terrace', 'AL', '251-716-3929');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (126, 15, 'Rossie', 'Potbury', '6019 Declaration Way', 'FL', '813-400-7358');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (127, 17, 'Kendal', 'Wrassell', '8 Esch Pass', 'DC', '202-886-0957');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (128, 12, 'Reuven', 'Truter', '58590 Iowa Hill', 'MN', '651-927-3126');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (129, 15, 'Rafael', 'McLaggan', '31349 Hooker Road', 'FL', '754-207-5859');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (130, 16, 'Alix', 'Keynd', '3146 Warrior Trail', 'TX', '817-675-7420');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (131, 16, 'Skell', 'Waight', '96639 4th Junction', 'VA', '757-189-3053');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (132, 16, 'Meade', 'Schultze', '03173 Kim Trail', 'TX', '713-766-9870');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (133, 12, 'Tyrone', 'Batch', '994 Dixon Drive', 'FL', '941-784-9263');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (134, 15, 'Northrop', 'Keeping', '8929 Banding Hill', 'GA', '678-308-8833');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (135, 13, 'Ossie', 'Vorley', '66364 Ruskin Junction', 'KS', '785-671-3281');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (136, 17, 'Clayson', 'Tue', '6 Milwaukee Avenue', 'MS', '601-661-1869');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (137, 16, 'Tannie', 'Mation', '551 Ronald Regan Crossing', 'IL', '773-961-8039');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (138, 12, 'Gasparo', 'Lockwood', '63 Merrick Trail', 'TX', '713-540-1904');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (139, 16, 'Troy', 'Merrifield', '5 Carey Alley', 'LA', '225-433-8794');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (140, 12, 'Silvano', 'Rodmell', '923 Lighthouse Bay Alley', 'ID', '208-404-7231');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (141, 11, 'Dallon', 'Newhouse', '647 Riverside Pass', 'MO', '314-706-8121');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (142, 10, 'Hamish', 'Pilsworth', '1785 Gateway Alley', 'MA', '508-882-8381');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (143, 11, 'Jorge', 'Glentz', '5 Upham Court', 'VA', '540-518-6370');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (144, 15, 'Davy', 'Hainge', '976 Lighthouse Bay Court', 'TN', '615-689-3642');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (145, 13, 'Bern', 'Slinn', '50 Kingsford Avenue', 'NY', '212-676-8191');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (146, 14, 'Raddie', 'Kepling', '005 Scoville Trail', 'CA', '619-304-8807');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (147, 17, 'Archaimbaud', 'Vellacott', '861 Sherman Pass', 'IN', '574-664-2266');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (148, 11, 'Nevin', 'Bruton', '6618 Roth Street', 'UT', '801-735-0384');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (149, 11, 'Robinson', 'Westmacott', '73320 Esker Street', 'CO', '720-519-9550');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (150, 12, 'Cece', 'Gleaves', '53522 Gina Drive', 'IN', '260-704-9060');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (151, 13, 'Antonino', 'Larway', '89 Arrowood Drive', 'AZ', '520-258-2388');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (152, 12, 'Chicky', 'Kermode', '55469 Erie Drive', 'VA', '804-389-5129');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (153, 14, 'Gaven', 'Scotti', '23 Scott Junction', 'CA', '916-736-8984');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (154, 13, 'Nickie', 'Gooke', '24243 Oriole Road', 'CA', '626-325-5466');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (155, 16, 'Ezequiel', 'Seward', '459 Bobwhite Street', 'SC', '864-360-5991');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (156, 16, 'Siward', 'Wadsworth', '3 6th Lane', 'MD', '301-683-7152');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (157, 13, 'Duncan', 'Bearham', '55 Milwaukee Court', 'PA', '412-828-0705');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (158, 13, 'Morey', 'Dibdale', '0 Haas Lane', 'FL', '561-352-4867');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (159, 13, 'Justen', 'Ellerman', '57317 Express Terrace', 'WI', '414-282-5935');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (160, 13, 'Doug', 'Newburn', '58 Pleasure Alley', 'NY', '518-802-5169');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (161, 14, 'Andreas', 'Gay', '42 Vera Trail', 'WA', '253-511-5333');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (162, 13, 'Spenser', 'Odcroft', '4715 Goodland Junction', 'LA', '225-269-9065');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (163, 12, 'Archy', 'Tolomelli', '46312 Ohio Trail', 'NY', '516-101-0206');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (164, 15, 'Errick', 'Haughian', '6 Glacier Hill Junction', 'KY', '502-878-6606');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (165, 10, 'Peter', 'Preshous', '1178 Milwaukee Terrace', 'MN', '612-451-9549');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (166, 13, 'Ansel', 'Hedgecock', '231 Almo Drive', 'FL', '561-454-1789');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (167, 12, 'Kristofer', 'Morsom', '1 Randy Place', 'NC', '919-367-4290');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (168, 14, 'Andrew', 'Bister', '2 Spaight Parkway', 'TX', '817-298-4417');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (169, 14, 'Barclay', 'Kennicott', '5 Mcbride Circle', 'IA', '515-486-8883');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (170, 16, 'Boris', 'Boughtflower', '3542 Leroy Terrace', 'WA', '253-229-4671');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (171, 11, 'Ulysses', 'Larkkem', '8 Shasta Lane', 'MN', '763-176-4416');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (172, 15, 'Hall', 'Felgat', '3 Boyd Lane', 'IA', '515-253-4188');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (173, 16, 'Avram', 'Lambregts', '522 Maple Plaza', 'CT', '860-574-6168');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (174, 14, 'Laughton', 'Philippe', '85536 Pleasure Park', 'TX', '214-771-0421');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (175, 10, 'Brewster', 'Rollins', '68447 Mcbride Junction', 'OH', '216-274-3812');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (176, 10, 'Ariel', 'McCaw', '68608 Coleman Drive', 'NC', '704-729-0774');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (177, 12, 'Davis', 'Alanbrooke', '96721 Forest Dale Place', 'FL', '561-104-7458');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (178, 17, 'Dugald', 'Barham', '9 Dryden Court', 'CA', '916-112-2609');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (179, 15, 'Martainn', 'Rossborough', '7321 Barby Center', 'NY', '716-967-3529');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (180, 16, 'Hi', 'Bernollet', '6 Ramsey Drive', 'NY', '716-255-0157');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (181, 13, 'Arne', 'Nathan', '1 Welch Trail', 'NV', '702-822-4499');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (182, 17, 'Marty', 'Ortas', '73698 Hayes Trail', 'MN', '651-273-3534');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (183, 13, 'Faber', 'Adamou', '268 Mallard Center', 'DE', '302-921-6004');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (184, 10, 'Dewie', 'Gosnell', '8483 Darwin Junction', 'GA', '678-728-8872');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (185, 17, 'Pyotr', 'Jelley', '66562 Kedzie Trail', 'FL', '904-847-8923');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (186, 16, 'Ramsey', 'Howle', '4272 Springview Drive', 'TX', '210-431-7510');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (187, 10, 'Raff', 'Otterwell', '0 Alpine Place', 'CA', '661-608-9506');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (188, 16, 'Jacky', 'Habbijam', '88 Vera Road', 'FL', '321-347-2114');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (189, 11, 'Domenico', 'Gummary', '9460 Lakewood Gardens Lane', 'TX', '512-996-4046');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (190, 12, 'Shaughn', 'Archibald', '6 Eagan Road', 'WI', '414-559-7729');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (191, 12, 'Isak', 'Papis', '2 Ryan Drive', 'NY', '315-409-4400');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (192, 12, 'Chester', 'Berriball', '9 South Pass', 'TX', '713-614-9927');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (193, 13, 'Clarke', 'Pagon', '8764 Thierer Hill', 'AZ', '623-905-8530');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (194, 17, 'Derek', 'Schach', '58 Dunning Avenue', 'PA', '717-388-3633');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (195, 11, 'Husein', 'Stendell', '39025 Bonner Trail', 'MI', '231-562-1736');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (196, 16, 'Ashton', 'King', '85 Independence Place', 'GA', '706-429-0161');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (197, 14, 'Del', 'Nanninini', '4 Ilene Drive', 'NY', '646-564-4339');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (198, 10, 'Hillary', 'Mcmanaman', '4415 Amoth Pass', 'GA', '706-103-9418');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (199, 17, 'Gerhardt', 'Swanborrow', '7 Arapahoe Lane', 'NY', '516-355-5694');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (200, 10, 'Turner', 'Fawkes', '118 Debra Point', 'PA', '215-273-0081');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (201, 13, 'Derry', 'Ingarfield', '22 3rd Alley', 'DC', '202-978-8745');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (202, 15, 'Wang', 'Greatbank', '7371 Lawn Crossing', 'TX', '915-819-9795');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (203, 16, 'Romain', 'Grayer', '75 Village Avenue', 'DC', '202-180-3536');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (204, 14, 'Tabor', 'Tevlin', '92059 Westend Center', 'WI', '414-292-6974');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (205, 15, 'Keir', 'Frane', '6 Corry Point', 'NJ', '973-369-6321');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (206, 10, 'Stanton', 'Gascone', '3033 Division Terrace', 'MO', '816-679-2585');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (207, 16, 'Durant', 'Josephi', '01 Donald Trail', 'FL', '954-376-3599');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (208, 12, 'Flynn', 'Leakner', '5400 Burrows Circle', 'NJ', '609-491-7551');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (209, 13, 'Morty', 'Tibbotts', '02 7th Center', 'PA', '267-898-1524');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (210, 10, 'Mozes', 'Mose', '840 Hansons Road', 'CA', '650-843-3021');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (211, 14, 'Jaime', 'Millican', '6 Melrose Trail', 'WA', '360-351-3106');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (212, 12, 'Derril', 'Carroll', '3 Burrows Crossing', 'VA', '540-522-0874');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (213, 10, 'Rolf', 'Wickenden', '8 Westport Lane', 'AR', '501-888-9197');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (214, 14, 'Tally', 'Loverock', '7 Thompson Trail', 'AR', '501-797-1065');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (215, 14, 'Yardley', 'Parlor', '54 Waubesa Alley', 'PA', '412-551-8175');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (216, 15, 'Glen', 'Rosenfelder', '52 Express Hill', 'IL', '217-325-4485');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (217, 14, 'Svend', 'McArthur', '11812 Birchwood Circle', 'MD', '240-844-7449');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (218, 10, 'Hanan', 'McGuinness', '10723 Elmside Terrace', 'MN', '218-449-4762');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (219, 14, 'Gib', 'Leneham', '8 Northview Point', 'TX', '915-513-6390');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (220, 15, 'Mac', 'Boas', '64 Jay Court', 'CO', '720-960-7923');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (221, 15, 'Homerus', 'Elecum', '814 Thierer Hill', 'NC', '704-750-6489');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (222, 10, 'Elijah', 'Wilkenson', '9329 Nova Place', 'MI', '248-248-7062');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (223, 12, 'Lemuel', 'Emerton', '18923 Stoughton Point', 'VA', '571-787-2863');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (224, 16, 'Curry', 'Hunnicot', '6 Eastlawn Lane', 'OH', '937-325-2426');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (225, 15, 'Allister', 'Cosgrive', '660 Morrow Parkway', 'OH', '216-312-9846');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (226, 14, 'Lemar', 'McCrae', '0 Hallows Junction', 'OH', '419-153-0300');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (227, 15, 'Rikki', 'Ordidge', '6061 Maywood Lane', 'NY', '212-544-3779');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (228, 14, 'Yurik', 'O'' Hanvey', '82731 Fisk Junction', 'VA', '804-376-0265');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (229, 10, 'Ephrem', 'Molder', '75 Mariners Cove Street', 'CA', '714-330-4066');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (230, 17, 'Gilburt', 'Kerrigan', '70 Village Avenue', 'CA', '714-959-2098');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (231, 16, 'Corney', 'Mapledoore', '826 Starling Way', 'NC', '828-498-4195');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (232, 14, 'Tymon', 'Gilhool', '046 Walton Hill', 'CA', '619-490-3498');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (233, 11, 'Shanan', 'Edser', '5 Village Hill', 'OK', '405-473-9470');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (234, 17, 'Marv', 'Jaskiewicz', '0969 Everett Center', 'CA', '323-505-6895');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (235, 17, 'Salomon', 'Kleehuhler', '6 Fulton Street', 'DC', '202-738-5959');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (236, 13, 'Felicio', 'Odhams', '36900 Clemons Trail', 'GA', '404-748-0621');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (237, 11, 'Dare', 'Flawith', '8 Blue Bill Park Street', 'GA', '912-207-5800');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (238, 15, 'Gustavo', 'Smorthwaite', '52 Holmberg Plaza', 'CA', '818-206-2984');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (239, 11, 'Samson', 'Bienvenu', '471 Pearson Court', 'UT', '801-949-0857');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (240, 14, 'Cullie', 'Finey', '0 Muir Crossing', 'MN', '651-412-9642');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (241, 12, 'Hillel', 'Scurfield', '81202 3rd Place', 'IN', '260-220-4429');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (242, 15, 'Erv', 'Raggatt', '69671 Kedzie Street', 'AL', '334-549-1398');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (243, 11, 'Traver', 'Labbati', '152 Cambridge Hill', 'AK', '907-680-6877');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (244, 14, 'Konstantin', 'Mableson', '8 Clove Terrace', 'IA', '563-541-3607');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (245, 14, 'Ambrose', 'Olivet', '1121 Monica Crossing', 'VA', '757-166-7715');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (246, 12, 'Corbett', 'Fontes', '16686 Mayer Circle', 'OH', '937-170-4628');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (247, 11, 'Manolo', 'Liggins', '5174 Kim Circle', 'NY', '212-867-8237');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (248, 12, 'Jethro', 'Radage', '0 Green Ridge Circle', 'KS', '316-792-2724');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (249, 14, 'Zelig', 'Jedras', '5616 Twin Pines Drive', 'PA', '814-288-7633');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (250, 12, 'Myles', 'Mugg', '079 Corry Terrace', 'TX', '214-381-0047');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (251, 13, 'Rickert', 'Habbin', '08 Loomis Place', 'CA', '415-659-4562');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (252, 12, 'Manolo', 'Hawyes', '02316 Schiller Hill', 'NY', '646-660-7331');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (253, 10, 'Lars', 'Atkins', '49922 Homewood Hill', 'TX', '281-777-4199');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (254, 14, 'Thatcher', 'Antonucci', '55 Farwell Court', 'TX', '512-924-7815');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (255, 16, 'Gilles', 'Windybank', '13389 Vidon Trail', 'NY', '212-739-6944');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (256, 17, 'Darius', 'McLaughlin', '1 Walton Park', 'CO', '303-531-8633');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (257, 16, 'Drake', 'Watmore', '36002 Almo Lane', 'TN', '865-312-0660');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (258, 12, 'Garald', 'Askew', '4 Packers Trail', 'MA', '617-290-5726');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (259, 11, 'Der', 'Burnsall', '1 Troy Lane', 'NE', '402-347-1571');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (260, 12, 'Ian', 'Ferrieres', '8479 Lake View Hill', 'TX', '972-786-6663');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (261, 10, 'Orv', 'MacRorie', '15893 Straubel Court', 'TX', '915-112-0983');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (262, 11, 'Gerald', 'Druhan', '46 Golf Course Junction', 'MO', '816-470-9293');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (263, 14, 'Bent', 'Seiler', '89552 Mcguire Hill', 'DC', '202-172-6306');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (264, 10, 'Lowe', 'Choldcroft', '4 Nevada Street', 'CA', '858-763-1391');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (265, 13, 'Siegfried', 'Manlow', '1920 La Follette Junction', 'DE', '302-409-4792');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (266, 17, 'Merrel', 'Wabe', '7213 Claremont Trail', 'NV', '702-242-4325');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (267, 16, 'Itch', 'Ambrosi', '86 Lakewood Gardens Park', 'FL', '941-989-2882');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (268, 12, 'Chev', 'Meldrum', '6121 Commercial Parkway', 'MS', '601-564-3901');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (269, 11, 'Harmon', 'Menzies', '27 Debra Court', 'VA', '703-420-2009');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (270, 16, 'Raoul', 'Castana', '9351 Portage Parkway', 'TX', '210-750-5968');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (271, 15, 'Teador', 'Tesauro', '76868 Bowman Center', 'TN', '615-332-6491');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (272, 15, 'Mikael', 'Tacker', '6235 Paget Park', 'NC', '704-852-3031');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (273, 11, 'Angelico', 'Lortz', '864 Walton Court', 'MD', '410-506-7040');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (274, 17, 'Timmy', 'Warstall', '2205 Grayhawk Circle', 'DC', '202-627-1290');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (275, 11, 'Robinson', 'Brind', '72 Claremont Drive', 'IA', '515-735-5437');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (276, 16, 'Gav', 'Ellingsworth', '832 Knutson Center', 'OR', '971-434-6564');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (277, 13, 'Reggie', 'Quogan', '805 Forest Way', 'WA', '509-237-0275');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (278, 16, 'Wilt', 'Stanion', '1 Brown Crossing', 'AZ', '623-764-0359');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (279, 11, 'Rogers', 'Pisco', '92549 Pine View Center', 'CA', '702-952-5236');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (280, 13, 'Hunter', 'Gomes', '1 Petterle Trail', 'ND', '701-990-7269');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (281, 16, 'Arel', 'MacConnal', '3756 Miller Hill', 'IN', '812-988-0128');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (282, 16, 'Lazare', 'Nazareth', '92479 Prairie Rose Center', 'FL', '754-408-8126');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (283, 12, 'Lenard', 'Whettleton', '43921 Garrison Park', 'TX', '832-734-2806');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (284, 14, 'Vernon', 'Beton', '94 Prairie Rose Street', 'IL', '309-540-1026');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (285, 16, 'Darryl', 'Bonham', '71532 Glendale Lane', 'CA', '415-514-2790');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (286, 12, 'Riccardo', 'Charters', '6 Eastwood Drive', 'OK', '405-643-9677');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (287, 16, 'Cord', 'Liebmann', '720 Delladonna Park', 'CO', '303-922-6654');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (288, 12, 'Lammond', 'Stroyan', '455 Spohn Pass', 'OK', '918-281-3896');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (289, 17, 'Xenos', 'Shardlow', '4925 Sheridan Point', 'OR', '503-917-0199');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (290, 17, 'Yuri', 'Maccaig', '7766 Armistice Alley', 'KY', '859-565-8134');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (291, 14, 'Bernhard', 'Denslow', '8 Everett Center', 'AL', '205-182-8766');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (292, 14, 'Phillip', 'Battrick', '6629 Erie Street', 'CA', '213-851-5384');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (293, 11, 'Haze', 'Lelande', '15673 Green Center', 'CO', '719-250-9712');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (294, 10, 'Archer', 'Rosenhaus', '3 Scoville Park', 'DC', '202-120-6419');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (295, 13, 'Pippo', 'Rennels', '9 Glendale Pass', 'NE', '402-557-2733');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (296, 10, 'Pascal', 'Stummeyer', '8242 Bonner Road', 'CA', '626-618-3492');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (297, 13, 'Murray', 'Treadgear', '49134 Thompson Center', 'CT', '860-552-1791');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (298, 10, 'Goran', 'McGoon', '3 Wayridge Alley', 'IN', '317-553-1381');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (299, 10, 'Will', 'Esherwood', '8347 Dapin Avenue', 'SC', '864-765-0327');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (300, 14, 'Tammie', 'Kayser', '20470 Old Gate Terrace', 'FL', '941-948-7959');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (301, 17, 'Armstrong', 'Drinkall', '56 Meadow Valley Drive', 'KS', '913-101-7651');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (302, 14, 'Cullin', 'Goodayle', '09 Spohn Street', 'FL', '407-994-7476');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (303, 15, 'Eugenius', 'Rowell', '31616 Talmadge Point', 'DC', '202-727-7668');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (304, 13, 'Finlay', 'Flye', '59785 Donald Terrace', 'OH', '614-526-1674');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (305, 15, 'Gray', 'Squier', '543 Saint Paul Drive', 'TX', '806-165-9182');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (306, 17, 'Harmon', 'Golland', '3 Transport Street', 'DC', '202-413-7141');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (307, 12, 'Wilbur', 'Cavy', '607 Oak Valley Drive', 'AZ', '602-901-4208');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (308, 12, 'Sherm', 'Fawcus', '1 High Crossing Center', 'TX', '915-572-8257');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (309, 13, 'Alejandro', 'Pruvost', '07 Scoville Way', 'MO', '816-133-0890');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (310, 14, 'Demott', 'Vanne', '6 Sunbrook Court', 'KS', '785-919-6674');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (311, 15, 'Nicholas', 'Casol', '16976 Continental Crossing', 'FL', '863-370-5434');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (312, 10, 'Basile', 'Flaxon', '7959 Fordem Pass', 'CA', '909-831-2639');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (313, 14, 'Glenden', 'Diggons', '722 Walton Trail', 'VA', '571-295-5727');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (314, 13, 'Vince', 'Klimashevich', '76 Oak Valley Court', 'FL', '850-204-9293');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (315, 10, 'Harcourt', 'Slavin', '0768 Pearson Hill', 'CO', '720-164-2057');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (316, 17, 'Rowan', 'Abbey', '7 Ronald Regan Avenue', 'VA', '434-925-4620');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (317, 17, 'Lenci', 'Culligan', '6 Service Place', 'IL', '217-879-0200');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (318, 11, 'Stefano', 'Roxburch', '9 Hoepker Junction', 'NY', '212-890-6576');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (319, 14, 'Glen', 'Cullrford', '588 Merry Drive', 'PA', '215-530-2408');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (320, 15, 'Barret', 'Yurasov', '3 Bartillon Avenue', 'FL', '561-859-7254');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (321, 13, 'Bastien', 'Stollenbecker', '65 Golf Crossing', 'PA', '814-357-0801');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (322, 16, 'Carter', 'Terese', '28 Lotheville Road', 'FL', '786-842-2614');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (323, 11, 'Cyrill', 'Levet', '5 Green Place', 'MS', '601-947-8196');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (324, 17, 'Bobbie', 'Lofty', '690 Reinke Junction', 'FL', '863-215-8986');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (325, 15, 'Ethe', 'Paolino', '39 David Circle', 'MO', '573-122-8151');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (326, 17, 'Borg', 'Slader', '346 Claremont Junction', 'NV', '775-583-9790');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (327, 14, 'Pate', 'Girton', '0 Maywood Point', 'CA', '858-130-3921');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (328, 16, 'Trenton', 'Cote', '754 Glendale Junction', 'AZ', '602-560-0092');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (329, 16, 'Tabb', 'Swalough', '81 Oak Park', 'CA', '916-125-3083');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (330, 10, 'Chucho', 'Leall', '040 Muir Place', 'VA', '757-907-4148');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (331, 17, 'Arlin', 'Choulerton', '87035 John Wall Street', 'GA', '404-317-6850');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (332, 10, 'Keefer', 'Steane', '9632 Orin Center', 'CA', '916-554-4298');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (333, 13, 'Nicholas', 'Sikora', '6 Hagan Center', 'DC', '202-523-8565');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (334, 15, 'Byrle', 'Fassbindler', '67980 Mariners Cove Point', 'AZ', '602-249-1859');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (335, 16, 'Terencio', 'Petrillo', '4300 Northfield Court', 'PA', '717-993-7373');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (336, 13, 'Tammy', 'Cridge', '883 Surrey Center', 'NY', '917-834-4151');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (337, 13, 'Jimmie', 'Battaille', '556 Maple Trail', 'CT', '860-235-8978');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (338, 17, 'Nevins', 'Jumel', '00693 Milwaukee Street', 'TX', '214-847-4619');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (339, 17, 'Demetris', 'O''Murtagh', '4617 Hovde Lane', 'OH', '614-810-4609');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (340, 10, 'Rogers', 'Hourihan', '00595 Sullivan Road', 'CA', '831-342-2641');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (341, 13, 'Sayre', 'Cuerda', '72 Superior Place', 'VA', '804-581-6350');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (342, 17, 'Bram', 'Longrigg', '12 Briar Crest Parkway', 'WI', '414-566-8486');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (343, 13, 'Charlie', 'Beggini', '4651 Declaration Way', 'OK', '918-993-0871');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (344, 10, 'Hadley', 'Gooderridge', '4794 Farwell Lane', 'SD', '605-530-8000');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (345, 17, 'Hercule', 'Bell', '70 Meadow Valley Avenue', 'LA', '225-772-4441');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (346, 17, 'Brett', 'Thewlis', '02 Marquette Hill', 'TN', '615-418-8331');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (347, 12, 'Cameron', 'Weine', '9940 Melody Alley', 'IA', '515-590-8357');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (348, 17, 'Hanson', 'Gaskin', '59 Porter Parkway', 'AZ', '602-451-7991');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (349, 11, 'Sullivan', 'Millott', '13209 Lillian Avenue', 'VA', '434-734-7328');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (350, 13, 'Nealy', 'Pring', '16 Shopko Circle', 'CT', '860-370-7689');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (351, 17, 'Spense', 'Boller', '25 Monterey Hill', 'GA', '770-160-5106');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (352, 16, 'Kingsley', 'Roswarn', '785 Montana Alley', 'FL', '850-801-4706');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (353, 15, 'Pren', 'Gilfoy', '601 Namekagon Plaza', 'NM', '505-189-9238');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (354, 10, 'Cassius', 'Van der Velden', '8 Blaine Parkway', 'FL', '352-835-1421');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (355, 17, 'Gaile', 'Proger', '6484 Prairie Rose Drive', 'NJ', '609-454-5057');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (356, 12, 'Che', 'Barta', '9452 Morning Trail', 'NJ', '609-535-1322');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (357, 13, 'Jarrod', 'Lillistone', '90 Carioca Drive', 'CA', '916-666-7639');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (358, 12, 'Guglielmo', 'Fernehough', '8645 Kropf Road', 'VA', '540-498-4208');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (359, 13, 'Victoir', 'Board', '4900 Holy Cross Way', 'TX', '214-349-5044');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (360, 15, 'Merv', 'Botger', '891 Almo Trail', 'MO', '816-572-1288');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (361, 17, 'Ed', 'Redrup', '802 Delaware Circle', 'TX', '832-920-3044');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (362, 17, 'Vern', 'Giovannini', '388 Packers Center', 'NC', '704-964-1156');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (363, 17, 'Quinton', 'Isacke', '66185 Sugar Way', 'MN', '952-934-3683');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (364, 11, 'Wayland', 'Ballach', '0493 Victoria Way', 'MS', '601-598-8948');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (365, 14, 'Farlie', 'Sandell', '485 Messerschmidt Hill', 'PA', '610-712-3248');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (366, 17, 'Lyle', 'McGuiness', '45 Sunnyside Avenue', 'CA', '714-918-0545');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (367, 16, 'Chic', 'Perrelli', '10512 Kinsman Point', 'AZ', '480-978-0469');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (368, 12, 'Colby', 'Ferrettini', '40 Delaware Place', 'IA', '515-998-3251');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (369, 14, 'Spence', 'Arnefield', '36 Evergreen Plaza', 'CA', '415-768-7703');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (370, 11, 'Lion', 'Skells', '656 Hanover Crossing', 'VA', '571-205-6559');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (371, 14, 'Baird', 'Jacombs', '1 Homewood Court', 'OH', '216-305-2212');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (372, 14, 'Thatcher', 'Taylo', '4 Doe Crossing Lane', 'NY', '585-312-7253');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (373, 10, 'Rad', 'Gibson', '28 7th Crossing', 'AL', '251-399-5675');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (374, 10, 'Gray', 'Morigan', '56961 Lindbergh Avenue', 'PA', '215-419-4600');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (375, 15, 'Lek', 'Burgher', '51914 Sommers Lane', 'TX', '972-114-2156');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (376, 17, 'Gardner', 'Creavin', '98 Cody Lane', 'NV', '702-410-1822');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (377, 13, 'Haroun', 'Hillum', '4 Shelley Trail', 'NC', '704-771-1462');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (378, 11, 'Auberon', 'Gunstone', '64 Sunnyside Center', 'MN', '952-481-1649');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (379, 15, 'Wolfgang', 'Tidgewell', '2750 Lerdahl Pass', 'TX', '903-673-0294');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (380, 10, 'Elvis', 'Vellender', '1671 Merry Street', 'KY', '502-502-9628');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (381, 12, 'Bradan', 'Roantree', '7 Laurel Hill', 'OH', '614-935-6097');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (382, 10, 'Ellery', 'Blanchette', '01707 Lyons Circle', 'VA', '540-534-5676');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (383, 13, 'Mohandas', 'Offener', '85993 Blackbird Pass', 'LA', '504-833-9141');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (384, 17, 'Duncan', 'Louche', '787 Arkansas Way', 'FL', '352-279-9105');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (385, 16, 'Angel', 'Forrestall', '7 Crescent Oaks Parkway', 'PA', '610-289-3740');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (386, 16, 'Bartram', 'Staley', '257 Kennedy Avenue', 'WV', '304-836-4889');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (387, 12, 'Leo', 'Stollwerk', '72828 Armistice Point', 'ND', '701-719-6216');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (388, 11, 'Levi', 'Bloxsum', '6 Stuart Park', 'CO', '719-752-0808');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (389, 10, 'Cedric', 'Blakeway', '7850 Basil Street', 'FL', '941-820-1039');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (390, 10, 'Oran', 'McGrady', '58941 Corry Park', 'FL', '954-737-6679');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (391, 14, 'Fraser', 'Passo', '4075 Nobel Lane', 'TN', '423-460-1441');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (392, 12, 'Clemens', 'Sola', '3192 Loomis Alley', 'TX', '214-345-6322');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (393, 13, 'Bruce', 'Skough', '0 La Follette Center', 'CA', '510-683-3831');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (394, 12, 'Ferdie', 'Devanney', '74 Amoth Court', 'MA', '508-963-2997');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (395, 16, 'Abner', 'Lening', '8815 Kim Road', 'MA', '508-212-2350');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (396, 16, 'Victoir', 'Maps', '7501 Lake View Center', 'CA', '408-341-3046');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (397, 11, 'Andrey', 'Filpo', '22 Dunning Street', 'TX', '806-283-4885');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (398, 15, 'Buddie', 'Ellingworth', '06940 Algoma Alley', 'CO', '303-206-6768');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (399, 17, 'Ellsworth', 'Heffernan', '5 Mallory Park', 'MO', '314-496-0473');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (400, 10, 'Yale', 'Lindro', '77 Loomis Way', 'DC', '202-151-3012');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (401, 17, 'Luis', 'Ovey', '01 Sachtjen Point', 'MN', '651-675-5179');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (402, 13, 'Dorian', 'Decker', '3675 Huxley Alley', 'WA', '425-684-8243');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (403, 15, 'Garwood', 'Kosel', '5380 Golden Leaf Crossing', 'KY', '502-375-5070');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (404, 10, 'Donavon', 'Hawke', '939 Raven Court', 'PA', '610-354-3920');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (405, 13, 'Paulo', 'Whatsize', '363 Arkansas Alley', 'HI', '808-333-9794');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (406, 11, 'Torey', 'Knowles', '52 Westridge Court', 'NJ', '862-942-9731');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (407, 15, 'Korey', 'Harlowe', '32 Crownhardt Lane', 'CT', '203-741-8638');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (408, 14, 'Montague', 'Cubbit', '184 Twin Pines Circle', 'TN', '615-647-3676');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (409, 16, 'Say', 'Hurche', '2054 Anhalt Way', 'KS', '913-102-9319');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (410, 13, 'Alan', 'Cowmeadow', '0541 Mifflin Road', 'LA', '337-440-8635');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (411, 14, 'Moises', 'Runcieman', '45752 Steensland Alley', 'TX', '903-398-9670');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (412, 12, 'Vale', 'Goodbarr', '6289 Shopko Court', 'NY', '315-859-2641');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (413, 11, 'Sigfried', 'Bussel', '480 Chinook Lane', 'TN', '901-811-8422');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (414, 16, 'Mitch', 'Luttger', '0106 Vera Center', 'IN', '317-992-0571');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (415, 14, 'Falito', 'Vallintine', '3 Stang Plaza', 'TX', '915-597-9828');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (416, 10, 'Nahum', 'Girardengo', '22 Sycamore Terrace', 'OH', '513-206-2384');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (417, 15, 'Matthieu', 'Sidlow', '1893 Northwestern Crossing', 'WV', '304-606-0312');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (418, 14, 'Marcel', 'Coit', '326 Grayhawk Avenue', 'TX', '281-454-1017');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (419, 15, 'Worth', 'Miere', '3 Lunder Crossing', 'FL', '561-394-0086');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (420, 13, 'Anatollo', 'Henighan', '6 Hollow Ridge Plaza', 'AL', '256-781-3079');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (421, 13, 'Alleyn', 'Yanne', '7334 Blue Bill Park Place', 'MO', '816-932-1729');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (422, 14, 'Shane', 'Pardy', '84938 Hansons Junction', 'IN', '765-329-2444');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (423, 13, 'Rowen', 'Hanfrey', '29667 Hoard Hill', 'SC', '803-323-4831');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (424, 15, 'Roosevelt', 'Firks', '38673 Scott Crossing', 'KS', '316-953-2676');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (425, 12, 'Sig', 'MacGaffey', '29 Wayridge Avenue', 'TX', '817-829-3451');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (426, 10, 'Rip', 'Cornfoot', '1 Myrtle Center', 'CA', '559-942-5950');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (427, 12, 'Kahlil', 'Kopelman', '5473 Carberry Plaza', 'CO', '303-660-6251');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (428, 14, 'Langsdon', 'Votier', '7952 Anzinger Court', 'IN', '317-389-2907');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (429, 15, 'Quincey', 'Scrymgeour', '4 Paget Way', 'MA', '617-313-7674');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (430, 15, 'Horatio', 'Elsey', '601 Merchant Center', 'LA', '337-940-9481');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (431, 13, 'Norrie', 'Crickmore', '1792 Loomis Crossing', 'CA', '310-528-6634');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (432, 14, 'Rhys', 'Coode', '2044 Weeping Birch Place', 'MI', '517-460-3909');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (433, 16, 'Woodrow', 'Rantoull', '0694 Dahle Point', 'CA', '619-814-5793');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (434, 12, 'Elwood', 'Lince', '1 Crest Line Junction', 'CA', '213-254-9162');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (435, 12, 'Sylvester', 'Gabby', '870 Namekagon Street', 'AZ', '602-297-4382');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (436, 12, 'Ronald', 'Millis', '9809 Carey Alley', 'TX', '214-119-3155');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (437, 16, 'Brand', 'Tibbits', '6 Sullivan Circle', 'WA', '509-996-6956');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (438, 17, 'Keir', 'Sawood', '1054 Anhalt Way', 'WA', '253-269-6995');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (439, 10, 'Terrel', 'Bahike', '565 Northland Way', 'NY', '585-956-2429');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (440, 17, 'Geri', 'Sturton', '547 Darwin Center', 'NH', '603-468-1275');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (441, 12, 'Giffard', 'Gaskarth', '70263 Morrow Plaza', 'TX', '915-504-7310');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (442, 15, 'Adrien', 'Jedrych', '59 Debra Plaza', 'MD', '410-332-4512');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (443, 17, 'Trumann', 'Burgin', '7266 Bellgrove Plaza', 'CA', '916-545-4170');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (444, 12, 'Bay', 'Bazire', '011 Blue Bill Park Parkway', 'GA', '770-970-1857');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (445, 16, 'Adolphus', 'O'' Byrne', '38703 Schurz Place', 'ME', '207-428-1077');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (446, 17, 'Erny', 'Lighten', '1044 Lillian Court', 'MD', '301-426-5731');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (447, 14, 'Antin', 'Pickance', '61972 Main Point', 'TX', '281-627-5248');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (448, 15, 'Devlen', 'Sandbatch', '762 Northwestern Center', 'CA', '818-449-6179');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (449, 13, 'Englebert', 'Tollet', '8400 Derek Circle', 'MS', '601-208-7738');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (450, 16, 'Eddie', 'Aynold', '369 Armistice Alley', 'CA', '916-741-5683');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (451, 12, 'Artemas', 'Grigoriev', '2 Morning Court', 'LA', '504-792-8143');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (452, 12, 'Sampson', 'Conneau', '68 Rockefeller Place', 'AZ', '520-312-2559');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (453, 12, 'Padraic', 'Mottram', '24 Orin Point', 'AL', '205-721-3536');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (454, 12, 'Craggy', 'Kalinovich', '03517 Novick Park', 'CA', '310-305-0159');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (455, 15, 'Flory', 'Tourry', '27 Buell Terrace', 'TX', '409-765-9300');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (456, 14, 'Dennie', 'Pirouet', '7672 Farwell Pass', 'CA', '831-713-7048');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (457, 17, 'Far', 'McWhirter', '49325 Eliot Court', 'UT', '801-821-1706');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (458, 10, 'Frank', 'Wysome', '14 Judy Drive', 'MD', '301-690-3168');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (459, 13, 'Matthew', 'Renahan', '79 Dwight Parkway', 'CA', '714-684-8390');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (460, 11, 'Willie', 'McMenamie', '79289 Heath Terrace', 'PA', '610-204-3674');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (461, 12, 'Erasmus', 'Wones', '22659 Scofield Center', 'TX', '214-821-0952');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (462, 17, 'Buck', 'Foulgham', '7 Warrior Center', 'DC', '202-675-1177');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (463, 10, 'Micheal', 'Creaney', '67 Anhalt Pass', 'WI', '608-165-7238');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (464, 13, 'Mark', 'Bugs', '7 Talisman Trail', 'VA', '804-343-9248');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (465, 12, 'Wilbert', 'Syvret', '9 Messerschmidt Avenue', 'OK', '405-452-4553');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (466, 10, 'Yancey', 'Turnock', '8107 Monica Parkway', 'CA', '916-858-1635');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (467, 12, 'Branden', 'O''Hegertie', '44 Mitchell Hill', 'FL', '305-723-0741');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (468, 17, 'Keefer', 'Midlar', '81 Continental Place', 'DC', '202-923-8898');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (469, 11, 'Lonny', 'Mealand', '6 Melby Drive', 'NY', '315-382-9736');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (470, 16, 'Corty', 'Careless', '2 Pankratz Junction', 'KS', '913-264-3399');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (471, 12, 'Roderigo', 'Megainey', '38 Ronald Regan Circle', 'IA', '515-616-9900');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (472, 12, 'Martyn', 'Bottom', '0 Redwing Parkway', 'NY', '518-589-2129');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (473, 10, 'Sol', 'Hammond', '87494 Hoepker Street', 'FL', '561-519-5175');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (474, 17, 'Geoffrey', 'Detheridge', '909 Dawn Center', 'TX', '713-871-0303');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (475, 14, 'Bruno', 'Harcarse', '55681 Fairview Way', 'TX', '915-502-6750');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (476, 15, 'Yardley', 'Geddis', '6376 Mockingbird Street', 'GA', '404-424-6602');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (477, 15, 'Kahaleel', 'Dumphry', '9 Moland Avenue', 'MS', '228-145-0693');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (478, 16, 'Manfred', 'Pentercost', '5035 Golf Way', 'FL', '786-501-8765');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (479, 10, 'Kit', 'Mc Ilwrick', '729 Ruskin Point', 'TX', '713-258-8906');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (480, 12, 'Felice', 'Mettetal', '39656 Kings Way', 'TX', '214-751-6652');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (481, 12, 'Gasper', 'Fransewich', '12 Continental Pass', 'GA', '770-232-8864');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (482, 13, 'Gordie', 'Newborn', '61158 Anhalt Junction', 'MA', '413-149-4202');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (483, 15, 'Fraze', 'Frankiss', '91691 Comanche Pass', 'IN', '260-747-3981');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (484, 15, 'Bordy', 'Brahams', '007 Caliangt Circle', 'IL', '312-990-6518');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (485, 13, 'Desi', 'Worthington', '0 Mosinee Lane', 'CO', '720-161-3310');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (486, 11, 'Alberto', 'Nangle', '4 Talmadge Center', 'CA', '559-759-1049');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (487, 14, 'Christy', 'Inns', '258 Nova Center', 'IL', '309-826-0568');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (488, 13, 'Cristiano', 'Philler', '33 Gulseth Circle', 'AL', '205-435-7090');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (489, 15, 'Freedman', 'Trout', '71 Lindbergh Court', 'MI', '313-681-3898');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (490, 16, 'Jackie', 'Mussett', '2529 Carberry Park', 'WI', '920-785-2264');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (491, 13, 'Iorgos', 'McGriffin', '84 Briar Crest Parkway', 'OR', '541-317-3351');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (492, 11, 'Ozzy', 'Beckhurst', '30 Waywood Trail', 'MI', '989-570-2665');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (493, 15, 'Kalil', 'Applin', '77 Rigney Circle', 'GA', '706-360-5427');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (494, 14, 'Frazier', 'Waite', '1 Harper Parkway', 'AZ', '520-702-2079');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (495, 12, 'Kippie', 'Petschel', '25 Anhalt Street', 'NE', '402-837-5745');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (496, 12, 'Cy', 'Reaman', '7 Riverside Terrace', 'AL', '256-454-4177');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (497, 10, 'Hazlett', 'Millberg', '0565 Continental Road', 'TX', '469-878-5123');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (498, 12, 'Erick', 'Kenwin', '8085 Kennedy Avenue', 'CA', '213-989-6473');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (499, 11, 'Benjy', 'Fenny', '16 Reinke Hill', 'AL', '205-248-4203');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (500, 16, 'Teodoro', 'Baynon', '21 Westport Way', 'DC', '202-622-6186');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (501, 11, 'Raynor', 'Splevin', '94247 Cascade Way', 'CA', '714-140-7918');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (502, 17, 'Ric', 'Harner', '92439 Hintze Hill', 'FL', '850-727-8594');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (503, 16, 'Noll', 'Milsom', '88812 Huxley Drive', 'CA', '559-522-2064');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (504, 15, 'Rockwell', 'Blesli', '58 Waxwing Alley', 'MS', '228-425-8054');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (505, 11, 'Griffith', 'Rolles', '8304 Surrey Park', 'AK', '907-266-1550');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (506, 15, 'Fergus', 'McOnie', '7 Butterfield Alley', 'NC', '704-656-7718');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (507, 11, 'Bryanty', 'Lauks', '95496 Fair Oaks Point', 'NY', '347-559-4696');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (508, 12, 'Torrance', 'Drever', '13695 Carey Parkway', 'MO', '573-893-2597');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (509, 12, 'Moishe', 'Korous', '17657 Farmco Center', 'TX', '915-531-5334');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (510, 11, 'Darrick', 'O''Scannill', '5 Anhalt Center', 'VA', '757-451-7205');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (511, 11, 'Aldo', 'Pickthorne', '13 American Ash Trail', 'NY', '585-690-0270');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (512, 11, 'Titus', 'Nanson', '56814 Tennessee Circle', 'FL', '407-564-7471');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (513, 11, 'Quincy', 'Selway', '05 Clarendon Parkway', 'TX', '682-331-4102');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (514, 15, 'Byron', 'Gavini', '7053 Mandrake Crossing', 'NY', '718-764-2496');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (515, 10, 'Reece', 'Mannooch', '3 American Ash Terrace', 'VA', '703-195-3917');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (516, 13, 'Sherwin', 'Kerrane', '2888 Dexter Hill', 'AR', '501-116-3300');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (517, 14, 'Kennedy', 'Illwell', '2 Northport Alley', 'CA', '323-520-1485');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (518, 15, 'Eli', 'Ladley', '51 Melby Place', 'NC', '919-500-4060');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (519, 14, 'Rodney', 'De Ortega', '08 Meadow Ridge Center', 'SC', '843-855-0589');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (520, 14, 'Troy', 'Pitblado', '3 Loeprich Park', 'ID', '208-780-3784');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (521, 15, 'Shelton', 'Dutson', '9181 Marcy Junction', 'TX', '713-795-3409');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (522, 12, 'August', 'Dover', '4841 Almo Alley', 'CA', '916-548-5466');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (523, 10, 'Esme', 'Olek', '55543 Springs Pass', 'CT', '203-419-1166');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (524, 14, 'Ricard', 'Fendt', '32 Towne Center', 'TX', '409-240-7836');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (525, 17, 'Noam', 'Petrina', '39 Northview Alley', 'NE', '402-610-1940');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (526, 14, 'Micky', 'Beverley', '5 Hoffman Parkway', 'CA', '650-344-0606');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (527, 14, 'Montgomery', 'Callen', '3188 Southridge Crossing', 'CA', '916-504-4430');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (528, 13, 'Allyn', 'Dilleway', '4057 Monument Avenue', 'UT', '801-574-8190');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (529, 15, 'Jule', 'Champkin', '03832 Westridge Terrace', 'MT', '406-206-7676');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (530, 11, 'Borg', 'Rove', '2 3rd Court', 'DC', '202-956-3141');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (531, 10, 'Riordan', 'Rontsch', '13 Green Ridge Way', 'FL', '239-520-4093');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (532, 14, 'Barnabas', 'Gideon', '822 Armistice Pass', 'WI', '414-881-7979');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (533, 10, 'Nichole', 'Hebblethwaite', '6 Green Ridge Drive', 'MO', '816-136-7086');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (534, 11, 'Morly', 'Marre', '3565 Dahle Avenue', 'CT', '860-830-4894');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (535, 17, 'Morgen', 'Hebblewhite', '98 Chive Way', 'FL', '407-988-5488');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (536, 17, 'Tadd', 'Duignan', '66 Sloan Center', 'OK', '405-257-5072');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (537, 17, 'Norman', 'Guyer', '15 Superior Point', 'MO', '314-761-3510');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (538, 17, 'Heindrick', 'Stocking', '74 Maryland Park', 'CO', '303-731-6415');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (539, 17, 'Chrisse', 'Foch', '66 Prairie Rose Junction', 'MI', '313-575-9317');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (540, 13, 'Chip', 'Duchant', '80962 Walton Park', 'MA', '617-356-5032');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (541, 13, 'Jeremias', 'Bayford', '9 Vernon Road', 'CA', '661-232-0555');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (542, 13, 'Berty', 'Chiplen', '30196 Pearson Alley', 'MT', '406-416-5891');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (543, 12, 'Godard', 'Scotts', '5 Mayfield Crossing', 'NV', '775-720-6648');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (544, 11, 'Zachary', 'Degoy', '417 Lakewood Plaza', 'OK', '405-974-1152');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (545, 12, 'Hugo', 'Parfrey', '71 Stuart Place', 'AZ', '602-900-5119');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (546, 15, 'Cletis', 'Jimes', '507 Reindahl Court', 'CA', '559-521-3495');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (547, 17, 'John', 'Tomowicz', '152 Melody Center', 'IA', '319-733-8890');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (548, 17, 'Cece', 'Leyson', '45353 Knutson Plaza', 'FL', '786-901-0609');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (549, 11, 'Dolph', 'Treher', '76 Havey Drive', 'GA', '678-165-3591');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (550, 12, 'Knox', 'Mahy', '241 Caliangt Circle', 'TX', '214-731-0965');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (551, 15, 'Constantino', 'Rattry', '8089 Maywood Drive', 'CA', '209-228-8515');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (552, 10, 'Rockey', 'Iacapucci', '54972 Bunker Hill Place', 'FL', '904-995-2246');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (553, 14, 'Osbourne', 'Bridie', '22316 Mayfield Avenue', 'AZ', '602-395-6931');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (554, 17, 'Rad', 'Izzard', '10176 Oneill Road', 'WA', '360-149-9697');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (555, 16, 'Jeffie', 'Drysdale', '395 Holmberg Point', 'CA', '925-787-6377');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (556, 11, 'Mortimer', 'Bradbury', '5629 Hansons Place', 'CA', '408-528-6633');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (557, 17, 'Garek', 'McCarthy', '2984 Elmside Avenue', 'VA', '757-588-8174');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (558, 12, 'Owen', 'Yearn', '47 Westerfield Court', 'NY', '607-136-8091');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (559, 16, 'Raffaello', 'Elmar', '27 Coleman Center', 'DC', '202-807-9855');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (560, 17, 'Simmonds', 'Brandenberg', '08 Green Ridge Plaza', 'IN', '317-855-5320');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (561, 13, 'Blaine', 'Matys', '1 Larry Terrace', 'TX', '210-408-1274');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (562, 16, 'Napoleon', 'Dyne', '93 Buena Vista Court', 'GA', '229-215-4606');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (563, 12, 'Dennie', 'Georgiev', '78673 6th Lane', 'FL', '321-809-1985');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (564, 12, 'Maxie', 'Eynald', '935 Memorial Pass', 'CT', '203-915-0944');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (565, 14, 'Hagan', 'Coulston', '64 Michigan Terrace', 'DC', '202-770-5161');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (566, 13, 'Lek', 'Olliar', '6686 Kennedy Lane', 'TN', '865-425-7469');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (567, 13, 'Rudolfo', 'McElvogue', '1330 North Drive', 'VA', '757-887-0318');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (568, 16, 'Washington', 'Mordon', '836 Roxbury Trail', 'SC', '803-400-6587');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (569, 16, 'Luther', 'Proud', '400 Lakeland Way', 'MD', '301-760-8462');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (570, 11, 'Laurens', 'Flack', '431 Eagan Drive', 'NM', '505-855-0091');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (571, 13, 'Pavel', 'Kondratyuk', '862 Sullivan Drive', 'WA', '509-344-3884');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (572, 12, 'Salem', 'Treffry', '69383 Forest Trail', 'DC', '202-586-3823');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (573, 10, 'Yancy', 'Ivanishev', '0436 Becker Center', 'GA', '912-871-2811');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (574, 12, 'Sawyere', 'Cicero', '437 Mockingbird Junction', 'FL', '813-165-0259');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (575, 17, 'Kellby', 'Mum', '77413 Rowland Pass', 'CA', '760-825-9876');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (576, 15, 'Burg', 'Paulsson', '0 Victoria Terrace', 'NE', '402-706-2576');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (577, 15, 'Tommie', 'Carncross', '55 Brentwood Terrace', 'GA', '404-869-0363');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (578, 11, 'Hendrik', 'Scyone', '89 7th Pass', 'CA', '626-362-9936');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (579, 12, 'Marion', 'Ruoff', '797 Bluestem Court', 'FL', '786-267-6561');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (580, 14, 'Mikael', 'Fitchett', '569 Vernon Hill', 'MA', '617-279-2803');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (581, 16, 'Artur', 'Piken', '004 Cascade Junction', 'ID', '208-957-9292');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (582, 11, 'Niven', 'Jedrysik', '272 Stephen Park', 'FL', '727-412-6838');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (583, 14, 'Gearalt', 'Putman', '12285 Ludington Terrace', 'TX', '361-729-1985');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (584, 13, 'Hobey', 'Cockson', '6 Hooker Junction', 'GA', '770-335-3785');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (585, 16, 'Rusty', 'Marte', '48729 Petterle Pass', 'WI', '414-890-2504');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (586, 14, 'Jamesy', 'Dovey', '4 Oak Valley Place', 'CT', '203-928-9215');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (587, 10, 'Nestor', 'Pierpoint', '4 Village Green Terrace', 'MN', '612-524-5330');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (588, 15, 'Keane', 'Eglin', '3767 Bay Terrace', 'NY', '716-438-8379');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (589, 11, 'Harlen', 'Skeats', '2367 Rieder Junction', 'CA', '310-762-1426');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (590, 15, 'Frederick', 'Hullins', '158 Becker Alley', 'TX', '469-755-6291');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (591, 13, 'Lyell', 'Fritche', '1263 Bluestem Junction', 'IL', '312-761-0635');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (592, 10, 'Rodolphe', 'Ablitt', '84787 Sullivan Point', 'KY', '502-543-9368');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (593, 13, 'Kendrick', 'Brogini', '82 Cambridge Crossing', 'MO', '314-670-5996');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (594, 17, 'Beniamino', 'Wrench', '902 Grim Terrace', 'NY', '518-930-9199');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (595, 17, 'Toddie', 'Henrichs', '5034 Village Parkway', 'CA', '562-752-9655');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (596, 15, 'Buck', 'Lewson', '0282 Arizona Road', 'DC', '202-467-5484');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (597, 14, 'Clarance', 'Jeavons', '46347 Menomonie Park', 'CA', '619-106-8856');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (598, 17, 'Norry', 'Pischof', '5 Loeprich Place', 'CA', '951-941-0909');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (599, 17, 'Rowan', 'Wooddisse', '58074 Glendale Circle', 'FL', '941-267-8763');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (600, 17, 'Ewen', 'Bassick', '305 Anthes Terrace', 'DC', '202-592-0756');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (601, 17, 'Eddy', 'Golly', '20763 Bayside Alley', 'DE', '302-570-5658');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (602, 16, 'Mordy', 'Dongles', '90622 Moose Court', 'NV', '702-614-5983');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (603, 17, 'Dieter', 'Baudy', '039 Melody Lane', 'IL', '309-761-4684');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (604, 12, 'Keefe', 'Crain', '21 Mallory Center', 'NY', '212-504-7114');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (605, 15, 'Barn', 'Fitchett', '24394 Little Fleur Terrace', 'CA', '714-225-9630');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (606, 10, 'Prentiss', 'Trulocke', '63964 Sauthoff Circle', 'TX', '210-550-6409');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (607, 16, 'Wells', 'Stollen', '93 Ramsey Junction', 'IA', '515-988-2708');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (608, 17, 'Christos', 'Gronno', '375 Pawling Parkway', 'DC', '202-180-2487');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (609, 17, 'Hobey', 'Glisenan', '6 Sage Place', 'NJ', '609-138-7857');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (610, 15, 'Chrissie', 'Crowder', '95752 Chive Street', 'FL', '561-558-5913');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (611, 11, 'Barnaby', 'Muffett', '594 Evergreen Alley', 'NJ', '201-585-7995');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (612, 16, 'Hailey', 'Cantrell', '12841 Express Alley', 'OH', '513-107-8725');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (613, 12, 'Guillaume', 'Robinette', '4464 Debra Street', 'MN', '612-352-2837');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (614, 14, 'Brandtr', 'Gallgher', '6044 Riverside Alley', 'CA', '213-808-1162');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (615, 11, 'Evelyn', 'Halbeard', '3390 Bellgrove Drive', 'TN', '865-368-6814');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (616, 11, 'Beaufort', 'Druery', '7 Rusk Avenue', 'VA', '703-339-3322');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (617, 10, 'Kalle', 'Gosnell', '85847 Mariners Cove Drive', 'KY', '502-106-4873');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (618, 16, 'Antons', 'Clutten', '9950 1st Plaza', 'GA', '912-811-9471');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (619, 10, 'Boone', 'Yearnsley', '61112 Jay Alley', 'OH', '419-938-3669');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (620, 16, 'Reginald', 'Smail', '75 Pleasure Lane', 'MN', '763-760-2254');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (621, 14, 'Emerson', 'Crisp', '66751 Fair Oaks Plaza', 'FL', '305-689-3253');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (622, 12, 'Tris', 'Glentz', '9 Pleasure Hill', 'DC', '202-614-0994');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (623, 13, 'Warden', 'Charles', '22074 Declaration Street', 'IL', '773-767-4439');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (624, 15, 'Sampson', 'Kiehl', '39 Ludington Way', 'KY', '859-888-4543');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (625, 17, 'Winn', 'Dilland', '96 Everett Trail', 'MO', '816-586-3959');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (626, 12, 'Kristoffer', 'Poat', '43 Vera Circle', 'KS', '913-780-2694');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (627, 10, 'Grover', 'Antonomolii', '475 International Road', 'CA', '530-987-3719');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (628, 13, 'Immanuel', 'Menichillo', '46025 Dunning Point', 'TX', '830-462-0382');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (629, 15, 'Glen', 'Oxtiby', '10229 Stone Corner Circle', 'TX', '979-693-6633');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (630, 13, 'Dex', 'Crick', '90393 Burning Wood Drive', 'WA', '253-786-4648');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (631, 10, 'Chadwick', 'Ranyelld', '107 Hovde Center', 'MD', '410-191-3083');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (632, 11, 'Huntlee', 'Kisbee', '7654 International Way', 'WV', '304-262-1346');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (633, 16, 'Zebulen', 'Mulroy', '2414 Daystar Center', 'CO', '719-416-3868');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (634, 12, 'Bruce', 'Jobb', '30139 Florence Parkway', 'TX', '682-418-5280');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (635, 16, 'Emanuele', 'Chappel', '448 Butterfield Parkway', 'MD', '410-845-6552');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (636, 16, 'Filberte', 'Yekel', '1704 Lukken Crossing', 'NY', '212-528-4991');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (637, 12, 'Monroe', 'Lauridsen', '58711 Oak Point', 'WI', '608-554-7581');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (638, 12, 'Johann', 'MacElroy', '841 Golf View Center', 'FL', '727-612-2725');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (639, 13, 'Michale', 'Gladdolph', '73 6th Circle', 'TX', '806-745-5503');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (640, 12, 'Rudolfo', 'Fierro', '05225 Armistice Pass', 'IN', '812-173-0258');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (641, 12, 'Blaine', 'Callen', '8112 Sugar Parkway', 'MD', '410-995-9406');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (642, 14, 'Roman', 'Richt', '2 Swallow Hill', 'DC', '202-226-1444');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (643, 10, 'Bengt', 'Baldassi', '334 Arapahoe Crossing', 'MS', '601-244-4478');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (644, 12, 'Broderic', 'Felix', '9 Lakewood Gardens Center', 'OH', '513-288-3235');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (645, 16, 'Iago', 'Coen', '9 Park Meadow Trail', 'TX', '713-130-0270');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (646, 16, 'Inglis', 'Shewon', '1231 Park Meadow Pass', 'NC', '336-606-3773');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (647, 13, 'Alphonso', 'Saull', '14 Moulton Court', 'CA', '626-427-8409');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (648, 10, 'Rodolfo', 'Beesley', '214 Sutherland Hill', 'LA', '318-180-7859');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (649, 16, 'Tyrone', 'Adamsen', '6751 Crownhardt Point', 'OH', '513-855-1394');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (650, 16, 'Estevan', 'Smithson', '1483 Maryland Alley', 'SD', '605-914-3084');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (651, 11, 'Elden', 'Taffe', '7 Lakewood Gardens Road', 'IN', '765-318-7669');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (652, 17, 'Rafael', 'Fores', '4994 Charing Cross Junction', 'OR', '503-457-5435');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (653, 16, 'Vaughan', 'Kobierra', '4 Amoth Point', 'NC', '704-358-2488');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (654, 12, 'Shelley', 'Willbourne', '41 Gale Point', 'PA', '215-788-0363');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (655, 10, 'Tamas', 'Conkay', '89551 Everett Avenue', 'IN', '765-529-9368');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (656, 17, 'Jeremie', 'Sima', '40405 Killdeer Avenue', 'PA', '610-691-2193');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (657, 14, 'Lowrance', 'Burrus', '4 Di Loreto Hill', 'MO', '816-964-0038');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (658, 17, 'Raimondo', 'Marden', '8 Springview Court', 'AR', '501-954-4880');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (659, 16, 'Torey', 'Lawrinson', '38679 Comanche Court', 'OK', '918-275-8812');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (660, 10, 'Vic', 'Siveter', '12 Londonderry Park', 'DC', '202-120-7722');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (661, 12, 'Ali', 'Levick', '491 Judy Park', 'FL', '813-968-4881');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (662, 16, 'Corbin', 'Gerin', '7579 Roxbury Lane', 'KS', '785-136-5762');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (663, 17, 'Bondie', 'Capsey', '11731 Del Mar Lane', 'NM', '505-158-1294');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (664, 14, 'Antonino', 'Tilberry', '9131 Fairfield Terrace', 'FL', '239-497-6484');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (665, 15, 'Tedd', 'Brient', '0 Pearson Street', 'WI', '608-966-3186');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (666, 10, 'Leigh', 'Shaxby', '08 Rowland Circle', 'NM', '505-623-5591');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (667, 17, 'Parker', 'MacKessock', '02847 2nd Terrace', 'PA', '484-442-4230');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (668, 17, 'Raimondo', 'Arkcoll', '124 Manley Parkway', 'CA', '714-123-0996');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (669, 11, 'Levy', 'Kairns', '29 Cherokee Point', 'VA', '571-565-6221');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (670, 15, 'Frederich', 'Drakes', '42382 Veith Parkway', 'IL', '312-498-3967');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (671, 15, 'Roma', 'Prime', '4 Harbort Street', 'NC', '919-452-1473');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (672, 15, 'Kain', 'Girke', '8891 Miller Lane', 'FL', '904-706-5834');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (673, 17, 'Armstrong', 'Lawlee', '2 Esker Junction', 'TX', '806-247-1635');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (674, 16, 'Iosep', 'Smy', '6 Lake View Terrace', 'TX', '806-698-4982');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (675, 10, 'Reinold', 'Deignan', '176 Arapahoe Junction', 'FL', '941-584-8028');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (676, 12, 'Meyer', 'Ilyinykh', '000 Surrey Place', 'AK', '907-732-4481');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (677, 13, 'Rooney', 'Prosch', '5856 Dwight Road', 'TX', '281-338-5376');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (678, 13, 'Aron', 'Houliston', '6 Fisk Parkway', 'AL', '251-208-1135');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (679, 12, 'Putnam', 'Wood', '15 Tomscot Park', 'CA', '805-317-1606');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (680, 15, 'Harley', 'Furley', '46999 Linden Drive', 'MI', '517-477-3560');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (681, 16, 'Uriah', 'Favela', '7418 Summerview Parkway', 'OH', '937-274-0206');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (682, 10, 'Kerry', 'Holdren', '94 Hoffman Center', 'DC', '202-994-7450');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (683, 17, 'Mose', 'Havis', '3290 Pine View Terrace', 'TX', '214-439-4371');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (684, 10, 'Hazlett', 'Male', '816 Eastlawn Road', 'TX', '830-844-7853');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (685, 13, 'Dukie', 'Ricco', '4 Monterey Avenue', 'OK', '405-686-7047');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (686, 16, 'Jerrie', 'Trunby', '5 Katie Plaza', 'NY', '917-427-8288');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (687, 10, 'Lombard', 'Inkster', '192 Summer Ridge Terrace', 'CT', '860-597-7793');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (688, 11, 'Odie', 'Humbles', '6404 Oriole Place', 'CA', '510-484-6012');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (689, 17, 'Jamill', 'Cicutto', '8628 Portage Circle', 'OK', '918-939-5919');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (690, 15, 'Kimbell', 'Gormley', '6162 Nova Center', 'OH', '419-883-8305');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (691, 11, 'Cesar', 'Wyborn', '797 Golden Leaf Plaza', 'OH', '513-603-0676');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (692, 17, 'Lowrance', 'Capelle', '5132 Leroy Avenue', 'CA', '909-523-7680');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (693, 10, 'Andros', 'Vairow', '8 Riverside Point', 'NV', '775-244-4160');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (694, 14, 'Artemis', 'Lineham', '8089 Summit Parkway', 'NY', '646-964-3521');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (695, 15, 'Steward', 'Petersen', '7258 Burning Wood Crossing', 'IA', '712-118-5955');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (696, 13, 'Budd', 'Rylatt', '51709 Pearson Court', 'TX', '915-962-3384');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (697, 11, 'Meredith', 'MacAnulty', '816 Kingsford Parkway', 'OK', '405-371-0582');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (698, 13, 'Tedie', 'Spratley', '2602 Fordem Terrace', 'CT', '203-982-0509');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (699, 14, 'Levey', 'Devlin', '03 Kedzie Drive', 'WV', '304-422-1778');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (700, 11, 'Dietrich', 'Viner', '831 Old Shore Lane', 'FL', '727-137-8210');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (701, 17, 'Willdon', 'De Roberto', '32 Stuart Terrace', 'TX', '972-869-0364');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (702, 15, 'Seymour', 'Pollak', '71 Northfield Court', 'GA', '404-131-2553');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (703, 10, 'Johnathon', 'Stawell', '357 New Castle Park', 'TX', '713-760-7986');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (704, 13, 'Laird', 'Troth', '180 Darwin Center', 'MA', '617-890-3009');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (705, 17, 'Huntley', 'Gerant', '09 Lunder Place', 'VA', '804-261-5360');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (706, 12, 'Igor', 'Simonard', '1252 Sommers Alley', 'CA', '415-764-6037');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (707, 17, 'Chrissy', 'Gonnely', '28394 Sunbrook Crossing', 'PA', '412-525-2044');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (708, 15, 'Theodore', 'Paterson', '613 Talmadge Terrace', 'TX', '713-624-4327');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (709, 17, 'Burnard', 'Jordison', '95272 Doe Crossing Pass', 'MA', '339-169-7622');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (710, 12, 'Ulysses', 'Delany', '897 Crest Line Junction', 'CA', '510-103-2084');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (711, 14, 'Quint', 'Frangione', '55296 Valley Edge Pass', 'FL', '321-230-5692');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (712, 13, 'Matthus', 'Guerrin', '3761 Cambridge Court', 'CA', '619-331-4314');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (713, 13, 'Bennie', 'Sansome', '848 Michigan Place', 'OR', '971-953-2951');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (714, 16, 'Chick', 'Pritty', '49403 Quincy Lane', 'NY', '212-474-3602');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (715, 12, 'Kent', 'Daft', '5 Arizona Lane', 'LA', '337-196-6327');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (716, 16, 'Bone', 'Wotton', '78 Kensington Lane', 'NY', '718-926-6686');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (717, 17, 'Bernard', 'Fruchter', '12 Logan Court', 'CA', '818-911-3163');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (718, 11, 'Reinald', 'Tee', '76626 Stuart Park', 'DC', '202-548-4567');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (719, 14, 'Charlton', 'Grayston', '0708 Carey Alley', 'TX', '254-209-7235');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (720, 10, 'Carney', 'Shwenn', '56 La Follette Plaza', 'GA', '404-484-0911');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (721, 12, 'Filberto', 'Trevino', '09762 Oriole Plaza', 'WI', '608-705-7070');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (722, 17, 'Jarib', 'Turfin', '4115 Knutson Circle', 'DC', '202-990-7276');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (723, 15, 'Tanner', 'Stienton', '4838 Schurz Court', 'KS', '316-975-2265');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (724, 10, 'Felike', 'Silkstone', '1607 Maywood Center', 'TX', '281-144-5625');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (725, 15, 'Jean', 'Bezemer', '75 Nobel Center', 'FL', '305-351-3482');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (726, 11, 'Rockey', 'Uc', '8 Hovde Pass', 'TX', '214-421-1821');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (727, 13, 'Marlow', 'Le Teve', '8 Melvin Alley', 'MO', '816-150-6579');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (728, 14, 'Che', 'Kose', '3963 Sycamore Plaza', 'MN', '763-972-3984');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (729, 13, 'Errol', 'Flude', '7305 Browning Place', 'DC', '202-971-9682');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (730, 12, 'Bartholomew', 'Moffett', '5 Brickson Park Lane', 'OH', '937-687-3095');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (731, 12, 'Ned', 'Gaskal', '19753 North Road', 'NM', '505-600-1714');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (732, 13, 'Trueman', 'MacManus', '51 Farragut Way', 'OH', '937-559-9651');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (733, 10, 'Percival', 'Bertrand', '73 4th Point', 'AL', '256-158-0151');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (734, 13, 'Benyamin', 'Pischof', '08558 Sommers Trail', 'OR', '503-677-1920');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (735, 16, 'Enrique', 'Vobes', '433 Fair Oaks Hill', 'TX', '469-682-7577');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (736, 16, 'Alair', 'Lippiatt', '4 Oriole Crossing', 'MN', '952-827-2507');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (737, 11, 'Oren', 'Paulsen', '42404 Delaware Crossing', 'PA', '814-800-7035');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (738, 10, 'Tirrell', 'Rosa', '62 Arrowood Plaza', 'OH', '937-217-1206');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (739, 16, 'Stirling', 'Dybell', '57057 Northridge Circle', 'AK', '907-152-7190');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (740, 12, 'Alexei', 'Edward', '89 Packers Point', 'NY', '516-337-6049');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (741, 14, 'Quinton', 'Ollive', '38 Lake View Avenue', 'FL', '727-829-3061');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (742, 12, 'Wait', 'Garrelts', '37 Hansons Street', 'CA', '310-489-6787');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (743, 15, 'Owen', 'Grills', '84 North Point', 'GA', '229-496-3242');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (744, 11, 'Benjy', 'Buxsey', '21185 Larry Way', 'AL', '205-951-8575');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (745, 15, 'Harwilll', 'Ezzle', '13 Linden Plaza', 'WV', '304-277-3496');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (746, 13, 'Temp', 'Kirckman', '4157 Northwestern Lane', 'OK', '405-994-5467');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (747, 13, 'Elbert', 'Kincey', '85789 Sommers Plaza', 'NE', '402-585-4127');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (748, 15, 'Dougie', 'Bauldrey', '481 Park Meadow Way', 'TX', '940-722-3285');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (749, 14, 'Jeffry', 'Tapley', '26 Esch Terrace', 'PA', '724-616-4897');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (750, 15, 'Stanislaus', 'Piel', '49 Old Gate Circle', 'AL', '205-187-7761');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (751, 17, 'Isador', 'Saggers', '32688 Lien Terrace', 'MI', '313-856-5280');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (752, 10, 'Teodoro', 'Risso', '14 Hansons Plaza', 'CA', '559-805-0556');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (753, 14, 'Griz', 'O''Keevan', '8499 Talisman Junction', 'CA', '909-998-9393');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (754, 14, 'Laurent', 'Ackeroyd', '2 Burrows Hill', 'PA', '814-546-5527');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (755, 13, 'Nicko', 'O''Hartagan', '0 Thierer Lane', 'MI', '517-967-8050');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (756, 10, 'Alon', 'Penzer', '28 Southridge Drive', 'WI', '920-250-6347');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (757, 15, 'Jackson', 'Soda', '2109 Fairfield Point', 'OK', '405-721-3053');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (758, 11, 'Nickolas', 'Cowen', '7545 Memorial Circle', 'PA', '412-586-1597');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (759, 15, 'Augusto', 'Forestel', '5603 Crest Line Pass', 'GA', '404-190-9149');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (760, 10, 'Filmer', 'Hessle', '0671 Macpherson Road', 'OH', '513-588-2286');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (761, 12, 'Yehudit', 'Stredwick', '23199 Ohio Way', 'OH', '419-276-9972');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (762, 11, 'Vite', 'Dumbleton', '0186 Corben Avenue', 'IA', '515-734-2050');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (763, 12, 'Conrade', 'McCrudden', '94 Drewry Junction', 'DC', '202-444-9124');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (764, 15, 'Sanderson', 'Mercer', '1 Cordelia Street', 'CA', '805-850-1551');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (765, 14, 'Tirrell', 'Swigg', '29644 Sherman Alley', 'TX', '254-685-4205');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (766, 12, 'Cecilius', 'Chicchelli', '80921 Memorial Pass', 'FL', '239-930-8034');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (767, 15, 'Mayor', 'Skaid', '779 Orin Hill', 'AL', '205-318-5259');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (768, 14, 'Quill', 'Lionel', '1608 Warbler Court', 'CT', '203-552-5289');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (769, 10, 'Jedediah', 'Wilkerson', '0334 Mesta Place', 'CA', '760-866-6632');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (770, 13, 'Wayne', 'Norgate', '24201 Ronald Regan Avenue', 'AR', '501-574-5733');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (771, 13, 'Booth', 'McCabe', '59 Fremont Alley', 'MD', '443-939-6665');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (772, 12, 'Stafford', 'Gormley', '392 Briar Crest Hill', 'AL', '334-794-5115');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (773, 12, 'Witty', 'Norcop', '19 Summerview Trail', 'AL', '205-362-1397');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (774, 13, 'Kimble', 'Drysdell', '11046 Mesta Lane', 'FL', '941-622-0055');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (775, 10, 'Matthaeus', 'Bierton', '9277 Hooker Point', 'TX', '713-167-8651');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (776, 11, 'Padraig', 'Conn', '62707 Montana Lane', 'TN', '865-236-5110');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (777, 16, 'Aleksandr', 'Helstrom', '003 High Crossing Crossing', 'CA', '323-788-1201');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (778, 10, 'Johnathon', 'Middlemiss', '93 Pine View Alley', 'CA', '408-534-8883');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (779, 16, 'Emmy', 'Dranfield', '4248 Waywood Road', 'OR', '503-995-2979');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (780, 11, 'Ferd', 'Winter', '891 Center Center', 'FL', '941-216-4721');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (781, 17, 'Sanderson', 'Milroy', '1 Trailsway Circle', 'CA', '916-284-4434');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (782, 14, 'Franzen', 'Harbour', '9875 Graceland Street', 'MO', '314-504-3348');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (783, 16, 'Bendix', 'Tilling', '9 Mallard Hill', 'TX', '915-216-9521');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (784, 11, 'Ezechiel', 'Rugge', '1825 Macpherson Drive', 'CA', '408-750-0616');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (785, 11, 'Daryl', 'Battaille', '0 Lakeland Junction', 'FL', '321-887-0821');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (786, 10, 'Quill', 'Tong', '1318 Esch Terrace', 'TX', '214-967-4744');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (787, 15, 'Lockwood', 'Markwelley', '4 Pierstorff Court', 'TX', '713-540-3096');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (788, 16, 'Gallagher', 'D''Ruel', '759 Tennessee Court', 'CA', '951-690-9541');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (789, 17, 'Waring', 'Arnott', '91 Tennyson Drive', 'IL', '309-657-0712');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (790, 13, 'Ritchie', 'Proctor', '4250 Walton Center', 'TX', '214-884-8423');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (791, 13, 'Tuck', 'Deelay', '3066 Maple Wood Pass', 'CA', '818-884-1155');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (792, 13, 'Winnie', 'Antoszczyk', '297 Union Way', 'MN', '612-111-9429');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (793, 10, 'Jake', 'Corrigan', '62845 Starling Avenue', 'KS', '816-509-8665');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (794, 15, 'Bartolemo', 'Ickovici', '77 Summit Avenue', 'CA', '559-607-4739');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (795, 10, 'Stan', 'Eggers', '97753 Walton Drive', 'DE', '302-748-2973');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (796, 12, 'Dallis', 'Denziloe', '6 Coleman Court', 'MO', '314-328-0134');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (797, 15, 'Edgardo', 'Beagin', '6658 Schurz Lane', 'NY', '315-809-6928');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (798, 15, 'Merwyn', 'Colisbe', '06629 Holy Cross Point', 'SC', '864-235-6213');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (799, 11, 'Shepard', 'Mordie', '84620 Moulton Center', 'OH', '513-896-6502');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (800, 15, 'Den', 'Rigolle', '00 Shopko Way', 'FL', '754-249-3052');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (801, 10, 'Granger', 'Pratte', '466 Spaight Court', 'IA', '319-741-7313');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (802, 16, 'Briggs', 'McIver', '01 Stuart Crossing', 'WA', '509-729-2104');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (803, 16, 'Creighton', 'Bandiera', '68 Cottonwood Terrace', 'OH', '216-232-1510');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (804, 15, 'Tomlin', 'Pullar', '989 Bultman Terrace', 'OH', '513-836-0810');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (805, 11, 'Jens', 'Harberer', '227 Ludington Avenue', 'DC', '202-282-3101');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (806, 11, 'Vernor', 'Gosnall', '58 Susan Junction', 'CA', '619-672-6940');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (807, 12, 'Joaquin', 'Canning', '7694 Dennis Street', 'CO', '719-650-0124');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (808, 10, 'Lombard', 'Yegorovnin', '4679 Londonderry Junction', 'OH', '513-312-9938');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (809, 15, 'Gerhard', 'Ubanks', '7 Gulseth Lane', 'TN', '615-953-7453');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (810, 13, 'Thebault', 'Esche', '3 Southridge Plaza', 'TX', '915-222-2274');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (811, 16, 'Tannie', 'Seery', '25846 Blackbird Center', 'NV', '702-517-6889');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (812, 14, 'Rossie', 'Cancellieri', '5 Moose Avenue', 'CA', '559-193-7457');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (813, 16, 'Joshua', 'Felkin', '2 Lakeland Junction', 'CA', '415-920-4811');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (814, 14, 'Pembroke', 'Teaz', '51 Fieldstone Plaza', 'WV', '304-288-6131');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (815, 11, 'Tiler', 'Domsalla', '547 Vernon Parkway', 'VA', '571-599-1659');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (816, 10, 'Bradan', 'Pales', '40 Ridge Oak Hill', 'KS', '913-658-0053');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (817, 12, 'Merrill', 'Rottcher', '706 Bultman Park', 'IL', '630-324-9706');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (818, 16, 'Jerrie', 'Durward', '2935 Grayhawk Alley', 'CA', '805-859-2820');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (819, 15, 'Benji', 'Ivanusyev', '32 Pennsylvania Street', 'VA', '804-715-6675');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (820, 17, 'Buddy', 'Sowten', '14870 Nancy Way', 'ID', '208-663-2779');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (821, 15, 'Neal', 'Handaside', '12 Randy Trail', 'FL', '813-169-5618');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (822, 14, 'Vassili', 'Fautley', '52192 Commercial Trail', 'WA', '509-957-6570');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (823, 12, 'Rance', 'Lidierth', '76 Anniversary Street', 'KY', '859-817-9848');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (824, 11, 'Lucian', 'Gaul', '5184 Dapin Plaza', 'MN', '218-684-0469');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (825, 15, 'Rorke', 'Leckie', '8712 Grayhawk Junction', 'PA', '215-592-5304');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (826, 17, 'Matthias', 'Lintott', '903 Melvin Trail', 'NV', '702-916-0466');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (827, 13, 'Ancell', 'Grandison', '45 Oriole Park', 'ND', '701-533-1864');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (828, 14, 'Bucky', 'Wemes', '96 Hollow Ridge Trail', 'TX', '713-406-1468');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (829, 17, 'Carny', 'Whiscard', '31 Carey Hill', 'NY', '212-142-6334');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (830, 13, 'Odell', 'Deboy', '2886 Northland Way', 'AL', '205-190-5330');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (831, 14, 'Patric', 'Brimelow', '315 Hudson Drive', 'OR', '971-255-1814');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (832, 15, 'Wiatt', 'MacElroy', '49196 Quincy Lane', 'CT', '203-512-2589');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (833, 15, 'Merell', 'Poor', '58 Quincy Point', 'WV', '304-319-4941');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (834, 15, 'Ruperto', 'Rutley', '8 Towne Pass', 'ID', '208-182-4546');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (835, 14, 'Carey', 'Boyall', '53 Carpenter Circle', 'TX', '214-866-7771');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (836, 13, 'Bent', 'Puckey', '819 Orin Way', 'ND', '701-172-5540');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (837, 11, 'Whitman', 'Brookshaw', '08106 Montana Trail', 'TX', '832-762-0684');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (838, 12, 'Konstantine', 'Tranter', '34 Hazelcrest Park', 'NE', '402-880-9115');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (839, 15, 'Brodie', 'Beckers', '26 Weeping Birch Pass', 'NV', '775-258-7254');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (840, 14, 'Weston', 'Fairbrother', '2 Anhalt Circle', 'TX', '210-785-1966');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (841, 13, 'Elvin', 'Brilon', '2807 Bashford Hill', 'WI', '920-811-5458');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (842, 12, 'Kaine', 'Lamborn', '2397 Farwell Parkway', 'CA', '805-862-8324');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (843, 14, 'Dewain', 'Praundlin', '2375 Independence Way', 'TX', '903-141-8318');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (844, 16, 'Conrado', 'Haistwell', '293 Bunting Pass', 'CA', '916-813-7960');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (845, 16, 'Duff', 'Sara', '99167 Hintze Circle', 'MS', '662-677-4711');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (846, 15, 'Land', 'Autrie', '82575 Carpenter Center', 'DC', '202-119-3335');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (847, 15, 'Cordie', 'O''Loughnan', '81938 Kingsford Park', 'ND', '701-526-4844');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (848, 13, 'Millard', 'Everit', '342 Dovetail Trail', 'TX', '214-715-8863');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (849, 12, 'Orrin', 'Beddows', '55075 Messerschmidt Junction', 'NV', '702-306-7956');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (850, 12, 'Felice', 'Seagood', '175 Declaration Pass', 'GA', '706-676-1554');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (851, 11, 'Bartram', 'Jubert', '3 Hoepker Parkway', 'TX', '832-686-4366');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (852, 17, 'Graeme', 'Arro', '93675 Esch Circle', 'FL', '941-638-4677');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (853, 10, 'Royall', 'Welfare', '680 Norway Maple Plaza', 'FL', '850-447-2038');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (854, 12, 'Yvon', 'Eastwood', '75322 Grasskamp Lane', 'FL', '305-143-0670');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (855, 16, 'Hurleigh', 'Baty', '1604 Stoughton Lane', 'TX', '361-973-9755');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (856, 15, 'Todd', 'Le-Good', '5286 Menomonie Trail', 'NJ', '551-710-7227');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (857, 15, 'Ahmed', 'Huard', '992 Sage Point', 'MO', '816-275-0184');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (858, 13, 'Thorstein', 'Kloska', '6 5th Junction', 'ID', '208-539-4698');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (859, 12, 'Welch', 'Margiotta', '2899 2nd Road', 'FL', '863-137-6590');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (860, 13, 'Alix', 'Fellgatt', '7 Elgar Street', 'NJ', '609-370-9716');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (861, 11, 'Riccardo', 'Pearch', '1 Corben Crossing', 'KY', '606-865-7234');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (862, 17, 'Orton', 'Guilliatt', '414 Roxbury Way', 'MN', '651-100-8212');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (863, 12, 'Maurice', 'Muncaster', '62 Mesta Place', 'TX', '972-641-5450');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (864, 16, 'Travers', 'Gremane', '12255 Shoshone Circle', 'NY', '646-898-2488');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (865, 10, 'Osbourn', 'Karoly', '9464 Esker Avenue', 'WA', '253-625-2912');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (866, 16, 'Elvyn', 'Boyton', '451 Magdeline Way', 'FL', '813-774-0005');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (867, 15, 'Marwin', 'Tunnow', '16 Lyons Road', 'IA', '515-419-7906');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (868, 15, 'Portie', 'Kirkland', '314 Norway Maple Center', 'FL', '772-610-2733');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (869, 14, 'Eliot', 'Hasselby', '87468 Declaration Parkway', 'VA', '540-544-1757');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (870, 12, 'Chase', 'Schankelborg', '80 Talmadge Point', 'LA', '318-992-7122');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (871, 15, 'Stafford', 'Zukerman', '0962 Bunting Trail', 'NY', '646-997-9978');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (872, 10, 'Erick', 'Kenwright', '97 Monica Plaza', 'FL', '850-997-5810');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (873, 13, 'Mathian', 'Leyre', '29376 Warner Park', 'PA', '570-285-5214');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (874, 11, 'Peadar', 'Carvil', '7 Annamark Court', 'IL', '312-171-2206');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (875, 14, 'Henrik', 'Mitten', '0297 Monica Parkway', 'TX', '972-462-4386');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (876, 14, 'Fabian', 'Szimon', '5110 Continental Pass', 'FL', '305-679-3319');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (877, 15, 'De witt', 'Charity', '63833 Hovde Street', 'NY', '347-300-5345');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (878, 13, 'Fredrick', 'Carrabott', '493 Fulton Crossing', 'IN', '260-557-2814');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (879, 11, 'Konstantin', 'Andrioli', '3516 Cordelia Center', 'LA', '504-788-1719');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (880, 13, 'Obadiah', 'Tampling', '332 Fremont Park', 'MO', '417-988-5551');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (881, 11, 'Wolf', 'Welbrock', '767 Randy Trail', 'GA', '678-705-3681');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (882, 15, 'Isac', 'Durtnall', '72 Eastwood Plaza', 'MI', '616-428-7140');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (883, 14, 'Gustavo', 'Burnapp', '9699 Northfield Way', 'KY', '502-959-7046');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (884, 17, 'Shawn', 'De Castri', '57737 Ridgeway Center', 'MI', '313-463-4454');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (885, 12, 'Austin', 'Smithend', '2 Ludington Alley', 'PA', '484-636-0339');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (886, 10, 'Julie', 'McPhillips', '4 Dottie Parkway', 'WV', '304-742-7157');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (887, 16, 'Monty', 'Longhorn', '50997 Bartelt Circle', 'GA', '770-415-3099');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (888, 14, 'Jedidiah', 'Brigshaw', '9 Hintze Center', 'ID', '208-925-4110');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (889, 14, 'Stephen', 'Outridge', '2 Merry Lane', 'MI', '616-414-2006');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (890, 11, 'Izak', 'Fairebrother', '414 Forest Run Road', 'NC', '910-933-3944');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (891, 16, 'Goran', 'Ethelstone', '56091 Bay Drive', 'TX', '817-110-8748');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (892, 10, 'Any', 'Trowbridge', '0338 Pennsylvania Court', 'FL', '786-114-5258');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (893, 15, 'Steffen', 'Aburrow', '00 Bay Lane', 'NJ', '609-800-8010');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (894, 16, 'Jody', 'Vorley', '52 Spenser Alley', 'NY', '315-348-8273');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (895, 14, 'Jocko', 'Pilgram', '1415 Waxwing Alley', 'GA', '404-740-5733');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (896, 14, 'Remington', 'McMenamin', '776 Walton Way', 'TX', '512-426-2003');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (897, 16, 'Ulrick', 'Pods', '69073 Vernon Hill', 'TN', '901-601-6561');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (898, 15, 'Bendick', 'Hoogendorp', '9973 Troy Park', 'NJ', '609-264-5475');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (899, 14, 'Far', 'Lacaze', '11 Karstens Point', 'CA', '559-320-8570');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (900, 11, 'Hobard', 'Drain', '5 Main Court', 'KY', '502-859-0107');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (901, 13, 'Sly', 'Hawkin', '07012 Longview Parkway', 'KY', '502-904-3311');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (902, 17, 'Wittie', 'Jeyness', '93 Chinook Crossing', 'NJ', '862-109-3435');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (903, 14, 'Karlan', 'McCumskay', '8 Weeping Birch Lane', 'TX', '936-414-4119');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (904, 15, 'Petr', 'Scottesmoor', '0168 Acker Park', 'CA', '714-539-8921');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (905, 10, 'Devy', 'Bruty', '04954 Warner Terrace', 'IA', '515-414-3068');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (906, 11, 'Stavro', 'Perview', '93746 Homewood Place', 'DC', '202-443-7995');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (907, 16, 'Robbie', 'Kinman', '870 Ryan Park', 'WA', '360-192-6574');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (908, 13, 'Nickolai', 'Massen', '5125 Logan Circle', 'CT', '203-853-7209');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (909, 11, 'Baldwin', 'Renwick', '66 Thompson Circle', 'MI', '517-523-0103');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (910, 17, 'Cristiano', 'Alexandersen', '737 Petterle Plaza', 'TX', '281-729-5797');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (911, 12, 'Jessee', 'Rathke', '391 Vera Lane', 'GA', '404-930-8138');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (912, 13, 'Kirby', 'Livett', '0033 Cody Street', 'TX', '214-354-8248');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (913, 12, 'Nikki', 'Davinet', '2 Mesta Avenue', 'CA', '831-101-5152');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (914, 16, 'Tuckie', 'Buckby', '4157 Scott Alley', 'CA', '925-878-5936');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (915, 12, 'Udell', 'McGoon', '6 Village Green Plaza', 'IN', '812-963-5071');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (916, 15, 'Maury', 'Willmetts', '35663 Kropf Center', 'RI', '401-579-9355');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (917, 15, 'Ignatius', 'Rodriguez', '9296 Anthes Terrace', 'OH', '614-320-5905');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (918, 17, 'Giorgi', 'Vinck', '557 Delaware Way', 'MS', '601-707-1629');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (919, 10, 'Inglis', 'Orman', '4451 Westend Terrace', 'TX', '214-110-3007');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (920, 10, 'Lalo', 'Summerell', '860 Sutteridge Road', 'OH', '614-589-2374');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (921, 14, 'Reinwald', 'Dochon', '7152 Loomis Junction', 'CA', '818-202-4425');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (922, 15, 'Rock', 'Streight', '1 Lukken Parkway', 'IN', '317-514-8462');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (923, 11, 'Lazare', 'Eddie', '38420 Hayes Court', 'OR', '503-178-4769');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (924, 13, 'Rayner', 'Giovanizio', '4 Bay Lane', 'TX', '210-151-0490');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (925, 14, 'Brok', 'Heckney', '0 Bobwhite Alley', 'VA', '757-933-8847');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (926, 13, 'Creight', 'Ossenna', '42020 Blaine Plaza', 'IL', '312-103-8882');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (927, 16, 'Moshe', 'Crocetti', '64312 Buena Vista Parkway', 'LA', '318-200-4132');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (928, 11, 'Jermayne', 'Weddeburn', '0077 Kensington Junction', 'LA', '225-759-5911');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (929, 17, 'Wilmer', 'Vere', '6 Heffernan Crossing', 'FL', '727-488-6464');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (930, 12, 'Jeno', 'Cohr', '3 Thompson Drive', 'NC', '704-283-2684');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (931, 15, 'Guilbert', 'Langsdon', '30237 Commercial Street', 'CA', '760-602-5990');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (932, 14, 'Kareem', 'Zukierman', '69707 Beilfuss Junction', 'IL', '815-162-3137');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (933, 16, 'Brendis', 'Hembery', '92404 Melvin Center', 'NC', '704-621-9312');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (934, 15, 'Bondy', 'Raleston', '45 Miller Way', 'FL', '941-259-4437');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (935, 11, 'Curran', 'Tilbury', '16454 Mcbride Park', 'FL', '754-261-4094');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (936, 13, 'Quintus', 'Howson', '7 Rusk Place', 'NM', '505-509-4011');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (937, 15, 'Manuel', 'Chasemore', '1 Grim Way', 'CA', '510-444-0860');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (938, 14, 'Jere', 'Chestnutt', '2 Jenna Place', 'AL', '205-911-7389');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (939, 17, 'Henderson', 'Stean', '6 Ramsey Center', 'TX', '512-909-6453');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (940, 12, 'Niki', 'Ramey', '26418 Sunnyside Terrace', 'CA', '714-875-4938');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (941, 13, 'Northrop', 'Virr', '8 Schmedeman Trail', 'TX', '713-265-8385');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (942, 15, 'Panchito', 'Scamerden', '84 Northfield Way', 'TX', '940-500-3161');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (943, 15, 'Gaultiero', 'McIlwreath', '8 Russell Park', 'CA', '408-288-3966');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (944, 13, 'Niko', 'Jentgens', '3 Bobwhite Plaza', 'NY', '718-425-2558');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (945, 12, 'Gustaf', 'Zukierman', '7581 Grover Trail', 'KY', '859-223-8246');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (946, 15, 'Sky', 'Armit', '817 Trailsway Alley', 'WA', '509-503-9910');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (947, 15, 'Demott', 'Rebillard', '4 Northland Junction', 'CO', '719-833-6633');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (948, 16, 'Hans', 'Setterfield', '5632 Morning Center', 'AL', '251-604-8342');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (949, 17, 'Davide', 'Dignam', '42 Jenna Hill', 'NM', '505-414-5773');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (950, 17, 'Percival', 'Cleator', '1572 Caliangt Trail', 'AL', '251-214-9418');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (951, 12, 'Kort', 'Broadwell', '66 Menomonie Junction', 'NC', '919-379-2759');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (952, 15, 'Laird', 'Tilston', '29 Bartillon Way', 'CA', '916-226-3232');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (953, 17, 'Patten', 'Hoyland', '30987 Mockingbird Plaza', 'TX', '936-835-1584');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (954, 11, 'Hodge', 'Lordon', '02 Daystar Plaza', 'NY', '585-801-5181');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (955, 17, 'Dunstan', 'Niess', '012 Golden Leaf Pass', 'TX', '915-872-1368');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (956, 12, 'Cos', 'Snazle', '6 Brentwood Street', 'ND', '701-267-6201');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (957, 11, 'Randell', 'Lawtey', '73230 Hoard Lane', 'NC', '919-158-0468');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (958, 16, 'Franklyn', 'Mason', '6 Sycamore Terrace', 'DC', '202-332-1626');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (959, 15, 'Isidro', 'Lantiff', '8510 Debs Point', 'TX', '915-276-1220');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (960, 14, 'Marven', 'Bownd', '10 Sommers Way', 'AZ', '602-321-6394');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (961, 11, 'Curtis', 'Merrill', '19862 Erie Road', 'OH', '216-422-7946');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (962, 15, 'Chane', 'Vanyatin', '222 Dayton Junction', 'OK', '918-287-1651');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (963, 11, 'Calv', 'Kamien', '2627 Lakewood Junction', 'TX', '214-486-2179');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (964, 17, 'Kahaleel', 'Petera', '91099 Susan Lane', 'TX', '806-694-1184');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (965, 10, 'Kim', 'Sherrock', '88727 Melody Way', 'GA', '770-563-6329');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (966, 13, 'Forrest', 'MacFaul', '936 Katie Way', 'PA', '570-996-7054');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (967, 11, 'Chane', 'Scutter', '69920 Miller Circle', 'WV', '304-600-4174');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (968, 14, 'Dallis', 'Veryard', '090 Leroy Lane', 'PA', '215-846-2891');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (969, 15, 'Abeu', 'Ambrosoli', '248 Northwestern Drive', 'CA', '510-452-8456');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (970, 10, 'Jess', 'Tomlins', '1 Bashford Avenue', 'VA', '804-816-9080');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (971, 10, 'Abeu', 'Karel', '70483 Sloan Pass', 'NV', '702-267-8653');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (972, 15, 'Harlin', 'Mainwaring', '85 Forest Road', 'NJ', '201-155-3108');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (973, 12, 'Onfre', 'Heiner', '032 Laurel Place', 'CO', '719-211-5162');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (974, 10, 'Sidney', 'Lawlor', '270 Hooker Parkway', 'MN', '612-350-5211');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (975, 17, 'Immanuel', 'Lanon', '2096 Basil Parkway', 'TX', '713-609-0474');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (976, 17, 'Archie', 'Gainsboro', '24 Russell Terrace', 'MA', '617-876-8673');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (977, 14, 'Warde', 'Blakemore', '3817 Prairie Rose Street', 'CO', '720-921-0647');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (978, 16, 'Hamlen', 'Welden', '2419 Longview Way', 'VA', '804-846-3244');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (979, 10, 'Enos', 'Pitkins', '42262 Heath Crossing', 'ID', '208-704-6362');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (980, 14, 'Renato', 'Keast', '19 Grayhawk Drive', 'CO', '720-395-1054');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (981, 17, 'Padgett', 'Atterbury', '7452 Monument Parkway', 'PA', '412-149-9415');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (982, 11, 'Thorstein', 'Fredi', '424 Larry Center', 'MN', '218-496-6681');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (983, 17, 'Murdoch', 'Boddymead', '10 Tennessee Junction', 'IL', '309-609-3405');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (984, 17, 'Cory', 'Olphert', '9 Hayes Center', 'TX', '713-539-1896');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (985, 17, 'Augusto', 'McCowen', '07 Carioca Pass', 'FL', '352-305-8314');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (986, 14, 'Mikael', 'Henkmann', '6208 Service Drive', 'IL', '312-112-0279');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (987, 11, 'Waverley', 'Vedntyev', '91 Jenna Parkway', 'FL', '772-502-7570');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (988, 12, 'Daren', 'Thaller', '253 7th Terrace', 'PA', '717-681-4655');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (989, 13, 'Brandy', 'Folini', '3321 Mayer Trail', 'AZ', '480-354-1498');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (990, 17, 'Bren', 'Kolakowski', '8576 Hermina Road', 'NC', '919-749-2862');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (991, 13, 'Fidelio', 'Dillon', '566 Sutteridge Street', 'MO', '573-554-5763');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (992, 14, 'Brnaby', 'Shiell', '29 Forster Way', 'MO', '314-540-8961');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (993, 17, 'Doyle', 'Kempshall', '7860 Bonner Crossing', 'TX', '915-972-7300');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (994, 10, 'Omero', 'Mellers', '89 Portage Park', 'TX', '281-338-1151');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (995, 13, 'Hailey', 'Bond', '79 Lerdahl Point', 'PA', '484-646-0675');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (996, 14, 'Vinnie', 'Aylen', '1 Fairfield Lane', 'CA', '818-359-8035');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (997, 12, 'Perry', 'Benton', '84 Blackbird Place', 'MT', '406-917-6614');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (998, 15, 'Aylmar', 'Squeers', '7 Tennessee Park', 'FL', '561-700-9105');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (999, 15, 'Tobiah', 'Morter', '2 Esker Crossing', 'AZ', '480-435-0202');
insert into members (MEMBER_NUM, TEAM_CODE, MEMBER_FNAME, MEMBER_LNAME, MEMBER_ADDRESS, MEMBER_STATE, MEMBER_PHONE) values (1000, 10, 'Kris', 'Francescone', '04782 Blaine Circle', 'CA', '510-733-4964');

 # Insert Players Data

INSERT INTO `players` (`MEMBER_NUM`, `PLAYER_DOB`, `PLAYER_HEIGHT`, `PLAYER_WEIGHT`, `PLAYER_COLLEGE`, `PLAYER_POSITION`, `PLAYER_NUM`, `PLAYER_TERM`) VALUES
(42, '1976-05-28', 81, 252, 'Northwestern', 'Cornerback', 6, 9),
(43, '1998-06-14', 81, 208, 'Washington', 'Fullback', 17, 8),
(44, '1988-06-14', 67, 239, 'Mississippi State', 'Fullback', 41, 1),
(45, '1986-12-13', 77, 178, 'Washington', 'Fullback', 18, 8),
(46, '1993-01-04', 60, 297, 'Colorado State', 'Safety', 81, 6),
(47, '1987-08-21', 82, 233, 'Miami - OH', 'Center', 72, 6),
(48, '1998-08-16', 79, 265, 'Boston College', 'Cornerback', 5, 6),
(49, '1998-11-02', 65, 225, 'North Carolina State', 'Wide Receiver', 56, 10),
(50, '1975-05-30', 76, 296, 'Houston', 'Center', 79, 8),
(51, '1990-09-16', 63, 191, 'Georgia State', 'Wide Receiver', 80, 2),
(52, '1989-04-16', 62, 242, 'Rice', 'Linebacker', 81, 3),
(53, '1986-04-21', 62, 265, 'Temple', 'Linebacker', 65, 1),
(54, '1982-08-18', 68, 229, 'Tulsa', 'Tight End', 75, 3),
(55, '1996-06-01', 75, 260, 'Oklahoma', 'Safety', 52, 9),
(56, '1995-07-18', 60, 221, 'BYU', 'Cornerback', 2, 8),
(57, '1988-03-16', 79, 164, 'Northwestern', 'Safety', 11, 10),
(58, '1975-08-15', 83, 183, 'Marshall', 'Fullback', 75, 5),
(59, '1989-11-30', 62, 218, 'Washington', 'Quarterback', 49, 3),
(60, '1997-07-02', 70, 227, 'Vanderbilt', 'Cornerback', 72, 10),
(61, '1977-06-22', 61, 258, 'North Carolina', 'Fullback', 99, 9),
(62, '1989-03-13', 77, 266, 'Texas State', 'Linebacker', 97, 5),
(63, '1984-12-18', 80, 260, 'Oklahoma State', 'Wide Receiver', 22, 10),
(64, '1998-10-08', 85, 294, 'Massachusetts', 'Safety', 94, 3),
(65, '1992-08-12', 61, 161, 'West Virginia', 'Cornerback', 36, 5),
(66, '1989-08-30', 72, 174, 'California', 'Center', 92, 10),
(67, '1991-05-06', 80, 217, 'Southern Cal', 'Linebacker', 34, 1),
(68, '1989-12-06', 78, 261, 'Michigan', 'Cornerback', 87, 8),
(69, '1986-09-11', 79, 262, 'Georgia', 'Cornerback', 6, 8),
(70, '1976-11-14', 67, 237, 'Notre Dame', 'Quaterback', 53, 6),
(71, '1993-02-12', 83, 291, 'Mississippi', 'Fullback', 52, 10),
(72, '1978-06-27', 82, 310, 'Maryland', 'Running Back', 96, 8),
(73, '1987-08-13', 67, 308, 'Georgia Southern', 'Running Back', 90, 8),
(74, '1978-02-19', 65, 300, 'Marshall', 'Tight End', 60, 5),
(75, '1986-01-14', 69, 171, 'Louisville', 'Fullback', 25, 10),
(76, '1993-09-25', 72, 238, 'Boston College', 'Safety', 97, 8),
(77, '1996-09-15', 69, 190, 'North Carolina State', 'Safety', 6, 3),
(78, '1975-03-02', 82, 284, 'Wake Forest', 'Cornerback', 19, 10),
(79, '1978-11-22', 75, 255, 'Utah State', 'Safety', 75, 9),
(80, '1976-07-11', 65, 277, 'South Carolina', 'Guard', 21, 1),
(81, '1985-12-21', 70, 273, 'Arizona State', 'Safety', 33, 3),
(82, '1996-04-25', 71, 245, 'UNLV', 'Running Back', 37, 5),
(83, '1990-04-02', 74, 165, 'Illinois', 'Fullback', 32, 2),
(84, '1992-04-14', 77, 219, 'Washington', 'Cornerback', 55, 9),
(85, '1982-12-04', 77, 170, 'Mississippi', 'Tight End', 93, 6),
(86, '1992-05-31', 69, 223, 'South Florida', 'Running Back', 47, 3),
(87, '1991-12-23', 68, 224, 'Miami - OH', 'Safety', 28, 6),
(88, '1978-03-07', 73, 160, 'Western Michigan', 'Fullback', 78, 5),
(89, '1989-05-24', 71, 300, 'Washington', 'Quarterback', 89, 6),
(90, '1989-11-21', 81, 205, 'South Carolina', 'Quarterback', 58, 3),
(91, '1977-05-08', 82, 255, 'Houston', 'Fullback', 4, 2),
(92, '1995-08-15', 83, 211, 'Ohio', 'Linebacker', 73, 10),
(93, '1996-02-06', 68, 174, 'SMU', 'Safety', 96, 8),
(94, '1990-10-01', 71, 212, 'Rutgers', 'Tight End', 30, 4),
(95, '1981-09-02', 78, 160, 'Oregon', 'Quarterback', 65, 8),
(96, '1984-05-13', 66, 280, 'South Alabama', 'Safety', 24, 7),
(97, '1987-02-19', 66, 277, 'BYU', 'Tight End', 30, 10),
(98, '1987-04-27', 66, 301, 'UAB', 'Tight End', 1, 8),
(99, '1995-06-01', 73, 230, 'Vanderbilt', 'Tight End', 80, 10),
(100, '1996-06-18', 73, 221, 'South Carolina', 'Cornerback', 92, 9),
(101, '1994-01-18', 73, 278, 'North Carolina State', 'Fullback', 16, 4),
(102, '1983-04-14', 62, 280, 'Eastern Michigan', 'Tight End', 15, 3),
(103, '1987-07-11', 67, 296, 'Florida State', 'Center', 69, 3),
(104, '1998-02-16', 65, 303, 'Utah State', 'Quarterback', 2, 10),
(105, '1977-04-09', 80, 164, 'Alabama', 'Tight End', 52, 5),
(106, '1994-03-18', 80, 161, 'Florida International', 'Linebacker', 73, 4),
(107, '1986-06-24', 77, 289, 'Colorado State', 'Quarterback', 62, 3),
(108, '1975-06-29', 67, 236, 'Stanford', 'Tight End', 32, 4),
(109, '1996-08-21', 77, 208, 'SMU', 'Quarterback', 99, 10),
(110, '1978-08-06', 66, 309, 'Wake Forest', 'Center', 21, 8),
(111, '1981-01-29', 79, 225, 'Coastal Carolina', 'Center', 27, 1),
(112, '1985-10-25', 81, 259, 'Indiana', 'Safety', 64, 6),
(113, '1992-10-20', 80, 164, 'Rice', 'Safety', 6, 5),
(114, '1979-04-28', 78, 188, 'Georgia Tech', 'Safety', 34, 7),
(115, '1982-06-25', 79, 307, 'Virginia Tech', 'Center', 74, 9),
(116, '1985-01-15', 84, 264, 'North Carolina State', 'Wide Receiver', 69, 10),
(117, '1985-06-03', 80, 235, 'Missouri', 'Center', 56, 8),
(118, '1996-02-29', 80, 256, 'Vanderbilt', 'Guard', 19, 4),
(119, '1993-07-04', 85, 182, 'Pittsburgh', 'Quarterback', 38, 10),
(120, '1979-10-17', 63, 274, 'Connecticut', 'Cornerback', 54, 7),
(121, '1999-06-07', 79, 258, 'Syracuse', 'Quarterback', 3, 3),
(122, '1984-08-21', 63, 179, 'Kansas State', 'Quarterback', 95, 1),
(123, '1978-08-02', 83, 208, 'Navy', 'Safety', 68, 2),
(124, '1976-11-03', 76, 216, 'Fresno State', 'Wide Receiver', 69, 2),
(125, '1977-11-06', 77, 279, 'Memphis', 'Wide Receiver', 56, 8),
(126, '1987-03-11', 68, 310, 'Duke', 'Wide Receiver', 45, 6),
(127, '1992-07-12', 73, 309, 'San Diego State', 'Center', 3, 10),
(128, '1989-11-11', 66, 274, 'Arkansas', 'Tight End', 55, 1),
(129, '1999-03-08', 65, 193, 'Kansas', 'Running Back', 52, 5),
(130, '1991-08-02', 73, 249, 'Missouri', 'Tight End', 91, 8),
(131, '1984-11-27', 82, 278, 'UTEP', 'Cornerback', 87, 6),
(132, '1985-12-31', 67, 253, 'Tulsa', 'Tight End', 24, 10),
(133, '1992-04-24', 76, 190, 'San Diego State', 'Safety', 78, 4),
(134, '1979-11-15', 60, 286, 'Colorado', 'Safety', 21, 3),
(135, '1980-04-04', 73, 290, 'Colorado', 'Quarterback', 37, 10),
(136, '1977-11-15', 75, 281, 'Hawaii', 'Linebacker', 14, 4),
(137, '1989-08-01', 77, 257, 'Coastal Carolina', 'Tight End', 52, 7),
(138, '1978-08-11', 61, 308, 'Alabama', 'Tight End', 6, 4),
(139, '1990-10-11', 62, 168, 'Central Michigan', 'Safety', 13, 1),
(140, '1994-06-09', 80, 167, 'Oregon State', 'Safety', 72, 10),
(141, '1985-12-07', 60, 239, 'Michigan State', 'Linebacker', 32, 6),
(142, '1988-04-10', 71, 265, 'Liberty', 'Quarterback', 85, 1),
(143, '1992-12-07', 62, 171, 'Boston College', 'Safety', 83, 3),
(144, '1999-01-26', 83, 164, 'Oklahoma', 'Linebacker', 38, 9),
(145, '1981-02-25', 70, 291, 'Texas', 'Fullback', 83, 9),
(146, '1977-02-08', 71, 278, 'Duke', 'Linebacker', 68, 2),
(147, '1998-04-20', 62, 193, 'Georgia', 'Safety', 65, 4),
(148, '1983-02-21', 77, 253, 'Minnesota', 'Wide Receiver', 40, 3),
(149, '1989-09-09', 83, 234, 'Georgia Southern', 'Tight End', 56, 4),
(150, '1986-03-24', 85, 204, 'Florida State', 'Center', 21, 6),
(151, '1975-12-08', 82, 301, 'Cincinnati', 'Safety', 7, 8),
(152, '1989-08-28', 74, 171, 'Florida', 'Running Back', 20, 10),
(153, '1986-11-12', 82, 244, 'Marshall', 'Tight End', 2, 6),
(154, '1983-07-17', 85, 248, 'Boston College', 'Safety', 12, 8),
(155, '1996-12-13', 61, 171, 'Ohio State', 'Running Back', 82, 7),
(156, '1995-05-02', 65, 235, 'BYU', 'Linebacker', 72, 5),
(157, '1985-07-15', 71, 186, 'San Diego State', 'Safety', 71, 3),
(158, '1975-09-02', 75, 298, 'Wisconsin', 'Safety', 58, 1),
(159, '1986-03-25', 60, 184, 'Charlotte', 'Tight End', 71, 9),
(160, '1999-07-19', 70, 181, 'Georgia Tech', 'Fullback', 36, 2),
(161, '1984-01-22', 79, 193, 'California', 'Quarterback', 79, 4),
(162, '1988-05-12', 68, 223, 'LSU', 'Fullback', 98, 5),
(163, '1981-07-24', 83, 235, 'Massachusetts', 'Wide Receiver', 43, 9),
(164, '1993-08-09', 79, 272, 'Georgia Tech', 'Safety', 10, 2),
(165, '1987-05-10', 85, 227, 'Central Florida', 'Fullback', 47, 3),
(166, '1995-11-02', 75, 229, 'Virginia Tech', 'Center', 40, 7),
(167, '1993-02-09', 79, 304, 'UCLA', 'Quarterback', 74, 3),
(168, '1998-01-15', 84, 288, 'Tennessee', 'Safety', 10, 4),
(169, '1983-05-31', 63, 169, 'Kansas', 'Center', 58, 9),
(170, '1982-01-10', 76, 180, 'Air Force', 'Running Back', 83, 5),
(171, '1976-07-20', 64, 265, 'Nebraska', 'Safety', 97, 3),
(172, '1999-10-14', 75, 252, 'North Carolina', 'Fullback', 26, 2),
(173, '1986-05-08', 82, 309, 'West Virginia', 'Center', 43, 6),
(174, '1977-09-09', 74, 274, 'East Carolina', 'Tight End', 94, 10),
(175, '1988-10-14', 66, 286, 'Florida International', 'Safety', 16, 10),
(176, '1989-09-25', 74, 263, 'UCLA', 'Center', 20, 9),
(177, '1983-11-05', 84, 253, 'Temple', 'Guard', 12, 8),
(178, '1996-12-21', 75, 205, 'South Florida', 'Safety', 87, 4),
(179, '1995-02-24', 77, 291, 'Michigan State', 'Tight End', 60, 3),
(180, '1975-03-06', 76, 260, 'Texas Tech', 'Tight End', 6, 8),
(181, '1985-06-27', 74, 250, 'New Mexico', 'Running Back', 5, 4),
(182, '1992-07-25', 67, 233, 'Buffalo', 'Quarterback', 11, 9),
(183, '1994-11-13', 80, 173, 'Arkansas', 'Cornerback', 60, 10),
(184, '1995-07-11', 64, 214, 'Pittsburgh', 'Fullback', 52, 10),
(185, '1982-07-05', 66, 235, 'San Diego State', 'Running Back', 96, 1),
(186, '1978-11-30', 83, 216, 'Duke', 'Safety', 54, 7),
(187, '1980-06-04', 63, 211, 'Navy', 'Linebacker', 34, 4),
(188, '1985-01-09', 67, 288, 'South Alabama', 'Running Back', 12, 4),
(189, '1999-12-13', 71, 299, 'Michigan State', 'Safety', 98, 6),
(190, '1985-01-12', 76, 161, 'Ohio State', 'Center', 80, 3),
(191, '1984-05-02', 70, 258, 'Ball State', 'Guard', 99, 6),
(192, '1987-11-07', 70, 207, 'Georgia Tech', 'Safety', 41, 9),
(193, '1978-12-26', 71, 193, 'Ohio State', 'Safety', 59, 4),
(194, '1983-01-01', 77, 268, 'Tulane', 'Wide Receiver', 70, 9),
(195, '1998-08-18', 69, 265, 'Minnesota', 'Center', 89, 7),
(196, '1984-08-05', 80, 173, 'Central Florida', 'Linebacker', 35, 5),
(197, '1979-10-31', 71, 235, 'Georgia Southern', 'Fullback', 50, 2),
(198, '1985-07-18', 68, 241, 'Colorado', 'Safety', 22, 5),
(199, '1979-06-16', 82, 247, 'UCLA', 'Running Back', 37, 4),
(200, '1991-09-18', 65, 209, 'Fresno State', 'Safety', 18, 9),
(201, '1977-11-09', 67, 201, 'South Carolina', 'Cornerback', 87, 7),
(202, '1996-03-01', 60, 221, 'Fresno State', 'Running Back', 37, 2),
(203, '1992-05-07', 75, 284, 'SMU', 'Center', 41, 4),
(204, '1992-11-02', 75, 182, 'Purdue', 'Center', 78, 2),
(205, '1976-03-25', 67, 234, 'Baylor', 'Wide Receiver', 4, 7),
(206, '1980-04-19', 68, 227, 'Mississippi State', 'Tight End', 46, 3),
(207, '1976-12-19', 66, 260, 'Appalachian State', 'Safety', 47, 2),
(208, '1989-10-21', 76, 267, 'Georgia Southern', 'Cornerback', 91, 7),
(209, '1985-02-01', 69, 170, 'Ball State', 'Tight End', 78, 3),
(210, '1995-11-25', 84, 193, 'Virginia', 'Linebacker', 22, 7),
(211, '1979-02-11', 62, 206, 'Cincinnati', 'Quarterback', 2, 6),
(212, '1988-12-18', 69, 274, 'SMU', 'Safety', 2, 10),
(213, '1976-12-12', 82, 250, 'Wisconsin', 'Center', 31, 4),
(214, '1983-08-21', 79, 213, 'Fresno State', 'Running Back', 3, 9),
(215, '1987-02-27', 77, 163, 'Indiana', 'Safety', 41, 5),
(216, '1979-03-13', 71, 238, 'Wyoming', 'Cornerback', 40, 9),
(217, '1983-01-14', 60, 216, 'Wake Forest', 'Center', 34, 3),
(218, '1999-02-23', 78, 241, 'Mississippi', 'Fullback', 65, 9),
(219, '1979-02-23', 75, 294, 'Arkansas State', 'Linebacker', 16, 6),
(220, '1991-03-09', 84, 267, 'California', 'Safety', 31, 7),
(221, '1986-03-26', 67, 224, 'Utah State', 'Fullback', 71, 5),
(222, '1983-03-12', 63, 287, 'Old Dominion', 'Tight End', 88, 7),
(223, '1994-05-17', 62, 258, 'Hawaii', 'Tight End', 30, 7),
(224, '1999-11-27', 72, 240, 'West Virginia', 'Guard', 58, 8),
(225, '1997-06-28', 69, 207, 'Texas State', 'Fullback', 40, 6),
(226, '1997-04-12', 65, 224, 'Navy', 'Guard', 52, 7),
(227, '1993-07-18', 66, 299, 'Eastern Michigan', 'Center', 64, 2),
(228, '1976-12-16', 72, 266, 'Tennessee', 'Running Back', 73, 9),
(229, '1984-02-01', 63, 259, 'Louisiana-Lafayette', 'Wide Receiver', 73, 4),
(230, '1978-12-04', 64, 309, 'Liberty', 'Linebacker', 88, 10),
(231, '1989-12-26', 83, 180, 'Washington State', 'Safety', 76, 9),
(232, '1992-05-26', 65, 304, 'Alabama', 'Wide Receiver', 71, 3),
(233, '1991-12-01', 60, 264, 'UCLA', 'Quarterback', 26, 5),
(234, '1975-02-02', 66, 297, 'Wisconsin', 'Fullback', 79, 9),
(235, '1995-06-07', 63, 189, 'Clemson', 'Cornerback', 74, 4),
(236, '1978-02-03', 80, 239, 'Colorado', 'Safety', 12, 9),
(237, '1994-07-27', 78, 199, 'SMU', 'Fullback', 10, 10),
(238, '1985-05-25', 74, 224, 'East Carolina', 'Wide Receiver', 12, 1),
(239, '1995-08-07', 84, 209, 'Oregon', 'Linebacker', 18, 4),
(240, '1978-03-21', 83, 169, 'Coastal Carolina', 'Linebacker', 38, 1),
(241, '1989-07-25', 77, 234, 'Miami - OH', 'Quarterback', 23, 2),
(242, '1984-10-20', 75, 242, 'Marshall', 'Cornerback', 60, 10),
(243, '1977-10-07', 63, 162, 'Toledo', 'Guard', 74, 3),
(244, '1993-01-01', 79, 299, 'Connecticut', 'Cornerback', 30, 5),
(245, '1996-04-18', 83, 249, 'Kansas', 'Safety', 56, 3),
(246, '1991-04-02', 81, 307, 'Florida State', 'Guard', 33, 1),
(247, '1988-11-16', 73, 210, 'Texas', 'Tight End', 63, 6),
(248, '1995-02-05', 62, 283, 'Rice', 'Tight End', 28, 5),
(249, '1994-08-21', 80, 230, 'Florida', 'Fullback', 40, 2),
(250, '1976-12-27', 76, 259, 'Louisville', 'Linebacker', 14, 5),
(251, '1976-05-04', 71, 188, 'Wyoming', 'Tight End', 37, 3),
(252, '1980-11-25', 79, 268, 'Mississippi', 'Guard', 54, 2),
(253, '1994-08-09', 79, 203, 'LSU', 'Guard', 11, 1),
(254, '1982-01-17', 65, 237, 'Charlotte', 'Tight End', 41, 10),
(255, '1979-05-01', 85, 286, 'Texas A&M', 'Cornerback', 61, 4),
(256, '1989-06-11', 70, 210, 'Wisconsin', 'Wide Receiver', 3, 2),
(257, '1981-12-30', 61, 278, 'Tennessee', 'Wide Receiver', 72, 1),
(258, '1991-01-28', 65, 255, 'North Carolina State', 'Running Back', 22, 6),
(259, '1982-12-12', 61, 176, 'Mississippi State', 'Fullback', 80, 10),
(260, '1991-06-11', 62, 231, 'Ohio', 'Center', 93, 5),
(261, '1986-03-30', 73, 223, 'Oklahoma', 'Guard', 5, 7),
(262, '1998-08-12', 83, 305, 'Ohio State', 'Fullback', 94, 10),
(263, '1999-09-24', 60, 242, 'Louisiana Tech', 'Safety', 51, 10),
(264, '1980-08-03', 60, 203, 'Mississippi State', 'Fullback', 70, 4),
(265, '1988-10-08', 62, 276, 'Kent State', 'Tight End', 69, 6),
(266, '1988-03-22', 85, 235, 'East Carolina', 'Fullback', 62, 2),
(267, '1997-02-12', 81, 277, 'Boston College', 'Guard', 1, 1),
(268, '1998-07-08', 83, 164, 'Connecticut', 'Running Back', 79, 8),
(269, '1981-07-19', 61, 287, 'Louisville', 'Running Back', 6, 8),
(270, '1982-05-29', 81, 271, 'Appalachian State', 'Wide Receiver', 96, 9),
(271, '1998-05-16', 63, 253, 'Ball State', 'Linebacker', 18, 2),
(272, '1984-02-25', 74, 220, 'Charlotte', 'Cornerback', 17, 5),
(273, '1996-04-04', 73, 306, 'Wake Forest', 'Quarterback', 59, 4),
(274, '1977-12-30', 70, 190, 'Navy', 'Safety', 46, 7),
(275, '1987-01-24', 66, 300, 'Tulane', 'Guard', 65, 2),
(276, '1984-12-27', 83, 274, 'Virginia', 'Center', 95, 1),
(277, '1986-05-01', 75, 184, 'Liberty', 'Wide Receiver', 2, 6),
(278, '1986-06-15', 64, 250, 'Eastern Michigan', 'Fullback', 39, 3),
(279, '1999-02-21', 81, 179, 'Rutgers', 'Center', 59, 9),
(280, '1978-07-21', 79, 198, 'Colorado', 'Tight End', 62, 4),
(281, '1986-01-25', 76, 160, 'Georgia', 'Linebacker', 64, 3),
(282, '1999-04-10', 71, 185, 'Marshall', 'Safety', 52, 1),
(283, '1982-10-21', 67, 208, 'Georgia Southern', 'Linebacker', 63, 5),
(284, '1985-07-17', 72, 190, 'Old Dominion', 'Tight End', 93, 10),
(285, '1984-09-15', 71, 243, 'West Virginia', 'Wide Receiver', 90, 4),
(286, '1976-10-31', 82, 256, 'Michigan', 'Wide Receiver', 83, 6),
(287, '1997-05-23', 81, 222, 'Arkansas State', 'Quarterback', 99, 9),
(288, '1990-05-30', 67, 310, 'Wisconsin', 'Wide Receiver', 32, 4),
(289, '1993-02-28', 74, 219, 'Alabama', 'Cornerback', 61, 8),
(290, '1988-04-20', 82, 275, 'New Mexico', 'Fullback', 95, 8),
(291, '1986-09-14', 79, 186, 'North Carolina', 'Cornerback', 83, 6),
(292, '1992-10-20', 70, 284, 'Michigan', 'Fullback', 92, 8),
(293, '1979-10-17', 71, 174, 'North Carolina State', 'Quarterback', 21, 1),
(294, '1977-01-24', 85, 259, 'Nebraska', 'Wide Receiver', 21, 10),
(295, '1981-04-16', 62, 166, 'Penn State', 'Guard', 94, 6),
(296, '1990-09-03', 70, 173, 'Pittsburgh', 'Quarterback', 82, 8),
(297, '1986-09-29', 78, 301, 'Baylor', 'Tight End', 87, 6),
(298, '1993-06-02', 85, 161, 'Air Force', 'Quarterback', 38, 10),
(299, '1977-01-31', 64, 303, 'LSU', 'Guard', 83, 5),
(300, '1976-09-13', 78, 304, 'Navy', 'Cornerback', 38, 1),
(301, '1977-03-09', 74, 199, 'Maryland', 'Guard', 63, 3),
(302, '1991-07-01', 68, 266, 'Coastal Carolina', 'Linebacker', 60, 7),
(303, '1993-09-12', 85, 240, 'UTEP', 'Guard', 26, 7),
(304, '1983-06-07', 68, 213, 'Air Force', 'Guard', 44, 7),
(305, '1993-12-28', 73, 213, 'Houston', 'Quaterback', 10, 2),
(306, '1987-01-28', 76, 247, 'West Virginia', 'Tight End', 6, 3),
(307, '1996-06-24', 64, 181, 'BYU', 'Fullback', 8, 6),
(308, '1985-10-10', 84, 178, 'Middle Tennessee', 'Guard', 35, 6),
(309, '1976-07-12', 72, 218, 'Memphis', 'Linebacker', 89, 3),
(310, '1983-07-05', 69, 256, 'Nebraska', 'Safety', 47, 9),
(311, '1994-04-05', 79, 175, 'Fresno State', 'Wide Reciever', 69, 8),
(312, '1983-08-08', 65, 187, 'Rutgers', 'Quarterback', 78, 2),
(313, '1990-09-23', 80, 296, 'Kentucky', 'Guard', 71, 7),
(314, '1993-12-18', 83, 212, 'Liberty', 'Running Back', 10, 5),
(315, '1977-10-18', 83, 284, 'Ohio State', 'Cornerback', 36, 5),
(316, '1976-02-29', 71, 212, 'Utah State', 'Running Back', 93, 2),
(317, '1996-03-19', 62, 186, 'Pittsburgh', 'Safety', 22, 5),
(318, '1991-01-02', 60, 218, 'Michigan State', 'Linebacker', 46, 5),
(319, '1990-03-20', 62, 160, 'Penn State', 'Wide Receiver', 98, 3),
(320, '1991-03-09', 71, 284, 'Texas Tech', 'Running Back', 82, 8),
(321, '1990-03-07', 84, 206, 'Toledo', 'Guard', 96, 10),
(322, '1994-02-01', 62, 211, 'New Mexico', 'Center', 17, 3),
(323, '1992-06-29', 81, 171, 'Wyoming', 'Cornerback', 25, 9),
(324, '1985-12-06', 82, 213, 'Baylor', 'Safety', 11, 9),
(325, '1980-03-31', 75, 265, 'Georgia', 'Linebacker', 45, 10),
(326, '1999-11-17', 69, 255, 'Texas State', 'Fullback', 61, 7),
(327, '1977-11-25', 62, 267, 'Arkansas', 'Quarterback', 50, 3),
(328, '1996-01-28', 72, 192, 'Iowa State', 'Cornerback', 22, 10),
(329, '1980-11-17', 82, 217, 'SMU', 'Linebacker', 7, 1),
(330, '1988-06-13', 85, 310, 'Mississippi', 'Tight End', 12, 6),
(331, '1993-01-28', 74, 285, 'Troy', 'Center', 79, 8),
(332, '1984-05-15', 74, 308, 'Eastern Michigan', 'Guard', 26, 6),
(333, '1991-10-11', 64, 293, 'Oregon State', 'Guard', 61, 1),
(334, '1984-03-16', 76, 184, 'Massachusetts', 'Quaterback', 81, 1),
(335, '1993-03-30', 66, 195, 'Tulsa', 'Tight End', 21, 10),
(336, '1991-06-27', 68, 235, 'Arkansas', 'Tight End', 14, 3),
(337, '1993-08-03', 72, 300, 'South Carolina', 'Center', 14, 8),
(338, '1993-04-19', 67, 242, 'Arkansas State', 'Cornerback', 47, 2),
(339, '1975-04-12', 82, 242, 'Nevada', 'Cornerback', 71, 10),
(340, '1990-07-21', 79, 178, 'Florida', 'Safety', 28, 7),
(341, '1995-08-03', 85, 302, 'Old Dominion', 'Cornerback', 72, 1),
(342, '1985-07-17', 82, 281, 'Florida', 'Wide Receiver', 45, 1),
(343, '1985-05-22', 70, 230, 'West Virginia', 'Wide Receiver', 46, 4),
(344, '1978-08-28', 80, 232, 'Appalachian State', 'Linebacker', 38, 9),
(345, '1981-10-07', 79, 195, 'UCLA', 'Center', 6, 2),
(346, '1982-07-28', 67, 304, 'Southern Mississippi', 'Fullback', 37, 3),
(347, '1994-03-23', 79, 161, 'Illinois', 'Safety', 10, 2),
(348, '1991-11-15', 80, 241, 'UTEP', 'Running Back', 33, 2),
(349, '1975-01-15', 69, 257, 'Northern Illinois', 'Tight End', 35, 7),
(350, '1989-01-20', 84, 243, 'Notre Dame', 'Quarterback', 1, 7),
(351, '1982-02-09', 73, 241, 'Temple', 'Center', 62, 4),
(352, '1994-04-26', 80, 301, 'Marshall', 'Safety', 73, 5),
(353, '1999-03-01', 71, 221, 'Duke', 'Fullback', 33, 7),
(354, '1990-12-14', 83, 281, 'Massachusetts', 'Running Back', 36, 1),
(355, '1978-08-05', 80, 164, 'Marshall', 'Guard', 25, 6),
(356, '1991-03-29', 84, 291, 'Georgia State', 'Linebacker', 54, 1),
(357, '1983-07-11', 85, 224, 'East Carolina', 'Quarterback', 2, 5),
(358, '1976-07-06', 81, 221, 'UAB', 'Tight End', 2, 1),
(359, '1978-06-12', 64, 197, 'Central Florida', 'Quarterback', 63, 9),
(360, '1987-02-06', 60, 301, 'Tulane', 'Wide Receiver', 56, 3),
(361, '1977-08-28', 63, 274, 'Tulsa', 'Wide Receiver', 30, 5),
(362, '1994-10-02', 75, 230, 'New Mexico', 'Running Back', 73, 3),
(363, '1987-12-14', 64, 176, 'Georgia State', 'Tight End', 91, 2),
(364, '1976-12-30', 64, 161, 'Northern Illinois', 'Fullback', 94, 9),
(365, '1987-04-10', 60, 246, 'Texas Tech', 'Linebacker', 20, 2),
(366, '1995-09-17', 67, 238, 'Houston', 'Guard', 71, 10),
(367, '1988-01-10', 77, 214, 'Toledo', 'Wide Reciever', 50, 2),
(368, '1999-08-06', 79, 295, 'Central Michigan', 'Guard', 64, 6),
(369, '1996-03-16', 63, 223, 'Florida', 'Center', 43, 2),
(370, '1994-09-26', 83, 260, 'Hawaii', 'Safety', 41, 8),
(371, '1983-12-19', 80, 224, 'Mississippi State', 'Guard', 58, 6),
(372, '1977-01-03', 60, 222, 'Virginia', 'Guard', 96, 6),
(373, '1999-05-16', 63, 302, 'Louisville', 'Fullback', 48, 9),
(374, '1997-08-13', 61, 268, 'Mississippi', 'Linebacker', 94, 6),
(375, '1999-01-11', 70, 239, 'Missouri', 'Running Back', 16, 6),
(376, '1980-08-05', 78, 260, 'Stanford', 'Tight End', 51, 5),
(377, '1996-08-22', 85, 300, 'Kansas', 'Fullback', 66, 9),
(378, '1991-12-08', 73, 189, 'Auburn', 'Cornerback', 45, 1),
(379, '1989-07-19', 76, 215, 'Miami', 'Safety', 56, 1),
(380, '1991-10-27', 70, 279, 'Fresno State', 'Cornerback', 24, 10),
(381, '1984-05-16', 60, 306, 'Boston College', 'Quarterback', 33, 10),
(382, '1981-10-13', 81, 298, 'East Carolina', 'Quarterback', 23, 5),
(383, '1976-04-10', 83, 257, 'Texas Tech', 'Wide Reciever', 1, 3),
(384, '1998-10-12', 83, 181, 'Kentucky', 'Guard', 78, 3),
(385, '1980-02-06', 85, 303, 'Appalachian State', 'Fullback', 45, 9),
(386, '1999-09-24', 73, 235, 'Mississippi', 'Tight End', 14, 9),
(387, '1982-04-12', 63, 266, 'Boston College', 'Center', 29, 4),
(388, '1990-11-14', 77, 161, 'Nevada', 'Fullback', 52, 3),
(389, '1995-08-09', 73, 238, 'Nevada', 'Cornerback', 14, 4),
(390, '1998-07-27', 64, 230, 'Toledo', 'Wide Receiver', 37, 5),
(391, '1992-03-10', 61, 195, 'Purdue', 'Fullback', 88, 2),
(392, '1997-03-07', 65, 249, 'Western Kentucky', 'Safety', 26, 2),
(393, '1996-02-17', 67, 195, 'Marshall', 'Fullback', 23, 7),
(394, '1985-04-26', 77, 251, 'Arizona', 'Running Back', 34, 7),
(395, '1989-11-06', 72, 225, 'San Diego State', 'Wide Receiver', 93, 7),
(396, '1988-08-05', 82, 276, 'Pittsburgh', 'Fullback', 35, 8),
(397, '1999-01-03', 67, 199, 'California', 'Guard', 39, 3),
(398, '1998-01-25', 84, 309, 'Ohio State', 'Wide Receiver', 79, 1),
(399, '1984-06-08', 80, 207, 'Kansas State', 'Tight End', 34, 1),
(400, '1991-07-13', 71, 218, 'Texas Tech', 'Safety', 69, 8),
(401, '1979-12-11', 79, 200, 'Georgia Southern', 'Linebacker', 34, 4),
(402, '1996-10-24', 72, 188, 'Utah', 'Cornerback', 61, 10),
(403, '1988-03-24', 65, 185, 'Coastal Carolina', 'Running Back', 81, 1),
(404, '1989-12-01', 61, 211, 'Houston', 'Cornerback', 61, 3),
(405, '1975-08-29', 82, 284, 'Kansas State', 'Quarterback', 46, 4),
(406, '1997-06-24', 62, 244, 'Kansas', 'Center', 60, 10),
(407, '1990-11-07', 70, 182, 'Kansas', 'Running Back', 3, 5),
(408, '1985-04-26', 62, 280, 'Arizona State', 'Center', 98, 6),
(409, '1994-04-18', 61, 245, 'Penn State', 'Safety', 15, 7),
(410, '1983-05-20', 70, 164, 'Oklahoma State', 'Running Back', 64, 9),
(411, '1992-03-08', 78, 236, 'Mississippi State', 'Center', 59, 3),
(412, '1998-07-19', 73, 176, 'South Alabama', 'Fullback', 77, 10),
(413, '1979-09-20', 84, 276, 'Mississippi State', 'Cornerback', 60, 8),
(414, '1994-02-03', 80, 240, 'Central Florida', 'Cornerback', 80, 6),
(415, '1992-01-02', 64, 262, 'Clemson', 'Safety', 13, 6),
(416, '1985-04-02', 78, 289, 'New Mexico', 'Fullback', 5, 4),
(417, '1992-08-29', 62, 197, 'Buffalo', 'Linebacker', 31, 2),
(418, '1984-02-16', 75, 209, 'Rutgers', 'Fullback', 22, 8),
(419, '1977-08-17', 74, 245, 'Oregon', 'Quarterback', 18, 2),
(420, '1977-08-29', 63, 310, 'Washington', 'Guard', 29, 5),
(421, '1994-05-28', 69, 199, 'Northern Illinois', 'Quaterback', 59, 2),
(422, '1997-12-26', 74, 302, 'Kansas', 'Center', 15, 8),
(423, '1979-08-26', 77, 187, 'Arkansas', 'Linebacker', 54, 10),
(424, '1976-11-19', 85, 162, 'SMU', 'Safety', 89, 7),
(425, '1997-07-17', 77, 310, 'Central Florida', 'Wide Receiver', 8, 10),
(426, '1980-02-11', 72, 251, 'West Virginia', 'Cornerback', 73, 7),
(427, '1983-06-07', 81, 286, 'UNLV', 'Fullback', 96, 5),
(428, '1982-01-21', 85, 235, 'Army', 'Quarterback', 88, 2),
(429, '1989-07-10', 76, 241, 'Hawaii', 'Tight End', 77, 4),
(430, '1985-09-12', 85, 166, 'UNLV', 'Fullback', 14, 10),
(431, '1997-09-28', 84, 308, 'Miami', 'Tight End', 45, 6),
(432, '1975-06-27', 79, 184, 'Indiana', 'Guard', 76, 7),
(433, '1989-04-11', 68, 276, 'Louisiana Tech', 'Fullback', 17, 5),
(434, '1987-05-04', 81, 262, 'Old Dominion', 'Fullback', 99, 10),
(435, '1986-03-26', 85, 232, 'Cincinnati', 'Guard', 90, 8),
(436, '1980-03-08', 69, 208, 'Coastal Carolina', 'Cornerback', 80, 8),
(437, '1990-03-08', 74, 172, 'SMU', 'Quarterback', 5, 5),
(438, '1986-09-08', 60, 273, 'California', 'Fullback', 65, 7),
(439, '1989-06-11', 83, 292, 'Utah', 'Wide Receiver', 67, 10),
(440, '1985-04-30', 66, 251, 'UCLA', 'Safety', 22, 10),
(441, '1997-05-18', 74, 192, 'Rutgers', 'Quaterback', 70, 4),
(442, '1999-01-06', 60, 264, 'Hawaii', 'Guard', 66, 8),
(443, '1979-08-11', 81, 246, 'Toledo', 'Wide Receiver', 54, 6),
(444, '1990-05-27', 66, 279, 'North Carolina', 'Linebacker', 59, 6),
(445, '1996-12-25', 84, 233, 'Southern Cal', 'Center', 98, 3),
(446, '1993-05-25', 71, 196, 'Toledo', 'Center', 59, 8),
(447, '1982-10-30', 72, 235, 'Kansas State', 'Fullback', 5, 3),
(448, '1975-10-08', 62, 273, 'Vanderbilt', 'Wide Receiver', 99, 4),
(449, '1987-05-23', 76, 235, 'South Florida', 'Tight End', 55, 3),
(450, '1994-04-01', 78, 290, 'Hawaii', 'Quarterback', 38, 5),
(451, '1986-01-22', 78, 258, 'Michigan', 'Fullback', 72, 9),
(452, '1986-04-30', 68, 205, 'LSU', 'Cornerback', 76, 8),
(453, '1995-11-06', 60, 277, 'Penn State', 'Tight End', 73, 1),
(454, '1980-04-24', 79, 253, 'Nebraska', 'Tight End', 22, 5),
(455, '1996-03-26', 74, 278, 'New Mexico', 'Center', 34, 10),
(456, '1997-02-22', 64, 193, 'Oregon State', 'Cornerback', 63, 3),
(457, '1977-10-08', 61, 225, 'Texas A&M', 'Running Back', 83, 6),
(458, '1993-04-04', 63, 282, 'Oklahoma', 'Quarterback', 93, 3),
(459, '1984-04-13', 68, 163, 'Georgia State', 'Running Back', 61, 9),
(460, '1975-05-10', 81, 196, 'Georgia Tech', 'Guard', 60, 5),
(461, '1976-07-03', 84, 286, 'Penn State', 'Guard', 2, 5),
(462, '1996-01-14', 81, 165, 'Washington State', 'Center', 52, 4),
(463, '1982-10-24', 61, 201, 'Washington State', 'Running Back', 29, 6),
(464, '1984-02-10', 60, 172, 'Pittsburgh', 'Fullback', 43, 1),
(465, '1977-02-12', 80, 188, 'Stanford', 'Cornerback', 99, 10),
(466, '1997-08-22', 80, 222, 'Cincinnati', 'Safety', 13, 8),
(467, '1995-01-04', 60, 277, 'North Carolina', 'Quarterback', 95, 8),
(468, '1999-03-09', 79, 240, 'Southern Cal', 'Guard', 15, 8),
(469, '1980-01-31', 70, 162, 'New Mexico', 'Linebacker', 12, 1),
(470, '1986-04-01', 65, 263, 'Texas', 'Center', 81, 9),
(471, '1984-05-02', 85, 286, 'Cincinnati', 'Quarterback', 23, 3),
(472, '1992-04-29', 62, 294, 'Memphis', 'Running Back', 14, 10),
(473, '1986-12-05', 79, 280, 'Utah', 'Wide Receiver', 66, 3),
(474, '1990-01-25', 78, 279, 'Nebraska', 'Guard', 34, 6),
(475, '1988-03-27', 67, 241, 'Old Dominion', 'Center', 74, 2),
(476, '1987-08-27', 74, 212, 'Washington', 'Fullback', 99, 9),
(477, '1999-06-30', 80, 305, 'Northwestern', 'Quarterback', 1, 10),
(478, '1991-09-04', 81, 192, 'East Carolina', 'Cornerback', 49, 10),
(479, '1987-01-29', 81, 263, 'Northwestern', 'Cornerback', 73, 8),
(480, '1978-06-15', 65, 257, 'Ball State', 'Running Back', 16, 4),
(481, '1979-08-13', 79, 306, 'Rice', 'Tight End', 11, 2),
(482, '1996-03-06', 66, 297, 'Texas State', 'Fullback', 28, 9),
(483, '1981-05-14', 65, 162, 'Utah State', 'Safety', 58, 7),
(484, '1985-03-05', 78, 185, 'UTEP', 'Running Back', 72, 7),
(485, '1977-08-09', 78, 290, 'South Carolina', 'Quaterback', 29, 2),
(486, '1975-04-12', 62, 169, 'UTEP', 'Wide Receiver', 53, 9),
(487, '1983-05-31', 82, 261, 'Duke', 'Safety', 60, 8),
(488, '1987-11-22', 61, 254, 'Minnesota', 'Linebacker', 13, 1),
(489, '1997-04-26', 60, 175, 'Tulane', 'Fullback', 78, 7),
(490, '1998-07-27', 82, 210, 'Temple', 'Fullback', 32, 6),
(491, '1979-05-08', 67, 265, 'Nevada', 'Guard', 71, 6),
(492, '1991-02-17', 66, 175, 'Utah State', 'Running Back', 27, 9),
(493, '1993-12-13', 74, 172, 'UCLA', 'Cornerback', 99, 9),
(494, '1994-06-17', 61, 236, 'Appalachian State', 'Safety', 86, 4),
(495, '1982-02-02', 75, 281, 'Tulsa', 'Quaterback', 40, 5),
(496, '1994-08-21', 66, 181, 'UAB', 'Safety', 73, 10),
(497, '1997-12-09', 67, 212, 'Mississippi State', 'Linebacker', 89, 5),
(498, '1978-05-09', 60, 164, 'Miami - OH', 'Guard', 78, 1),
(499, '1982-02-09', 71, 263, 'Connecticut', 'Running Back', 77, 2),
(500, '1998-12-20', 68, 176, 'Maryland', 'Linebacker', 79, 7),
(501, '1992-05-26', 67, 293, 'Georgia Southern', 'Fullback', 20, 9),
(502, '1979-01-27', 71, 247, 'Michigan State', 'Fullback', 91, 7),
(503, '1999-11-21', 66, 249, 'Tennessee', 'Tight End', 98, 1),
(504, '1984-06-23', 65, 209, 'Alabama', 'Fullback', 90, 10),
(505, '1993-10-03', 83, 257, 'Oregon State', 'Linebacker', 69, 7),
(506, '1996-01-15', 67, 212, 'Texas State', 'Cornerback', 65, 9),
(507, '1991-03-21', 65, 264, 'San Diego State', 'Tight End', 21, 2),
(508, '1996-01-24', 83, 223, 'Texas Tech', 'Wide Reciever', 11, 3),
(509, '1990-10-05', 63, 176, 'Georgia State', 'Fullback', 58, 9),
(510, '1982-11-22', 76, 186, 'Mississippi State', 'Guard', 38, 3),
(511, '1991-03-14', 67, 291, 'East Carolina', 'Guard', 79, 1),
(512, '1987-09-13', 78, 248, 'Kansas State', 'Linebacker', 1, 9),
(513, '1999-12-31', 66, 265, 'UAB', 'Center', 35, 8),
(514, '1993-12-10', 72, 254, 'Notre Dame', 'Wide Receiver', 19, 4),
(515, '1980-05-12', 61, 173, 'Texas', 'Cornerback', 97, 3),
(516, '1979-06-25', 71, 241, 'Tulane', 'Safety', 60, 2),
(517, '1995-09-15', 72, 273, 'BYU', 'Center', 27, 4),
(518, '1992-03-22', 66, 225, 'Coastal Carolina', 'Cornerback', 84, 2),
(519, '1978-03-02', 60, 161, 'Utah State', 'Wide Receiver', 41, 5),
(520, '1980-12-04', 78, 283, 'LSU', 'Wide Reciever', 73, 1),
(521, '1991-02-15', 83, 288, 'Tennessee', 'Safety', 50, 2),
(522, '1996-04-30', 78, 309, 'UCLA', 'Linebacker', 74, 5),
(523, '1984-11-10', 70, 233, 'Arkansas State', 'Tight End', 19, 10),
(524, '1988-08-13', 65, 296, 'Marshall', 'Safety', 75, 3),
(525, '1997-08-07', 64, 285, 'Michigan State', 'Linebacker', 5, 2),
(526, '1976-11-19', 84, 249, 'Army', 'Center', 33, 1),
(527, '1985-04-26', 73, 215, 'Georgia State', 'Guard', 49, 4),
(528, '1989-07-22', 69, 272, 'Arizona State', 'Quarterback', 90, 8),
(529, '1997-12-23', 85, 263, 'Oregon', 'Wide Receiver', 23, 6),
(530, '1994-10-01', 73, 177, 'Western Michigan', 'Guard', 62, 8),
(531, '1985-06-27', 71, 306, 'Georgia State', 'Safety', 45, 3),
(532, '1992-02-16', 70, 248, 'California', 'Safety', 99, 6),
(533, '1977-02-18', 61, 257, 'South Alabama', 'Quarterback', 72, 6),
(534, '1979-01-19', 81, 185, 'Vanderbilt', 'Quarterback', 16, 5),
(535, '1983-12-20', 68, 259, 'TCU', 'Guard', 42, 6),
(536, '1996-10-16', 73, 176, 'South Florida', 'Running Back', 92, 6),
(537, '1981-07-15', 82, 211, 'Stanford', 'Fullback', 51, 2),
(538, '1986-10-22', 66, 181, 'North Texas', 'Cornerback', 28, 7),
(539, '1993-03-14', 75, 198, 'UTEP', 'Running Back', 58, 3),
(540, '1981-10-14', 63, 252, 'Baylor', 'Wide Receiver', 40, 8),
(541, '1996-05-29', 62, 208, 'Kansas', 'Quaterback', 61, 8),
(542, '1987-01-14', 62, 180, 'Charlotte', 'Wide Receiver', 77, 5),
(543, '1989-03-07', 75, 242, 'TCU', 'Quarterback', 45, 8),
(544, '1985-09-04', 81, 227, 'Alabama', 'Wide Receiver', 43, 10),
(545, '1976-12-28', 73, 292, 'Memphis', 'Running Back', 12, 4),
(546, '1998-12-02', 64, 232, 'Texas A&M', 'Running Back', 7, 8),
(547, '1994-10-25', 83, 304, 'UAB', 'Fullback', 43, 8),
(548, '1979-07-06', 63, 278, 'Temple', 'Tight End', 79, 8),
(549, '1986-06-18', 72, 268, 'New Mexico', 'Safety', 8, 6),
(550, '1983-12-14', 82, 202, 'Minnesota', 'Running Back', 35, 10),
(551, '1995-02-13', 76, 255, 'Iowa', 'Safety', 46, 6),
(552, '1981-10-16', 63, 256, 'Arizona State', 'Center', 68, 1),
(553, '1985-04-03', 60, 220, 'Syracuse', 'Quarterback', 6, 2),
(554, '1978-12-18', 60, 219, 'Connecticut', 'Linebacker', 30, 10),
(555, '1996-10-31', 80, 209, 'Boston College', 'Quaterback', 19, 3),
(556, '1978-12-30', 80, 292, 'Georgia', 'Center', 59, 2),
(557, '1982-09-25', 78, 230, 'South Florida', 'Fullback', 56, 8),
(558, '1986-05-24', 72, 212, 'Colorado', 'Quarterback', 79, 2),
(559, '1997-02-16', 72, 171, 'Tennessee', 'Quarterback', 53, 5),
(560, '1981-12-07', 69, 262, 'North Texas', 'Running Back', 31, 9),
(561, '1999-07-26', 71, 178, 'Coastal Carolina', 'Linebacker', 14, 3),
(562, '1997-05-20', 83, 264, 'Coastal Carolina', 'Guard', 4, 8),
(563, '1979-10-02', 80, 230, 'Tulsa', 'Linebacker', 74, 7),
(564, '1993-09-06', 82, 224, 'Boston College', 'Running Back', 79, 5),
(565, '1975-11-16', 81, 304, 'Notre Dame', 'Linebacker', 97, 3),
(566, '1996-08-22', 75, 214, 'Charlotte', 'Guard', 70, 6),
(567, '1983-07-01', 83, 241, 'Navy', 'Quaterback', 13, 3),
(568, '1996-05-13', 67, 290, 'Mississippi', 'Quaterback', 23, 6),
(569, '1991-03-18', 84, 188, 'Rutgers', 'Cornerback', 36, 9),
(570, '1984-10-18', 68, 240, 'Colorado', 'Cornerback', 53, 2),
(571, '1980-07-13', 63, 221, 'San Diego State', 'Cornerback', 62, 5),
(572, '1994-12-04', 62, 286, 'Middle Tennessee', 'Tight End', 59, 9),
(573, '1982-05-04', 84, 273, 'South Alabama', 'Cornerback', 23, 5),
(574, '1999-05-22', 68, 308, 'Mississippi', 'Quarterback', 49, 1),
(575, '1986-08-31', 68, 221, 'UCLA', 'Guard', 72, 2),
(576, '1988-08-24', 73, 248, 'Wake Forest', 'Fullback', 37, 8),
(577, '1978-09-29', 64, 287, 'Eastern Michigan', 'Wide Reciever', 42, 7),
(578, '1984-08-28', 82, 215, 'New Mexico State', 'Quarterback', 24, 7),
(579, '1979-08-26', 85, 271, 'Nevada', 'Running Back', 12, 5),
(580, '1986-10-17', 85, 293, 'Coastal Carolina', 'Wide Reciever', 65, 10),
(581, '1981-05-05', 70, 193, 'Southern Mississippi', 'Wide Reciever', 44, 8),
(582, '1988-06-16', 70, 246, 'Louisiana-Lafayette', 'Tight End', 43, 6),
(583, '1993-12-20', 85, 307, 'Alabama', 'Safety', 83, 3),
(584, '1977-12-23', 64, 186, 'Arkansas', 'Guard', 73, 9),
(585, '1993-01-18', 76, 292, 'Miami', 'Linebacker', 20, 4),
(586, '1985-01-03', 82, 256, 'Wyoming', 'Wide Receiver', 5, 6),
(587, '1985-08-13', 76, 215, 'Old Dominion', 'Center', 67, 5),
(588, '1978-04-26', 65, 161, 'Colorado State', 'Safety', 70, 10),
(589, '1994-08-11', 80, 233, 'Tulane', 'Quarterback', 84, 4),
(590, '1982-10-08', 69, 259, 'Missouri', 'Wide Receiver', 41, 10),
(591, '1990-03-12', 60, 182, 'Nebraska', 'Quaterback', 22, 7),
(592, '1991-10-22', 60, 203, 'Rutgers', 'Guard', 56, 2),
(593, '1978-09-24', 77, 256, 'UAB', 'Safety', 84, 3),
(594, '1993-06-08', 66, 234, 'Oklahoma', 'Safety', 84, 8),
(595, '1977-05-20', 74, 261, 'Toledo', 'Linebacker', 83, 6),
(596, '1975-03-26', 77, 306, 'Air Force', 'Guard', 47, 7),
(597, '1989-06-13', 70, 285, 'Texas', 'Guard', 84, 5),
(598, '1978-10-12', 68, 299, 'Tulsa', 'Quaterback', 1, 9),
(599, '1978-07-07', 78, 172, 'Tulane', 'Safety', 26, 8),
(600, '1977-07-30', 75, 203, 'South Alabama', 'Fullback', 97, 6),
(601, '1980-03-04', 75, 285, 'West Virginia', 'Wide Receiver', 74, 2),
(602, '1984-02-20', 78, 228, 'Wisconsin', 'Quarterback', 81, 5),
(603, '1991-05-16', 75, 270, 'Miami - OH', 'Running Back', 24, 6),
(604, '1983-12-10', 62, 256, 'Syracuse', 'Center', 80, 10),
(605, '1991-06-27', 81, 257, 'SMU', 'Quarterback', 55, 7),
(606, '1977-06-02', 76, 245, 'Air Force', 'Safety', 55, 6),
(607, '1980-09-01', 61, 170, 'North Carolina', 'Guard', 53, 9),
(608, '1982-09-12', 67, 206, 'Mississippi State', 'Tight End', 13, 3),
(609, '1997-09-01', 67, 183, 'Notre Dame', 'Cornerback', 83, 10),
(610, '1979-07-30', 74, 292, 'San Diego State', 'Running Back', 16, 5),
(611, '1991-03-07', 85, 305, 'West Virginia', 'Tight End', 11, 3),
(612, '1979-02-03', 77, 193, 'Baylor', 'Center', 51, 10),
(613, '1988-01-24', 73, 224, 'Florida State', 'Cornerback', 66, 5),
(614, '1995-10-31', 79, 295, 'Virginia', 'Tight End', 37, 6),
(615, '1983-04-07', 73, 189, 'Kent State', 'Linebacker', 9, 1),
(616, '1997-04-10', 71, 268, 'Massachusetts', 'Wide Reciever', 46, 8),
(617, '1987-05-13', 64, 191, 'Clemson', 'Wide Receiver', 75, 8),
(618, '1985-10-15', 70, 253, 'Ohio', 'Tight End', 52, 7),
(619, '1987-03-16', 75, 283, 'Pittsburgh', 'Quarterback', 89, 1),
(620, '1999-07-16', 66, 215, 'Mississippi State', 'Quarterback', 61, 5),
(621, '1980-04-29', 82, 264, 'Missouri', 'Center', 83, 5),
(622, '1979-10-29', 82, 288, 'Florida', 'Tight End', 26, 1),
(623, '1993-02-19', 83, 252, 'Appalachian State', 'Quarterback', 61, 5),
(624, '1996-04-07', 71, 287, 'Georgia State', 'Center', 92, 8),
(625, '1994-09-29', 64, 250, 'UTEP', 'Quarterback', 81, 5),
(626, '1988-04-18', 81, 218, 'Mississippi', 'Cornerback', 8, 1),
(627, '1982-12-28', 76, 281, 'Texas Tech', 'Linebacker', 69, 3),
(628, '1985-11-15', 62, 233, 'Wake Forest', 'Wide Receiver', 80, 4),
(629, '1996-09-28', 73, 304, 'West Virginia', 'Fullback', 69, 6),
(630, '1995-02-25', 78, 246, 'Tulsa', 'Safety', 23, 7),
(631, '1982-03-09', 80, 303, 'Florida', 'Guard', 99, 6),
(632, '1995-03-26', 79, 193, 'New Mexico', 'Guard', 83, 3),
(633, '1983-10-01', 74, 196, 'Northern Illinois', 'Quaterback', 82, 5),
(634, '1982-11-18', 81, 160, 'Utah State', 'Wide Receiver', 78, 7),
(635, '1989-01-16', 72, 205, 'Buffalo', 'Wide Receiver', 36, 5),
(636, '1999-03-25', 64, 187, 'Louisiana-Lafayette', 'Quarterback', 65, 3),
(637, '1984-10-02', 65, 188, 'Syracuse', 'Cornerback', 74, 7),
(638, '1981-06-08', 70, 287, 'Liberty', 'Guard', 34, 5),
(639, '1998-08-27', 79, 186, 'Connecticut', 'Wide Receiver', 99, 1),
(640, '1993-04-08', 70, 244, 'Syracuse', 'Linebacker', 13, 2),
(641, '1983-03-08', 80, 297, 'Oklahoma', 'Tight End', 67, 5),
(642, '1995-10-07', 79, 249, 'Auburn', 'Quaterback', 4, 3),
(643, '1982-12-01', 85, 230, 'Utah', 'Quaterback', 15, 9),
(644, '1985-03-07', 81, 263, 'Utah State', 'Guard', 65, 6),
(645, '1982-09-02', 80, 299, 'Wake Forest', 'Guard', 40, 3),
(646, '1999-10-01', 80, 254, 'Florida Atlantic', 'Tight End', 54, 3),
(647, '1982-11-19', 65, 237, 'Duke', 'Center', 20, 1),
(648, '1991-08-24', 77, 209, 'Mississippi State', 'Center', 26, 9),
(649, '1981-03-17', 73, 254, 'Southern Mississippi', 'Tight End', 7, 3),
(650, '1980-07-20', 79, 219, 'Western Kentucky', 'Fullback', 52, 6),
(651, '1991-05-25', 85, 163, 'UAB', 'Tight End', 24, 2),
(652, '1985-11-14', 77, 219, 'North Carolina', 'Center', 21, 2),
(653, '1992-10-12', 74, 210, 'Boston College', 'Linebacker', 89, 9),
(654, '1996-11-28', 64, 208, 'Ball State', 'Wide Receiver', 64, 1),
(655, '1986-01-21', 62, 267, 'Illinois', 'Wide Reciever', 8, 4),
(656, '1979-12-30', 74, 191, 'Iowa State', 'Quarterback', 17, 8),
(657, '1976-11-16', 78, 231, 'Pittsburgh', 'Guard', 52, 10),
(658, '1975-01-01', 73, 240, 'Western Kentucky', 'Cornerback', 4, 5),
(659, '1989-09-15', 75, 248, 'Georgia Tech', 'Guard', 10, 5),
(660, '1985-07-11', 82, 230, 'Army', 'Running Back', 30, 1),
(661, '1991-04-30', 83, 288, 'Utah', 'Running Back', 55, 8),
(662, '1987-10-03', 74, 223, 'Syracuse', 'Cornerback', 85, 8),
(663, '1993-07-13', 61, 291, 'Oregon State', 'Wide Receiver', 46, 3),
(664, '1994-04-29', 73, 210, 'Mississippi', 'Center', 86, 6),
(665, '1997-08-09', 76, 211, 'Ohio', 'Center', 83, 6),
(666, '1990-08-18', 74, 176, 'Iowa', 'Safety', 3, 10),
(667, '1990-06-25', 84, 255, 'Penn State', 'Cornerback', 48, 1),
(668, '1998-01-04', 81, 191, 'Alabama', 'Quarterback', 97, 10),
(669, '1982-04-09', 72, 171, 'East Carolina', 'Quaterback', 92, 5),
(670, '1997-04-07', 71, 189, 'Buffalo', 'Center', 57, 7),
(671, '1983-05-14', 74, 203, 'Oregon', 'Linebacker', 86, 10),
(672, '1998-05-22', 62, 167, 'Colorado', 'Running Back', 56, 6),
(673, '1992-12-28', 81, 240, 'Oklahoma', 'Linebacker', 81, 5),
(674, '1998-04-01', 63, 250, 'West Virginia', 'Safety', 10, 6),
(675, '1998-07-28', 75, 239, 'Virginia Tech', 'Quarterback', 74, 6),
(676, '1988-07-19', 67, 307, 'Coastal Carolina', 'Center', 80, 1),
(677, '1995-07-08', 77, 178, 'Wake Forest', 'Fullback', 55, 8),
(678, '1982-07-30', 76, 209, 'Texas A&M', 'Linebacker', 58, 2),
(679, '1987-07-04', 78, 274, 'Mississippi', 'Tight End', 61, 1),
(680, '1978-08-18', 76, 164, 'Miami - OH', 'Quarterback', 93, 1),
(681, '1997-05-18', 79, 308, 'Arkansas', 'Linebacker', 43, 6),
(682, '1975-01-10', 67, 302, 'Connecticut', 'Quarterback', 4, 5),
(683, '1985-02-10', 60, 297, 'Kent State', 'Fullback', 13, 9),
(684, '1979-08-16', 63, 189, 'Illinois', 'Guard', 28, 3),
(685, '1983-09-09', 85, 202, 'Hawaii', 'Linebacker', 40, 3),
(686, '1975-11-10', 80, 221, 'North Texas', 'Running Back', 74, 7),
(687, '1984-08-22', 84, 245, 'Memphis', 'Guard', 18, 1),
(688, '1978-08-20', 85, 226, 'Troy', 'Tight End', 33, 2),
(689, '1985-01-27', 81, 170, 'Baylor', 'Center', 22, 8),
(690, '1998-08-30', 61, 291, 'Indiana', 'Linebacker', 35, 4),
(691, '1982-05-28', 79, 272, 'Louisiana Tech', 'Quarterback', 78, 1),
(692, '1977-08-21', 63, 205, 'Michigan State', 'Center', 97, 2),
(693, '1984-06-11', 81, 244, 'Fresno State', 'Wide Receiver', 19, 9),
(694, '1976-09-06', 82, 200, 'Old Dominion', 'Linebacker', 72, 5),
(695, '1985-06-18', 67, 234, 'Syracuse', 'Wide Receiver', 4, 7),
(696, '1978-11-14', 72, 227, 'Clemson', 'Running Back', 88, 3),
(697, '1992-04-02', 68, 304, 'UCLA', 'Cornerback', 11, 5),
(698, '1988-10-18', 82, 280, 'Ohio', 'Safety', 8, 4),
(699, '1986-02-19', 76, 184, 'Virginia Tech', 'Tight End', 28, 2),
(700, '1991-09-20', 67, 172, 'Eastern Michigan', 'Safety', 48, 5),
(701, '1987-06-23', 80, 288, 'Ball State', 'Quarterback', 67, 5),
(702, '1975-08-01', 67, 164, 'Nebraska', 'Quarterback', 28, 4),
(703, '1975-10-28', 69, 273, 'Texas A&M', 'Running Back', 21, 5),
(704, '1983-03-25', 82, 301, 'Buffalo', 'Linebacker', 67, 7),
(705, '1980-12-18', 83, 207, 'Wake Forest', 'Linebacker', 82, 5),
(706, '1995-08-06', 67, 286, 'Miami', 'Cornerback', 18, 5),
(707, '1978-05-10', 77, 208, 'Colorado', 'Running Back', 33, 8),
(708, '1988-01-30', 60, 269, 'Army', 'Safety', 84, 7),
(709, '1978-07-26', 61, 260, 'Cincinnati', 'Linebacker', 57, 1),
(710, '1981-01-07', 72, 229, 'Arkansas State', 'Quarterback', 61, 5),
(711, '1984-04-20', 63, 195, 'Kentucky', 'Cornerback', 62, 6),
(712, '1995-01-11', 76, 190, 'BYU', 'Tight End', 55, 6),
(713, '1990-03-12', 75, 304, 'Kansas', 'Fullback', 41, 7),
(714, '1982-10-29', 78, 304, 'LSU', 'Guard', 22, 7),
(715, '1980-06-19', 61, 245, 'Nevada', 'Fullback', 53, 1),
(716, '1994-12-10', 77, 175, 'Miami', 'Center', 6, 7),
(717, '1998-05-10', 72, 210, 'Middle Tennessee', 'Guard', 98, 7),
(718, '1983-04-01', 78, 209, 'Buffalo', 'Linebacker', 56, 10),
(719, '1991-08-20', 82, 215, 'Central Michigan', 'Guard', 80, 8),
(720, '1989-12-18', 75, 293, 'Michigan', 'Running Back', 96, 8),
(721, '1988-08-27', 61, 256, 'Arkansas State', 'Linebacker', 65, 6),
(722, '1975-10-11', 78, 198, 'Central Florida', 'Cornerback', 33, 8),
(723, '1990-06-13', 83, 279, 'Mississippi State', 'Safety', 38, 3),
(724, '1981-11-18', 82, 209, 'Houston', 'Quarterback', 15, 1),
(725, '1979-01-29', 83, 162, 'Army', 'Fullback', 19, 7),
(726, '1978-04-10', 81, 234, 'Colorado State', 'Running Back', 44, 8),
(727, '1993-10-09', 75, 287, 'Washington State', 'Linebacker', 94, 1),
(728, '1991-05-07', 78, 162, 'Central Michigan', 'Cornerback', 78, 2),
(729, '1992-06-18', 69, 283, 'South Florida', 'Guard', 21, 8),
(730, '1979-02-15', 84, 303, 'Maryland', 'Tight End', 80, 8),
(731, '1984-12-10', 85, 307, 'Texas A&M', 'Quarterback', 56, 3),
(732, '1984-12-19', 79, 237, 'TCU', 'Linebacker', 68, 6),
(733, '1980-01-02', 63, 161, 'Wisconsin', 'Fullback', 56, 4),
(734, '1985-07-12', 78, 288, 'Boise State', 'Fullback', 5, 8),
(735, '1975-08-02', 81, 285, 'Buffalo', 'Center', 25, 7),
(736, '1988-04-23', 71, 285, 'Southern Cal', 'Linebacker', 92, 1),
(737, '1978-10-30', 75, 210, 'BYU', 'Safety', 20, 10),
(738, '1991-01-17', 77, 300, 'Penn State', 'Guard', 66, 3),
(739, '1977-05-28', 72, 180, 'Kansas', 'Guard', 61, 5),
(740, '1984-09-19', 67, 184, 'Minnesota', 'Cornerback', 29, 1),
(741, '1976-04-04', 79, 191, 'Tulane', 'Cornerback', 36, 7),
(742, '1983-04-09', 71, 231, 'Memphis', 'Wide Receiver', 8, 8),
(743, '1994-02-06', 83, 292, 'Iowa State', 'Center', 18, 3),
(744, '1997-07-03', 60, 263, 'Massachusetts', 'Center', 51, 3),
(745, '1990-05-29', 76, 267, 'Ohio', 'Safety', 9, 6),
(746, '1986-02-20', 61, 214, 'Miami', 'Center', 9, 7),
(747, '1985-11-28', 77, 309, 'Massachusetts', 'Fullback', 88, 5),
(748, '1992-05-13', 80, 266, 'Washington', 'Cornerback', 12, 4),
(749, '1986-06-28', 64, 193, 'Colorado', 'Cornerback', 13, 3),
(750, '1985-04-25', 61, 223, 'Iowa State', 'Cornerback', 8, 5),
(751, '1998-06-29', 60, 226, 'Mississippi', 'Fullback', 68, 2),
(752, '1975-06-24', 62, 213, 'West Virginia', 'Cornerback', 71, 6),
(753, '1982-12-10', 81, 297, 'Kentucky', 'Tight End', 74, 4),
(754, '1987-01-16', 74, 172, 'Texas', 'Linebacker', 46, 2),
(755, '1979-05-20', 60, 278, 'Florida Atlantic', 'Fullback', 93, 6),
(756, '1989-12-28', 78, 310, 'Arkansas', 'Safety', 12, 5),
(757, '1977-11-22', 68, 235, 'Houston', 'Running Back', 49, 9),
(758, '1989-09-02', 71, 212, 'Rutgers', 'Guard', 68, 9),
(759, '1995-12-17', 69, 276, 'Ball State', 'Tight End', 51, 7),
(760, '1984-09-05', 76, 260, 'Florida International', 'Tight End', 89, 3),
(761, '1996-06-27', 62, 189, 'Penn State', 'Guard', 90, 5),
(762, '1987-10-30', 60, 194, 'Houston', 'Linebacker', 14, 6),
(763, '1978-02-06', 84, 265, 'Maryland', 'Quarterback', 97, 2),
(764, '1980-08-25', 60, 274, 'Houston', 'Cornerback', 54, 6),
(765, '1986-06-27', 82, 207, 'Nevada', 'Linebacker', 24, 8),
(766, '1982-05-27', 71, 279, 'Memphis', 'Quarterback', 77, 1),
(767, '1992-05-30', 72, 246, 'Coastal Carolina', 'Wide Receiver', 18, 4),
(768, '1998-09-24', 63, 247, 'Clemson', 'Quarterback', 90, 4),
(769, '1984-02-23', 70, 194, 'Georgia', 'Safety', 15, 10),
(770, '1990-03-01', 75, 268, 'Virginia', 'Wide Receiver', 19, 10),
(771, '1998-03-14', 61, 274, 'UTEP', 'Guard', 32, 10),
(772, '1994-06-01', 71, 164, 'West Virginia', 'Quarterback', 10, 2),
(773, '1975-03-12', 70, 246, 'Toledo', 'Wide Reciever', 37, 4),
(774, '1975-06-19', 70, 309, 'Boston College', 'Running Back', 72, 8),
(775, '1997-12-17', 62, 171, 'Rice', 'Safety', 67, 4),
(776, '1997-12-24', 61, 196, 'San Diego State', 'Cornerback', 7, 3),
(777, '1991-09-22', 64, 189, 'UAB', 'Cornerback', 74, 8),
(778, '1984-03-29', 68, 280, 'Northwestern', 'Guard', 75, 8),
(779, '1984-07-09', 78, 190, 'Texas State', 'Cornerback', 77, 3),
(780, '1999-07-07', 64, 285, 'Iowa State', 'Guard', 77, 10),
(781, '1994-11-08', 81, 280, 'Charlotte', 'Quaterback', 30, 3),
(782, '1996-11-03', 65, 215, 'Iowa', 'Fullback', 82, 8),
(783, '1990-05-17', 69, 297, 'Eastern Michigan', 'Tight End', 80, 1),
(784, '1984-06-09', 72, 179, 'Rice', 'Tight End', 98, 7),
(785, '1988-11-29', 73, 226, 'Oregon', 'Guard', 46, 7),
(786, '1991-08-17', 63, 289, 'Wake Forest', 'Cornerback', 64, 6),
(787, '1984-11-20', 73, 185, 'Texas Tech', 'Linebacker', 33, 1),
(788, '1981-07-24', 71, 232, 'Southern Cal', 'Center', 27, 7),
(789, '1975-10-24', 70, 184, 'Massachusetts', 'Safety', 34, 1),
(790, '1997-11-26', 84, 224, 'Massachusetts', 'Running Back', 49, 4),
(791, '1977-04-20', 85, 167, 'Northern Illinois', 'Fullback', 48, 4),
(792, '1990-04-26', 72, 215, 'Georgia', 'Tight End', 11, 7),
(793, '1993-11-04', 77, 170, 'Central Florida', 'Linebacker', 81, 6),
(794, '1982-09-06', 71, 170, 'Texas State', 'Guard', 76, 7),
(795, '1985-05-17', 72, 253, 'Boston College', 'Safety', 48, 2),
(796, '1996-12-01', 69, 277, 'Pittsburgh', 'Running Back', 55, 4),
(797, '1984-02-07', 72, 283, 'Eastern Michigan', 'Tight End', 58, 4),
(798, '1982-03-17', 81, 182, 'Texas A&M', 'Linebacker', 74, 1),
(799, '1985-10-05', 82, 200, 'Texas', 'Quarterback', 53, 6),
(800, '1995-03-14', 61, 297, 'Air Force', 'Cornerback', 97, 6),
(801, '1979-10-26', 78, 237, 'Old Dominion', 'Tight End', 27, 2),
(802, '1993-10-03', 63, 300, 'Wake Forest', 'Center', 90, 8),
(803, '1990-02-23', 69, 166, 'Georgia Southern', 'Linebacker', 11, 6),
(804, '1981-10-30', 85, 254, 'Tulsa', 'Fullback', 83, 8),
(805, '1998-11-09', 82, 243, 'Michigan', 'Wide Receiver', 88, 7),
(806, '1985-11-18', 66, 252, 'Arkansas State', 'Linebacker', 18, 10),
(807, '1990-01-21', 60, 231, 'Houston', 'Quaterback', 25, 2),
(808, '1993-05-12', 62, 305, 'Florida', 'Safety', 4, 9),
(809, '1989-02-12', 73, 268, 'Washington State', 'Cornerback', 96, 6),
(810, '1996-07-28', 63, 217, 'Florida International', 'Linebacker', 59, 5),
(811, '1995-01-21', 76, 205, 'Northwestern', 'Center', 48, 10),
(812, '1983-12-31', 66, 173, 'South Alabama', 'Center', 51, 7),
(813, '1989-04-10', 82, 301, 'Charlotte', 'Safety', 2, 3),
(814, '1978-08-11', 79, 239, 'Wyoming', 'Wide Receiver', 23, 8),
(815, '1997-02-09', 61, 247, 'Ohio State', 'Safety', 43, 7),
(816, '1993-12-16', 67, 295, 'Central Michigan', 'Quarterback', 75, 6),
(817, '1975-05-25', 80, 237, 'Clemson', 'Quarterback', 67, 1),
(818, '1998-11-14', 74, 274, 'Southern Mississippi', 'Tight End', 42, 10),
(819, '1979-11-26', 65, 288, 'New Mexico', 'Center', 69, 3),
(820, '1998-07-19', 60, 172, 'Georgia', 'Quarterback', 51, 9),
(821, '1984-07-14', 75, 245, 'North Carolina State', 'Fullback', 40, 8),
(822, '1991-08-30', 76, 301, 'Kentucky', 'Tight End', 18, 3),
(823, '1980-04-07', 75, 288, 'Coastal Carolina', 'Wide Receiver', 64, 1),
(824, '1978-10-21', 62, 217, 'UNLV', 'Quaterback', 71, 3),
(825, '1979-12-25', 79, 262, 'North Texas', 'Quarterback', 35, 2),
(826, '1979-07-13', 67, 271, 'Cincinnati', 'Running Back', 28, 8),
(827, '1977-12-24', 68, 181, 'Mississippi State', 'Wide Reciever', 27, 5),
(828, '1984-02-25', 80, 212, 'Appalachian State', 'Cornerback', 21, 1),
(829, '1975-09-17', 83, 286, 'Florida Atlantic', 'Tight End', 54, 1),
(830, '1997-08-25', 74, 187, 'Nebraska', 'Quarterback', 83, 4),
(831, '1994-10-05', 60, 259, 'Toledo', 'Guard', 53, 6),
(832, '1995-07-23', 85, 244, 'Washington', 'Center', 71, 4),
(833, '1986-01-23', 60, 236, 'Michigan State', 'Wide Receiver', 83, 6),
(834, '1986-08-16', 78, 239, 'Fresno State', 'Wide Receiver', 85, 2),
(835, '1992-10-15', 79, 241, 'Missouri', 'Running Back', 82, 10),
(836, '1993-04-14', 84, 176, 'Central Florida', 'Center', 82, 10),
(837, '1980-12-12', 62, 175, 'Arkansas State', 'Guard', 57, 10),
(838, '1985-05-27', 83, 162, 'Florida State', 'Tight End', 36, 9),
(839, '1975-06-06', 79, 213, 'Washington State', 'Running Back', 38, 7),
(840, '1995-01-25', 82, 169, 'South Carolina', 'Guard', 83, 6),
(841, '1979-01-07', 76, 201, 'Oklahoma State', 'Guard', 2, 9),
(842, '1995-04-18', 66, 240, 'Maryland', 'Quarterback', 67, 7),
(843, '1988-08-22', 77, 279, 'Oregon State', 'Cornerback', 78, 3),
(844, '1984-07-14', 72, 198, 'Minnesota', 'Tight End', 58, 2),
(845, '1996-10-14', 65, 194, 'Houston', 'Cornerback', 78, 8),
(846, '1994-08-08', 77, 250, 'Maryland', 'Running Back', 28, 8),
(847, '1990-06-07', 60, 228, 'San Diego State', 'Linebacker', 83, 6),
(848, '1984-07-25', 77, 283, 'Tulane', 'Wide Receiver', 29, 5);
INSERT INTO `players` (`MEMBER_NUM`, `PLAYER_DOB`, `PLAYER_HEIGHT`, `PLAYER_WEIGHT`, `PLAYER_COLLEGE`, `PLAYER_POSITION`, `PLAYER_NUM`, `PLAYER_TERM`) VALUES
(849, '1982-03-11', 81, 233, 'Penn State', 'Linebacker', 56, 3),
(850, '1994-03-21', 76, 221, 'Western Kentucky', 'Cornerback', 21, 6),
(851, '1998-06-27', 75, 278, 'Boston College', 'Guard', 74, 7),
(852, '1991-01-26', 79, 238, 'Penn State', 'Tight End', 16, 7),
(853, '1998-01-30', 78, 249, 'Georgia Tech', 'Safety', 30, 9),
(854, '1985-02-24', 81, 171, 'Houston', 'Cornerback', 66, 9),
(855, '1986-06-27', 61, 298, 'Northern Illinois', 'Guard', 35, 8),
(856, '1981-01-14', 80, 161, 'Arkansas', 'Wide Reciever', 69, 10),
(857, '1996-06-11', 82, 270, 'Kent State', 'Fullback', 24, 5),
(858, '1989-08-22', 74, 194, 'Air Force', 'Running Back', 3, 6),
(859, '1986-08-10', 60, 221, 'Colorado State', 'Running Back', 3, 10),
(860, '1987-10-01', 61, 181, 'Appalachian State', 'Guard', 13, 7),
(861, '1982-07-15', 82, 256, 'South Alabama', 'Cornerback', 83, 7),
(862, '1985-10-20', 74, 182, 'Navy', 'Center', 57, 10),
(863, '1975-05-07', 60, 240, 'Ball State', 'Fullback', 13, 10),
(864, '1983-05-28', 85, 307, 'Tulane', 'Quarterback', 52, 2),
(865, '1998-10-22', 79, 260, 'Georgia Southern', 'Running Back', 38, 4),
(866, '1979-12-14', 73, 215, 'Oklahoma State', 'Wide Reciever', 67, 9),
(867, '1983-10-18', 85, 199, 'Buffalo', 'Quarterback', 17, 6),
(868, '1980-08-22', 85, 274, 'Temple', 'Wide Receiver', 90, 7),
(869, '1984-11-05', 73, 169, 'Ball State', 'Center', 25, 6),
(870, '1984-05-09', 63, 241, 'Western Michigan', 'Safety', 82, 8),
(871, '1991-01-04', 72, 209, 'Buffalo', 'Linebacker', 74, 4),
(872, '1995-05-02', 84, 170, 'Boise State', 'Wide Receiver', 28, 1),
(873, '1992-03-20', 78, 215, 'Air Force', 'Safety', 46, 8),
(874, '1997-02-04', 64, 266, 'Connecticut', 'Linebacker', 21, 5),
(875, '1980-07-16', 76, 202, 'Texas A&M', 'Wide Receiver', 52, 7),
(876, '1996-12-11', 79, 214, 'Louisiana-Lafayette', 'Cornerback', 37, 9),
(877, '1985-03-12', 66, 213, 'Baylor', 'Quarterback', 93, 10),
(878, '1982-04-18', 65, 306, 'Purdue', 'Linebacker', 92, 1),
(879, '1980-09-18', 77, 293, 'Temple', 'Fullback', 15, 7),
(880, '1992-08-06', 79, 217, 'Arizona', 'Center', 62, 8),
(881, '1989-05-29', 63, 174, 'Indiana', 'Wide Receiver', 68, 7),
(882, '1984-08-31', 73, 303, 'Oklahoma', 'Cornerback', 86, 5),
(883, '1979-02-01', 74, 307, 'Central Michigan', 'Quarterback', 36, 8),
(884, '1998-08-26', 67, 269, 'Baylor', 'Cornerback', 74, 4),
(885, '1990-12-29', 79, 244, 'Massachusetts', 'Tight End', 92, 8),
(886, '1989-08-27', 75, 167, 'Northwestern', 'Tight End', 68, 4),
(887, '1977-07-04', 64, 189, 'Syracuse', 'Guard', 38, 6),
(888, '1995-07-06', 72, 200, 'Connecticut', 'Quaterback', 30, 9),
(889, '1975-01-22', 84, 211, 'Oregon', 'Cornerback', 61, 3),
(890, '1977-11-28', 73, 219, 'UTEP', 'Wide Receiver', 57, 8),
(891, '1975-10-12', 66, 279, 'TCU', 'Center', 52, 1),
(892, '1985-07-25', 82, 170, 'Western Michigan', 'Tight End', 97, 3),
(893, '1995-07-30', 61, 186, 'Wyoming', 'Guard', 8, 7),
(894, '1988-06-10', 83, 289, 'Navy', 'Linebacker', 64, 5),
(895, '1982-09-25', 73, 160, 'Middle Tennessee', 'Fullback', 39, 1),
(896, '1996-09-06', 77, 242, 'Old Dominion', 'Safety', 73, 4),
(897, '1988-02-23', 66, 269, 'South Florida', 'Center', 72, 6),
(898, '1985-11-08', 73, 288, 'Appalachian State', 'Cornerback', 77, 3),
(899, '1975-07-07', 60, 303, 'Baylor', 'Linebacker', 65, 8),
(900, '1975-07-24', 73, 289, 'Ball State', 'Safety', 51, 10),
(901, '1982-12-04', 77, 186, 'Penn State', 'Fullback', 2, 8),
(902, '1992-11-26', 83, 250, 'Air Force', 'Cornerback', 97, 5),
(903, '1998-02-21', 73, 174, 'Northwestern', 'Fullback', 9, 2),
(904, '1984-05-30', 74, 277, 'Middle Tennessee', 'Fullback', 78, 1),
(905, '1999-05-24', 62, 193, 'Kentucky', 'Cornerback', 68, 2),
(906, '1989-04-17', 75, 168, 'Texas Tech', 'Fullback', 75, 8),
(907, '1986-10-23', 79, 251, 'Kentucky', 'Running Back', 96, 3),
(908, '1999-10-09', 83, 281, 'Georgia', 'Fullback', 52, 9),
(909, '1991-07-21', 69, 172, 'Arkansas State', 'Safety', 3, 6),
(910, '1979-08-26', 76, 214, 'Central Florida', 'Fullback', 55, 3),
(911, '1993-02-05', 85, 222, 'Western Michigan', 'Quarterback', 87, 10),
(912, '1980-08-20', 77, 295, 'Alabama', 'Wide Receiver', 55, 1),
(913, '1990-07-19', 80, 165, 'Oregon State', 'Guard', 53, 2),
(914, '1991-02-14', 63, 287, 'Mississippi', 'Safety', 99, 2),
(915, '1986-02-13', 72, 270, 'Toledo', 'Cornerback', 41, 10),
(916, '1985-07-12', 76, 161, 'Stanford', 'Linebacker', 11, 7),
(917, '1981-12-16', 68, 247, 'UAB', 'Guard', 47, 1),
(918, '1995-03-30', 70, 299, 'Texas State', 'Running Back', 81, 2),
(919, '1976-05-02', 81, 223, 'East Carolina', 'Tight End', 84, 6),
(920, '1999-10-13', 74, 205, 'Pittsburgh', 'Running Back', 53, 2),
(921, '1988-08-11', 64, 186, 'Syracuse', 'Tight End', 72, 6),
(922, '1983-01-25', 74, 275, 'Texas A&M', 'Center', 43, 6),
(923, '1975-01-05', 62, 257, 'Colorado State', 'Center', 14, 1),
(924, '1975-07-19', 75, 197, 'Oregon', 'Wide Receiver', 24, 3),
(925, '1983-01-10', 69, 210, 'Nevada', 'Tight End', 67, 9),
(926, '1978-05-10', 66, 289, 'Florida', 'Center', 62, 6),
(927, '1991-07-02', 73, 233, 'UTEP', 'Safety', 53, 4),
(928, '1992-12-30', 61, 288, 'Colorado', 'Tight End', 79, 5),
(929, '1988-08-02', 84, 235, 'Massachusetts', 'Cornerback', 95, 5),
(930, '1990-06-08', 83, 180, 'Southern Cal', 'Wide Receiver', 38, 5),
(931, '1997-01-18', 68, 276, 'Air Force', 'Tight End', 46, 5),
(932, '1976-05-16', 79, 219, 'Army', 'Fullback', 30, 10),
(933, '1989-01-10', 81, 163, 'Texas', 'Fullback', 54, 2),
(934, '1982-12-14', 63, 305, 'Iowa', 'Quarterback', 56, 3),
(935, '1995-06-21', 78, 169, 'Southern Mississippi', 'Cornerback', 70, 7),
(936, '1996-09-23', 66, 163, 'Missouri', 'Quarterback', 49, 10),
(937, '1982-06-07', 62, 273, 'Ball State', 'Linebacker', 24, 5),
(938, '1999-05-23', 69, 195, 'Connecticut', 'Running Back', 28, 5),
(939, '1975-09-07', 79, 239, 'Nebraska', 'Quarterback', 69, 6),
(940, '1994-11-01', 70, 237, 'South Florida', 'Running Back', 63, 3),
(941, '1993-02-13', 76, 192, 'Wake Forest', 'Linebacker', 28, 4),
(942, '1996-10-05', 81, 230, 'Hawaii', 'Linebacker', 68, 7),
(943, '1999-02-27', 66, 285, 'Arkansas', 'Fullback', 50, 7),
(944, '1977-01-16', 62, 199, 'Georgia Tech', 'Center', 17, 5),
(945, '1996-01-29', 80, 279, 'Utah State', 'Guard', 61, 3),
(946, '1983-09-11', 80, 284, 'Pittsburgh', 'Wide Receiver', 82, 3),
(947, '1979-05-12', 67, 170, 'Arkansas', 'Guard', 63, 5),
(948, '1996-11-12', 80, 200, 'Notre Dame', 'Quarterback', 54, 7),
(949, '1980-12-25', 73, 160, 'Oregon State', 'Fullback', 7, 6),
(950, '1998-09-20', 73, 302, 'Nebraska', 'Quarterback', 30, 5),
(951, '1998-12-08', 60, 290, 'Georgia Tech', 'Safety', 16, 9),
(952, '1976-08-20', 73, 266, 'Oregon', 'Guard', 20, 3),
(953, '1987-11-05', 80, 166, 'Syracuse', 'Quarterback', 2, 10),
(954, '1984-10-04', 71, 182, 'Tulsa', 'Cornerback', 59, 1),
(955, '1986-12-14', 79, 171, 'Wake Forest', 'Cornerback', 96, 7),
(956, '1980-08-17', 70, 248, 'Louisiana-Lafayette', 'Cornerback', 94, 5),
(957, '1983-09-24', 72, 198, 'Stanford', 'Fullback', 44, 5),
(958, '1982-02-07', 65, 226, 'Massachusetts', 'Fullback', 72, 3),
(959, '1994-12-26', 69, 288, 'Southern Cal', 'Running Back', 30, 10),
(960, '1991-12-13', 70, 255, 'Ball State', 'Center', 82, 1),
(961, '1987-09-17', 81, 292, 'North Carolina State', 'Safety', 14, 8),
(962, '1994-09-02', 84, 244, 'UAB', 'Quarterback', 6, 7),
(963, '1981-09-11', 71, 165, 'New Mexico State', 'Fullback', 69, 6),
(964, '1994-07-27', 74, 265, 'San Jose State', 'Linebacker', 8, 7),
(965, '1987-03-27', 65, 192, 'Syracuse', 'Wide Receiver', 36, 10),
(966, '1998-05-10', 62, 238, 'Boston College', 'Center', 25, 5),
(967, '1981-11-30', 73, 262, 'North Carolina State', 'Tight End', 98, 6),
(968, '1979-11-27', 82, 231, 'East Carolina', 'Center', 71, 2),
(969, '1981-03-01', 68, 250, 'Texas', 'Quaterback', 88, 8),
(970, '1982-02-07', 66, 240, 'UTEP', 'Safety', 39, 5),
(971, '1975-10-01', 61, 259, 'Arizona State', 'Quaterback', 81, 2),
(972, '1985-07-20', 77, 209, 'Arkansas', 'Safety', 45, 10),
(973, '1983-05-24', 85, 270, 'Memphis', 'Linebacker', 62, 9),
(974, '1988-12-29', 71, 226, 'Florida State', 'Quaterback', 22, 2),
(975, '1994-05-21', 81, 210, 'Navy', 'Center', 86, 9),
(976, '1994-04-05', 63, 193, 'California', 'Wide Receiver', 29, 5),
(977, '1982-08-31', 83, 251, 'Indiana', 'Cornerback', 61, 9),
(978, '1995-03-08', 73, 253, 'Louisiana-Lafayette', 'Center', 97, 6),
(979, '1983-11-08', 69, 178, 'Mississippi', 'Quaterback', 27, 2),
(980, '1981-09-21', 75, 231, 'Illinois', 'Running Back', 55, 6),
(981, '1981-03-26', 80, 235, 'Iowa State', 'Center', 33, 7),
(982, '1987-03-10', 64, 214, 'Cincinnati', 'Guard', 87, 2),
(983, '1978-05-19', 74, 188, 'Toledo', 'Fullback', 82, 8),
(984, '1996-07-07', 62, 257, 'Northwestern', 'Center', 25, 9),
(985, '1975-09-26', 78, 268, 'Texas A&M', 'Quaterback', 37, 9),
(986, '1988-04-11', 82, 260, 'Ohio', 'Quaterback', 69, 10),
(987, '1999-08-10', 72, 169, 'Auburn', 'Fullback', 98, 7),
(988, '1975-02-15', 61, 217, 'Boise State', 'Running Back', 5, 3),
(989, '1978-11-20', 77, 211, 'Massachusetts', 'Quaterback', 37, 8),
(990, '1997-07-22', 75, 161, 'Eastern Michigan', 'Fullback', 90, 10),
(991, '1981-02-22', 66, 229, 'Florida International', 'Fullback', 21, 1),
(992, '1980-09-24', 69, 230, 'Navy', 'Cornerback', 74, 6),
(993, '1985-03-10', 65, 166, 'Miami - OH', 'Safety', 95, 6),
(994, '1976-02-21', 71, 240, 'Arizona State', 'Fullback', 55, 8),
(995, '1981-07-09', 75, 221, 'Ohio', 'Quaterback', 89, 9),
(996, '1999-01-09', 84, 197, 'Miami', 'Tight End', 99, 5),
(997, '1978-05-07', 60, 230, 'Arizona State', 'Guard', 61, 9),
(998, '1985-02-16', 64, 223, 'Georgia Southern', 'Linebacker', 4, 10),
(999, '1976-10-10', 75, 216, 'Alabama', 'Tight End', 92, 3),
(1000, '1996-01-17', 72, 165, 'Southern Cal', 'Running Back', 62, 9);





 # Insert Coaches Data
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (29, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (15, 19, 'Offensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (20, 4, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (3, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (16, 24, 'Offensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (21, 19, 'Offensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (32, 20, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (5, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (26, 14, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (14, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (23, 21, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (24, 9, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (4, 27, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (31, 1, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (27, 14, 'Offensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (12, 26, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (8, 2, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (17, 19, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (6, 24, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (18, 27, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (7, 20, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (9, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (11, 3, 'Assitant Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (19, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (28, 11, 'Offensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (13, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (1, 14, 'Offensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (2, 6, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (22, 32, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (30, null, 'Head Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (25, 14, 'Defensive Coach');
insert into coaches (MEMBER_NUM, COACH_REPORTSTO, COACH_ROLE) values (10, 21, 'Assitant Coach');

 # Insert Owners Data
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (33, '2007-08-31', '2012-04-14', 10011972);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (34, '2002-02-10', '2009-06-07', 7171266);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (35, '2009-02-07', '2013-04-23', 33955023);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (37, '2004-10-27', '2006-11-10', 36905028);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (38, '2005-08-13', '2014-05-25', 35980480);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (39, '2000-07-13', '2004-10-09', 11913366);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (40, '2001-06-11', '2007-01-26', 19286947);
insert into owners (MEMBER_NUM, OWNER_HIREDATE, OWNER_STARTDATE, OWNER_BUYPRICE) values (41, '2005-05-13', '2008-09-24', 37783225);

 # Insert Statistics Data
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1055, 42, null, 9643, null, 342, 234, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1056, 43, 4237, 23440, null, 396, 275, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1057, 44, 17820, 20624, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1058, 45, 18260, 17443, 389, 86, 206, 49348, 126);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1059, 46, null, 22733, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1060, 47, null, 17854, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1061, 48, null, 7928, null, 88, 53, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1062, 49, null, 11579, null, 375, 28, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1063, 50, 518, 8912, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1064, 51, 13425, 12026, null, 292, 136, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1065, 52, null, 21600, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1066, 53, null, 5609, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1067, 54, 18723, 4401, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1068, 55, 7839, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1069, 56, 20881, 15607, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1070, 57, null, 5099, null, 92, 84, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1071, 58, 17720, 6310, 387, null, null, 18644, 143);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1072, 59, null, 3830, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1073, 60, 24935, 20657, 214, 266, 146, 49272, 140);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1074, 61, 21846, 11574, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1075, 62, 18735, 19631, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1076, 63, 5816, 6632, null, 375, 249, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1077, 64, 11149, 2836, null, 50, 101, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1078, 65, 9792, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1079, 66, 17950, 1194, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1080, 67, null, null, null, 381, 144, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1081, 68, null, 9071, null, 167, 232, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1082, 69, null, 12623, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1083, 70, 10911, null, null, 105, 238, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1084, 71, 6032, 7368, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1085, 72, null, 23936, 193, 53, 147, 4923, 103);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1086, 73, null, 693, 501, null, null, 86957, 105);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1087, 74, null, 6464, 298, null, null, 86744, 80);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1088, 75, 17534, 4757, null, 337, 281, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1089, 76, 17103, 14827, null, 344, 204, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1090, 77, 7876, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1091, 78, null, 9081, null, 55, 117, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1092, 79, 22947, 22115, null, 14, 144, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1093, 80, 12829, 23664, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1094, 81, 11403, 23918, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1095, 82, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1096, 83, 19621, null, null, 148, 68, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1097, 84, 8345, 6456, 605, 418, 280, 49540, 47);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1098, 85, 19180, 11649, 683, 147, 57, 21718, 25);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1099, 86, 4657, 22628, 272, 397, 6, 44804, 89);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1100, 87, 15579, 20165, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1101, 88, 4375, 8167, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1102, 89, 16591, null, null, 479, 226, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1103, 90, 17373, 3875, 179, null, null, 50430, 29);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1104, 91, 21594, 18602, null, 425, 141, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1105, 92, 19558, 20562, null, 65, 259, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1106, 93, 23391, 9823, 385, 127, 157, 30791, 34);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1107, 94, null, 284, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1108, 95, 17105, null, null, 210, 72, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1109, 96, null, 19068, null, 396, 114, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1110, 97, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1111, 98, null, 19418, null, 467, 180, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1112, 99, 3252, 1554, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1113, 100, 22523, 324, 540, null, null, 18007, 30);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1114, 101, null, 23158, null, 354, 19, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1115, 102, 13104, 20153, null, 254, 250, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1116, 103, 15214, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1117, 104, null, 10357, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1118, 105, 9933, 10602, null, 293, 119, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1119, 106, null, 9657, null, 107, 211, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1120, 107, null, 12622, null, 178, 19, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1121, 108, 7712, 21119, null, 409, 286, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1122, 109, 4818, null, 305, null, null, 44104, 139);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1123, 110, 9013, 11568, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1124, 111, null, 4402, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1125, 112, 9506, 6039, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1126, 113, 20907, 24200, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1127, 114, null, 4462, null, 126, 138, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1128, 115, 20167, 1965, null, 238, 272, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1129, 116, 5937, 309, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1130, 117, null, 16080, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1131, 118, 3117, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1132, 119, 935, 23016, null, 283, 186, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1133, 120, 3500, 11001, null, 241, 29, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1134, 121, 7367, 9869, null, 7, 71, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1135, 122, 12035, 21238, null, 366, 188, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1136, 123, 14723, 21581, null, 220, 66, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1137, 124, 9253, 2219, 212, null, null, 73685, 39);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1138, 125, null, null, 103, null, null, 60457, 147);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1139, 126, null, 7287, 243, null, null, 39848, 112);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1140, 127, 7066, 24547, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1141, 128, null, 9931, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1142, 129, 21891, null, 105, 144, 222, 18582, 113);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1143, 130, 20687, 11692, null, 283, 94, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1144, 131, null, 3937, 346, 189, 213, 67699, 130);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1145, 132, 4223, 20697, null, 283, 189, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1146, 133, null, null, 129, null, null, 20740, 142);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1147, 134, 7932, 24187, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1148, 135, 21834, 10238, null, 296, 187, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1149, 136, 22306, 11703, 1, null, null, 31653, 48);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1150, 137, 992, 14320, null, 43, 126, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1151, 138, 21942, 19450, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1152, 139, 14218, 10581, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1153, 140, 21960, 11771, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1154, 141, null, 15371, 547, 314, 9, 58161, 29);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1155, 142, 7315, 8345, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1156, 143, 3003, 22210, null, 457, 96, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1157, 144, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1158, 145, null, 2005, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1159, 146, 22080, 7436, null, 196, 188, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1160, 147, 16338, 24739, null, 10, 42, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1161, 148, 24393, null, null, 258, 178, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1162, 149, null, 15599, 528, null, null, 25416, 148);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1163, 150, null, 17019, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1164, 151, 14734, 11906, null, 62, 11, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1165, 152, null, 24346, 354, 14, 19, 76763, 143);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1166, 153, 24403, 7173, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1167, 154, 10165, 4012, null, 296, 168, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1168, 155, 5361, 16937, 60, null, null, 25091, 54);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1169, 156, null, null, null, 114, 205, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1170, 157, 10948, 357, null, 466, 111, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1171, 158, 8153, 17259, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1172, 159, null, 356, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1173, 160, 7552, 17664, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1174, 161, 7371, 861, null, 107, 290, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1175, 162, 4230, 5288, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1176, 163, 18974, 20001, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1177, 164, 1207, 19399, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1178, 165, 3920, 12175, 251, 222, 271, 4209, 65);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1179, 166, null, null, null, 70, 156, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1180, 167, 1613, 24977, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1181, 168, 4716, 22598, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1182, 169, 6875, 24553, null, 284, 87, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1183, 170, null, null, 18, null, null, 41421, 67);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1184, 171, 16997, 8444, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1185, 172, 12468, 21192, 387, 123, 65, 58359, 127);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1186, 173, 17257, 241, null, 354, 15, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1187, 174, 11404, 17599, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1188, 175, 9170, 19540, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1189, 176, 12669, 23585, null, 299, 279, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1190, 177, null, 20831, null, 124, 193, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1191, 178, null, 11989, null, 323, 177, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1192, 179, 7218, 15033, 517, 206, 143, 42807, 50);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1193, 180, null, 2337, null, 340, 56, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1194, 181, 2246, 10836, null, 238, 271, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1195, 182, null, 13451, 599, null, null, 83372, 55);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1196, 183, 702, 1327, null, 103, 70, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1197, 184, 4312, 200, null, 33, 171, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1198, 185, 521, 16757, 414, 246, 55, 56196, 40);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1199, 186, 1618, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1200, 187, 13776, 18114, null, 75, 162, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1201, 188, null, 15250, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1202, 189, 5988, 7950, 204, 453, 234, 1289, 85);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1203, 190, null, 8511, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1204, 191, null, 20774, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1205, 192, null, 14474, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1206, 193, 136, 1260, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1207, 194, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1208, 195, null, 22817, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1209, 196, 3484, 5297, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1210, 197, 8970, 9126, null, 386, 267, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1211, 198, 4687, 1541, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1212, 199, 17742, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1213, 200, null, 14346, null, 66, 92, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1214, 201, null, 11386, 57, 244, 278, 95313, 62);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1215, 202, null, 3458, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1216, 203, 23697, 15861, null, 237, 49, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1217, 204, null, 24113, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1218, 205, 21438, 1016, null, 120, 244, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1219, 206, null, null, 572, 139, 107, 81388, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1220, 207, 436, 3781, null, 96, 264, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1221, 208, 11683, 12398, null, 16, 172, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1222, 209, 13581, 10627, null, 82, 15, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1223, 210, 21739, null, null, 323, 169, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1224, 211, 7144, 14234, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1225, 212, null, null, null, 334, 59, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1226, 213, 24673, 2815, null, 470, 157, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1227, 214, 5891, 18091, 99, null, null, 36473, 71);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1228, 215, 22150, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1229, 216, 16154, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1230, 217, null, 2284, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1231, 218, null, null, null, 333, 243, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1232, 219, 6433, 1359, 582, null, null, 71383, 135);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1233, 220, null, 2023, 653, 393, 229, 16442, 92);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1234, 221, null, 19471, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1235, 222, null, 13088, null, 239, 197, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1236, 223, 6050, 13634, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1237, 224, 9270, 9418, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1238, 225, 18601, 23748, 284, null, null, 14070, 79);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1239, 226, 24381, 24786, 225, null, null, 46230, 123);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1240, 227, null, 17999, null, 42, 282, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1241, 228, 3193, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1242, 229, null, 19464, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1243, 230, null, null, 699, null, null, 67757, 112);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1244, 231, 11797, 13485, null, 36, 186, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1245, 232, null, 17450, null, 355, 209, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1246, 233, 543, 11094, null, 90, 278, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1247, 234, null, 21127, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1248, 235, null, 4134, null, 176, 132, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1249, 236, 23386, 7126, 302, 194, 25, 64927, 46);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1250, 237, null, 8318, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1251, 238, 19304, 1113, null, 67, 150, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1252, 239, 6276, 1650, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1253, 240, 12648, 4979, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1254, 241, null, 13914, null, 235, 229, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1255, 242, null, 18073, null, 288, 120, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1256, 243, 1581, 6351, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1257, 244, 23679, 5253, null, 396, 246, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1258, 245, 1807, 5402, null, 34, 28, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1259, 246, 6324, 22364, null, 83, 267, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1260, 247, 7574, 568, null, 26, 258, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1261, 248, 16909, 13291, null, 140, 220, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1262, 249, null, 9824, null, 416, 217, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1263, 250, null, 12717, 693, null, null, 35775, 53);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1264, 251, 252, 10488, null, 87, 297, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1265, 252, null, 9329, null, 169, 60, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1266, 253, 19850, 18429, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1267, 254, null, 9596, null, 170, 293, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1268, 255, 20058, null, 658, null, null, 12013, 53);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1269, 256, 5843, 19171, null, 354, 11, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1270, 257, 1215, 6915, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1271, 258, 13418, 17627, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1272, 259, null, 6861, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1273, 260, null, 6951, null, 221, 177, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1274, 261, null, 2094, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1275, 262, 20322, 11131, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1276, 263, null, 17913, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1277, 264, 23714, 22682, null, 417, 274, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1278, 265, 20095, 13299, 567, null, null, 22211, 96);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1279, 266, 3545, 7211, 81, null, null, 19487, 70);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1280, 267, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1281, 268, 1337, 6723, 430, null, null, 20705, 135);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1282, 269, 1502, 18325, null, 190, 212, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1283, 270, null, 13008, null, 262, 61, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1284, 271, null, 9158, null, 362, 128, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1285, 272, null, 11697, 313, 146, 110, 80903, 106);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1286, 273, 23485, 20346, null, 133, 114, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1287, 274, 15561, 17823, null, 405, 65, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1288, 275, null, 15645, null, 314, 210, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1289, 276, null, 8060, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1290, 277, 4955, 6980, null, 292, 177, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1291, 278, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1292, 279, null, 24753, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1293, 280, 12918, 16207, null, 124, 16, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1294, 281, 24675, 19217, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1295, 282, null, 24777, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1296, 283, 4382, 12369, 407, null, null, 34626, 149);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1297, 284, 4964, 16010, 107, 216, 185, 38945, 110);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1298, 285, 13354, 14057, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1299, 286, null, 7060, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1300, 287, 16139, 7788, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1301, 288, 21305, 4404, null, 395, 88, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1302, 289, null, 6546, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1303, 290, 6400, null, 447, 212, 89, 54364, 144);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1304, 291, 377, 19349, null, 45, 176, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1305, 292, 9127, 16149, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1306, 293, null, 3567, null, 268, 240, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1307, 294, null, 4031, 320, 229, 57, 68312, 137);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1308, 295, 13124, null, null, 213, 94, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1309, 296, null, 3353, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1310, 297, null, 16770, null, 262, 101, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1311, 298, 7623, 18454, null, 13, 64, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1312, 299, 21134, 21140, null, 57, 23, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1313, 300, 24249, 16037, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1314, 301, null, null, null, 49, 152, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1315, 302, 15554, 22028, null, 413, 31, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1316, 303, 19782, 10233, null, 274, 241, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1317, 304, null, 23505, null, 260, 32, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1318, 305, 324, 2302, 57, null, null, 35745, 54);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1319, 306, 5621, null, 578, null, null, 20257, 74);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1320, 307, 186, 14691, 650, 110, 211, 79085, 117);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1321, 308, null, 3568, null, 382, 280, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1322, 309, null, 12573, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1323, 310, 21469, 23047, null, 289, 257, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1324, 311, null, 6236, 651, 85, 252, 22563, 126);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1325, 312, 12853, 5948, null, 437, 166, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1326, 313, 22605, 1959, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1327, 314, 10163, 15268, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1328, 315, null, 12734, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1329, 316, 16365, null, null, 464, 199, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1330, 317, 5938, 6799, null, 158, 213, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1331, 318, 782, 4042, 447, 23, 48, 63543, 97);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1332, 319, 23464, 18995, null, 70, 294, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1333, 320, null, 8764, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1334, 321, 19727, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1335, 322, 4736, 13440, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1336, 323, 11390, 1989, 194, 80, 225, 34278, 85);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1337, 324, 20311, 24583, null, 338, 220, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1338, 325, 8849, null, 141, null, null, 77003, 77);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1339, 326, null, 19588, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1340, 327, 6405, 130, 506, 106, 181, 88385, 38);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1341, 328, null, 684, 304, 58, 143, 30534, 58);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1342, 329, 9151, 14064, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1343, 330, 10053, 10950, null, 102, 95, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1344, 331, 1234, 21266, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1345, 332, 6707, null, null, 219, 142, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1346, 333, null, 7090, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1347, 334, 13933, 4904, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1348, 335, 15675, 16504, 657, 319, 33, 14920, 81);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1349, 336, 15456, 852, 298, 363, 239, 4390, 28);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1350, 337, 5449, 11559, null, 426, 289, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1351, 338, 9291, 1858, null, 89, 185, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1352, 339, 16271, 6366, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1353, 340, null, 10102, 557, 145, 141, 49420, 123);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1354, 341, 9598, 5232, null, 13, 54, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1355, 342, 5033, null, null, 242, 214, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1356, 343, 17123, 5200, null, 41, 282, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1357, 344, null, null, null, 318, 76, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1358, 345, 10339, 8043, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1359, 346, 24362, 18966, null, 196, 219, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1360, 347, null, 22066, 460, 223, 280, 9867, 90);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1361, 348, null, 18545, 35, 212, 49, 29095, 127);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1362, 349, null, 19064, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1363, 350, 4897, 9595, 146, 337, 139, 82565, 49);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1364, 351, 22357, 6930, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1365, 352, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1366, 353, null, 7350, 164, 454, 160, 60407, 136);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1367, 354, null, 22658, null, 222, 166, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1368, 355, 1045, 11218, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1369, 356, 6034, 2885, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1370, 357, null, 22185, 448, 29, 134, 21346, 108);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1371, 358, 19962, 9292, null, 430, 257, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1372, 359, 20330, 7064, null, 349, 164, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1373, 360, 18244, 10761, 558, 473, 53, 49306, 66);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1374, 361, null, 3249, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1375, 362, null, 24534, null, 246, 268, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1376, 363, 18263, 9311, null, 332, 107, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1377, 364, 14701, 8472, null, 42, 284, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1378, 365, 216, 6919, null, 63, 127, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1379, 366, null, 21377, 377, 465, 101, 35644, 91);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1380, 367, null, 18723, null, 291, 53, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1381, 368, 3404, 1073, 362, 207, 59, 67590, 69);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1382, 369, 13540, 15955, 629, null, null, 15225, 121);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1383, 370, 6312, 22820, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1384, 371, 16653, 4540, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1385, 372, 3165, 13663, 645, null, null, 89540, 51);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1386, 373, 14105, 13274, null, 228, 193, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1387, 374, 13090, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1388, 375, 12840, 14581, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1389, 376, 10377, 13596, 647, 307, 191, 77977, 50);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1390, 377, 13167, 17079, 466, 325, 214, 857, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1391, 378, 13805, 4941, null, 210, 211, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1392, 379, 9799, 7347, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1393, 380, 12176, 22313, null, 73, 230, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1394, 381, 4590, 20196, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1395, 382, null, 14009, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1396, 383, null, 15655, null, 451, 15, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1397, 384, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1398, 385, 13694, 10123, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1399, 386, 19567, 1146, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1400, 387, 24509, 8945, 688, null, null, 31454, 118);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1401, 388, 19050, 21424, null, 50, 254, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1402, 389, null, 23716, 315, null, null, 42917, 111);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1403, 390, null, 11752, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1404, 391, 9204, 14090, null, 64, 162, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1405, 392, null, 6158, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1406, 393, null, 15255, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1407, 394, 2862, 11677, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1408, 395, null, 6390, 258, 300, 55, 13269, 91);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1409, 396, null, 655, null, 374, 100, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1410, 397, 12397, null, 335, 18, 253, 2230, 71);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1411, 398, null, 2277, 231, 367, 140, 3139, 92);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1412, 399, 24069, 8464, 532, null, null, 22201, 97);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1413, 400, 10886, 162, 52, null, null, 55043, 134);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1414, 401, null, 8991, null, 91, 48, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1415, 402, 14534, 20893, null, 368, 117, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1416, 403, 19928, 23489, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1417, 404, 21457, 16709, null, 176, 16, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1418, 405, 23001, 18746, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1419, 406, 10160, 16641, 419, 454, 64, 75965, 142);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1420, 407, 10210, 9899, 9, null, null, 12711, 42);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1421, 408, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1422, 409, null, 6091, null, 180, 114, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1423, 410, 5338, 1496, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1424, 411, 1279, 4058, 105, 155, 220, 9798, 30);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1425, 412, 18516, 12897, null, 461, 123, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1426, 413, 10320, 22980, 64, 467, 268, 45750, 127);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1427, 414, 12924, 12633, null, 115, 51, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1428, 415, 8405, null, null, 181, 258, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1429, 416, null, 3234, null, 380, 275, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1430, 417, 12432, 17795, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1431, 418, null, null, 651, null, null, 75951, 62);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1432, 419, 9918, 17315, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1433, 420, null, 8525, null, 72, 87, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1434, 421, 832, null, null, 268, 97, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1435, 422, null, null, 510, 17, 10, 38736, 122);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1436, 423, 20337, 6453, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1437, 424, 22393, 22798, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1438, 425, null, 21227, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1439, 426, null, 4625, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1440, 427, null, 19537, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1441, 428, 17370, 6997, null, 190, 175, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1442, 429, 11049, 15523, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1443, 430, null, 85, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1444, 431, 4809, 7457, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1445, 432, null, 13820, 338, 469, 290, 48102, 41);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1446, 433, 20090, 9388, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1447, 434, 884, 13370, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1448, 435, 13199, 22092, 61, null, null, 16573, 94);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1449, 436, null, 1916, null, 360, 36, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1450, 437, 9190, 20859, 403, 250, 187, 81759, 74);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1451, 438, null, 2115, null, 381, 74, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1452, 439, 23813, 16754, null, 61, 264, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1453, 440, 23138, 15697, null, 58, 278, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1454, 441, 4514, 16619, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1455, 442, 24226, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1456, 443, null, 5454, null, 286, 12, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1457, 444, null, 9821, null, 373, 213, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1458, 445, null, 22621, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1459, 446, null, 8197, 346, 244, 205, 61814, 100);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1460, 447, null, 16459, null, 472, 224, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1461, 448, 12341, 4473, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1462, 449, 10407, null, 320, null, null, 98617, 133);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1463, 450, null, 1897, null, 363, 99, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1464, 451, 14959, 13222, 658, null, null, 80220, 115);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1465, 452, 14159, 11426, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1466, 453, 9802, 13206, 373, null, null, 33342, 103);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1467, 454, 20283, 16632, null, 150, 205, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1468, 455, 13586, 20506, 286, null, null, 61990, 142);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1469, 456, 11827, 19192, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1470, 457, null, null, null, 304, 38, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1471, 458, 24, null, null, 271, 2, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1472, 459, null, 6797, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1473, 460, 9272, 1366, null, 448, 37, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1474, 461, 1937, 14192, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1475, 462, 18446, 7639, 391, null, null, 54515, 86);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1476, 463, 6791, 16490, null, 101, 128, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1477, 464, 22630, 3249, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1478, 465, 22690, 18124, null, 78, 176, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1479, 466, null, 6439, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1480, 467, 2843, 794, 561, null, null, 71010, 92);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1481, 468, 7247, 17742, null, 423, 135, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1482, 469, null, 22402, null, 121, 255, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1483, 470, 2588, 247, 373, null, null, 78596, 149);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1484, 471, 4761, 3417, null, 252, 33, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1485, 472, null, 19952, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1486, 473, 6956, 20683, 656, null, null, 36311, 87);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1487, 474, 4064, 2328, 596, null, null, 34182, 50);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1488, 475, 5403, 23898, 667, 484, 234, 37852, 100);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1489, 476, 16726, 20309, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1490, 477, 9616, 16729, null, 79, 211, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1491, 478, 12930, 9915, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1492, 479, null, 20910, 286, null, null, 73424, 79);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1493, 480, 16533, 20400, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1494, 481, 18553, 9557, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1495, 482, 24765, 1985, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1496, 483, 19462, 11416, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1497, 484, 8504, 24261, 634, 453, 54, 70944, 126);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1498, 485, 20144, 17875, null, 420, 119, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1499, 486, 23529, 709, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1500, 487, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1501, 488, 12742, 18570, null, 401, 51, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1502, 489, null, 5649, 651, null, null, 84936, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1503, 490, 13626, 8430, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1504, 491, 12885, 18919, null, 108, 284, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1505, 492, 16304, 10542, null, 25, 107, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1506, 493, 6695, 8490, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1507, 494, null, 24745, null, 251, 211, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1508, 495, 16549, 24874, 320, 29, 281, 61379, 122);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1509, 496, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1510, 497, 14912, 2117, 262, null, null, 56201, 34);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1511, 498, 10320, 4101, 578, null, null, 27823, 101);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1512, 499, null, 19361, null, 229, 102, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1513, 500, 963, 1092, null, 166, 173, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1514, 501, 12770, 24970, 385, null, null, 19009, 59);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1515, 502, 1267, 1684, 419, null, null, 62343, 93);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1516, 503, 9535, 15252, 594, 289, 46, 98321, 60);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1517, 504, 21728, 17860, null, 45, 118, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1518, 505, 20954, null, 42, 280, 7, 26397, 113);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1519, 506, 6816, 24986, null, 145, 47, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1520, 507, null, 7869, null, 487, 295, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1521, 508, null, 24954, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1522, 509, null, null, 540, null, null, 98192, 105);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1523, 510, 6172, 9395, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1524, 511, 9315, 22862, 246, null, null, 25277, 94);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1525, 512, null, 8502, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1526, 513, 19422, 24507, null, 228, 157, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1527, 514, 3204, 9338, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1528, 515, 5071, 1489, null, 258, 107, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1529, 516, null, null, null, 373, 21, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1530, 517, 8530, 8292, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1531, 518, 19778, 3034, null, 265, 59, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1532, 519, 2615, 16150, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1533, 520, 18896, 1560, null, 359, 172, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1534, 521, 24373, null, null, 139, 147, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1535, 522, 22883, 6324, null, 136, 203, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1536, 523, 14173, 15863, null, 27, 11, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1537, 524, 23321, 13072, null, 246, 161, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1538, 525, 10346, 21385, null, 90, 292, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1539, 526, 1696, 16870, 38, 481, 159, 1605, 44);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1540, 527, 1790, 2022, null, 64, 69, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1541, 528, 9112, 18181, 226, 474, 150, 90685, 63);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1542, 529, 2727, 2822, null, 398, 239, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1543, 530, null, 11814, 156, null, null, 8243, 62);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1544, 531, 12628, null, null, 236, 85, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1545, 532, 21442, null, null, 63, 177, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1546, 533, 21758, 20744, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1547, 534, null, 10606, null, 162, 299, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1548, 535, null, 20673, null, 396, 121, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1549, 536, 16441, 1401, null, 411, 258, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1550, 537, null, 16600, null, 248, 88, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1551, 538, 22755, 1285, null, 125, 199, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1552, 539, null, 21530, null, 35, 214, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1553, 540, 591, 21253, 390, null, null, 95405, 77);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1554, 541, null, 20706, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1555, 542, null, 15571, null, 72, 34, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1556, 543, 3931, 11355, null, 254, 249, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1557, 544, null, 16471, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1558, 545, null, 17947, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1559, 546, 13015, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1560, 547, 19462, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1561, 548, 1116, 14246, 392, 408, 209, 19229, 138);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1562, 549, null, 24898, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1563, 550, 5523, 16217, 578, 416, 166, 90366, 79);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1564, 551, 14341, 11360, 63, 497, 265, 1090, 112);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1565, 552, null, 23874, null, 331, 278, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1566, 553, 18307, 3982, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1567, 554, 1367, 3765, null, 451, 114, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1568, 555, null, 4991, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1569, 556, null, null, null, 359, 227, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1570, 557, 16663, 5003, null, 35, 143, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1571, 558, 9024, 9452, null, 175, 51, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1572, 559, 18082, 4229, 623, 76, 143, 12365, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1573, 560, null, 9618, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1574, 561, 7609, 10240, null, 265, 213, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1575, 562, null, 5768, 333, 419, 129, 36870, 143);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1576, 563, null, 1626, null, 483, 261, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1577, 564, null, 17783, null, 101, 189, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1578, 565, 8433, 17468, 135, 2, 257, 8168, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1579, 566, 21642, 13414, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1580, 567, 21461, 1401, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1581, 568, null, 9517, null, 348, 43, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1582, 569, 1450, 13760, 564, 492, 47, 8653, 127);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1583, 570, 12642, 23592, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1584, 571, 20117, 4188, 269, null, null, 40871, 101);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1585, 572, 23737, null, null, 135, 205, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1586, 573, 5583, 17856, 276, 500, 221, 30254, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1587, 574, null, 20749, null, 16, 215, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1588, 575, 22904, null, 492, null, null, 4000, 35);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1589, 576, 3356, 424, 53, null, null, 76764, 33);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1590, 577, null, 2547, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1591, 578, null, null, null, 499, 99, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1592, 579, null, 24172, null, 483, 186, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1593, 580, 290, 2086, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1594, 581, 15571, 14273, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1595, 582, 1354, 2201, null, 343, 102, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1596, 583, null, 21469, 535, 21, 102, 8125, 102);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1597, 584, null, 9395, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1598, 585, 8488, 9873, 420, 34, 15, 18235, 142);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1599, 586, 5827, 24272, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1600, 587, 4022, 19524, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1601, 588, 8594, 3522, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1602, 589, 3042, 14534, null, 338, 108, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1603, 590, 22847, 3714, null, 293, 126, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1604, 591, 14413, 19272, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1605, 592, 15331, 14886, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1606, 593, 22100, null, null, 126, 285, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1607, 594, null, 5023, null, 186, 99, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1608, 595, 6649, 19464, null, 141, 226, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1609, 596, null, 14883, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1610, 597, null, 10022, 50, null, null, 79150, 47);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1611, 598, 1712, 18027, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1612, 599, null, 8089, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1613, 600, 16360, 10135, 317, null, null, 77094, 124);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1614, 601, 24843, 1126, null, 162, 96, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1615, 602, null, 352, null, 174, 152, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1616, 603, 24248, 14246, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1617, 604, null, 11312, null, 11, 98, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1618, 605, null, 16401, null, 18, 124, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1619, 606, 24075, null, null, 149, 207, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1620, 607, 15164, 9051, 21, 294, 205, 45200, 99);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1621, 608, null, 9653, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1622, 609, 5538, 9766, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1623, 610, 5902, 10161, null, 464, 277, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1624, 611, 10400, 17740, null, 336, 221, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1625, 612, 19742, 24679, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1626, 613, 5652, 23000, null, 222, 171, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1627, 614, null, 14024, null, 182, 64, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1628, 615, 24398, 10240, null, 413, 199, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1629, 616, 1275, 13831, null, 361, 185, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1630, 617, 21187, 22550, null, 76, 19, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1631, 618, null, 5906, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1632, 619, 6803, null, null, 188, 238, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1633, 620, 11641, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1634, 621, 19321, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1635, 622, 11613, 1500, null, 135, 256, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1636, 623, 7232, 9155, 336, 440, 79, 12246, 104);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1637, 624, null, 13793, 697, null, null, 93869, 42);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1638, 625, 3632, 7222, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1639, 626, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1640, 627, null, 20725, 310, null, null, 91096, 28);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1641, 628, null, 2731, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1642, 629, 14171, 553, null, 272, 204, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1643, 630, 22673, 8633, null, 235, 7, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1644, 631, 9167, 4820, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1645, 632, 14637, 15012, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1646, 633, 12613, 4813, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1647, 634, null, 23077, null, 365, 223, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1648, 635, null, null, null, 483, 14, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1649, 636, null, 1508, 296, 31, 19, 30980, 33);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1650, 637, null, 6888, null, 445, 172, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1651, 638, null, 841, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1652, 639, null, 24949, 639, null, null, 38629, 103);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1653, 640, 20731, 12469, 462, 117, 220, 96974, 33);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1654, 641, 15630, 21506, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1655, 642, null, 23523, null, 182, 23, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1656, 643, 24030, 783, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1657, 644, 21277, 23650, 655, null, null, 94194, 54);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1658, 645, null, 16651, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1659, 646, 22805, 18765, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1660, 647, 13941, 13144, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1661, 648, 5103, 19570, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1662, 649, 22069, 23166, null, 344, 290, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1663, 650, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1664, 651, 14999, 13221, null, 133, 78, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1665, 652, 5700, 18968, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1666, 653, 2844, 9184, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1667, 654, 15578, 22475, null, 326, 52, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1668, 655, null, 5605, null, 39, 149, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1669, 656, null, 3096, null, 434, 284, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1670, 657, null, null, null, 255, 232, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1671, 658, null, 17729, null, 182, 62, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1672, 659, 9167, 22704, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1673, 660, 11942, 4062, null, 53, 150, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1674, 661, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1675, 662, 3762, 15474, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1676, 663, 17567, 21793, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1677, 664, 3108, 15200, null, 278, 53, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1678, 665, 1182, 9109, 130, null, null, 84402, 107);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1679, 666, null, 6769, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1680, 667, null, 14445, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1681, 668, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1682, 669, 8933, 24619, 400, null, null, 33024, 120);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1683, 670, 5530, 1129, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1684, 671, 6547, 15125, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1685, 672, 17329, 3661, null, 335, 110, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1686, 673, 22858, 853, null, 384, 189, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1687, 674, null, 12772, null, 148, 48, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1688, 675, null, 806, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1689, 676, null, 9682, 531, null, null, 7021, 122);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1690, 677, null, 1723, null, 497, 154, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1691, 678, 14812, 20302, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1692, 679, null, 24814, 59, 295, 204, 34554, 70);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1693, 680, 12557, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1694, 681, null, 21048, null, 489, 210, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1695, 682, 6243, 22554, null, 87, 160, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1696, 683, 11637, 304, null, 75, 256, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1697, 684, 6316, 10664, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1698, 685, null, 1812, null, 6, 131, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1699, 686, 8256, 23024, 483, null, null, 93730, 98);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1700, 687, null, 11395, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1701, 688, 17204, 5683, null, 451, 183, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1702, 689, 13285, 2919, null, 4, 262, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1703, 690, 18665, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1704, 691, 15607, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1705, 692, 16468, 19606, null, 395, 81, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1706, 693, null, 20517, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1707, 694, 10647, 7033, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1708, 695, null, 21362, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1709, 696, 19140, 19094, null, 251, 294, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1710, 697, 21620, 20182, null, 31, 286, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1711, 698, 2025, 13735, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1712, 699, null, 8997, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1713, 700, 11273, 19435, 284, 99, 26, 84057, 82);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1714, 701, 12741, 24953, null, 7, 77, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1715, 702, 20347, 6161, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1716, 703, 18054, 16735, 381, 38, 267, 37051, 64);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1717, 704, null, 3524, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1718, 705, null, 7649, 301, 371, 24, 27008, 87);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1719, 706, null, 3581, null, 165, 78, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1720, 707, null, 24465, null, 387, 130, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1721, 708, null, 16426, null, 23, 211, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1722, 709, null, 2669, null, 148, 169, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1723, 710, null, 24194, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1724, 711, 17812, 10168, 522, 404, 209, 16132, 101);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1725, 712, null, 6824, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1726, 713, 8749, 8922, null, 295, 287, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1727, 714, 22636, 21989, null, 29, 152, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1728, 715, 5313, 14259, 91, null, null, 6243, 104);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1729, 716, 16468, 16484, null, 114, 168, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1730, 717, 16157, 18882, null, 414, 167, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1731, 718, 24410, 4706, null, 305, 209, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1732, 719, null, null, 11, null, null, 46518, 126);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1733, 720, null, 5880, 538, null, null, 63241, 137);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1734, 721, 22055, 16571, null, 464, 277, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1735, 722, 5644, 3790, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1736, 723, 4578, 20313, null, 267, 1, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1737, 724, 26, 8244, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1738, 725, 19033, 16342, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1739, 726, 11424, 17637, null, 50, 236, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1740, 727, 1731, 1508, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1741, 728, 11268, 231, 65, 278, 204, 75428, 93);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1742, 729, null, 23363, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1743, 730, 3511, 10355, null, 132, 137, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1744, 731, 13658, 20028, null, 406, 283, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1745, 732, 11415, 16917, 610, null, null, 93161, 42);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1746, 733, 17863, 9432, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1747, 734, null, 7128, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1748, 735, null, 16302, 196, null, null, 22115, 116);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1749, 736, 6567, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1750, 737, 22651, 8819, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1751, 738, 7711, 613, null, 457, 35, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1752, 739, 4287, 22465, null, 73, 103, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1753, 740, 14894, 13502, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1754, 741, 12306, 10206, 609, null, null, 39307, 144);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1755, 742, null, 2064, null, 494, 299, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1756, 743, 9221, 11179, 531, null, null, 43001, 46);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1757, 744, null, 20902, null, 228, 11, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1758, 745, 15910, 14049, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1759, 746, 19029, 7965, null, 224, 192, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1760, 747, 15533, 1565, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1761, 748, 3834, 6302, null, 272, 122, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1762, 749, 10834, 602, null, 246, 166, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1763, 750, null, 3316, null, 139, 166, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1764, 751, null, 11134, null, 68, 167, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1765, 752, 2143, null, null, 142, 252, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1766, 753, null, 20886, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1767, 754, null, 3612, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1768, 755, null, 11189, 505, 441, 96, 24689, 57);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1769, 756, null, 22534, null, 178, 229, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1770, 757, 12750, 2742, null, 278, 135, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1771, 758, 593, 339, null, 214, 124, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1772, 759, 20666, 13265, 167, 222, 213, 81208, 57);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1773, 760, 610, 18749, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1774, 761, 24284, 18367, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1775, 762, null, 6757, null, 98, 88, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1776, 763, 20275, null, null, 26, 129, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1777, 764, 7050, 22426, null, 119, 98, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1778, 765, 13542, 15185, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1779, 766, null, 14874, null, 476, 215, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1780, 767, 21620, 9271, 314, null, null, 6345, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1781, 768, 9076, null, null, 37, 125, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1782, 769, 17474, 11462, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1783, 770, 24237, null, null, 14, 148, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1784, 771, 14564, 4876, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1785, 772, 20332, 22581, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1786, 773, null, 2346, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1787, 774, null, 8721, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1788, 775, 6114, 2188, null, 186, 189, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1789, 776, null, 19081, 485, null, null, 80708, 38);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1790, 777, 16578, 6221, null, 335, 89, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1791, 778, 22296, 21136, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1792, 779, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1793, 780, 7196, 16567, null, 376, 102, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1794, 781, 24575, 13661, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1795, 782, 11192, 19490, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1796, 783, null, 195, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1797, 784, null, 15217, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1798, 785, null, 17865, 408, 400, 118, 43553, 64);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1799, 786, 5046, 22790, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1800, 787, 20236, null, null, 108, 87, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1801, 788, null, 17271, null, 449, 118, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1802, 789, 22351, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1803, 790, 20832, 24806, null, 44, 195, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1804, 791, 14146, 3615, null, 104, 150, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1805, 792, null, 1737, null, 294, 2, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1806, 793, null, 12488, null, 274, 110, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1807, 794, null, 7861, null, 83, 91, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1808, 795, null, null, 569, null, null, 47546, 47);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1809, 796, null, 9628, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1810, 797, null, 13173, null, 411, 227, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1811, 798, null, 24260, null, 382, 47, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1812, 799, null, 7970, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1813, 800, null, 15312, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1814, 801, null, 13355, null, 155, 235, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1815, 802, 12539, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1816, 803, null, 5612, null, 481, 101, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1817, 804, 18023, 18471, 167, 486, 127, 42846, 98);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1818, 805, 12796, 19399, null, 44, 121, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1819, 806, 11999, 15069, 671, null, null, 97997, 99);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1820, 807, 2494, 15018, null, 131, 108, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1821, 808, 21991, 22437, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1822, 809, 20382, 15278, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1823, 810, 15395, 12091, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1824, 811, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1825, 812, null, 2195, null, 438, 237, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1826, 813, null, 23264, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1827, 814, 24358, 13248, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1828, 815, 17814, 1760, null, 104, 243, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1829, 816, null, 22206, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1830, 817, 12664, 12073, 373, null, null, 18359, 113);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1831, 818, null, 7799, null, 142, 58, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1832, 819, 14855, 18123, null, 315, 288, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1833, 820, 7629, 24296, null, 496, 221, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1834, 821, 9343, 9092, null, 294, 168, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1835, 822, 12843, 16230, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1836, 823, 3933, 17509, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1837, 824, 10127, 12771, 326, null, null, 89708, 94);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1838, 825, 5799, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1839, 826, null, 939, null, 340, 95, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1840, 827, 754, 23628, null, 367, 257, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1841, 828, 1096, 7182, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1842, 829, null, 19252, 64, null, null, 13891, 134);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1843, 830, null, 14539, null, 402, 267, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1844, 831, 7037, 6972, 634, null, null, 55560, 140);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1845, 832, null, 2358, null, 478, 240, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1846, 833, null, 18357, null, 439, 283, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1847, 834, 12556, 169, null, 13, 271, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1848, 835, 22488, 20788, null, 160, 64, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1849, 836, null, 16272, null, 107, 129, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1850, 837, 4241, null, null, 172, 207, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1851, 838, null, 10831, null, 465, 40, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1852, 839, null, 12616, null, 296, 248, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1853, 840, null, null, 184, null, null, 69281, 55);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1854, 841, 20349, 10270, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1855, 842, 2655, 8214, null, 318, 212, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1856, 843, 20675, 19678, null, 28, 9, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1857, 844, null, 20201, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1858, 845, 13660, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1859, 846, 3626, 21041, null, 407, 100, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1860, 847, null, 8565, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1861, 848, 13268, 2349, null, 415, 13, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1862, 849, null, 19314, null, 58, 229, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1863, 850, 23062, 15449, null, 194, 228, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1864, 851, 3557, 7123, null, 497, 56, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1865, 852, 8687, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1866, 853, 286, null, null, 171, 246, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1867, 854, 7195, 2684, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1868, 855, 16198, 21826, null, 77, 196, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1869, 856, null, 12306, null, 204, 174, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1870, 857, 1614, 19119, null, 24, 216, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1871, 858, 11435, 13249, null, 13, 75, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1872, 859, 862, 4015, 104, null, null, 27638, 93);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1873, 860, 7087, 7192, null, 217, 137, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1874, 861, null, 548, null, 345, 273, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1875, 862, 15815, 20022, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1876, 863, 13609, 10614, 393, null, null, 89582, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1877, 864, null, 22616, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1878, 865, 12093, 8125, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1879, 866, null, 21282, null, 348, 93, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1880, 867, null, null, null, 133, 249, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1881, 868, 7282, 15258, null, 458, 45, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1882, 869, 9311, null, null, 238, 236, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1883, 870, null, 21367, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1884, 871, 16805, 13152, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1885, 872, 7596, 22481, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1886, 873, 4780, 18970, null, 401, 145, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1887, 874, 15659, 24479, 465, null, null, 42543, 102);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1888, 875, 13412, 19922, 216, null, null, 58811, 135);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1889, 876, 19709, 9742, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1890, 877, null, 20703, 320, null, null, 87398, 53);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1891, 878, null, 845, null, 471, 158, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1892, 879, 8475, 664, null, 462, 293, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1893, 880, 7371, 17968, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1894, 881, 9613, 12508, null, 79, 142, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1895, 882, null, 12619, null, 82, 97, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1896, 883, null, 8270, 34, 110, 190, 30577, 95);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1897, 884, null, null, 666, null, null, 75642, 126);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1898, 885, 4301, 17316, null, 24, 227, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1899, 886, 17374, 20493, 127, 404, 87, 63293, 147);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1900, 887, 17164, null, null, 381, 200, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1901, 888, null, 18726, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1902, 889, 495, null, 678, 311, 203, 8810, 81);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1903, 890, 7831, 21000, null, 39, 162, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1904, 891, 24852, null, 341, null, null, 78915, 75);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1905, 892, 7152, 1496, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1906, 893, 5094, 20138, 576, null, null, 91399, 129);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1907, 894, 114, 18473, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1908, 895, null, 15983, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1909, 896, 16575, 6689, null, 261, 105, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1910, 897, 23862, null, null, 130, 107, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1911, 898, 20560, 20800, null, 51, 206, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1912, 899, 19955, null, null, 236, 293, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1913, 900, 14117, 6373, null, 138, 64, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1914, 901, 10318, 14518, 440, 459, 78, 51744, 70);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1915, 902, 4125, 564, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1916, 903, null, 11086, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1917, 904, null, 19190, null, 371, 193, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1918, 905, 2323, 7502, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1919, 906, 17541, 18996, null, 32, 289, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1920, 907, null, 4423, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1921, 908, 19706, 3133, null, 407, 246, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1922, 909, 18397, 15295, 222, 398, 192, 54322, 96);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1923, 910, 16021, 5718, null, 429, 187, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1924, 911, 16824, 9983, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1925, 912, 9977, 10613, null, 306, 71, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1926, 913, 51, 5915, 528, 395, 207, 65687, 111);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1927, 914, 16710, 10202, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1928, 915, 19201, 2905, null, 81, 260, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1929, 916, null, 12013, null, 487, 85, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1930, 917, 14168, null, null, 205, 139, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1931, 918, 1482, 23286, null, 265, 100, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1932, 919, 17022, 6656, null, 129, 40, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1933, 920, 2607, 15040, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1934, 921, 16856, 5028, null, 292, 131, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1935, 922, null, 6916, null, 133, 16, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1936, 923, 7318, 3659, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1937, 924, 4885, null, null, 55, 155, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1938, 925, 11234, 8675, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1939, 926, 21756, 450, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1940, 927, null, 1565, null, 420, 97, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1941, 928, null, 17316, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1942, 929, null, 20373, null, 211, 118, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1943, 930, 8001, 15554, 149, null, null, 66986, 127);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1944, 931, null, 1543, null, 493, 104, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1945, 932, 1676, 19125, null, 75, 115, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1946, 933, 16285, 12143, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1947, 934, null, 9930, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1948, 935, 22820, 14042, null, 371, 208, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1949, 936, null, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1950, 937, 10708, 5365, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1951, 938, 5684, 24709, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1952, 939, 18811, 12730, null, 106, 258, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1953, 940, null, 18377, 521, null, null, 94087, 67);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1954, 941, 19523, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1955, 942, null, 15013, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1956, 943, 6491, 24045, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1957, 944, 7382, 9230, null, 334, 234, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1958, 945, null, 1731, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1959, 946, 18488, 21347, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1960, 947, 838, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1961, 948, null, 14924, null, 266, 26, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1962, 949, 10189, 10154, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1963, 950, 7756, 9537, null, 72, 135, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1964, 951, 15331, 3993, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1965, 952, 638, 22637, null, 125, 69, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1966, 953, null, 14638, 224, null, null, 83342, 32);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1967, 954, 12879, 18563, null, 17, 110, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1968, 955, 17926, 9830, null, 284, 102, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1969, 956, null, 10357, null, 475, 113, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1970, 957, 21653, 11185, null, 483, 195, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1971, 958, null, 24341, null, 293, 55, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1972, 959, null, null, null, 123, 174, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1973, 960, 7426, 531, 432, null, null, 46967, 59);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1974, 961, 21748, 4380, null, 50, 95, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1975, 962, 6866, 18856, null, 326, 105, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1976, 963, null, 7806, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1977, 964, null, 22147, 525, 56, 179, 8073, 139);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1978, 965, 15524, 17463, 31, null, null, 69929, 85);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1979, 966, 21982, 3872, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1980, 967, null, null, null, 329, 205, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1981, 968, null, 6591, null, 466, 105, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1982, 969, null, 9446, 677, null, null, 16556, 111);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1983, 970, 11292, 23467, null, 265, 278, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1984, 971, null, 623, null, 473, 40, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1985, 972, null, 1078, null, 174, 47, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1986, 973, 13769, 11662, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1987, 974, 13807, 3540, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1988, 975, 21016, 16111, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1989, 976, 9013, 3529, null, 494, 161, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1990, 977, 19590, 8141, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1991, 978, 3893, 16967, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1992, 979, null, 10551, 305, null, null, 60660, 62);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1993, 980, null, 965, null, 51, 153, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1994, 981, 6234, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1995, 982, 22820, 5945, null, 22, 284, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1996, 983, 6467, 8780, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1997, 984, 19576, null, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1998, 985, null, 20045, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (1999, 986, null, 17106, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2000, 987, null, null, null, 3, 212, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2001, 988, null, 1242, null, 449, 123, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2002, 989, 8070, 18128, null, 50, 82, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2003, 990, 15718, 1949, null, 258, 211, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2004, 991, 10633, 24065, null, 424, 110, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2005, 992, 22246, 16515, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2006, 993, null, 9773, 462, null, null, 47277, 50);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2007, 994, null, 17876, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2008, 995, 24563, 13112, null, 493, 66, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2009, 996, 12030, 2937, null, null, null, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2010, 997, 9870, null, null, 161, 6, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2011, 998, 20030, 6116, null, 233, 293, null, null);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2012, 999, 13396, 19397, 400, 209, 241, 36407, 78);
insert into statistics (STAT_CODE, MEMBER_NUM, STAT_RECEIVINGYD, STAT_RUSHINGYD, STAT_TDS, STAT_TACKLES, STAT_SACKS, STAT_PASSYD, STAT_QBR) values (2013, 1000, null, 22281, null, null, null, null, null);




