CREATE DATABASE IF NOT EXISTS strnadova DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE strnadova;

DROP TABLE IF EXISTS accolades;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS coach;
DROP TABLE IF EXISTS image;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS reference;
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS teamplayerstats;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS university;
DROP TABLE IF EXISTS universtiystats;


CREATE TABLE IF NOT EXISTS accolades (
	awardid int(15) NOT NULL,
	awardname varchar(255) NOT NULL,
	year varchar(4) NOT NULL,
	primary key(awardid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS activities (
	activityid int(15) NOT NULL,
	name varchar(255) NOT NULL,
	length varchar(50) NOT NULL,
	primary key(activityid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS coach (
	userid varchar(15) NOT NULL,
	address varchar(255) NOT NULL,
	citizenship varchar(3) NOT NULL,
	dateofbirth date NOT NULL,
	email varchar(255) NOT NULL,
	emailconfidential tinyint(1) NOT NULL,
	gender varchar(1) NOT NULL,
	name varchar(50) NOT NULL,
	password varchar(100) NOT NULL,
	phonenumber varchar(30) NOT NULL,
	experience text NOT NULL,
	verified tinyint(1) NOT NULL,
	views text NOT NULL,
	primary key(userid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS image (
	imageid int(15) NOT NULL,
	imagelink varchar(255) NOT NULL,
	imagename varchar(255) NOT NULL,
	primary key(imageid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS player (
	userid varchar(15) NOT NULL,
	address varchar(255) NOT NULL,
	citizenship varchar(3) NOT NULL,
	dateofbirth date NOT NULL,
	email varchar(255) NOT NULL,
	emailconfidential tinyint(1) NOT NULL,
	gender varchar(1) NOT NULL,
	name varchar(50) NOT NULL,
	password varchar(100) NOT NULL,
	phonenumber varchar(30) NOT NULL,
	act varchar(50) NOT NULL,
	committed text NOT NULL,
	countryplayingin varchar(3) NOT NULL,
	fieldofstudy text NOT NULL,
	gpa float NOT NULL,
	graduation date NOT NULL,
	level varchar(15) NOT NULL,
	links text NOT NULL,
	sat varchar(50) NOT NULL,
	toefl varchar(50) NOT NULL,
	views text NOT NULL,
	videos text NOT NULL,
	parentapproval tinyint(1) NOT NULL,
	primary key(userid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS reference (
	userid varchar(15) NOT NULL,
	address varchar(255) NOT NULL,
	citizenship varchar(3) NOT NULL,
	dateofbirth date NOT NULL,
	email varchar(255) NOT NULL,
	emailconfidential tinyint(1) NOT NULL,
	gender varchar(1) NOT NULL,
	name varchar(50) NOT NULL,
	password varchar(100) NOT NULL,
	phonenumber varchar(30) NOT NULL,
	parent tinyint(1) NOT NULL,
	relationship varchar(50) NOT NULL,
	verified tinyint(1) NOT NULL,
	primary key(userid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS school (
	city varchar(255) NOT NULL,
	country varchar(3) NOT NULL,
	name varchar(255) NOT NULL,
	primary key(name, city)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS teamplayerstats (
	assists tinyint(4) NOT NULL,
	gamesplayed tinyint(4) NOT NULL,
	gamesstarted tinyint(4) NOT NULL,
	goals tinyint(4) NOT NULL,
	minutesplayed tinyint(4) NOT NULL,
	teamid varchar(15) NOT NULL,
	year varchar(10) NOT NULL,
	primary key(userid, teamid, year),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS teams (
	city varchar(255) NOT NULL,
	country varchar(3) NOT NULL,
	division varchar(255) NOT NULL,
	league varchar(255) NOT NULL,
	level varchar(15) NOT NULL,
	name varchar(255) NOT NULL,
	teamid varchar(15) NOT NULL,
	tournamentresults text NOT NULL,
	primary key(teamid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS university (
	academicsupport text NOT NULL,
	awards text NOT NULL,
	city varchar(255) NOT NULL,
	conference varchar(15) NOT NULL,
	country varchar(3) NOT NULL,
	majors text NOT NULL,
	playerarrival date NOT NULL,
	preseasonstart date NOT NULL,
	rankedopponentsresults text NOT NULL,
	rankingwithdate text NOT NULL,
	state varchar(255) NOT NULL,
	springsemesterend date NOT NULL,
	universityname varchar(255) NOT NULL,
	winterbreaklength varchar(50) NOT NULL,
	primary key(universityname)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS universtiystats (
	confloss int(11) NOT NULL,
	confwin int(11) NOT NULL,
	conferenceresults text NOT NULL,
	loss int(11) NOT NULL,
	ncaaresults text NOT NULL,
	universityname varchar(255) NOT NULL,
	videos text NOT NULL,
	win int(11) NOT NULL,
	year varchar(10) NOT NULL,
	primary key(universityname, year),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE IF NOT EXISTS PersonAward (
	AwardID int, 
	UserID varchar(15),
	primary key(AwardID),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UnivAward (
	AwardID int, 
	UniversityName varchar(255),
	primary key(AwardID),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachedAt (
	Position varchar(35),
	UniversityName varchar(255),
	UserID varchar(15), 
	Years int, 
	primary key(UniversityName),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PersonImage (
	ImageId int, 
	UserID varchar(15), 	
	primary key(ImageId, UserID),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UnivImage (
	ImageId int, 
	UniversityName varchar(255),
	primary key(ImageId, UniversityName),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerActivity (
	ActivityID int,
	UserID varchar(15),
	primary key(ActivityID, UserID),
	foreign key() references Stock() 	
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PersonReference (
	PlayerUserID varchar(15),
	ReferenceUserID varchar(15), 	
	primary key(ReferenceUserID),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerSchool (
	City varchar(45), 
	SchoolName varchar(45), 
	UserID varchar(15), 		
	primary key(City, SchoolName, UserID),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerTeam (
	Date date, 
	Postion varchar(20), 	
	TeamID int,
	UserID varchar(15), 	 
	Years int, 	
	primary key(TeamID, UserID),
	foreign key() references Stock()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
