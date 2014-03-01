# Srcum Module 

DROP TABLE IF EXISTS SUTB_PROCESSING_DAYS;
DROP TABLE IF EXISTS SUTB_HOLIDAY;
DROP VIEW IF EXISTS SUVW_SCRUM_UPDATE;
DROP TABLE IF EXISTS SUTB_SCRUM_UPDATE;
DROP TABLE IF EXISTS SUTB_SUB_CATEGORY;
DROP TABLE IF EXISTS SUTB_CATEGORY;
DROP TABLE IF EXISTS SUTB_REPORT_TEAM;
DROP TABLE IF EXISTS SUTB_REPORT_DETAIL;

# Tickets Module
DROP TABLE IF EXISTS TKTB_TICKET_EVENT;
DROP TABLE IF EXISTS TKTB_TICKET;
DROP TABLE IF EXISTS TKTB_PRODUCT_USER_MAP;

DROP TABLE IF EXISTS TKTB_SEVERITY;
DROP TABLE IF EXISTS TKTB_STATUS;
DROP TABLE IF EXISTS TKTB_CATEGORY;
DROP TABLE IF EXISTS TKTB_ENVIRONMENT;
DROP TABLE IF EXISTS TKTB_PRODUCT;

# User Module
DROP VIEW IF EXISTS APVW_USER_ACT;

DROP TABLE IF EXISTS APTB_USER;
DROP TABLE IF EXISTS APTB_ROLE;

# Core App
DROP TABLE IF EXISTS CRTB_APP_DETAILS;

# Core App ---------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE  CRTB_APP_DETAILS  (
   CRTB_APP_DETAILS_ID  BINARY(16) NOT NULL,
   PARAM_NAME  VARCHAR(256) NOT NULL,
   PARAM_VALUE  VARCHAR(500) NOT NULL,
   ACT_STATUS  ENUM('Y','N') ,
   CREATED_ON  DATETIME DEFAULT NULL,
   CREATED_BY  BINARY(16) DEFAULT NULL,
   UPDATED_ON  DATETIME DEFAULT NULL,
   UPDATED_BY  BINARY(16) DEFAULT NULL,
  PRIMARY KEY ( CRTB_APP_DETAILS_ID ),
  UNIQUE KEY  PARAM_NAME  ( PARAM_NAME )
);

INSERT INTO CRTB_APP_DETAILS VALUES
( UNHEX(REPLACE(UUID(),'-','')), 'APP NAME', 'Bug Tracker' ,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT),
( UNHEX(REPLACE(UUID(),'-','')), 'VERSION', '0.0.1' ,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT),
( UNHEX(REPLACE(UUID(),'-','')), 'DATE_FORMAT', 'later' ,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT);


# User Module ---------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS APTB_ROLE(
	APTB_ROLE_ID BINARY(16) PRIMARY KEY,
	ROLE VARCHAR(80) UNIQUE NOT NULL,
    ROLE_LEVEL SMALLINT NOT NULL DEFAULT -1,
	DISPLAY_NAME VARCHAR(80) DEFAULT NULL,
	ACT_STS ENUM('Y','N') NOT NULL,
    USER_MGMT ENUM('N','Y') NOT NULL
);

INSERT INTO APTB_ROLE VALUES 
( UNHEX(REPLACE(UUID(),'-','')), 'ADMIN', 0, 'Admin', DEFAULT, 'Y'),
( UNHEX(REPLACE(UUID(),'-','')), 'VP', 1, 'Vice President' , DEFAULT, 'Y'),
( UNHEX(REPLACE(UUID(),'-','')), 'MANAGER',2, 'Manager', DEFAULT, 'Y'),
( UNHEX(REPLACE(UUID(),'-','')), 'DEV', 3, 'Developer', DEFAULT, 'N'),
( UNHEX(REPLACE(UUID(),'-','')), 'LABS', 4, 'Labs', DEFAULT, 'N')
;

