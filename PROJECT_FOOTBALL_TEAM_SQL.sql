CREATE TABLE Club (
    club_id INT PRIMARY KEY,
    name VARCHAR(100),
    foundation_year INT,
    stadium_name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    goals_scored INT,
    games_played INT,
    yellow_cards INT,
    red_cards INT,
    place_of_birth VARCHAR(100),
    telephone_number VARCHAR(15),
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Coach (
    coach_id INT PRIMARY KEY,
    name VARCHAR(100),
    place_of_birth VARCHAR(100),
    experience_years INT,
    salary DECIMAL(10, 2),
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Match_ (
    match_id INT PRIMARY KEY,
    date DATE,
    opponent VARCHAR(100),
    venue VARCHAR(100),
    result VARCHAR(10),
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Club_History (
    history_id INT PRIMARY KEY,
    club_id INT,
    year INT,
    league_position INT,
    trophies_won INT,
    top_scorer INT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id),
    FOREIGN KEY (top_scorer) REFERENCES Player(player_id)
);

CREATE TABLE Training (
    training_id INT PRIMARY KEY,
    date DATE,
    location VARCHAR(100),
    duration_hours DECIMAL(4, 2),
    coach_id INT,
    players_present VARCHAR(255),
    FOREIGN KEY (coach_id) REFERENCES Coach(coach_id)
);

CREATE TABLE Stadium (
    stadium_id INT PRIMARY KEY,
    name VARCHAR(100),
    capacity INT,
    city VARCHAR(100),
    country VARCHAR(100),
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Sponsor (
    sponsor_id INT PRIMARY KEY,
    name VARCHAR(100),
    industry VARCHAR(100),
    contract_start_date DATE,
    contract_end_date DATE,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Injury (
    injury_id INT PRIMARY KEY,
    description TEXT,
    date_of_injury DATE,
    estimated_recovery_date DATE,
    player_id INT,
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE Player_Training (
    player_id INT,
    training_id INT,
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (training_id) REFERENCES Training(training_id),
    PRIMARY KEY (player_id, training_id)
);

CREATE TABLE Player_Match (
    player_id INT,
    match_id INT,
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (match_id) REFERENCES Match_(match_id),
    PRIMARY KEY (player_id, match_id)
);

INSERT INTO Club (club_id, name, foundation_year, stadium_name, city, country)
VALUES 
(1, 'Atlantis FC', 1990, 'Neptune Stadium', 'Atlantis City', 'Atlantis'),
(2, 'Galaxy United', 2005, 'Cosmos Arena', 'Star City', 'Galaxy'),
(3, 'Thunder Dragons', 1985, 'Thunder Dome', 'Thunder City', 'Thunderland'),
(4, 'Aurora Lions', 2010, 'Aurora Park', 'Aurora City', 'Aurora');

INSERT INTO `club_history` VALUES (1,1,2020,1,3,1),(2,2,2020,2,2,2),(3,3,2020,3,1,3),(4,4,2020,4,0,4);

INSERT INTO `coach` VALUES (1,'Coach A','City A',10,10000.00,1),(2,'Coach B','City B',8,9000.00,2),(3,'Coach C','City C',12,11000.00,3),(4,'Coach D','City D',6,8000.00,4);

INSERT INTO `injury` VALUES (1,'Sprained ankle','2024-05-10','2024-05-20',1),(2,'Muscle strain','2024-05-12','2024-05-25',2),(3,'Concussion','2024-05-14','2024-05-30',3),(4,'Knee injury','2024-05-16','2024-06-05',4);

INSERT INTO `match_` VALUES (1,'2024-05-15','Opponent A','Stadium A','Win',1),(2,'2024-05-16','Opponent B','Stadium B','Loss',2),(3,'2024-05-17','Opponent C','Stadium C','Draw',3),(4,'2024-05-18','Opponent D','Stadium D','Win',4);

INSERT INTO `player` VALUES (1,'John Doe',20,30,5,1,'Atlantis','123456789',1),(2,'Jane Smith',15,25,3,0,'Galaxy','987654321',2),(3,'Michael Johnson',10,20,2,0,'Thunderland','555555555',3),(4,'Emma Brown',5,15,1,0,'Aurora City','111222333',4);

INSERT INTO `player_match` VALUES (1,1),(2,1),(3,2),(4,2);

INSERT INTO `player_training` VALUES (1,1),(2,1),(3,2),(4,2);

INSERT INTO `sponsor` VALUES (1,'Sponsor A','Industry A','2024-01-01','2025-01-01',1),(2,'Sponsor B','Industry B','2024-02-01','2025-02-01',2),(3,'Sponsor C','Industry C','2024-03-01','2025-03-01',3),(4,'Sponsor D','Industry D','2024-04-01','2025-04-01',4);

INSERT INTO `stadium` VALUES (1,'Stadium A',50000,'City A','Country A',1),(2,'Stadium B',45000,'City B','Country B',2),(3,'Stadium C',55000,'City C','Country C',3),(4,'Stadium D',60000,'City D','Country D',4);

INSERT INTO `training` VALUES (1,'2024-05-10','Training Ground A',2.50,1,'1,2'),(2,'2024-05-12','Training Ground B',2.00,2,'2,3'),(3,'2024-05-14','Training Ground C',2.50,3,'3,4'),(4,'2024-05-16','Training Ground D',2.00,4,'1,4');




















