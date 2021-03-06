/*All information is from scripts greenconstruction*/
/*Selects from a table*/
SELECT * FROM TBL_COUNTRY;
SELECT * FROM TBL_BRANCH ;
SELECT * FROM TBL_BUILDING ;
SELECT * FROM TBL_ROOF ;
SELECT * FROM TBL_SITE ;
SELECT * FROM TBL_CLIENT ;

/*Gives back listing of variables from table*/
DESCRIBE TBL_COUNTRY;
DESCRIBE TBL_BRANCH;
DESCRIBE TBL_BUILDING;
DESCRIBE TBL_ROOF;
DESCRIBE TBL_SITE;
DESCRIBE TBL_CLIENT;

/*Selects from a table only giving specific details*/
SELECT BRANCHNAME AS NAME, BRANCHEMAIL AS EMAIL, BRANCHPHONE AS "PHONE NUMBER" FROM TBL_BRANCH;
SELECT COUNTRYCAPITAL AS "CAPITAL CITY", COUNTRYNAME AS NAME FROM TBL_COUNTRY;
SELECT CLIENTNAME, COMPANYNAME FROM TBL_CLIENT;
SELECT DISTINCT BUILDINGTYPE FROM TBL_BUILDING;
SELECT SITEADDRESS, STARTDATE, ENDDATE FROM TBL_SITE;

/*Selects from a table where a specific value is*/
SELECT * FROM TBL_COUNTRY WHERE COUNTRYNAME = 'Belgium';
SELECT * FROM TBL_CLIENT WHERE CLIENTID = 12349;
SELECT BUILDINGNAME, BUILDINGTYPE FROM TBL_BUILDING WHERE BUILDINGID = 888;
SELECT * FROM TBL_ROOF WHERE ROOFTYPE = 'pitched';

/*Selects specific values from a table where email begin in "s"*/
SELECT BRANCHNAME AS NAME, BRANCHEMAIL AS EMAIL 
FROM TBL_BRANCH
WHERE BRANCHEMAIL LIKE 's%';

/*Selects specific values from a table there estate is in address*/
SELECT CLIENTID, CLIENTADDRESS FROM TBL_CLIENT
WHERE CLIENTADDRESS LIKE '%Estate%';

/*Selects from a table specific values where values are between*/
SELECT ROOFID, ROOFTYPE FROM TBL_ROOF 
WHERE ROOFSOILDEPTH BETWEEN 60 AND 160;
SELECT ROOFID, ROOFTYPE FROM TBL_ROOF 
WHERE ROOFANGLE BETWEEN 40 AND 60
AND ROOFSOILDEPTH >60;	

/*Selects all from a table where a type is either one or the other*/
SELECT * FROM TBL_BUILDING WHERE BUILDINGTYPE IN ('Apartment', 'Townhouse');

/*Selects addresses where the id is null*/
SELECT SITEADDRESS FROM TBL_SITE WHERE S_BUILDINGID IS NULL;
SELECT SITEADDRESS FROM TBL_SITE WHERE S_ROOFID IS NULL;

/*Selects from a table in a specific order*/
SELECT COUNTRYNAME FROM TBL_COUNTRY ORDER BY COUNTRYNAME;
SELECT COUNTRYCAPITAL, COUNTRYNAME FROM TBL_COUNTRY ORDER BY COUNTRYCAPITAL;

/*Aggregate Functions*/
/*Using different aggregates to select specific details, like average, max, min count etc*/
SELECT COUNT(BRANCHID) FROM TBL_BRANCH;
SELECT COUNT(CLIENTID) FROM TBL_CLIENT WHERE COMPANYDESC = 'SME';
SELECT MAX(ROOFSOILDEPTH) FROM TBL_ROOF; 
SELECT MIN(ROOFSOILDEPTH) FROM TBL_ROOF; 
SELECT COUNT(*) FROM TBL_BUILDING;
SELECT BUILDINGTYPE, COUNT(*) FROM TBL_BUILDING GROUP BY BUILDINGTYPE;
SELECT AVG(BUILDINGHEIGHT) FROM TBL_BUILDING;
SELECT BUILDINGTYPE, AVG(BUILDINGHEIGHT) FROM TBL_BUILDING GROUP BY BUILDINGTYPE;
SELECT BUILDINGTYPE, AVG(BUILDINGHEIGHT) FROM TBL_BUILDING GROUP BY BUILDINGTYPE HAVING AVG(BUILDINGHEIGHT) >80;

/*Joining two tables*/
/*Giving back information from different tables in the one select statement*/

SELECT COUNTRYID, COUNTRYNAME, COUNTRYCAPITAL, BRANCHID, BRANCHNAME, BRANCHEMAIL
FROM TBL_BRANCH, TBL_COUNTRY
WHERE COUNTRYID = B_COUNTRYID
AND COUNTRYID = 222;