CREATE TABLE APTB_USER(
	APTB_USER_ID BINARY(16) PRIMARY KEY,
	USER_NAME VARCHAR(80) UNIQUE NOT NULL,
	USER_PASSWORD VARCHAR(256) NOT NULL,
	FULL_NAME VARCHAR(256) NOT NULL,
	MOBILE_NO VARCHAR(80) NOT NULL,
	EMAIL_ID VARCHAR(256) NOT NULL,
	APTB_ROLE_ID BINARY(16) NOT NULL REFERENCES APTB_ROLE(APTB_ROLE_ID),
	ACT_STS ENUM('Y','N') NOT NULL,
    MICRO_MNGMT ENUM('N','Y') NOT NULL,
    FEEDBACK_REQ ENUM('N','Y') NOT NULL,
	CREATED_ON DATETIME,
	UPDATED_ON DATETIME,
	CREATED_BY BINARY(16),
	UPDATED_BY BINARY(16)
);

SET @ADMIN_ROLE_ID = (SELECT APTB_ROLE_ID FROM APTB_ROLE WHERE ROLE = 'ADMIN');
SET @VP_ROLE_ID = (SELECT APTB_ROLE_ID FROM APTB_ROLE WHERE ROLE = 'VP');
SET @M_ROLE_ID = (SELECT APTB_ROLE_ID FROM APTB_ROLE WHERE ROLE = 'MANAGER');
SET @DEV_ROLE_ID = (SELECT APTB_ROLE_ID FROM APTB_ROLE WHERE ROLE = 'DEV');
SET @LABS_ROLE_ID = (SELECT APTB_ROLE_ID FROM APTB_ROLE WHERE ROLE = 'LABS');

INSERT INTO APTB_USER VALUE 
( UNHEX(REPLACE(UUID(),'-','')), 'ADMIN', 'ADMIN', 'ADMIN', '9986736810', 'krishna.k@mu-sigma.com', 
	@ADMIN_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'zubin', 'zubin', 'Zubin', '9986736810', 'krishna.k@mu-sigma.com', 
	@VP_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'subir', 'subir', 'Subir', '9986736810', 'krishna.k@mu-sigma.com', 
	@M_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'bharat', 'bharat', 'Bharat', '9986736810', 'krishna.k@mu-sigma.com', 
	@M_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'srinivasan', 'srinivasan', 'Srini', '9986736810', 'krishna.k@mu-sigma.com', 
	@M_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'chandrahaas', 'chandrahaas', 'Chandrahaas', '9986736810', 'krishna.k@mu-sigma.com', 
	@DEV_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'manisha', 'manisha', 'Manisha', '9986736810', 'krishna.k@mu-sigma.com', 
	@DEV_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'dinesh', 'dinesh', 'Dinesh', '9986736810', 'krishna.k@mu-sigma.com', 
	@DEV_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'santhosh', 'santhosh', 'Santhosh', '9986736810', 'krishna.k@mu-sigma.com', 
	@DEV_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'avinash', 'avinash', 'Avinash', '9986736810', 'krishna.k@mu-sigma.com', 
	@LABS_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'pravin', 'pravin', 'Pravin', '9986736810', 'krishna.k@mu-sigma.com', 
	@LABS_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL),
( UNHEX(REPLACE(UUID(),'-','')), 'krishna', 'krishna', 'krishna', '9986736810', 'krishna.k@mu-sigma.com', 
	@DEV_ROLE_ID, DEFAULT, DEFAULT, DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL);


CREATE VIEW APVW_USER_ACT AS 
	SELECT
		HEX(APTB_USER_ID) AS APTB_USER_ID,
		USER_NAME,
		USER_PASSWORD,
		FULL_NAME,
		MOBILE_NO,
		EMAIL_ID,
		HEX(U.APTB_ROLE_ID) AS APTB_ROLE_ID,
		U.ACT_STS,
        U.MICRO_MNGMT,
        U.FEEDBACK_REQ,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		HEX(UPDATED_BY) AS UPDATED_BY,
        R.ROLE AS ROLE,
		DISPLAY_NAME AS DISPLAY_NAME,
        ROLE_LEVEL,
        USER_MGMT
        
	FROM aptb_user U
	JOIN aptb_role R ON 
		U.APTB_ROLE_ID = R.APTB_ROLE_ID AND
		R.ACT_STS = 'Y';

