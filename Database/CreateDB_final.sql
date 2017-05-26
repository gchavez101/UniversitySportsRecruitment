USE cs448sp16team3;

DROP TABLE IF EXISTS Accolades;
DROP TABLE IF EXISTS Activities;
DROP TABLE IF EXISTS Coach;
DROP TABLE IF EXISTS Image;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Reference;
DROP TABLE IF EXISTS School;
DROP TABLE IF EXISTS Teamplayerstats;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS University;
DROP TABLE IF EXISTS Universtiystats;


CREATE TABLE IF NOT EXISTS Accolades (
	AwardID int(15) NOT NULL,
	AwardName varchar(255) NOT NULL,
	primary key(AwardID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Activities (
	ActivityID int(15) NOT NULL,
	Name varchar(255) NOT NULL,
	Length varchar(50),
	primary key(ActivityID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Coach (
	UserID varchar(15) NOT NULL,
	Address varchar(255),
	Citizenship varchar(3),
	DateOfBirth date NOT NULL,
	Experience blob,
	Email varchar(255),
	Emailconfidential tinyint(1) NOT NULL,
	Gender varchar(1) NOT NULL,
	Name varchar(50) NOT NULL,
	Password varchar(100) NOT NULL,
	Phonenumber varchar(30),
	Sport varchar(25),
	Verified tinyint(1) NOT NULL,
	Views blob,
	primary key(userid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Image (
	ImageID int(15) NOT NULL,
	ImageLink varchar(255) NOT NULL,
	primary key(ImageID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Player (
	UserID varchar(15) NOT NULL,
	Address varchar(255),
	Citizenship varchar(3) NOT NULL,
	Committed blob,
	CountryPlayingIn varchar(3),
	DateOfBirth date NOT NULL,
	Email varchar(255),
	EmailConfidential tinyint(1) NOT NULL,
	FieldOfStudy blob,
	Gender varchar(1) NOT NULL,
	Graduation varchar(15),
	Level varchar(15),
	Links blob,
	Name varchar(50) NOT NULL,
	ParentApproval tinyint(1),
	Password varchar(100) NOT NULL,
	PhoneNumber varchar(30),
	Sport varchar(25),
	Views blob,
	Videos blob,
	ACT varchar(15) NOT NULL,
	GPA float NOT NULL,
	SAT varchar(15) NOT NULL,
	TOEFL varchar(15) NOT NULL,
	primary key(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Reference (
	UserID varchar(15) NOT NULL,
	Address varchar(255),
	Citizenship varchar(3),
	DateOfBirth date,
	Email varchar(255),
	EmailConfidential tinyint(1),
	Gender varchar(1) NOT NULL,
	Name varchar(50) NOT NULL,
	Password varchar(100) NOT NULL,
	Parent tinyint(1) NOT NULL,
	PhoneNumber varchar(30),
	Relationship varchar(50) NOT NULL,
	Verified tinyint(1) NOT NULL,
	primary key(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS School (
	City varchar(255) NOT NULL,	
	Name varchar(255) NOT NULL,
	Country varchar(3) NOT NULL,
	primary key(City, Name)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Team (
	Teamid varchar(15) NOT NULL,
	City varchar(255) NOT NULL,
	Country varchar(3) NOT NULL,
	Division varchar(255) NOT NULL,
	League varchar(255) NOT NULL,
	Level varchar(15) NOT NULL,
	Name varchar(255) NOT NULL,
	TournamentResults blob,
	primary key(TeamID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS University (
	UniversityName varchar(255) NOT NULL,
	AcademicSupport blob,
	Awards blob,
	City varchar(255) NOT NULL,
	Conference varchar(15) NOT NULL,
	Country varchar(3) NOT NULL,
	Majors blob NOT NULL,
	Playerarrival date,
	PreseasonStart date,
	RankedOpponentsResults blob,
	RankingWithDate blob,
	State varchar(255) NOT NULL,
	SpringSemesterEnd date,	
	WinterBreakLength varchar(50),
	primary key(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachAward (
	AwardID int NOT NULL, 
	UserID varchar(15) NOT NULL,
	primary key(AwardID),
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UserID) references Coach(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerAward (
	AwardID int NOT NULL, 
	UserID varchar(15) NOT NULL,
	primary key(AwardID),
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UniversityAward (
	AwardID int NOT NULL, 
	UniversityName varchar(255) NOT NULL,
	primary key(AwardID),
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UniversityName) references University(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachImage (
	ImageID int NOT NULL, 
	UserID varchar(15) NOT NULL, 	
	primary key(ImageID, UserID),
	foreign key(ImageID) references Image(ImageID),
	foreign key(UserID) references Coach(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerImage (
	ImageID int NOT NULL, 
	UserID varchar(15) NOT NULL, 	
	primary key(ImageID, UserID),
	foreign key(ImageID) references Image(ImageID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UnivImage (
	ImageID int NOT NULL, 
	UniversityName varchar(255) NOT NULL,
	primary key(ImageID, UniversityName),
	foreign key(ImageID) references Image(ImageID),
	foreign key(UniversityName) references University(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachedAt (
	Position varchar(35) NOT NULL,
	UniversityName varchar(255) NOT NULL,
	UserID varchar(15) NOT NULL, 
	Years int, 
	primary key(Position, UniversityName, UserID),
	foreign key(UniversityName) references University(UniversityName),
	foreign key(UserID) references Coach(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PersonReference (
	PlayerUserID varchar(15) NOT NULL,
	ReferenceUserID varchar(15) NOT NULL, 	
	primary key(PlayerUserID, ReferenceUserID),
	foreign key(PlayerUserID) references Player(UserID),
	foreign key(ReferenceUserID) references Reference(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerActivity (
	activityid int NOT NULL,
	userid varchar(15) NOT NULL,
	primary key(activityid, userid),
	foreign key(activityid) references Activities(activityid),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerSchool (
	City varchar(255) NOT NULL, 
	SchoolName varchar(45) NOT NULL, 
	UserID varchar(15) NOT NULL, 		
	primary key(City, SchoolName, UserID),
	foreign key(City, SchoolName) references School(City, Name),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerTeam (
	TeamID int NOT NULL,
	UserID varchar(15) NOT NULL, 
	Dates varchar(20), 
	NumOfYears int NOT NULL,
	Postion varchar(20) NOT NULL, 	
	primary key(TeamID, UserID),
	foreign key(TeamID) references Team(TeamID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS TeamPlayerStats (
	TeamID varchar(15) NOT NULL,
	UserID varchar(15) NOT NULL,
	Year varchar(10) NOT NULL,
	Assists tinyint(4) NOT NULL,
	GamesPlayed tinyint(4) NOT NULL,
	GamesStarted tinyint(4) NOT NULL,
	Goals tinyint(4) NOT NULL,
	MinutesPlayed tinyint(4) NOT NULL,	
	primary key(TeamID, UserID, Year),
	foreign key(TeamID) references Team(TeamID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UniverstiyStats (
	UniversityName varchar(255) NOT NULL,
	Year varchar(10) NOT NULL,
	ConfLoss int(11) NOT NULL,
	ConfWin int(11) NOT NULL,
	ConferenceResults blob NOT NULL,
	Loss int(11) NOT NULL,
	NCAAResults blob NOT NULL,
	Videos blob NOT NULL,
	Win int(11) NOT NULL,
	primary key(UniversityName, year),
	foreign key(UniversityName) references University(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;