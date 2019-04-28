# Authors: Matthew Olker, Spencer Peters, Chad Sigmon, Rahul
# Class: CSC3210

# DROP TABLE IF EXISTS `divisions`;

CREATE TABLE `divisions` (
	DIV_CODE int(11) NOT NULL UNIQUE,
	DIV_NAME varchar(40) NOT NULL,
	PRIMARY KEY(DIV_CODE)
	);

# Inserts

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

# Inserts

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
	SCHED_CODE int(11) NOT NULL UNIQUE,
	TEAM_CODE int(11) NOT NULL,
	HOME_TEAM varchar(25),
	AWAY_TEAM varchar(25),
	PRIMARY KEY(SCHED_CODE),
	FOREIGN KEY(TEAM_CODE) REFERENCES `teams` (TEAM_CODE) ON UPDATE CASCADE
);

# Inserts

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

# Inserts

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

# Inserts

DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
	MEMBER_NUM int(11) NOT NULL REFERENCES `members`,
	COACH_REPORTSTO int(11) NOT NULL,
	COACH_ROLE varchar(20) NOT NULL,
	PRIMARY KEY(MEMBER_NUM),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `members` (MEMBER_NUM)
);

# Inserts

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

# Inserts

DROP TABLE IF EXISTS `owners`;

CREATE TABLE `owners` (
	MEMBER_NUM int(11) NOT NULL UNIQUE REFERENCES `members`,
	OWNER_HIREDATE date NOT NULL,
	OWNER_STARTDATE date NOT NULL,
	OWNER_BUYPRICE int(12) NOT NULL, 
	PRIMARY KEY(MEMBER_NUM),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `members` (MEMBER_NUM)
);

# Inserts

DROP TABLE IF EXISTS `statistics`;

CREATE TABLE `statistics` (
	STAT_CODE int(11) NOT NULL UNIQUE,
	MEMBER_NUM int(3) NOT NULL REFERENCES `players`,
	STAT_RECEIVINGYD int(4) NOT NULL,
	STAT_RUSHINGYD int(4) NOT NULL,
	STAT_TDS int(3) NOT NULL,
	STAT_TACKLES int(3) NOT NULL,
	STAT_SACKS int(3) NOT NULL,
	STAT_PASSYD int(4) NOT NULL,
	STAT_QBR int(3) NOT NULL,
	PRIMARY KEY(STAT_CODE),
	FOREIGN KEY(MEMBER_NUM) REFERENCES `players` (MEMBER_NUM)
);

# Inserts
