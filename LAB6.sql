CREATE DATABASE LAB6;
/* Delete the tables if they already exist */
drop table if exists Movie CASCADE ;
drop table if exists Reviewer CASCADE ;
drop table if exists Rating CASCADE ;
/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);
/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977,'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

ALTER TABLE Movie ADD PRIMARY KEY (mID);--1
ALTER TABLE Movie ADD UNIQUE (title,year);--2
ALTER TABLE Reviewer ADD PRIMARY KEY (rID);--3
ALTER TABLE Rating add unique (rID,mID,ratingDate);--4
ALTER TABLE Reviewer ADD CONSTRAINT check_name CHECK(name IS NOT NULL);--5
ALTER TABLE Rating ADD CONSTRAINT check_stars CHECK(stars IS NOT NULL);--6
ALTER TABLE Movie ADD CONSTRAINT year_after CHECK(year>1900);--7
ALTER TABLE Rating ADD CONSTRAINT stars_in CHECK(stars IN (1,2,3,4,5));--8
ALTER TABLE Rating ADD CONSTRAINT date_late CHECK(EXTRACT(YEAR FROM ratingDate)>2000);--9

ALTER TABLE Movie  ADD CONSTRAINT movie_check CHECK((director='Steven Spielberg' AND year<1990)
                                                    OR (director = 'James Cameron' and year>1990)
                                                    OR (director NOT IN('Steven Spielberg','James Cameron')));--10

UPDATE Movie SET mID = mID+1;--11 error
INSERT INTO Movie VALUES(109,'Titanic',1997,'JC');--12 error
INSERT INTO Reviewer VALUES(201,'Ted Codd');--13 error
UPDATE Rating SET  rID = 205,mID = 104;--14 error
INSERT INTO Reviewer VALUES (209,NULL);--15 error
UPDATE Rating SET stars = NULL WHERE rID = 208;--16 error
UPDATE Movie SET year = year -40;--17 error
UPDATE Rating SET stars = stars + 1; --18 error;
INSERT INTO Rating VALUES(201,101,1,'1999-01-01');--19 error;
INSERT INTO Movie values (109,'Jurassic Park',1993,'Steven Spielberg');--20 error
UPDATE Movie SET year = year -10 WHERE title = 'Titanic';--21 error;

INSERT INTO Movie VALUES (109,'Titanic',2001,null);--22
UPDATE Rating SET mID = 109;--23
UPDATE Movie SET year = 1901 WHERE director <> 'James Cameron';--24
UPDATE Rating SET stars = stars -1;--25

ALTER TABLE Rating ADD FOREIGN KEY (rID) REFERENCES Reviewer(rID) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE Rating ADD FOREIGN KEY (mID) REFERENCES Movie(mID) ON DELETE CASCADE ;


INSERT INTO Rating VALUES (209,109,3,'2001-01-01'); -- 27 ERROR
UPDATE Rating SET rID = 209 WHERE rID = 208; -- 28 ERROR
UPDATE Rating SET mID = mID +1; -- 29 error
UPDATE Movie SET mID = 109 WHERE mID = 108;--30 ERROR


UPDATE Movie SET mID = 109 WHERE mID = 102; -- 31 done
UPDATE Reviewer SET rID = rID + 10;--32 done
DELETE FROM Reviewer WHERE rID>215; -- 33 DONE
DELETE FROM Movie WHERE mID<105;--34 done
--check
SELECT SUM(rID) FROM Rating WHERE rID IS NOT NULL;
SELECT COUNT(*)FROM Rating WHERE rID IS NULL;

