USE cs448sp16team3;

DROP TABLE IF EXISTS PlayerActivity;
DROP TABLE IF EXISTS PlayerAward;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS TeamYearlyStats;
DROP TABLE IF EXISTS PlayerActivity;
DROP TABLE IF EXISTS PlayerTeam;
DROP TABLE IF EXISTS UniverstiyStats;
DROP TABLE IF EXISTS CoachAward;
DROP TABLE IF EXISTS PlayerAward;
DROP TABLE IF EXISTS UniversityAward;
DROP TABLE IF EXISTS CoachedAt;
DROP TABLE IF EXISTS Accolades;
DROP TABLE IF EXISTS TeamPlayerStats;
DROP TABLE IF EXISTS Activities;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS PersonReference;
DROP TABLE IF EXISTS PlayerSchool;
DROP TABLE IF EXISTS CoachImage;
DROP TABLE IF EXISTS PlayerImage;
DROP TABLE IF EXISTS UnivImage;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Image;
DROP TABLE IF EXISTS Coach;
DROP TABLE IF EXISTS University;
DROP TABLE IF EXISTS School;

CREATE TABLE IF NOT EXISTS School (
	Name varchar(255) NOT NULL,
	City varchar(255) NOT NULL,	
    Country varchar(50) NOT NULL,
	primary key(Name, City)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Coach (
	UserID varchar(15) NOT NULL,
	Address varchar(255),
	Citizenship varchar(50),
	DateOfBirth date NOT NULL,
	Email varchar(255),
	Emailconfidential tinyint(1) NOT NULL,
	Gender varchar(1) NOT NULL,
	Name varchar(50) NOT NULL,
	Password varchar(100) NOT NULL,
	Phonenumber varchar(30),
	Sport varchar(25),
	Verified tinyint(1) NOT NULL,
	Views varchar(255),
	primary key(userid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Image (
	ImageID int(50) NOT NULL,
	ImageName varchar(100) NOT NULL,
	Image varchar(255),
	primary key(ImageID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Player (
	UserID varchar(15) NOT NULL,
	Address varchar(255),
	Citizenship varchar(50) NOT NULL,
	Committed varchar(255),
	CountryPlayingIn varchar(50),
	DateOfBirth date NOT NULL,
	Email varchar(255),
	EmailConfidential tinyint(1) NOT NULL,
	FieldOfStudy varchar(255),
	Gender varchar(1) NOT NULL,
	Graduation varchar(15),
	Level varchar(15),
	Links varchar(255),
	Name varchar(50) NOT NULL,
	ParentApproval tinyint(1),
	Password varchar(100) NOT NULL,
	PhoneNumber varchar(30),
	Sport varchar(25),
	Views varchar(255),
	Videos varchar(255),
	ACT varchar(15) NOT NULL,
	GPA float NOT NULL,
	SAT varchar(15) NOT NULL,
	TOEFL varchar(15) NOT NULL,
	primary key(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Accolades (
	AwardID int(15) NOT NULL,
	AwardName varchar(255) NOT NULL,
	Type	int NOT NULL,
	primary key(AwardID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachImage (
	ImageID int NOT NULL, 
	UserID varchar(15) NOT NULL, 	
	primary key(ImageID, UserID),
	foreign key(ImageID) references Image(ImageID),
	foreign key(UserID) references Coach(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PersonReference (
	PlayerUserID varchar(15) NOT NULL,
	ReferenceUserID varchar(15) NOT NULL, 	
	primary key(PlayerUserID, ReferenceUserID),
	foreign key(PlayerUserID) references Player(UserID),
	foreign key(ReferenceUserID) references Reference(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerImage (
	ImageID int NOT NULL, 
	UserID varchar(15) NOT NULL, 	
	primary key(ImageID, UserID),
	foreign key(ImageID) references Image(ImageID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerAward (
	AwardID int NOT NULL, 
	UserID varchar(15) NOT NULL,
	Year int NOT NULL,
	primary key(AwardID, UserID, Year),
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Activity (
	ActivityID int(15) NOT NULL,
	Name varchar(255) NOT NULL,
	primary key(ActivityID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Team (
	Teamid varchar(15) NOT NULL,
	City varchar(255) NOT NULL,
	Country varchar(100) NOT NULL,
	Division varchar(255) NOT NULL,
	League varchar(255) NOT NULL,
	Level varchar(15) NOT NULL,
	Name varchar(255) NOT NULL,
	primary key(TeamID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS TeamYearlyStats(
	TeamID varchar(15) NOT NULL,
	Year int NOT NULL,
	SeasonResults varchar(255),
	TournamentResults varchar(255),
	primary key(TeamID, Year),
	foreign key(TeamID) references Team(TeamID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS University (
	UniversityName varchar(255) NOT NULL,
	AcademicSupport varchar(255),
	Awards varchar(255),
	City varchar(255) NOT NULL,
	Conference varchar(75) NOT NULL,
	Country varchar(50) NOT NULL,
	Majors varchar(255) NOT NULL,
	Playerarrival date,
	PreseasonStart date,
	RankedOpponentsResults varchar(255),
	RankingWithDate varchar(255),
	State varchar(255) NOT NULL,
	SpringSemesterEnd date,	
	Videos varchar(255),
	WinterBreakLength varchar(50),
	primary key(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UniverstiyStats (
	UniversityName varchar(255) NOT NULL,
	Year int(4) NOT NULL,
	ConfLoss int(2) NOT NULL,
	ConfWin int(2) NOT NULL,
	ConfTie int(2) NOT NULL,
	ConferenceResults varchar(255) NOT NULL,
	Loss int(2) NOT NULL,
	NCAAResults varchar(255) NOT NULL,
	Tie int(2) NOT NULL,
	Win int(2) NOT NULL,
	primary key(UniversityName, year),
	foreign key(UniversityName) references University(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachAward (
	AwardID int NOT NULL, 
	UserID varchar(15) NOT NULL,
	Year int NOT NULL,
	primary key(AwardID, Year),
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UserID) references Coach(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerAward (
	AwardID int NOT NULL, 
	UserID varchar(15) NOT NULL,
	Year int NOT NULL,
	primary key(AwardID, Year),
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UniversityAward (
	AwardID int NOT NULL, 
	UniversityName varchar(255) NOT NULL,
	Year int NOT NULL,
	foreign key(AwardID) references Accolades(AwardID),
	foreign key(UniversityName) references University(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CoachedAt (
	Position varchar(35) NOT NULL,
	TeamName varchar(255) NOT NULL,
	UserID varchar(15) NOT NULL, 
	Years int, 
	primary key(Position, TeamName, UserID),
	foreign key(UserID) references Coach(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS TeamPlayerStats (
	TeamID varchar(15) NOT NULL,
	UserID varchar(15) NOT NULL,
	Year varchar(10) NOT NULL,
	Assists tinyint(4) NOT NULL,
	CleanSheets tinyint(4) NOT NULL,
	GamesPlayed tinyint(4) NOT NULL,
	GamesStarted tinyint(4) NOT NULL,
	Goals tinyint(4) NOT NULL,
	MinutesPlayed int NOT NULL,
	Postion varchar(20) NOT NULL,	
	primary key(TeamID, UserID, Year),
	foreign key(TeamID) references Team(TeamID),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Activities (
	ActivityID int(15) NOT NULL,
	Name varchar(255) NOT NULL,
	primary key(ActivityID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerActivity (
	activityid int NOT NULL,
	userid varchar(15) NOT NULL,
    Length varchar(50),
	primary key(activityid, userid),
	foreign key(activityid) references Activities(activityid),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS UnivImage (
	ImageID int NOT NULL, 
	UniversityName varchar(255) NOT NULL,
	primary key(ImageID, UniversityName),
	foreign key(ImageID) references Image(ImageID),
	foreign key(UniversityName) references University(UniversityName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerActivity (
	activityid int NOT NULL,
	userid varchar(15) NOT NULL,
	Length varchar(50),
	primary key(activityid, userid),
	foreign key(activityid) references Activities(activityid),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS PlayerSchool (
	SchoolName varchar(255) NOT NULL, 
	City varchar(255) NOT NULL,	
    UserID varchar(15) NOT NULL, 		
	primary key(City, SchoolName, UserID),
	foreign key(SchoolName, City) references School(Name, City),
	foreign key(UserID) references Player(UserID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Insert into Accolades values(1, "Most Valuable Player", 1);
Insert into Accolades values(2, "Most Improved Player", 1);
Insert into Accolades values(3, "Most Improved Offensive Player Award", 1);
Insert into Accolades values(4, "Most Improved Defender Award", 1);
Insert into Accolades values(5, "Defensive Improvement Award", 1);
Insert into Accolades values(6, "Most Improved Goal Keeper Award", 1);
Insert into Accolades values(7, "Most Improved Midfielder Award", 1);
Insert into Accolades values(8, "Most Improved Forward Award", 1);
Insert into Accolades values(9, "Most Assists Award", 1);
Insert into Accolades values(10, "Best Assist Award", 1);
Insert into Accolades values(11, "Best Long Shot Award", 1);
Insert into Accolades values(12, "Toughest Defender Award", 1);
Insert into Accolades values(13, "Bravest Defender Award", 1);
Insert into Accolades values(14, "Best Goalie Award", 1);
Insert into Accolades values(15, "Most Dependable Player Award", 1);
Insert into Accolades values(16, "Best Teamwork Award", 1);
Insert into Accolades values(17, "Most Versatile Player Award", 1);
Insert into Accolades values(18, "Good Sport Award", 1);
Insert into Accolades values(19, "Winning Spirit Award", 1);
Insert into Accolades values(20, "Best Effort Award", 1);
Insert into Accolades values(21, "Leadership Award", 1);
Insert into Accolades values(22, "Team Spirit Award", 1);
Insert into Accolades values(23, "Most Energetic Player Award", 1);
Insert into Accolades values(24, "Role Model Award", 1);
Insert into Accolades values(25, "Best Teammate Award", 1);
Insert into Accolades values(26, "Coach of the Year", 2);
Insert into Accolades values(27, "Western Athletic Conference Coach of the Year", 2);
Insert into Accolades values(28, "Big10 Conference Coach of the Year", 2);
Insert into Accolades values(29, "Conference USA Coach of the Year", 2);
Insert into Accolades values(34, "NSCAA Coach of the Year", 2);
Insert into Accolades values(30, "MAC Hermann Trophy", 3);
Insert into Accolades values(57, "MAC Hermann Trophy semifinalist", 3);
Insert into Accolades values(31, "ISAA Player of the Year", 3);
Insert into Accolades values(32, "ISAA Goalkeeper of the Year", 3);
Insert into Accolades values(33, "All-Big Ten First Team", 3);
Insert into Accolades values(58, "NSCAA Player of the Year", 3);
Insert into Accolades values(35, "NSCAA First Team All-American", 3);
Insert into Accolades values(36, "NSCAA Second Team All-American", 3);
Insert into Accolades values(37, "NSCAA All-Great Lakes First Team", 3);
Insert into Accolades values(38, "All-Great Lakes Third Team", 3);
Insert into Accolades values(39, "Big Ten Midfielder of the Year", 3);
Insert into Accolades values(40, "Big Ten Freshman of the Year", 3);
Insert into Accolades values(41, "All-Big Ten Freshman Team", 3);
Insert into Accolades values(42, "Big Ten Freshman of the Week", 3);
Insert into Accolades values(43, "Soccer America Preseason All-America Team", 3);
Insert into Accolades values(44, "U.S. Soccer Young Female Athlete of the Year", 3);
Insert into Accolades values(45, "Academic All-Big Ten", 3);
Insert into Accolades values(46, "Big Ten Sportsmanship Award", 3);
Insert into Accolades values(47, "Big Ten All-Tournament Team", 3);
Insert into Accolades values(48, "Big Ten Tournament Offensive MVP", 3);
Insert into Accolades values(49, "espnW College Soccer Player of the Week", 3);
Insert into Accolades values(50, "All-Big Ten Second Team", 3);
Insert into Accolades values(51, "NSCAA Central Region Third-Team Member", 3);
Insert into Accolades values(52, "All C-USA First Team", 3);
Insert into Accolades values(53, "All C-USA Second Team", 3);
Insert into Accolades values(54, "All C-USA Third Team", 3);
Insert into Accolades values(55, "C-USA Commissioner's Academic Medalist", 3);
Insert into Accolades values(56, "C-USA Commissioner's Honor Roll", 3);

Insert into Activities values(1, "Astronomy Club");
Insert into Activities values(2, "Biology Club");
Insert into Activities values(3, "Chemistry Club");
Insert into Activities values(4, "Engineering Club");
Insert into Activities values(5, "Distributive Education Clubs of America");
Insert into Activities values(6, "National Honor Society");
Insert into Activities values(7, "Robotics Club");
Insert into Activities values(8, "Science National Honors Society");
Insert into Activities values(9, "Academic Decathlon");
Insert into Activities values(10, "High School Theater Program");
Insert into Activities values(11, "Community Theater Program");
Insert into Activities values(12, "4-H");
Insert into Activities values(13, "Habitat for Humanity");
Insert into Activities values(14, "Student Council");
Insert into Activities values(15, "Student Government");
Insert into Activities values(16, "Yearbook Committee");
Insert into Activities values(17, "Civil Air Patrol");
Insert into Activities values(18, "Junior ROTC");
Insert into Activities values(19, "Choir");
Insert into Activities values(20, "Band");
Insert into Activities values(21, "Orchestra");
Insert into Activities values(22, "Boy Scouts");
Insert into Activities values(23, "Chess Club");
Insert into Activities values(24, "Girl Scouts");
Insert into Activities values(25, "Debate Club");
Insert into Activities values(26, "Baseball");
Insert into Activities values(27, "Basketball");
Insert into Activities values(28, "Football");
Insert into Activities values(29, "Track & Field");
Insert into Activities values(30, "Red Cross");

Insert into Coach values("mtrakh", "1780 E University Ave, Las Cruces, NM 88003", "United States", '1955-5-31', "mtrakh@athletics.nmsu.edu", 0, "M", "Mark Trakh", "test123", "5756445278", "Soccer", 0, "/trunk/files/f00000.txt");
Insert into Coach values("jtrask", "702 West Johnson Street, Madison, WI 53706", "United States", '1953-9-11', "jtt@athletics.wisc.edu", 0, "M", "John Trask", "test123", "9202786445", "Soccer", 0, "/trunk/files/f00000.txt");
Insert into Coach values("kcross", "500 W University Ave, El Paso, TX 79902", "United States", '1972-1-2', "kcross@athletics.utep.edu", 0, "M", "Kevin Cross", "test123", "9155645745",  "Soccer", 0, "/trunk/files/f00000.txt");

Insert into School values("Tanglin Trust School", "Tanglin", "Singapore");
Insert into School values("Garden International School", "Kuala Lumpur", "Malaysia");
Insert into School values("Dulwich School", "Beijing", "China");
Insert into School values("St Christopher’s", "Bahrain", "England");
Insert into School values("Sir James Henderson School", "Milan", "Italy");
Insert into School values("Dulwich", "Shanghai", "China");
Insert into School values("International School of Geneva", "Geneva", "Switzerland");
Insert into School values("St Paul's school", "Sao Paulo", "Brazil");
Insert into School values("Emanuel-Lasker-Oberschule", "Berlin", "Germany");

Insert into Image values(1, "Wisconsin Campus", "/trunk/images/i00000.jpg");
Insert into Image values(2, "NMSU Campus", "/trunk/images/i00001.gif");
Insert into Image values(3, "UTEP Campus", "/trunk/images/i00002.jpg"); 
Insert into Image values(4, "Wisconsin Coach", "/trunk/images/i00003.png");
Insert into Image values(5, "NMSU Coach", "/trunk/images/i00004.jpg");
Insert into Image values(6, "UTEP Coach", "/trunk/images/i00005.jpg");
Insert into Image values(7, "Player One", "/trunk/images/i00006.png");
Insert into Image values(8, "Player Two", "/trunk/images/i00007.jpg");
Insert into Image values(9, "Player Three", "/trunk/images/i00008.png");
Insert into Image values(10, "Wisconsin Logo", "/trunk/images/i00009.png");

Insert into CoachImage values(4, "jtrask");
Insert into CoachImage values(5, "mtrakh");
Insert into CoachImage values(6, "kcross");

Insert into Player values(1, "20 Neuschwansteinstraße 20, 87645 Schwangau, Germany", "German", "/trunk/files/f00001.txt", "Germay", '1998-3-12', "lschmidt@yahoo.com", 1, "/trunk/files/f00002.txt", "M", "May 2016", "Amateur", "/trunk/files/f00000.txt", "Leon Schmidt", 1, "test123", "49 8362 930830", "Soccer", "/trunk/files/f00000.txt", "/trunk/files/f00000.txt", "24", "3.81", "1190", "22");
Insert into Player values(2, "2 Av. Pres. Castelo Branco, Rio de Janeiro, Brazil", "Brazilian", "/trunk/files/f00000.txt", "Brazil", '1999-12-24', "jcastillo@gmail.com", 1, "/trunk/files/f00003.txt", "F", "May 2016", "Amateur", "/trunk/files/f00000.txt", "Juana Castillo", 0, "test123", "55 800 062 7222", "Soccer", "/trunk/files/f00000.txt", "/trunk/files/f00000.txt", "20", "3.5", "900", "28");
Insert into Player values(3, "4 Jingshan Front St, Dongcheng, Beijing, China", "Chinese", "/trunk/files/f00000.txt", "China", '1999-2-5', "jliu@google.com", 0, "/trunk/files/f00004.txt", "F", "May 2019", "Amateur", "/trunk/files/f00000.txt", "Jia Liu", 1, "test123", "86 10 6702 8866", "Soccer", "/trunk/files/f00000.txt", "/trunk/files/f00000.txt", "Unknown", "3.9", "Unknown", "Unknown");

Insert into PlayerImage values(7, 1);
Insert into PlayerImage values(8, 2);
Insert into PlayerImage values(9, 3);

Insert into Team values(1, "Beijing", "China", "East Division", "Premier Development League", "National League", "Beijing Guoan");
Insert into Team values(2, "Changchun", "China", "West Division", "Premier Arena Soccer League", "Premier League", "Changchun Yatai");
Insert into Team values(3, "Taiyuan", "China", "Northwest Division", "National Premier Soccer League", "National League", "Dalian Aerbin");
Insert into Team values(4, "Maceió", "Brazil", "East Division", "Premier Arena Soccer League", "Premier League", "Bandeirante");
Insert into Team values(5, "Manaus", "Brazil", "South Division", "Premier Development League", "Recreational", "Clíper");
Insert into Team values(6, "Aachen", "Germany", "North Division", "National Premier Soccer League", "National League", "Alemannia Aachen");
Insert into Team values(7, "Neunkirchen", "Germany", "East Division", "Premier Development League", "Premier League", "Borussia Neunkirchen");

Insert into University values("New Mexico State University", "/trunk/files/f00005.txt", "/trunk/files/f00008.txt", "Las Cruses", "Western Athletic Conference", "United States of America", "/trunk/files/f00011.txt", '2016-8-19', '2016-4-16', "/trunk/files/f00014.txt", "/trunk/files/f00017.txt", "New Mexico", '2016-5-13', "/trunk/files/f00020.txt", '2015-12-10');
Insert into University values("University of Texas at El Paso", "/trunk/files/f00006.txt", "/trunk/files/f00009.txt", "El Paso", "Conference USA", "United States of America", "/trunk/files/f00012.txt", '2016-8-26', '2016-4-3', "/trunk/files/f00015.txt", "/trunk/files/f00018.txt", "Texas", '2016-5-13', "/trunk/files/f00021.txt", '2015-12-10');
Insert into University values("Univerisity of Wisconsin at Madison", "/trunk/files/f00007.txt", "/trunk/files/f00010.txt", "Madison", "Big 10 Conference", "United States of America", "/trunk/files/f00013.txt", null, '2016-3-6', "/trunk/files/f00016.txt", "/trunk/files/f00019.txt", "Wisconsin", '2016-5-14', "/trunk/files/f00022.txt", '2015-12-17');

Insert into UnivImage values(1, "Univerisity of Wisconsin at Madison");
Insert into UnivImage values(2, "New Mexico State University");
Insert into UnivImage values(3, "University of Texas at El Paso");

Insert into CoachAward values(28, "jtrask", 2014);
Insert into CoachAward values(34, "jtrask", 2014);
Insert into CoachAward values(27, "mtrakh", 2013);

Insert into PlayerAward values(12, 1, 2015);
Insert into PlayerAward values(21, 1, 2015);
Insert into PlayerAward values(15, 1, 2014);
Insert into PlayerAward values(17, 1, 2014);
Insert into PlayerAward values(21, 1, 2014);
Insert into PlayerAward values(23, 1, 2014);
Insert into PlayerAward values(17, 1, 2013);
Insert into PlayerAward values(23, 2, 2013);
Insert into PlayerAward values(14, 2, 2015); 
Insert into PlayerAward values(23, 2, 2015);
Insert into PlayerAward values(2, 2, 2014);
Insert into PlayerAward values(5, 2, 2014);
Insert into PlayerAward values(1, 3, 2015);
Insert into PlayerAward values(16, 3, 2015);
Insert into PlayerAward values(24, 3, 2015);
Insert into PlayerAward values(2, 3, 2014);
Insert into PlayerAward values(3, 3, 2014);

Insert into UniversityAward values(56, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2013);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2013);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2013);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(56, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(51, "University of Texas at El Paso", 2013);
Insert into UniversityAward values(51, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(55, "University of Texas at El Paso", 2015);
Insert into UniversityAward values(52, "University of Texas at El Paso", 2014);
Insert into UniversityAward values(54, "University of Texas at El Paso", 2013);
Insert into UniversityAward values(54, "University of Texas at El Paso", 2013);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(35, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(36, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(50, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(50, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(49, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(48, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(41, "Univerisity of Wisconsin at Madison", 2012);
Insert into UniversityAward values(41, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(40, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(47, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(46, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(46, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2012);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(38, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(33, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(58, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(36, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(37, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(37, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(38, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(39, "Univerisity of Wisconsin at Madison", 2015);
Insert into UniversityAward values(40, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(41, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(42, "Univerisity of Wisconsin at Madison", 2013);
Insert into UniversityAward values(43, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(44, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2014);
Insert into UniversityAward values(45, "Univerisity of Wisconsin at Madison", 2013);

Insert into CoachedAt values("Head Coach", "Pepperdine", "mtrakh", 11);
Insert into CoachedAt values("Head Coach", "University of Southern California", "mtrakh", 5);
Insert into CoachedAt values("Assistan Coach", "Indiana University", "jtrask", 7);
Insert into CoachedAt values("Assistan Coach", "Miami Fusion", "jtrask", 2);
Insert into CoachedAt values("Assistan Coach", "D.C. United", "jtrask", 2);
Insert into CoachedAt values("Assistan Coach", "Dallas Burn", "jtrask", 1);
Insert into CoachedAt values("Head Coach", "University of Illinois at Chicago", "jtrask", 5);
Insert into CoachedAt values("Assistan Coach", "Univeristy of Texas at El Paso", "kcross", 5);
Insert into CoachedAt values("Head Coach", "Texas A&M", "kcross", 2);
Insert into CoachedAt values("Head Coach", "Bryan High School", "kcross", 1);

Insert into PersonReference values(1, 1);
Insert into PersonReference values(1, 4);
Insert into PersonReference values(1, 5);
Insert into PersonReference values(1, 6);
Insert into PersonReference values(2, 2);
Insert into PersonReference values(2, 7);
Insert into PersonReference values(2, 8);
Insert into PersonReference values(3, 3);
Insert into PersonReference values(3, 9);
Insert into PersonReference values(3, 10);

Insert into PlayerActivity values(27, 1, "2 years");
Insert into PlayerActivity values(29, 1, "6 months");
Insert into PlayerActivity values(6, 2, "1 year");
Insert into PlayerActivity values(6, 3, "6 months");
Insert into PlayerActivity values(4, 2, "6 months");
Insert into PlayerActivity values(8, 2, "2 years");
Insert into PlayerActivity values(15, 3, "1 year");
Insert into PlayerActivity values(21, 3, "2 years");
Insert into PlayerActivity values(25, 3, "1.5 years");

Insert into PlayerSchool values("Emanuel-Lasker-Oberschule", "Berlin", 1);
Insert into PlayerSchool values("Dulwich School", "Beijing", 3);
Insert into PlayerSchool values("St Paul's school", "Sao Paulo", 2);

Insert into TeamYearlyStats values(1, 2013, "/trunk/files/f00023.txt", "/trunk/files/f00030.txt");
Insert into TeamYearlyStats values(1, 2014, "/trunk/files/f00023.txt", "/trunk/files/f00030.txt");
Insert into TeamYearlyStats values(1, 2015, "/trunk/files/f00023.txt", "/trunk/files/f00030.txt");
Insert into TeamYearlyStats values(2, 2014, "/trunk/files/f00024.txt", "/trunk/files/f00031.txt");
Insert into TeamYearlyStats values(3, 2015, "/trunk/files/f00025.txt", "/trunk/files/f00032.txt");
Insert into TeamYearlyStats values(4, 2015, "/trunk/files/f00026.txt", "/trunk/files/f00033.txt");
Insert into TeamYearlyStats values(5, 2015, "/trunk/files/f00023.txt", "/trunk/files/f00030.txt");
Insert into TeamYearlyStats values(5, 2014, "/trunk/files/f00023.txt", "/trunk/files/f00030.txt");
Insert into TeamYearlyStats values(6, 2015, "/trunk/files/f00027.txt", "/trunk/files/f00034.txt");
Insert into TeamYearlyStats values(7, 2015, "/trunk/files/f00028.txt", "/trunk/files/f00035.txt");
Insert into TeamYearlyStats values(7, 2014, "/trunk/files/f00029.txt", "/trunk/files/f00036.txt");

Insert into TeamPlayerStats values(1, 3, 2013, 0, 0, 17, 5, 1, 1020, "Center back");
Insert into TeamPlayerStats values(1, 3, 2014, 0, 0, 10, 5, 0, 575, "Center back");
Insert into TeamPlayerStats values(1, 3, 2015, 0, 0, 15, 12, 3, 900, "Center midfield");
Insert into TeamPlayerStats values(2, 3, 2014, 2, 0, 13, 10, 0, 820, "Center back");
Insert into TeamPlayerStats values(3, 3, 2015, 1, 0, 13, 4, 4, 975, "Center back");
Insert into TeamPlayerStats values(4, 2, 2015, 0, 3, 8, 2, 0, 420, "Goalkepper");
Insert into TeamPlayerStats values(5, 2, 2015, 0, 8, 15, 15, 0, 750, "Goalkepper");
Insert into TeamPlayerStats values(5, 2, 2014, 0, 7, 15, 15, 0, 840, "Goalkepper");
Insert into TeamPlayerStats values(6, 1, 2015, 3, 0, 14, 9, 7, 800, "Striker");
Insert into TeamPlayerStats values(7, 1, 2015, 1, 0, 14, 7, 3, 875, "Center forward");
Insert into TeamPlayerStats values(7, 1, 2014, 4, 0, 8, 3, 7, 480, "Striker");

Insert into UniverstiyStats values("Univerisity of Wisconsin at Madison", 2015, 2, 8, 1, "/trunk/files/f00041.txt", 6, "/trunk/files/f00056.txt", 3, 11);
Insert into UniverstiyStats values("Univerisity of Wisconsin at Madison", 2014, 2, 9, 2, "/trunk/files/f00040.txt", 3, "/trunk/files/f00055.txt", 2, 19);
Insert into UniverstiyStats values("Univerisity of Wisconsin at Madison", 2013, 5, 5, 1, "/trunk/files/f00039.txt", 7, "/trunk/files/f00054.txt", 2, 10);
Insert into UniverstiyStats values("Univerisity of Wisconsin at Madison", 2012, 5, 5, 1, "/trunk/files/f00038.txt", 8, "/trunk/files/f00053.txt", 1, 12);
Insert into UniverstiyStats values("Univerisity of Wisconsin at Madison", 2011, 5, 5, 3, "/trunk/files/f00037.txt", 7, "/trunk/files/f00052.txt", 3, 10);
Insert into UniverstiyStats values("New Mexico State University", 2015, 6, 4, 0, "/trunk/files/f00046.txt", 15, "/trunk/files/f00061.txt", 0, 5);
Insert into UniverstiyStats values("New Mexico State University", 2014, 7, 3, 0, "/trunk/files/f00045.txt", 17, "/trunk/files/f00060.txt", 0, 5);
Insert into UniverstiyStats values("New Mexico State University", 2013, 9, 2, 1, "/trunk/files/f00044.txt", 13, "/trunk/files/f00059.txt", 2, 5);
Insert into UniverstiyStats values("New Mexico State University", 2012, 7, 0, 1, "/trunk/files/f00043.txt", 14, "/trunk/files/f00058.txt", 3, 2);
Insert into UniverstiyStats values("New Mexico State University", 2011, 3, 2, 2, "/trunk/files/f00042.txt", 8, "/trunk/files/f00057.txt", 3, 10);
Insert into UniverstiyStats values("University of Texas at El Paso", 2015, 4, 4, 2, "/trunk/files/f00051.txt", 7, "/trunk/files/f00066.txt", 2, 11);
Insert into UniverstiyStats values("University of Texas at El Paso", 2014, 2, 6, 2, "/trunk/files/f00050.txt", 5, "/trunk/files/f00065.txt", 4, 12);
Insert into UniverstiyStats values("University of Texas at El Paso", 2013, 3, 5, 2, "/trunk/files/f00049.txt", 6, "/trunk/files/f00064.txt", 3, 12);
Insert into UniverstiyStats values("University of Texas at El Paso", 2012, 8, 3, 0, "/trunk/files/f00048.txt", 10, "/trunk/files/f00063.txt", 0, 10);
Insert into UniverstiyStats values("University of Texas at El Paso", 2011, 8, 3, 0, "/trunk/files/f00047.txt", 12, "/trunk/files/f00062.txt", 2, 6);