CREATE TABLE TKTB_PRODUCT(
	TKTB_PRODUCT_ID BINARY(16) PRIMARY KEY,
	PRODUCT VARCHAR(80) UNIQUE NOT NULL,
	DISPLAY_NAME VARCHAR(80) NOT NULL,
	ACT_STS ENUM('Y','N') NOT NULL
);

# Tickets Module ---------------------------------------------------------------------------------------------------------------------------------
INSERT INTO TKTB_PRODUCT VALUE 
( UNHEX(REPLACE(UUID(),'-','')), 'MUESP', 'MuESP' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'MINT', 'MINT' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'MUSTANG', 'Mustang' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'BUG_TRACKER', 'Bug Tracker' ,DEFAULT )
;

CREATE TABLE TKTB_ENVIRONMENT (
	TKTB_ENVIRONMENT_ID BINARY(16) PRIMARY KEY,
	ENVIRONMENT VARCHAR(80) UNIQUE NOT NULL,
	DISPLAY_NAME VARCHAR(80) NOT NULL,
	ACT_STS ENUM('Y','N') NOT NULL
);

INSERT INTO TKTB_ENVIRONMENT VALUE
(UNHEX(REPLACE(UUID(),'-','')), 'QA', 'QA' ,DEFAULT),
(UNHEX(REPLACE(UUID(),'-','')), 'PROD', 'Production' ,DEFAULT)
;

CREATE TABLE TKTB_PRODUCT_USER_MAP(
	TKTB_PRODUCT_USER_MAP_ID BINARY(16) PRIMARY KEY,
	APTB_PRODUCT_ID BINARY(16) NOT NULL REFERENCES APTB_PRODUCT(APTB_PRODUCT_ID),
	APTB_USER_ID BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID)
);

CREATE TABLE TKTB_STATUS(
	TKTB_STATUS_ID BINARY(16) PRIMARY KEY,
	STATUS VARCHAR(80) UNIQUE NOT NULL,
	DISPLAY_NAME VARCHAR(80) NOT NULL,
	ACT_STS ENUM('Y','N') NOT NULL
);

INSERT INTO TKTB_STATUS VALUES 
( UNHEX(REPLACE(UUID(),'-','')), 'OPENED', 'Opened' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'WIP', 'Work in progress' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'UAT', 'User acceptence test' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'PROD', 'Production' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'RESOLVED', 'Resolved' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'ARCHIVED', 'Archived' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'REOPENED', 'Reopened' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'MIR', 'More info required' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'HOLDED', 'Holded' ,DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'REJECTED', 'Rejected' ,DEFAULT )
;

CREATE TABLE TKTB_SEVERITY(
	TKTB_SEVERITY_ID BINARY(16) PRIMARY KEY,
	SEVERITY VARCHAR(80) UNIQUE NOT NULL,
	DISPLAY_NAME VARCHAR(80) NOT NULL,
	SEQ SMALLINT NOT NULL,
	ACT_STS ENUM('Y','N') NOT NULL
);

INSERT INTO TKTB_SEVERITY VALUES
( UNHEX(REPLACE(UUID(),'-','')), 'LOW', 'Low' , 1, DEFAULT),
( UNHEX(REPLACE(UUID(),'-','')), 'MEDIUM', 'Medium' , 2, DEFAULT),
( UNHEX(REPLACE(UUID(),'-','')), 'HIGH', 'High' , 3, DEFAULT),
( UNHEX(REPLACE(UUID(),'-','')), 'BUSINESS_LOSS', 'Business Loss' , 4, DEFAULT)
;

CREATE TABLE TKTB_CATEGORY(
	TKTB_CATEGORY_ID BINARY(16) PRIMARY KEY,
	CATEGORY VARCHAR(80) UNIQUE NOT NULL,
	DISPLAY_NAME VARCHAR(80) NOT NULL,
	ACT_STS ENUM('Y','N') NOT NULL
);

