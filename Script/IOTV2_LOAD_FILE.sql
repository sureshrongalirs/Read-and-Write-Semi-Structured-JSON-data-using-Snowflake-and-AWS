create or replace TABLE COMMON_LAYERS.STAGE_PREPROCESSING.PREP_LOAD_IOTV2_EUEXPERIENCE00320055 (
	ATOMICCONSENTS VARCHAR(16777216),
	DATA VARIANT,
	ORIGINREGION VARCHAR(16777216),
	REQUESTID VARCHAR(16777216),
	SERIALNUMBER VARCHAR(16777216),
	SOURCE_FILE_NAME VARCHAR(16777216),
	EVENT_LOCAL_TIMESTAMP TIMESTAMP_NTZ(9),
	PARTITION_DATE DATE,
	DSS_RECORD_SOURCE VARCHAR(64) COMMENT 'Record source.',
	DSS_LOAD_DATE TIMESTAMP_NTZ(9) COMMENT 'Load date.'
);

create or replace TABLE COMMON_LAYERS.STAGE_PREPROCESSING.PREP_LOAD_IOTV2_JPEXPERIENCE00320055 (
	ATOMICCONSENTS VARCHAR(16777216),
	DATA VARIANT,
	ORIGINREGION VARCHAR(16777216),
	REQUESTID VARCHAR(16777216),
	SERIALNUMBER VARCHAR(16777216),
	SOURCE_FILE_NAME VARCHAR(16777216),
	EVENT_LOCAL_TIMESTAMP TIMESTAMP_NTZ(9),
	PARTITION_DATE DATE,
	DSS_RECORD_SOURCE VARCHAR(64) COMMENT 'Record source.',
	DSS_LOAD_DATE TIMESTAMP_NTZ(9) COMMENT 'Load date.'
);

create or replace TABLE COMMON_LAYERS.STAGE_PREPROCESSING.PREP_LOAD_IOTV2_NZEXPERIENCE002F0052 (
	ATOMICCONSENTS VARCHAR(16777216),
	DATA VARIANT,
	ORIGINREGION VARCHAR(16777216),
	REQUESTID VARCHAR(16777216),
	SERIALNUMBER VARCHAR(16777216),
	SOURCE_FILE_NAME VARCHAR(16777216),
	EVENT_LOCAL_TIMESTAMP TIMESTAMP_NTZ(9),
	PARTITION_DATE DATE,
	DSS_RECORD_SOURCE VARCHAR(64) COMMENT 'Record source.',
	DSS_LOAD_DATE TIMESTAMP_NTZ(9) COMMENT 'Load date.'
);