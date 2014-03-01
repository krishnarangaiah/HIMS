DELIMITER $$
DROP PROCEDURE IF EXISTS CRPR_APP_DETAILS_LIST $$
CREATE PROCEDURE CRPR_APP_DETAILS_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
CRPR_APP_DETAILS_LIST:
 BEGIN
	SELECT
		HEX(CRTB_APP_DETAILS_ID) AS CRTB_APP_DETAILS_ID,
		PARAM_NAME,
		PARAM_VALUE,
		ACT_STATUS,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM CRTB_APP_DETAILS;
END
CRPR_APP_DETAILS_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS CRPR_APP_DETAILS_DELETE $$
CREATE PROCEDURE CRPR_APP_DETAILS_DELETE (
	IN pIN_CRTB_APP_DETAILS_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
CRPR_APP_DETAILS_DELETE:
 BEGIN
	DELETE
	FROM CRTB_APP_DETAILS
	WHERE CRTB_APP_DETAILS_ID = UNHEX(pIN_CRTB_APP_DETAILS_ID);
END
CRPR_APP_DETAILS_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS CRPR_APP_DETAILS_ADD $$
CREATE PROCEDURE CRPR_APP_DETAILS_ADD (
	IN pIN_CRTB_APP_DETAILS_ID VARCHAR(32),
	IN pIN_PARAM_NAME VARCHAR(256),
	IN pIN_PARAM_VALUE VARCHAR(500),
	IN pIN_ACT_STATUS VARCHAR(200),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
CRPR_APP_DETAILS_ADD:
 BEGIN

	INSERT INTO CRTB_APP_DETAILS (
		CRTB_APP_DETAILS_ID, 
		PARAM_NAME, 
		PARAM_VALUE, 
		ACT_STATUS, 
		CREATED_ON, 
		CREATED_BY, 
		UPDATED_ON, 
		UPDATED_BY
		)
	VALUES (
		UNHEX(pIN_CRTB_APP_DETAILS_ID),
		pINPARAM_NAME,
		pINPARAM_VALUE,
		pINACT_STATUS,
		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		UNHEX(pIN_CREATED_BY),
		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		UNHEX(pIN_UPDATED_BY)
		);
END
CRPR_APP_DETAILS_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS CRPR_APP_DETAILS_UPDATE $$
CREATE PROCEDURE CRPR_APP_DETAILS_UPDATE (
	IN pIN_CRTB_APP_DETAILS_ID VARCHAR(32),
	IN pIN_PARAM_NAME VARCHAR(256),
	IN pIN_PARAM_VALUE VARCHAR(500),
	IN pIN_ACT_STATUS VARCHAR(200),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
CRPR_APP_DETAILS_UPDATE:
 BEGIN

	UPDATE CRTB_APP_DETAILS SET
		CRTB_APP_DETAILS_ID	= 		UNHEX(pIN_CRTB_APP_DETAILS_ID),
		PARAM_NAME	= 		pINPARAM_NAME,
		PARAM_VALUE	= 		pINPARAM_VALUE,
		ACT_STATUS	= 		pINACT_STATUS,
		CREATED_ON	= 		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		CREATED_BY	= 		UNHEX(pIN_CREATED_BY),
		UPDATED_ON	= 		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		UPDATED_BY	= 		UNHEX(pIN_UPDATED_BY)
		;
END
CRPR_APP_DETAILS_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS CRPR_APP_DETAILS_FIND_BY_ID $$
CREATE PROCEDURE CRPR_APP_DETAILS_FIND_BY_ID (
	IN pIN_CRTB_APP_DETAILS_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
CRPR_APP_DETAILS_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(CRTB_APP_DETAILS_ID) AS CRTB_APP_DETAILS_ID,
		PARAM_NAME,
		PARAM_VALUE,
		ACT_STATUS,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM CRTB_APP_DETAILS
	WHERE CRTB_APP_DETAILS_ID = UNHEX(pIN_CRTB_APP_DETAILS_ID);
END
CRPR_APP_DETAILS_FIND_BY_ID $$
DELIMITER ;

# --------------------------------------------------------------------------------------------------------------------------- #

DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_ENVIRONMENT_LIST $$
CREATE PROCEDURE TKPR_ENVIRONMENT_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_ENVIRONMENT_LIST:
 BEGIN
	SELECT
		HEX(TKTB_ENVIRONMENT_ID) AS TKTB_ENVIRONMENT_ID,
		DISPLAY_NAME AS ENVIRONMENT,
		ACT_STS
	FROM TKTB_ENVIRONMENT;
END
TKPR_ENVIRONMENT_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_ENVIRONMENT_DELETE $$
CREATE PROCEDURE TKPR_ENVIRONMENT_DELETE (
	IN pIN_TKTB_ENVIRONMENT_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_ENVIRONMENT_DELETE:
 BEGIN
	DELETE
	FROM TKTB_ENVIRONMENT
	WHERE TKTB_ENVIRONMENT_ID = UNHEX(pIN_TKTB_ENVIRONMENT_ID);
END
TKPR_ENVIRONMENT_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_ENVIRONMENT_ADD $$
CREATE PROCEDURE TKPR_ENVIRONMENT_ADD (
	IN pIN_TKTB_ENVIRONMENT_ID VARCHAR(32),
	IN pIN_ENVIRONMENT VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_ENVIRONMENT_ADD:
 BEGIN

	INSERT INTO TKTB_ENVIRONMENT (
		TKTB_ENVIRONMENT_ID, 
		ENVIRONMENT, 
		ACT_STS
		)
	VALUES (
		UNHEX(pIN_TKTB_ENVIRONMENT_ID),
		pINENVIRONMENT,
		pINACT_STS
		);
END
TKPR_ENVIRONMENT_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_ENVIRONMENT_UPDATE $$
CREATE PROCEDURE TKPR_ENVIRONMENT_UPDATE (
	IN pIN_TKTB_ENVIRONMENT_ID VARCHAR(32),
	IN pIN_ENVIRONMENT VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_ENVIRONMENT_UPDATE:
 BEGIN

	UPDATE TKTB_ENVIRONMENT SET
		TKTB_ENVIRONMENT_ID	= 		UNHEX(pIN_TKTB_ENVIRONMENT_ID),
		ENVIRONMENT	= 		pINENVIRONMENT,
		ACT_STS	= 		pINACT_STS
		;
END
TKPR_ENVIRONMENT_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_ENVIRONMENT_FIND_BY_ID $$
CREATE PROCEDURE TKPR_ENVIRONMENT_FIND_BY_ID (
	IN pIN_TKTB_ENVIRONMENT_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_ENVIRONMENT_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(TKTB_ENVIRONMENT_ID) AS TKTB_ENVIRONMENT_ID,
		ENVIRONMENT,
		ACT_STS
	FROM TKTB_ENVIRONMENT
	WHERE TKTB_ENVIRONMENT_ID = UNHEX(pIN_TKTB_ENVIRONMENT_ID);
END
TKPR_ENVIRONMENT_FIND_BY_ID $$
DELIMITER ;

# --------------------------------------------------------------------------------------------------------------- #

DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_LIST $$
CREATE PROCEDURE TKPR_PRODUCT_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_LIST:
 BEGIN
	SELECT
		HEX(TKTB_PRODUCT_ID) AS TKTB_PRODUCT_ID,
		DISPLAY_NAME AS PRODUCT,
		ACT_STS
	FROM TKTB_PRODUCT;
END
TKPR_PRODUCT_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_DELETE $$
CREATE PROCEDURE TKPR_PRODUCT_DELETE (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_DELETE:
 BEGIN
	DELETE
	FROM TKTB_PRODUCT
	WHERE TKTB_PRODUCT_ID = UNHEX(pIN_TKTB_PRODUCT_ID);
END
TKPR_PRODUCT_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_ADD $$
CREATE PROCEDURE TKPR_PRODUCT_ADD (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	IN pIN_PRODUCT VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_ADD:
 BEGIN

	INSERT INTO TKTB_PRODUCT (
		TKTB_PRODUCT_ID, 
		PRODUCT, 
		ACT_STS
		)
	VALUES (
		UNHEX(pIN_TKTB_PRODUCT_ID),
		pINPRODUCT,
		pINACT_STS
		);
END
TKPR_PRODUCT_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_UPDATE $$
CREATE PROCEDURE TKPR_PRODUCT_UPDATE (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	IN pIN_PRODUCT VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_UPDATE:
 BEGIN

	UPDATE TKTB_PRODUCT SET
		TKTB_PRODUCT_ID	= 		UNHEX(pIN_TKTB_PRODUCT_ID),
		PRODUCT	= 		pINPRODUCT,
		ACT_STS	= 		pINACT_STS
		;
END
TKPR_PRODUCT_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_FIND_BY_ID $$
CREATE PROCEDURE TKPR_PRODUCT_FIND_BY_ID (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(TKTB_PRODUCT_ID) AS TKTB_PRODUCT_ID,
		PRODUCT,
		ACT_STS
	FROM TKTB_PRODUCT
	WHERE TKTB_PRODUCT_ID = UNHEX(pIN_TKTB_PRODUCT_ID);
END
TKPR_PRODUCT_FIND_BY_ID $$
DELIMITER ;

# ------------------------------------------------------------------------- #

DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_STATUS_LIST $$
CREATE PROCEDURE TKPR_STATUS_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_STATUS_LIST:
 BEGIN
	SELECT
		HEX(TKTB_STATUS_ID) AS TKTB_STATUS_ID,
		DISPLAY_NAME AS STATUS,
		ACT_STS
	FROM TKTB_STATUS;
END
TKPR_STATUS_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_STATUS_DELETE $$
CREATE PROCEDURE TKPR_STATUS_DELETE (
	IN pIN_TKTB_STATUS_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_STATUS_DELETE:
 BEGIN
	DELETE
	FROM TKTB_STATUS
	WHERE TKTB_STATUS_ID = UNHEX(pIN_TKTB_STATUS_ID);
END
TKPR_STATUS_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_STATUS_ADD $$
CREATE PROCEDURE TKPR_STATUS_ADD (
	IN pIN_TKTB_STATUS_ID VARCHAR(32),
	IN pIN_STATUS VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_STATUS_ADD:
 BEGIN

	INSERT INTO TKTB_STATUS (
		TKTB_STATUS_ID, 
		STATUS, 
		ACT_STS 
		)
	VALUES (
		UNHEX(pIN_TKTB_STATUS_ID),
		pINSTATUS,
		pINACT_STS
		);
END
TKPR_STATUS_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_STATUS_UPDATE $$
CREATE PROCEDURE TKPR_STATUS_UPDATE (
	IN pIN_TKTB_STATUS_ID VARCHAR(32),
	IN pIN_STATUS VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_STATUS_UPDATE:
 BEGIN

	UPDATE TKTB_STATUS SET
		TKTB_STATUS_ID	= 		UNHEX(pIN_TKTB_STATUS_ID),
		STATUS	= 		pINSTATUS,
		ACT_STS	= 		pINACT_STS
		;
END
TKPR_STATUS_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_STATUS_FIND_BY_ID $$
CREATE PROCEDURE TKPR_STATUS_FIND_BY_ID (
	IN pIN_TKTB_STATUS_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_STATUS_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(TKTB_STATUS_ID) AS TKTB_STATUS_ID,
		STATUS,
		ACT_STS
	FROM TKTB_STATUS
	WHERE TKTB_STATUS_ID = UNHEX(pIN_TKTB_STATUS_ID);
END
TKPR_STATUS_FIND_BY_ID $$
DELIMITER ;

# -------------------------------------------------------------------------------------------------------------------------- #

DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_LIST $$
CREATE PROCEDURE TKPR_PRODUCT_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_LIST:
 BEGIN
	SELECT
		HEX(TKTB_PRODUCT_ID) AS TKTB_PRODUCT_ID,
		DISPLAY_NAME AS PRODUCT,
		ACT_STS
	FROM TKTB_PRODUCT;
END
TKPR_PRODUCT_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_DELETE $$
CREATE PROCEDURE TKPR_PRODUCT_DELETE (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_DELETE:
 BEGIN
	DELETE
	FROM TKTB_PRODUCT
	WHERE TKTB_PRODUCT_ID = UNHEX(pIN_TKTB_PRODUCT_ID);
END
TKPR_PRODUCT_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_ADD $$
CREATE PROCEDURE TKPR_PRODUCT_ADD (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	IN pIN_PRODUCT VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_ADD:
 BEGIN

	INSERT INTO TKTB_PRODUCT (
		TKTB_PRODUCT_ID, 
		PRODUCT, 
		ACT_STS
		)
	VALUES (
		UNHEX(pIN_TKTB_PRODUCT_ID),
		pINPRODUCT,
		pINACT_STS
		);
END
TKPR_PRODUCT_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_UPDATE $$
CREATE PROCEDURE TKPR_PRODUCT_UPDATE (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	IN pIN_PRODUCT VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_UPDATE:
 BEGIN

	UPDATE TKTB_PRODUCT SET
		TKTB_PRODUCT_ID	= 		UNHEX(pIN_TKTB_PRODUCT_ID),
		PRODUCT	= 		pINPRODUCT,
		ACT_STS	= 		pINACT_STS
		;
END
TKPR_PRODUCT_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_PRODUCT_FIND_BY_ID $$
CREATE PROCEDURE TKPR_PRODUCT_FIND_BY_ID (
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_PRODUCT_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(TKTB_PRODUCT_ID) AS TKTB_PRODUCT_ID,
		PRODUCT,
		ACT_STS
	FROM TKTB_PRODUCT
	WHERE TKTB_PRODUCT_ID = UNHEX(pIN_TKTB_PRODUCT_ID);
END
TKPR_PRODUCT_FIND_BY_ID $$
DELIMITER ;

# ----------------------------------------------------------------------------------------------------- #

DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_CATEGORY_LIST $$
CREATE PROCEDURE TKPR_CATEGORY_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_CATEGORY_LIST:
 BEGIN
	SELECT
		HEX(TKTB_CATEGORY_ID) AS TKTB_CATEGORY_ID,
		DISPLAY_NAME AS CATEGORY,
		ACT_STS
	FROM TKTB_CATEGORY;
END
TKPR_CATEGORY_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_CATEGORY_DELETE $$
CREATE PROCEDURE TKPR_CATEGORY_DELETE (
	IN pIN_TKTB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_CATEGORY_DELETE:
 BEGIN
	DELETE
	FROM TKTB_CATEGORY
	WHERE TKTB_CATEGORY_ID = UNHEX(pIN_TKTB_CATEGORY_ID);
END
TKPR_CATEGORY_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_CATEGORY_ADD $$
CREATE PROCEDURE TKPR_CATEGORY_ADD (
	IN pIN_TKTB_CATEGORY_ID VARCHAR(32),
	IN pIN_CATEGORY VARCHAR(80),
	IN pIN_DISPLAY_NAME VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_CATEGORY_ADD:
 BEGIN

	INSERT INTO TKTB_CATEGORY (
		TKTB_CATEGORY_ID, 
		CATEGORY, 
		DISPLAY_NAME, 
		ACT_STS 
		)
	VALUES (
		UNHEX(pIN_TKTB_CATEGORY_ID),
		pINCATEGORY,
		pINDISPLAY_NAME,
		pINACT_STS
		);
END
TKPR_CATEGORY_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_CATEGORY_UPDATE $$
CREATE PROCEDURE TKPR_CATEGORY_UPDATE (
	IN pIN_TKTB_CATEGORY_ID VARCHAR(32),
	IN pIN_CATEGORY VARCHAR(80),
	IN pIN_DISPLAY_NAME VARCHAR(80),
	IN pIN_ACT_STS VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_CATEGORY_UPDATE:
 BEGIN

	UPDATE TKTB_CATEGORY SET
		TKTB_CATEGORY_ID	= 		UNHEX(pIN_TKTB_CATEGORY_ID),
		CATEGORY	= 		pINCATEGORY,
		DISPLAY_NAME	= 		pINDISPLAY_NAME,
		ACT_STS	= 		pINACT_STS
		;
END
TKPR_CATEGORY_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_CATEGORY_FIND_BY_ID $$
CREATE PROCEDURE TKPR_CATEGORY_FIND_BY_ID (
	IN pIN_TKTB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_CATEGORY_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(TKTB_CATEGORY_ID) AS TKTB_CATEGORY_ID,
		DISPLAY_NAME AS CATEGORY,
		ACT_STS
	FROM TKTB_CATEGORY
	WHERE TKTB_CATEGORY_ID = UNHEX(pIN_TKTB_CATEGORY_ID);
END
TKPR_CATEGORY_FIND_BY_ID $$
DELIMITER ;

# ------------------------------------------------------------------------------------------- #
# Ticket Procedures

DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_TICKET_LIST $$
CREATE PROCEDURE TKPR_TICKET_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_TICKET_LIST:
 BEGIN
	SELECT
		HEX(TKTB_TICKET_ID) AS TKTB_TICKET_ID,
		TICKET_ID,
		SUBJECT,
		DISC,
		SIMULATION_STEPS,
		ISSUE_TYPE,
		HEX(ASSIGNED_TO) AS ASSIGNED_TO,
		DATE_FORMAT(ETA,'%d-%m-%Y') AS ETA,
		REOPENED_COUNT,
		HEX(TKTB_PRODUCT_ID) AS TKTB_PRODUCT_ID,
		HEX(TKTB_ENVIRONMENT) AS TKTB_ENVIRONMENT,
		HEX(TKTB_STATUS_ID) AS TKTB_STATUS_ID,
		HEX(TKTB_CATEGORY_ID) AS TKTB_CATEGORY_ID,
		HEX(TKTB_SEVERITY_ID) AS TKTB_SEVERITY_ID,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM TKTB_TICKET;
END
TKPR_TICKET_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_TICKET_DELETE $$
CREATE PROCEDURE TKPR_TICKET_DELETE (
	IN pIN_TKTB_TICKET_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_TICKET_DELETE:
 BEGIN
	DELETE
	FROM TKTB_TICKET
	WHERE TKTB_TICKET_ID = UNHEX(pIN_TKTB_TICKET_ID);
END
TKPR_TICKET_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_TICKET_ADD $$
CREATE PROCEDURE TKPR_TICKET_ADD (
	IN pIN_TKTB_TICKET_ID VARCHAR(32),
	IN pIN_TICKET_ID VARCHAR(80),
	IN pIN_SUBJECT VARCHAR(500),
	IN pIN_DISC VARCHAR(2000),
	IN pIN_SIMULATION_STEPS VARCHAR(5000),
	IN pIN_ISSUE_TYPE VARCHAR(200),
	IN pIN_ASSIGNED_TO VARCHAR(32),
	IN pIN_ETA VARCHAR(32),
	IN pIN_REOPENED_COUNT VARCHAR(200),
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	IN pIN_TKTB_ENVIRONMENT VARCHAR(32),
	IN pIN_TKTB_STATUS_ID VARCHAR(32),
	IN pIN_TKTB_CATEGORY_ID VARCHAR(32),
	IN pIN_TKTB_SEVERITY_ID VARCHAR(32),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_TICKET_ADD:
 BEGIN

	INSERT INTO TKTB_TICKET (
		TKTB_TICKET_ID, 
		TICKET_ID, 
		SUBJECT, 
		DISC, 
		SIMULATION_STEPS, 
		ISSUE_TYPE, 
		ASSIGNED_TO, 
		ETA, 
		REOPENED_COUNT, 
		TKTB_PRODUCT_ID, 
		TKTB_ENVIRONMENT, 
		TKTB_STATUS_ID, 
		TKTB_CATEGORY_ID, 
		TKTB_SEVERITY_ID, 
		CREATED_ON, 
		UPDATED_ON, 
		CREATED_BY, 
		UPDATED_BY 
		)
	VALUES (
		UNHEX(pIN_TKTB_TICKET_ID),
		pINTICKET_ID,
		pINSUBJECT,
		pINDISC,
		pINSIMULATION_STEPS,
		pINISSUE_TYPE,
		UNHEX(pIN_ASSIGNED_TO),
		STR_TO_DATE(pIN_ETA,'%d-%m-%Y'),
		pINREOPENED_COUNT,
		UNHEX(pIN_TKTB_PRODUCT_ID),
		UNHEX(pIN_TKTB_ENVIRONMENT),
		UNHEX(pIN_TKTB_STATUS_ID),
		UNHEX(pIN_TKTB_CATEGORY_ID),
		UNHEX(pIN_TKTB_SEVERITY_ID),
		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		UNHEX(pIN_CREATED_BY),
		UNHEX(pIN_UPDATED_BY)
		);
END
TKPR_TICKET_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_TICKET_UPDATE $$
CREATE PROCEDURE TKPR_TICKET_UPDATE (
	IN pIN_TKTB_TICKET_ID VARCHAR(32),
	IN pIN_TICKET_ID VARCHAR(80),
	IN pIN_SUBJECT VARCHAR(500),
	IN pIN_DISC VARCHAR(2000),
	IN pIN_SIMULATION_STEPS VARCHAR(5000),
	IN pIN_ISSUE_TYPE VARCHAR(200),
	IN pIN_ASSIGNED_TO VARCHAR(32),
	IN pIN_ETA VARCHAR(32),
	IN pIN_REOPENED_COUNT VARCHAR(200),
	IN pIN_TKTB_PRODUCT_ID VARCHAR(32),
	IN pIN_TKTB_ENVIRONMENT VARCHAR(32),
	IN pIN_TKTB_STATUS_ID VARCHAR(32),
	IN pIN_TKTB_CATEGORY_ID VARCHAR(32),
	IN pIN_TKTB_SEVERITY_ID VARCHAR(32),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_TICKET_UPDATE:
 BEGIN

	UPDATE TKTB_TICKET SET
		TKTB_TICKET_ID	= 		UNHEX(pIN_TKTB_TICKET_ID),
		TICKET_ID	= 		pINTICKET_ID,
		SUBJECT	= 		pINSUBJECT,
		DISC	= 		pINDISC,
		SIMULATION_STEPS	= 		pINSIMULATION_STEPS,
		ISSUE_TYPE	= 		pINISSUE_TYPE,
		ASSIGNED_TO	= 		UNHEX(pIN_ASSIGNED_TO),
		ETA	= 		STR_TO_DATE(pIN_ETA,'%d-%m-%Y'),
		REOPENED_COUNT	= 		pINREOPENED_COUNT,
		TKTB_PRODUCT_ID	= 		UNHEX(pIN_TKTB_PRODUCT_ID),
		TKTB_ENVIRONMENT	= 		UNHEX(pIN_TKTB_ENVIRONMENT),
		TKTB_STATUS_ID	= 		UNHEX(pIN_TKTB_STATUS_ID),
		TKTB_CATEGORY_ID	= 		UNHEX(pIN_TKTB_CATEGORY_ID),
		TKTB_SEVERITY_ID	= 		UNHEX(pIN_TKTB_SEVERITY_ID),
		CREATED_ON	= 		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		UPDATED_ON	= 		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		CREATED_BY	= 		UNHEX(pIN_CREATED_BY),
		UPDATED_BY	= 		UNHEX(pIN_UPDATED_BY)
		;
END
TKPR_TICKET_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS TKPR_TICKET_FIND_BY_ID $$
CREATE PROCEDURE TKPR_TICKET_FIND_BY_ID (
	IN pIN_TKTB_TICKET_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
TKPR_TICKET_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(TKTB_TICKET_ID) AS TKTB_TICKET_ID,
		TICKET_ID,
		SUBJECT,
		DISC,
		SIMULATION_STEPS,
		ISSUE_TYPE,
		HEX(ASSIGNED_TO) AS ASSIGNED_TO,
		DATE_FORMAT(ETA,'%d-%m-%Y') AS ETA,
		REOPENED_COUNT,
		HEX(TKTB_PRODUCT_ID) AS TKTB_PRODUCT_ID,
		HEX(TKTB_ENVIRONMENT) AS TKTB_ENVIRONMENT,
		HEX(TKTB_STATUS_ID) AS TKTB_STATUS_ID,
		HEX(TKTB_CATEGORY_ID) AS TKTB_CATEGORY_ID,
		HEX(TKTB_SEVERITY_ID) AS TKTB_SEVERITY_ID,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM TKTB_TICKET
	WHERE TKTB_TICKET_ID = UNHEX(pIN_TKTB_TICKET_ID);
END
TKPR_TICKET_FIND_BY_ID $$
DELIMITER ;

#----------------------------------------------------------------------------------------------------------------------------
# Scrum Module

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_REPORT_DETAIL_LIST $$
CREATE PROCEDURE SUPR_REPORT_DETAIL_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_REPORT_DETAIL_LIST:
 BEGIN
	SELECT
		HEX(SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		REPORT_NAME,
		DISPLAY_NAME,
		HEX(SCRUM_MASTER_ID) AS SCRUM_MASTER_ID,
		REPORT_EVEN_DT,
		ACT_STS,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM SUTB_REPORT_DETAIL;
END
SUPR_REPORT_DETAIL_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_REPORT_DETAIL_DELETE $$
CREATE PROCEDURE SUPR_REPORT_DETAIL_DELETE (
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_REPORT_DETAIL_DELETE:
 BEGIN
	DELETE
	FROM SUTB_REPORT_DETAIL
	WHERE SUTB_REPORT_DETAIL_ID = UNHEX(pIN_SUTB_REPORT_DETAIL_ID);
END
SUPR_REPORT_DETAIL_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_REPORT_DETAIL_ADD $$
CREATE PROCEDURE SUPR_REPORT_DETAIL_ADD (
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	IN pIN_REPORT_NAME VARCHAR(80),
	IN pIN_DISPLAY_NAME VARCHAR(80),
	IN pIN_SCRUM_MASTER_ID VARCHAR(32),
	IN pIN_REPORT_EVEN_DT VARCHAR(200),
	IN pIN_ACT_STS VARCHAR(200),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_REPORT_DETAIL_ADD:
 BEGIN

	INSERT INTO SUTB_REPORT_DETAIL (
		SUTB_REPORT_DETAIL_ID, 
		REPORT_NAME, 
		DISPLAY_NAME, 
		SCRUM_MASTER_ID, 
		REPORT_EVEN_DT, 
		ACT_STS, 
		CREATED_ON, 
		UPDATED_ON, 
		CREATED_BY, 
		UPDATED_BY
		)
	VALUES (
		UNHEX(pIN_SUTB_REPORT_DETAIL_ID),
		pINREPORT_NAME,
		pINDISPLAY_NAME,
		UNHEX(pIN_SCRUM_MASTER_ID),
		pINREPORT_EVEN_DT,
		pINACT_STS,
		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		UNHEX(pIN_CREATED_BY),
		UNHEX(pIN_UPDATED_BY)
		);
END
SUPR_REPORT_DETAIL_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_REPORT_DETAIL_UPDATE $$
CREATE PROCEDURE SUPR_REPORT_DETAIL_UPDATE (
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	IN pIN_REPORT_NAME VARCHAR(80),
	IN pIN_DISPLAY_NAME VARCHAR(80),
	IN pIN_SCRUM_MASTER_ID VARCHAR(32),
	IN pIN_REPORT_EVEN_DT VARCHAR(200),
	IN pIN_ACT_STS VARCHAR(200),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_REPORT_DETAIL_UPDATE:
 BEGIN

	UPDATE SUTB_REPORT_DETAIL SET
		SUTB_REPORT_DETAIL_ID	= 		UNHEX(pIN_SUTB_REPORT_DETAIL_ID),
		REPORT_NAME	= 		pINREPORT_NAME,
		DISPLAY_NAME	= 		pINDISPLAY_NAME,
		SCRUM_MASTER_ID	= 		UNHEX(pIN_SCRUM_MASTER_ID),
		REPORT_EVEN_DT	= 		pINREPORT_EVEN_DT,
		ACT_STS	= 		pINACT_STS,
		CREATED_ON	= 		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		UPDATED_ON	= 		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		CREATED_BY	= 		UNHEX(pIN_CREATED_BY),
		UPDATED_BY	= 		UNHEX(pIN_UPDATED_BY)
		;
END
SUPR_REPORT_DETAIL_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_REPORT_DETAIL_FIND_BY_ID $$
CREATE PROCEDURE SUPR_REPORT_DETAIL_FIND_BY_ID (
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_REPORT_DETAIL_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		REPORT_NAME,
		DISPLAY_NAME,
		HEX(SCRUM_MASTER_ID) AS SCRUM_MASTER_ID,
		REPORT_EVEN_DT,
		ACT_STS,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM SUTB_REPORT_DETAIL
	WHERE SUTB_REPORT_DETAIL_ID = UNHEX(pIN_SUTB_REPORT_DETAIL_ID);
END
SUPR_REPORT_DETAIL_FIND_BY_ID $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_CATEGORY_LIST $$
CREATE PROCEDURE SUPR_CATEGORY_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_CATEGORY_LIST:
 BEGIN
	SELECT
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		HEX(SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		CATEGORY
	FROM SUTB_CATEGORY;
END
SUPR_CATEGORY_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_CATEGORY_DELETE $$
CREATE PROCEDURE SUPR_CATEGORY_DELETE (
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_CATEGORY_DELETE:
 BEGIN
	DELETE
	FROM SUTB_CATEGORY
	WHERE SUTB_CATEGORY_ID = UNHEX(pIN_SUTB_CATEGORY_ID);
END
SUPR_CATEGORY_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_CATEGORY_ADD $$
CREATE PROCEDURE SUPR_CATEGORY_ADD (
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	IN pIN_CATEGORY VARCHAR(80),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_CATEGORY_ADD:
 BEGIN

	INSERT INTO SUTB_CATEGORY (
		SUTB_CATEGORY_ID, 
		SUTB_REPORT_DETAIL_ID, 
		CATEGORY
		)
	VALUES (
		UNHEX(pIN_SUTB_CATEGORY_ID),
		UNHEX(pIN_SUTB_REPORT_DETAIL_ID),
		pINCATEGORY
		);
END
SUPR_CATEGORY_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_CATEGORY_UPDATE $$
CREATE PROCEDURE SUPR_CATEGORY_UPDATE (
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	IN pIN_CATEGORY VARCHAR(80),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_CATEGORY_UPDATE:
 BEGIN

	UPDATE SUTB_CATEGORY SET
		SUTB_CATEGORY_ID	= 		UNHEX(pIN_SUTB_CATEGORY_ID),
		SUTB_REPORT_DETAIL_ID	= 		UNHEX(pIN_SUTB_REPORT_DETAIL_ID),
		CATEGORY	= 		pINCATEGORY
		;
END
SUPR_CATEGORY_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_CATEGORY_FIND_BY_ID $$
CREATE PROCEDURE SUPR_CATEGORY_FIND_BY_ID (
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_CATEGORY_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		HEX(SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		CATEGORY
	FROM SUTB_CATEGORY
	WHERE SUTB_CATEGORY_ID = UNHEX(pIN_SUTB_CATEGORY_ID);
END
SUPR_CATEGORY_FIND_BY_ID $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_CATEGORY_FIND_BY_REPORT_ID $$
CREATE PROCEDURE SUPR_CATEGORY_FIND_BY_REPORT_ID (
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_CATEGORY_FIND_BY_REPORT_ID:
 BEGIN
	SELECT
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		HEX(SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		CATEGORY
	FROM SUTB_CATEGORY
	WHERE SUTB_REPORT_DETAIL_ID = UNHEX(pIN_SUTB_REPORT_DETAIL_ID);
END
SUPR_CATEGORY_FIND_BY_REPORT_ID $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SUB_CATEGORY_LIST $$
CREATE PROCEDURE SUPR_SUB_CATEGORY_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SUB_CATEGORY_LIST:
 BEGIN
	SELECT
		HEX(SUTB_SUB_CATEGORY_ID) AS SUTB_SUB_CATEGORY_ID,
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		SUB_CATEGORY
	FROM SUTB_SUB_CATEGORY;
END
SUPR_SUB_CATEGORY_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SUB_CATEGORY_DELETE $$
CREATE PROCEDURE SUPR_SUB_CATEGORY_DELETE (
	IN pIN_SUTB_SUB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SUB_CATEGORY_DELETE:
 BEGIN
	DELETE
	FROM SUTB_SUB_CATEGORY
	WHERE SUTB_SUB_CATEGORY_ID = UNHEX(pIN_SUTB_SUB_CATEGORY_ID);
END
SUPR_SUB_CATEGORY_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SUB_CATEGORY_ADD $$
CREATE PROCEDURE SUPR_SUB_CATEGORY_ADD (
	IN pIN_SUTB_SUB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUB_CATEGORY VARCHAR(80),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SUB_CATEGORY_ADD:
 BEGIN

	INSERT INTO SUTB_SUB_CATEGORY (
		SUTB_SUB_CATEGORY_ID, 
		SUTB_CATEGORY_ID, 
		SUB_CATEGORY 
		)
	VALUES (
		UNHEX(pIN_SUTB_SUB_CATEGORY_ID),
		UNHEX(pIN_SUTB_CATEGORY_ID),
		pINSUB_CATEGORY
		);
END
SUPR_SUB_CATEGORY_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SUB_CATEGORY_UPDATE $$
CREATE PROCEDURE SUPR_SUB_CATEGORY_UPDATE (
	IN pIN_SUTB_SUB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUB_CATEGORY VARCHAR(80),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SUB_CATEGORY_UPDATE:
 BEGIN

	UPDATE SUTB_SUB_CATEGORY SET
		SUTB_SUB_CATEGORY_ID	= 		UNHEX(pIN_SUTB_SUB_CATEGORY_ID),
		SUTB_CATEGORY_ID	= 		UNHEX(pIN_SUTB_CATEGORY_ID),
		SUB_CATEGORY	= 		pINSUB_CATEGORY
		;
END
SUPR_SUB_CATEGORY_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SUB_CATEGORY_FIND_BY_ID $$
CREATE PROCEDURE SUPR_SUB_CATEGORY_FIND_BY_ID (
	IN pIN_SUTB_SUB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SUB_CATEGORY_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(SUTB_SUB_CATEGORY_ID) AS SUTB_SUB_CATEGORY_ID,
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		SUB_CATEGORY
	FROM SUTB_SUB_CATEGORY
	WHERE SUTB_SUB_CATEGORY_ID = UNHEX(pIN_SUTB_SUB_CATEGORY_ID);
END
SUPR_SUB_CATEGORY_FIND_BY_ID $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SUB_CATEGORY_FIND_BY_CATEGORY_ID $$
CREATE PROCEDURE SUPR_SUB_CATEGORY_FIND_BY_CATEGORY_ID (
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SUB_CATEGORY_FIND_BY_CATEGORY_ID:
 BEGIN
	SELECT
		HEX(SUTB_SUB_CATEGORY_ID) AS SUTB_SUB_CATEGORY_ID,
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		SUB_CATEGORY
	FROM SUTB_SUB_CATEGORY
	WHERE SUTB_CATEGORY_ID = UNHEX(pIN_SUTB_CATEGORY_ID);
END
SUPR_SUB_CATEGORY_FIND_BY_CATEGORY_ID $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SCRUM_UPDATE_BY_MEMBER_ID $$
CREATE PROCEDURE SUPR_SCRUM_UPDATE_BY_MEMBER_ID (
	IN pIN_MEMBER_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SCRUM_UPDATE_BY_MEMBER_ID:
 BEGIN

	SELECT * FROM SUVW_SCRUM_UPDATE V
	WHERE UNHEX(V.MEMBER_ID) = UNHEX(pIN_MEMBER_ID) AND
		STR_TO_DATE(V.CREATED_ON,'%d-%m-%Y')= CURDATE();
END
SUPR_SCRUM_UPDATE_BY_MEMBER_ID $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_TOTAL_SCRUM_UPDATE $$
CREATE PROCEDURE SUPR_TOTAL_SCRUM_UPDATE (
	IN pIN_MEMBER_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_TOTAL_SCRUM_UPDATE:
 BEGIN

    SET pOUT_ACTION_MSG = CONCAT('Only ', DATE_FORMAT(CURDATE(),'%M') ,' month processed scrum updates are visible here');

	SELECT * FROM SUVW_SCRUM_UPDATE V
	 WHERE UNHEX(V.MEMBER_ID) = UNHEX(pIN_MEMBER_ID) AND
            DATE_FORMAT(STR_TO_DATE(CREATED_ON,'%d-%m-%Y'),'%M')  = DATE_FORMAT(CURDATE(),'%M');
END
SUPR_TOTAL_SCRUM_UPDATE $$
DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SCRUM_UPDATE_DELETE $$
CREATE PROCEDURE SUPR_SCRUM_UPDATE_DELETE (
	IN pIN_SUTB_SCRUM_UPDATE_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SCRUM_UPDATE_DELETE:
 BEGIN
	DELETE
	FROM SUTB_SCRUM_UPDATE
	WHERE SUTB_SCRUM_UPDATE_ID = UNHEX(pIN_SUTB_SCRUM_UPDATE_ID);
END
SUPR_SCRUM_UPDATE_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SCRUM_UPDATE_ADD $$
CREATE PROCEDURE SUPR_SCRUM_UPDATE_ADD (
	IN pIN_SUTB_SCRUM_UPDATE_ID VARCHAR(32),
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUTB_SUB_CATEGORY_ID VARCHAR(32),
	IN pIN_MEMBER_ID VARCHAR(32),
	IN pIN_UPDATE_TXT VARCHAR(200),
    IN pIN_HOURS_SPENT VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SCRUM_UPDATE_ADD:
 BEGIN

	INSERT INTO SUTB_SCRUM_UPDATE (
		SUTB_SCRUM_UPDATE_ID, 
		SUTB_REPORT_DETAIL_ID, 
		SUTB_CATEGORY_ID, 
		SUTB_SUB_CATEGORY_ID, 
		MEMBER_ID, 
		UPDATE_TXT,
        HOURS_SPENT,
		ACT_STS, 
		CREATED_ON, 
		UPDATED_ON, 
		CREATED_BY, 
		UPDATED_BY 
		)
	VALUES (
		UNHEX(pIN_SUTB_SCRUM_UPDATE_ID),
		UNHEX(pIN_SUTB_REPORT_DETAIL_ID),
		UNHEX(pIN_SUTB_CATEGORY_ID),
		UNHEX(pIN_SUTB_SUB_CATEGORY_ID),
		UNHEX(pIN_MEMBER_ID),
		pIN_UPDATE_TXT,
        pIN_HOURS_SPENT,
		DEFAULT,
		CURRENT_TIMESTAMP,
		DEFAULT,
		UNHEX(pIN_MEMBER_ID),
		NULL
		);
		
SET pOUT_ACTION_MSG = 'Successfully added your update';
		
END
SUPR_SCRUM_UPDATE_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SCRUM_UPDATE_UPDATE $$
CREATE PROCEDURE SUPR_SCRUM_UPDATE_UPDATE (
	IN pIN_SUTB_SCRUM_UPDATE_ID VARCHAR(32),
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	IN pIN_SUTB_CATEGORY_ID VARCHAR(32),
	IN pIN_SUTB_SUB_CATEGORY_ID VARCHAR(32),
	IN pIN_MEMBER_ID VARCHAR(32),
	IN pIN_UPDATE_TXT VARCHAR(200),
    IN pIN_HOURS_SPENT VARCHAR(32),
	IN pIN_ACT_STS VARCHAR(200),
	IN pIN_CREATED_ON VARCHAR(32),
	IN pIN_UPDATED_ON VARCHAR(32),
	IN pIN_CREATED_BY VARCHAR(32),
	IN pIN_UPDATED_BY VARCHAR(32),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SCRUM_UPDATE_UPDATE:
 BEGIN

	UPDATE SUTB_SCRUM_UPDATE SET
		SUTB_SCRUM_UPDATE_ID	= 		UNHEX(pIN_SUTB_SCRUM_UPDATE_ID),
		SUTB_REPORT_DETAIL_ID	= 		UNHEX(pIN_SUTB_REPORT_DETAIL_ID),
		SUTB_CATEGORY_ID	= 		UNHEX(pIN_SUTB_CATEGORY_ID),
		SUTB_SUB_CATEGORY_ID	= 		UNHEX(pIN_SUTB_SUB_CATEGORY_ID),
		MEMBER_ID	= 		UNHEX(pIN_MEMBER_ID),
		UPDATE_TXT	= 		pINUPDATE_TXT,
        HOURS_SPENT =       pIN_HOURS_SPENT,
		ACT_STS	    = 		pINACT_STS,
		CREATED_ON	= 		STR_TO_DATE(pIN_CREATED_ON,'%d-%m-%Y'),
		UPDATED_ON	= 		STR_TO_DATE(pIN_UPDATED_ON,'%d-%m-%Y'),
		CREATED_BY	= 		UNHEX(pIN_CREATED_BY),
		UPDATED_BY	= 		UNHEX(pIN_UPDATED_BY)
		;
END
SUPR_SCRUM_UPDATE_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_SCRUM_UPDATE_FIND_BY_ID $$
CREATE PROCEDURE SUPR_SCRUM_UPDATE_FIND_BY_ID (
	IN pIN_SUTB_SCRUM_UPDATE_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_SCRUM_UPDATE_FIND_BY_ID:
 BEGIN
/*	SELECT
		HEX(SUTB_SCRUM_UPDATE_ID) AS SUTB_SCRUM_UPDATE_ID,
		HEX(SUTB_REPORT_DETAIL_ID) AS SUTB_REPORT_DETAIL_ID,
		HEX(SUTB_CATEGORY_ID) AS SUTB_CATEGORY_ID,
		HEX(SUTB_SUB_CATEGORY_ID) AS SUTB_SUB_CATEGORY_ID,
		HEX(MEMBER_ID) AS MEMBER_ID,
		UPDATE_TXT,
		ACT_STS,
		DATE_FORMAT(CREATED_ON,'%d-%m-%Y') AS CREATED_ON,
		DATE_FORMAT(UPDATED_ON,'%d-%m-%Y') AS UPDATED_ON,
		HEX(CREATED_BY) AS CREATED_BY,
		HEX(UPDATED_BY) AS UPDATED_BY
	FROM SUTB_SCRUM_UPDATE
*/
    SELECT * FROM SUVW_SCRUM_UPDATE V
	WHERE UNHEX(SUTB_SCRUM_UPDATE_ID) = UNHEX(pIN_SUTB_SCRUM_UPDATE_ID);
END
SUPR_SCRUM_UPDATE_FIND_BY_ID $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_FINAL_REPORT_BY_REPORT_ID $$
CREATE PROCEDURE SUPR_FINAL_REPORT_BY_REPORT_ID(
	IN pIN_SUTB_REPORT_DETAIL_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)

)
SUPR_FINAL_REPORT_BY_REPORT_ID:
BEGIN

	SELECT * FROM SUVW_SCRUM_UPDATE V
	WHERE UNHEX(V.SUTB_REPORT_DETAIL_ID) = UNHEX(pIN_SUTB_REPORT_DETAIL_ID) AND
		STR_TO_DATE(V.CREATED_ON,'%d-%m-%Y')= CURDATE();

END 
SUPR_FINAL_REPORT_BY_REPORT_ID $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_PROCESSING_DAYS_LIST $$
CREATE PROCEDURE SUPR_PROCESSING_DAYS_LIST (
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_PROCESSING_DAYS_LIST:
 BEGIN
	SELECT
		HEX(SUTB_PROCESSING_DAYS_ID) AS SUTB_PROCESSING_DAYS_ID,
		WEEK_DAY
	FROM SUTB_PROCESSING_DAYS;
END
SUPR_PROCESSING_DAYS_LIST $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_PROCESSING_DAYS_DELETE $$
CREATE PROCEDURE SUPR_PROCESSING_DAYS_DELETE (
	IN pIN_SUTB_PROCESSING_DAYS_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_PROCESSING_DAYS_DELETE:
 BEGIN
	DELETE
	FROM SUTB_PROCESSING_DAYS
	WHERE SUTB_PROCESSING_DAYS_ID = UNHEX(pIN_SUTB_PROCESSING_DAYS_ID);
END
SUPR_PROCESSING_DAYS_DELETE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_PROCESSING_DAYS_ADD $$
CREATE PROCEDURE SUPR_PROCESSING_DAYS_ADD (
	IN pIN_SUTB_PROCESSING_DAYS_ID VARCHAR(32),
	IN pIN_WEEK_DAY_XML VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_PROCESSING_DAYS_ADD:
 BEGIN

    START TRANSACTION;

	INSERT INTO SUTB_PROCESSING_DAYS (
		SUTB_PROCESSING_DAYS_ID, 
		WEEK_DAY 
		)
	VALUES (
		UNHEX(pIN_SUTB_PROCESSING_DAYS_ID),
		pIN_WEEK_DAY
		);

    COMMIT;
END
SUPR_PROCESSING_DAYS_ADD $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_PROCESSING_DAYS_UPDATE $$
CREATE PROCEDURE SUPR_PROCESSING_DAYS_UPDATE (
	IN pIN_SUTB_PROCESSING_DAYS_ID VARCHAR(32),
	IN pIN_WEEK_DAY VARCHAR(200),

	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_PROCESSING_DAYS_UPDATE:
 BEGIN

	UPDATE SUTB_PROCESSING_DAYS SET
		SUTB_PROCESSING_DAYS_ID	= 		UNHEX(pIN_SUTB_PROCESSING_DAYS_ID),
		WEEK_DAY	= 		pIN_WEEK_DAY
		;
END
SUPR_PROCESSING_DAYS_UPDATE $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS SUPR_PROCESSING_DAYS_FIND_BY_ID $$
CREATE PROCEDURE SUPR_PROCESSING_DAYS_FIND_BY_ID (
	IN pIN_SUTB_PROCESSING_DAYS_ID VARCHAR(32),
	OUT pOUT_ACTION_MSG VARCHAR(1000),
	OUT pOUT_ERROR_MSG VARCHAR(1000)
)
SUPR_PROCESSING_DAYS_FIND_BY_ID:
 BEGIN
	SELECT
		HEX(SUTB_PROCESSING_DAYS_ID) AS SUTB_PROCESSING_DAYS_ID,
		WEEK_DAY
	FROM SUTB_PROCESSING_DAYS
	WHERE SUTB_PROCESSING_DAYS_ID = UNHEX(pIN_SUTB_PROCESSING_DAYS_ID);
END
SUPR_PROCESSING_DAYS_FIND_BY_ID $$
DELIMITER ;