INSERT INTO TKTB_CATEGORY VALUES
( UNHEX(REPLACE(UUID(),'-','')), 'DEV_ISSUE', 'Development issue' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'CLIENT_ISSUE', 'Client issue' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'COMMUNICATION_GAP', 'Communication gap' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'NEXT_BUILD', 'Next build' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'CHANGE_REQUEST', 'Change request' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'TECH_LIMITATION', 'Techical limitation', DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'INFRA_LIMITATION', 'Infra limitation', DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'ORG_LIMITATION', 'Organization limitation' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'NOT_AN_ISSUE', 'Not an issue' , DEFAULT ),
( UNHEX(REPLACE(UUID(),'-','')), 'FEATURE', 'Feature' , DEFAULT ) ,
( UNHEX(REPLACE(UUID(),'-','')), 'REJECTED', 'Rejected' , DEFAULT ) ,
( UNHEX(REPLACE(UUID(),'-','')), 'NOT_REPRODUCABLE', 'Not reproducable' , DEFAULT ) 
;

CREATE TABLE TKTB_TICKET(
	TKTB_TICKET_ID BINARY(16) PRIMARY KEY,
	TICKET_ID VARCHAR(80) UNIQUE NOT NULL,
	SUBJECT VARCHAR(500) NOT NULL,
	DISC VARCHAR(2000) NOT NULL,
	SIMULATION_STEPS VARCHAR(5000) NOT NULL,
	ISSUE_TYPE ENUM ('RANDOM', 'FREQUENT', 'LONG_RUN'),
	ASSIGNED_TO BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	ETA DATETIME,
	REOPENED_COUNT SMALLINT NOT NULL DEFAULT 0,
	TKTB_PRODUCT_ID BINARY(16) NOT NULL REFERENCES TKTB_PRODUCT(TKTB_PRODUCT_ID),
	TKTB_ENVIRONMENT BINARY(16) NOT NULL REFERENCES TKTB_ENVIRONMENT (TKTB_ENVIRONMENT_ID),
	TKTB_STATUS_ID BINARY(16) NOT NULL REFERENCES TKTB_STATUS (TKTB_STATUS_ID),
	TKTB_CATEGORY_ID BINARY(16) NOT NULL REFERENCES TKTB_CATEGORY (TKTB_CATEGORY_ID),
	TKTB_SEVERITY_ID BINARY(16) NOT NULL REFERENCES TKTB_SEVERITY (TKTB_SEVERITY_ID),
	CREATED_ON DATETIME,
	UPDATED_ON DATETIME,
	CREATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	UPDATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID)
);

CREATE TABLE TKTB_TICKET_EVENT(
	TKTB_TICKET_EVENT_ID BINARY(16) PRIMARY KEY,
	EVENT_ID VARCHAR(80) UNIQUE NOT NULL,
	EVENT_DESC VARCHAR(2000) NOT NULL,
	TKTB_TICKET_ID BINARY(16) NOT NULL REFERENCES TKTB_TICKET(TKTB_TICKET_ID),
	CREATED_ON DATETIME,
	UPDATED_ON DATETIME,
	CREATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	UPDATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID)
);

# Srcum Module ---------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SUTB_REPORT_DETAIL(
	SUTB_REPORT_DETAIL_ID BINARY(16) PRIMARY KEY,
	REPORT_NAME VARCHAR(80) UNIQUE NOT NULL,
	DISPLAY_NAME VARCHAR(80) NOT NULL,
	SCRUM_MASTER_ID BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	REPORT_EVEN_DT TIME NOT NULL,
	ACT_STS ENUM('Y','N') NOT NULL,
	CREATED_ON DATETIME,
	UPDATED_ON DATETIME,
	CREATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	UPDATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID)
);

SET @APTB_USER_ID := (SELECT APTB_USER_ID FROM APTB_USER WHERE USER_NAME LIKE 'bharat');

INSERT INTO SUTB_REPORT_DETAIL VALUES (UNHEX(REPLACE(UUID(),'-','')), 'Dev and Labs Scrum', 'Dev and Labs Scrum', @APTB_USER_ID,
	STR_TO_DATE('08:00', '%H:%i'), DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,@APTB_USER_ID, @APTB_USER_ID);

INSERT INTO SUTB_REPORT_DETAIL VALUES (UNHEX(REPLACE(UUID(),'-','')), 'Big Data Scrum', 'Big Data Scrum', @APTB_USER_ID,
	STR_TO_DATE('08:00', '%H:%i'), DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,@APTB_USER_ID, @APTB_USER_ID);


