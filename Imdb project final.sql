CREATE TABLE IF NOT EXISTS title_basics(
	tconst VARCHAR(15) NOT NULL PRIMARY KEY, 
	titleType VARCHAR(50),
	primaryTitle TEXT,  -- the title is really long
	originalTitle TEXT, -- the title is really long 
	isAdult BOOLEAN,
	startYear INT,
	endYear INT,
	runtimeMinutes INT,
	gernes VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS name_basics(
	nconst VARCHAR(15), -- unique identifier
    PrimaryName VARCHAR(200),
    primaryProfession VARCHAR(255),
    knownForTitles VARCHAR(255),
    PRIMARY KEY (nconst)
    );
   
CREATE TABLE IF NOT EXISTS Title_Ratings (
	tconst VARCHAR(15), -- tconst reference to title basic
 	averageRating DECIMAL(3,1),
	numVotes INT,
	PRIMARY KEY (tconst),
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);

CREATE TABLE IF NOT EXISTS Title_Principals (
    tconst VARCHAR(15), -- tconst reference to title basic
    ordering INT,
    nconst VARCHAR(15),
    category VARCHAR(50),
    job VARCHAR(255),
    characters TEXT,
    PRIMARY KEY (tconst, ordering), -- composite priimary key
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst),
	FOREIGN KEY (nconst) REFERENCES name_basics(nconst)
);

CREATE TABLE title_akas(
	titleId VARCHAR(15) NOT NULL,
	ordering INT NOT NULL,
	title TEXT NOT NULL,
	region VARCHAR(5),
	language VARCHAR(5),
	types VARCHAR(255) NOT NULL,
	attributes VARCHAR(255) NOT NULL,
	is_original_title	BOOLEAN,
	PRIMARY KEY (titleId, ordering), -- composite primary key
	FOREIGN KEY (titleId) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE -- update colunms 
);

CREATE TABLE title_crew(
	tconst VARCHAR(15) NOT NULL PRIMARY KEY,
	directors VARCHAR(15),
	writers VARCHAR(15),
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS Title_Episode (
    tconst VARCHAR(15),
    parentTconst VARCHAR(15),
    seasonNumber INT,
    episodeNumber INT,
    PRIMARY KEY (tconst),
    CONSTRAINT FK_parent FOREIGN KEY (parentTconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Tid FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);
  
#EXTRA TABLES

CREATE TABLE IF NOT EXISTS title_names(
	nconst VARCHAR(15) PRIMARY KEY,
	PrimaryName VARCHAR(200),
	birthYear INT,
	deathYear INT,
    FOREIGN KEY (nconst) REFERENCES name_basics(nconst) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS profession(
	tconst VARCHAR(15) NOT NULL,
	nconst VARCHAR(15) NOT NULL,
	primaryProfession VARCHAR(255),
	PRIMARY KEY (tconst,nconst), -- composite primary key
    FOREIGN KEY (nconst) REFERENCES name_basics(nconst) ON DELETE CASCADE ON UPDATE CASCADE
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS  knownFor(
	tconst VARCHAR(15) NOT NULL,
	nconst VARCHAR(15) NOT NULL,
	knownForTitles VARCHAR(255),
	primaryProfession VARCHAR(255),
	PRIMARY KEY (tconst,knownForTitles), -- composite primary key
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS director(
	tconst VARCHAR(15) NOT NULL,
    directors VARCHAR(15),
	PRIMARY KEY (tconst,directors), -- composite primary key
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS writer(
	tconst VARCHAR(15) NOT NULL,
    writers VARCHAR(15),
	PRIMARY KEY (tconst,writers), -- composite primary key
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS title_genres(
	tconst VARCHAR(15) NOT NULL,
	genres VARCHAR(255),
	PRIMARY KEY (tconst,genre), -- composite primary key
	FOREIGN KEY (tconst) REFERENCES title_basics(tconst) ON DELETE CASCADE ON UPDATE CASCADE
);