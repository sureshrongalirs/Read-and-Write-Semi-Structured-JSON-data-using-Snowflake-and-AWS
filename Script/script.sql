--IOT_V2_TABLE CREATION

CREATE OR REPLACE DATABASE IOT_V2;

CREATE OR REPLACE SCHEMA IOT_SCHEMA; 

DROP TABLE IOT_V2.IOT_SCHEMA.IOTV2_JSON_EXP;

create or replace TABLE LOAD_IOTV2_EUEXPERIENCE00320055 (
	ATOMICCONSENTS VARCHAR(16777216),
	DATA variant,
	ORIGINREGION VARCHAR(16777216),
	REQUESTID VARCHAR(16777216),
	SERIALNUMBER VARCHAR(16777216),
	SOURCE_FILE_NAME VARCHAR(16777216),
	EVENT_LOCAL_TIMESTAMP VARCHAR(16777216)

);

create or replace TABLE LOAD_IOTV2_EUEXPERIENCE00320055_copy as select * from LOAD_IOTV2_EUEXPERIENCE00320055;



create or replace TABLE LOAD_IOTV2_JPEXPERIENCE00320055 (
	ATOMICCONSENTS VARCHAR(16777216),
	DATA VARIANT,
	ORIGINREGION VARCHAR(16777216),
	REQUESTID VARCHAR(16777216),
	SERIALNUMBER VARCHAR(16777216),
	SOURCE_FILE_NAME VARCHAR(16777216),
	EVENT_LOCAL_TIMESTAMP VARCHAR(16777216)
);

create or replace TABLE LOAD_IOTV2_JPEXPERIENCE00320055_copy as select * from LOAD_IOTV2_JPEXPERIENCE00320055;

create or replace TABLE LOAD_IOTV2_NZEXPERIENCE002F0052 (
	ATOMICCONSENTS VARCHAR(16777216),
	DATA VARIANT,
	ORIGINREGION VARCHAR(16777216),
	REQUESTID VARCHAR(16777216),
	SERIALNUMBER VARCHAR(16777216),
	SOURCE_FILE_NAME VARCHAR(16777216),
	EVENT_LOCAL_TIMESTAMP VARCHAR(16777216)
);

create or replace TABLE LOAD_IOTV2_NZEXPERIENCE002F0052_copy as select * from LOAD_IOTV2_NZEXPERIENCE002F0052;

----------------------------------------------------AWS (S3) INTEGRATION------------------------------------------------------------------------
CREATE OR REPLACE STORAGE integration iotv2_si
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN ='arn:aws:iam::363946517930:role/retail_txns_access_role' 
STORAGE_ALLOWED_LOCATIONS =('s3://iotv21/');



create or replace file format iotv2_txt
    type = 'csv' 
    compression = 'none' 
    field_delimiter = ' '
    field_optionally_enclosed_by = 'none'
    skip_header = 1 ;  


create or replace file format iotv2_txt
type='csv'
compression='none'
field_delimiter='\t'
field_optionally_enclosed_by='\042'
skip_header=1;
    
CREATE OR REPLACE STAGE iotv2_stage
URL ='s3://iotv21/'
file_format = iotv2_txt
storage_integration = iotv2_si;

LIST @iotv2_stage;

SHOW STAGES;

-------------------------------------------------iotv2_snowpipe--------------------------------------------------------------------

CREATE OR REPLACE PIPE iotv2_snowpipe_EUEXPERIENCE00320055 AUTO_INGEST = TRUE AS
COPY INTO IOT_V2.IOT_SCHEMA.LOAD_IOTV2_EUEXPERIENCE00320055 --yourdatabase -- your schema ---your table
FROM '@iotv2_stage/IOTV2_EUEXPERIENCE00320055/' --s3 bucket subfolde4r name
FILE_FORMAT = iotv2_txt; --YOUR CSV FILE FORMAT NAME


CREATE OR REPLACE PIPE iotv2_snowpipe_JPEXPERIENCE00320055 AUTO_INGEST = TRUE AS
COPY INTO IOT_V2.IOT_SCHEMA.LOAD_IOTV2_JPEXPERIENCE00320055
FROM '@iotv2_stage/IOTV2_JPEXPERIENCE00320055/' 
FILE_FORMAT = iotv2_txt;

CREATE OR REPLACE PIPE iotv2_snowpipe_NZEXPERIENCE002F0052 AUTO_INGEST = TRUE AS
COPY INTO IOT_V2.IOT_SCHEMA.LOAD_IOTV2_NZEXPERIENCE002F0052
FROM '@iotv2_stage/IOTV2_NZEXPERIENCE00320055/' 
FILE_FORMAT = iotv2_txt;

SELECT COUNT(*) FROM LOAD_IOTV2_EUEXPERIENCE00320055;
SELECT COUNT(*) FROM LOAD_IOTV2_JPEXPERIENCE00320055;
SELECT COUNT(*) FROM LOAD_IOTV2_NZEXPERIENCE002F0052;

SELECT * FROM LOAD_IOTV2_EUEXPERIENCE00320055;
SELECT * FROM LOAD_IOTV2_JPEXPERIENCE00320055;
SELECT * FROM LOAD_IOTV2_NZEXPERIENCE002F0052;

----------------------------------------------------------PIPEREFRESH-----------------------------------------------------------------

ALTER PIPE iotv2_snowpipe_EUEXPERIENCE00320055 refresh;
ALTER PIPE  iotv2_snowpipe_JPEXPERIENCE00320055 refresh;
ALTER PIPE  iotv2_snowpipe_NZEXPERIENCE002F0052 refresh;