INSERT INTO SUTB_REPORT_DETAIL VALUES (UNHEX(REPLACE(UUID(),'-','')), 'Cummercialization Scrum', 'Cummercialization Scrum', @APTB_USER_ID,
	STR_TO_DATE('08:00', '%H:%i'), DEFAULT, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,@APTB_USER_ID, @APTB_USER_ID);

SET @SUTB_REPORT_DETAIL_ID = (SELECT SUTB_REPORT_DETAIL_ID FROM SUTB_REPORT_DETAIL WHERE REPORT_NAME = 'Dev and Labs Scrum');

CREATE TABLE SUTB_REPORT_TEAM(
	SUTB_REPORT_TEAM_ID BINARY(16) PRIMARY KEY,
	SUTB_REPORT_DETAIL_ID BINARY(16) NOT NULL REFERENCES SUTB_REPORT_DETAIL(SUTB_REPORT_DETAIL_ID),
	MEMBER_ID BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID)
);

INSERT INTO SUTB_REPORT_TEAM VALUES
(UNHEX(REPLACE(UUID(),'-','')),@SUTB_REPORT_DETAIL_ID, (SELECT APTB_USER_ID FROM APTB_USER WHERE USER_NAME LIKE 'bharat' )),
(UNHEX(REPLACE(UUID(),'-','')),@SUTB_REPORT_DETAIL_ID, (SELECT APTB_USER_ID FROM APTB_USER WHERE USER_NAME LIKE 'krishna' )),
(UNHEX(REPLACE(UUID(),'-','')),@SUTB_REPORT_DETAIL_ID, (SELECT APTB_USER_ID FROM APTB_USER WHERE USER_NAME LIKE 'chandrahaas' )),
(UNHEX(REPLACE(UUID(),'-','')),@SUTB_REPORT_DETAIL_ID, (SELECT APTB_USER_ID FROM APTB_USER WHERE USER_NAME LIKE 'manisha' )),
(UNHEX(REPLACE(UUID(),'-','')),@SUTB_REPORT_DETAIL_ID, (SELECT APTB_USER_ID FROM APTB_USER WHERE USER_NAME LIKE 'pravin' ))
;

CREATE TABLE SUTB_CATEGORY(
	SUTB_CATEGORY_ID BINARY(16) PRIMARY KEY,
	SUTB_REPORT_DETAIL_ID BINARY(16) NOT NULL REFERENCES SUTB_REPORT_DETAIL(SUTB_REPORT_DETAIL_ID),
	CATEGORY VARCHAR(80) NOT NULL,
	CONSTRAINT UNIQUE KEY (SUTB_REPORT_DETAIL_ID, CATEGORY)
);

INSERT INTO SUTB_CATEGORY VALUES
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'Reserch'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'Middleware'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'UI'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'Miscellaneous'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'Infra'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'Labs'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'BPM'),
(UNHEX(REPLACE(UUID(),'-','')), @SUTB_REPORT_DETAIL_ID, 'Hygiene')
;

CREATE TABLE SUTB_SUB_CATEGORY(
	SUTB_SUB_CATEGORY_ID BINARY(16) PRIMARY KEY,
	SUTB_CATEGORY_ID BINARY(16) NOT NULL REFERENCES SUTB_CATEGORY(SUTB_CATEGORY_ID),
	SUB_CATEGORY VARCHAR(80) NOT NULL,
	CONSTRAINT UNIQUE KEY (SUTB_CATEGORY_ID, SUB_CATEGORY)
);

SET @RESERCH_ID = (SELECT SUTB_CATEGORY_ID FROM SUTB_CATEGORY WHERE CATEGORY = 'Reserch');
SET @MiddleWare_ID = (SELECT SUTB_CATEGORY_ID FROM SUTB_CATEGORY WHERE CATEGORY = 'Middleware');
SET @UI_ID = (SELECT SUTB_CATEGORY_ID FROM SUTB_CATEGORY WHERE CATEGORY = 'UI');