SELECT COUNTRYID, COUNTRYNAME, COUNTRYCAPITAL, BRANCHID, BRANCHNAME, BRANCHEMAIL
FROM TBL_BRANCH, TBL_COUNTRY
WHERE COUNTRYID = B_COUNTRYID
AND COUNTRYID = 333;
SELECT COUNTRYID, COUNTRYNAME, COUNTRYCAPITAL, BRANCHID, BRANCHNAME, BRANCHEMAIL
FROM TBL_BRANCH, TBL_COUNTRY
WHERE COUNTRYID = B_COUNTRYID
ORDER BY COUNTRYNAME;

SELECT CLIENTID, CLIENTNAME, COMPANYNAME, SITEADDRESS, STARTDATE, ENDDATE
FROM TBL_SITE, TBL_CLIENT
WHERE C_ClientID = CLIENTID
AND CLIENTNAME = 'STEPHEN MORRISSEY';

SELECT BUILDINGID, BUILDINGNAME, BUILDINGTYPE, SITEADDRESS, STARTDATE, ENDDATE
FROM TBL_SITE, TBL_BUILDING
WHERE S_BUILDINGID = BUILDINGID
AND BUILDINGID = 888;

SELECT ROOFID, ROOFTYPE, SITEADDRESS, STARTDATE, ENDDATE
FROM TBL_SITE, TBL_ROOF
WHERE S_ROOFID = ROOFID
AND ROOFID = 454;

SELECT BUILDINGID, BUILDINGNAME, BUILDINGTYPE, SITEADDRESS, STARTDATE, ENDDATE
FROM TBL_SITE, TBL_BUILDING
WHERE C_ClientID = BUILDINGID
AND BUILDINGHEIGHT >60;
SELECT COUNTRYID, COUNTRYNAME, COUNTRYCAPITAL, BRANCHID, BRANCHNAME, BRANCHADDRESS
FROM TBL_COUNTRY, TBL_BRANCH
WHERE COUNTRYID = B_COUNTRYID
AND BRANCHEMAIL IS NULL;

SELECT STARTDATE, ROOFID, ROOFTYPE
FROM TBL_SITE, TBL_ROOF
WHERE ROOFID = S_ROOFID
AND STARTDATE < sysdate();

SELECT CLIENTID, CLIENTNAME, CLIENTADDRESS, COUNTRYNAME
FROM TBL_CLIENT, TBL_SITE, TBL_BRANCH, TBL_COUNTRY
WHERE CLIENTID = C_ClientID 
AND C_ClientID = BRANCHID
AND COUNTRYID = B_COUNTRYID
AND COUNTRYNAME = 'Ireland';

/*Inserts into tables*/
INSERT INTO TBL_CLIENT VALUES (48921, 'CLODAGH POWER',' KILKENNY ROAD, KILKENNY ','CLPOWER@WIT.IE', 
5552938488, 201273930, 'WIT', null, 'EDUCATION', null, null, null, null, 'Individual');
INSERT INTO TBL_CLIENT VALUES (48922, 'DEAN SCOTT',' MAIN ROAD, CASTLEBAR ','DSCOTT@YAHOO.COM', 
5552972998, 543273930, 'ENGIECHEM', null, 'SCIENCE', null, null, null, null, 'Individual');
INSERT INTO TBL_CLIENT VALUES (48923, 'FERGUS WESLEY',' MOUNT CROSS, CAVAN ','FWESLEY@GMAIL.COM', 
5552938488, 569273930, 'WESCROSS', null, 'RESEARCH', null, null, null, null, 'Individual');

INSERT INTO TBL_SITE VALUES ('18-06-13','CORK ROAD, WATERFORD','18-07-13', 111, 454, NULL, 48921);
INSERT INTO TBL_SITE VALUES ('20-06-13', 'THE CROSS, LONDON', '20-07-13', 222, 121, NULL, 48922);
INSERT INTO TBL_SITE VALUES ('25-06-13','OPEN AVENUE, BRUSSELS','25-07-13', 333, NULL, 777, 48923);

/*Updates to a table*/
update tbl_country
set countrycapital = 'Stockholm'
where countryname = 'Sweden';
update tbl_country
set countrycapital = 'Edinburgh'
where countryname = 'Scotland';

update tbl_country
set countrycapital = 'Cardiff'
where countryname = 'Wales';

update tbl_branch
set branchemail = 'None'
where branchemail is null;

update tbl_branch
set branchaddress = 'realistic address'
where branchid = 666;

update tbl_branch
set branchaddress = 'realistic address'
where branchid = 555;

update tbl_branch
set branchaddress = 'realistic address'
where branchid = 444;

insert into tbl_country values (621, 'tbc', 'Afganistan');

delete from tbl_country where countryid = '621';

delete from tbl_site
where startdate >= '2012-01-01'
and startdate <'2013-01-01';
delete from tbl_site;
rollback;