INSERT INTO SUTB_SUB_CATEGORY VALUES
(UNHEX(REPLACE(UUID(),'-','')), @RESERCH_ID, 'Scalability'),
(UNHEX(REPLACE(UUID(),'-','')), @MiddleWare_ID, 'Platform'),
(UNHEX(REPLACE(UUID(),'-','')), @MiddleWare_ID, 'CoreEngine'),
(UNHEX(REPLACE(UUID(),'-','')), @MiddleWare_ID, 'Webservices'),
(UNHEX(REPLACE(UUID(),'-','')), @UI_ID, 'Studio'),
(UNHEX(REPLACE(UUID(),'-','')), @UI_ID, 'Monitoring')
;

CREATE TABLE SUTB_SCRUM_UPDATE(
	SUTB_SCRUM_UPDATE_ID BINARY(16) PRIMARY KEY,
	SUTB_REPORT_DETAIL_ID BINARY(16) NOT NULL REFERENCES SUTB_REPORT_DETAIL(SUTB_REPORT_DETAIL_ID),
	SUTB_CATEGORY_ID BINARY(16) DEFAULT NULL REFERENCES SUTB_CATEGORY(SUTB_CATEGORY_ID),
	SUTB_SUB_CATEGORY_ID BINARY(16) DEFAULT NULL REFERENCES SUTB_SUB_CATEGORY(SUTB_SUB_CATEGORY_ID),
	MEMBER_ID BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	UPDATE_TXT TEXT NOT NULL,
    HOURS_SPENT TIME,
	ACT_STS ENUM('Y','N') NOT NULL,
    PROCESS_STS ENUM('N','Y') NOT NULL DEFAULT 'N',
	CREATED_ON DATETIME,
	UPDATED_ON DATETIME,
	CREATED_BY BINARY(16) NOT NULL REFERENCES APTB_USER(APTB_USER_ID),
	UPDATED_BY BINARY(16) DEFAULT NULL REFERENCES APTB_USER(APTB_USER_ID)
);


CREATE VIEW SUVW_SCRUM_UPDATE AS 
	SELECT
		HEX(A.SUTB_SCRUM_UPDATE_ID) AS SUTB_SCRUM_UPDATE_ID,
		HEX(A.SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		HEX(A.SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		HEX(A.SUTB_SUB_CATEGORY_ID) AS SUTB_SUB_CATEGORY_ID,
		HEX(A.MEMBER_ID) AS MEMBER_ID,
		A.UPDATE_TXT,
        DATE_FORMAT(HOURS_SPENT, '%H:%i') AS HOURS_SPENT,
        A.ACT_STS,
		DATE_FORMAT(A.CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(A.UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(A.CREATED_BY) AS CREATED_BY,
		HEX(A.UPDATED_BY) AS UPDATED_BY,
		B.REPORT_NAME,
		IFNULL(B.DISPLAY_NAME, 'N/A') AS REPORT_DISPLAY_NAME,
		IFNULL(C.CATEGORY, 'N/A') AS CATEGORY,
		IFNULL(D.SUB_CATEGORY, 'N/A') AS SUB_CATEGORY,
        U.FULL_NAME
		
	FROM SUTB_SCRUM_UPDATE A
    INNER JOIN APTB_USER U ON
    A.MEMBER_ID = U.APTB_USER_ID
	LEFT OUTER JOIN SUTB_REPORT_DETAIL B ON
	A.SUTB_REPORT_DETAIL_ID = B.SUTB_REPORT_DETAIL_ID
	LEFT OUTER JOIN SUTB_CATEGORY C ON
	A.SUTB_CATEGORY_ID = C.SUTB_CATEGORY_ID 
	LEFT OUTER JOIN SUTB_SUB_CATEGORY D ON
	A.SUTB_SUB_CATEGORY_ID = D.SUTB_SUB_CATEGORY_ID
    
	ORDER BY REPORT_DISPLAY_NAME, CATEGORY,SUB_CATEGORY, A.CREATED_ON ;

CREATE TABLE SUTB_PROCESSING_DAYS(
    SUTB_PROCESSING_DAYS_ID BINARY(16) PRIMARY KEY,
    WEEK_DAY ENUM('MON','TUE','WED','THU','FRI','SAT','SUN') NOT NULL UNIQUE
);

CREATE TABLE SUTB_HOLIDAY(
    SUTB_HOLIDAY_ID BINARY(16) PRIMARY KEY,
    HOLIDAY_ON DATE NOT NULL UNIQUE
);