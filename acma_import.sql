create schema IF NOT EXISTS acma;
drop table acma.access_area;
drop table acma.antenna;
drop table acma.antenna_pattern;
drop table acma.antenna_polarity;
drop table acma.applic_text_block;
drop table acma.auth_spectrum_area;
drop table acma.auth_spectrum_freq;
drop table acma.bsl;
drop table acma.bsl_area;
drop table acma.class_of_station;
drop table acma.client;
drop table acma.client_type;
drop table acma.device_details;
drop table acma.fee_status;
drop table acma.industry_cat;
drop table acma.licence;
drop table acma.licence_service;
drop table acma.licence_status;
drop table acma.licence_subservice;
drop table acma.licensing_area;
drop table acma.nature_of_service;
drop table acma.reports_text_block;
drop table acma.satellite;
drop table acma.site;


create table acma.access_area(
 AREA_ID		BIGINT,
 AREA_CODE              VARCHAR(256),
 AREA_NAME              VARCHAR(256),
 AREA_CATEGORY          DOUBLE PRECISION);
 
COPY acma.access_area FROM '/home/access_area.csv' CSV HEADER;

create table acma.antenna(
 ANTENNA_ID		VARCHAR(31),
 GAIN                   DOUBLE PRECISION,
 FRONT_TO_BACK          DOUBLE PRECISION,
 H_BEAMWIDTH            DOUBLE PRECISION,
 V_BEAMWIDTH            DOUBLE PRECISION,
 BAND_MIN_FREQ          DOUBLE PRECISION,
 BAND_MIN_FREQ_UNIT     VARCHAR(3),
 BAND_MAX_FREQ          DOUBLE PRECISION,
 BAND_MAX_FREQ_UNIT     VARCHAR(3),
 ANTENNA_SIZE           DOUBLE PRECISION,
 ANTENNA_TYPE           VARCHAR(240),
 MODEL                  VARCHAR(80),
 MANUFACTURER           VARCHAR(255));
 
COPY acma.antenna FROM '/home/antenna.csv' CSV HEADER;

create table acma.antenna_pattern(
 ANTENNA_ID		VARCHAR(31),
 AZ_TYPE                VARCHAR(15),
 ANGLE_REF              DOUBLE PRECISION,
 ANGLE                  DOUBLE PRECISION,
 ATTENUATION            DOUBLE PRECISION);
 
COPY acma.antenna_pattern FROM '/home/antenna_pattern.csv' CSV HEADER; 

create table acma.antenna_polarity(
 POLARISATION_CODE	VARCHAR(3),
 POLARISATION_TEXT      VARCHAR(50));
 
COPY acma.antenna_polarity FROM '/home/antenna_polarity.csv' CSV HEADER; 

create table acma.applic_text_block(
 APTB_ID		DOUBLE PRECISION,
 APTB_TABLE_PREFIX	VARCHAR(30),
 APTB_TABLE_ID          BIGINT,
 LICENCE_NO             VARCHAR(63),
 APTB_DESCRIPTION       VARCHAR(255),
 APTB_CATEGORY          VARCHAR(255),
 APTB_TEXT              VARCHAR(4000),
 APTB_ITEM              VARCHAR(15));

COPY acma.applic_text_block FROM '/home/applic_text_block.csv' CSV HEADER; 

create table acma.auth_spectrum_area(
 LICENCE_NO  		VARCHAR(63),
 AREA_CODE              VARCHAR(256),
 AREA_NAME              VARCHAR(256),
 AREA_DESCRIPTION       TEXT);
 
COPY acma.auth_spectrum_area FROM '/home/auth_spectrum_area.csv' CSV HEADER; 

create table acma.auth_spectrum_freq(
 LICENCE_NO		VARCHAR(63),
 AREA_CODE              VARCHAR(256),
 AREA_NAME              VARCHAR(256),
 LW_FREQUENCY_START     DOUBLE PRECISION,
 LW_FREQUENCY_END       DOUBLE PRECISION,
 UP_FREQUENCY_START     DOUBLE PRECISION,
 UP_FREQUENCY_END       DOUBLE PRECISION);
 
COPY acma.auth_spectrum_freq FROM '/home/auth_spectrum_freq.csv' CSV HEADER; 

create table acma.bsl(
 BSL_NO                 VARCHAR(31),
 MEDIUM_CATEGORY        VARCHAR(4000),
 REGION_CATEGORY        VARCHAR(4000),
 COMMUNITY_INTEREST     VARCHAR(4000),
 BSL_STATE              VARCHAR(4000),
 DATE_COMMENCED         TIMESTAMP(0),
 ON_AIR_ID              VARCHAR(511),
 CALL_SIGN              VARCHAR(255),
 IBL_TARGET_AREA        VARCHAR(511),
 AREA_CODE              VARCHAR(256),
 REFERENCE              VARCHAR(63)
);

COPY acma.bsl FROM '/home/bsl.csv' CSV HEADER; 

create table acma.bsl_area(
 AREA_CODE		VARCHAR(256),
 AREA_NAME		VARCHAR(256)
);

COPY acma.bsl_area FROM '/home/bsl_area.csv' CSV HEADER; 

create table acma.class_of_station(
 CODE			VARCHAR(31),
 DESCRIPTION            VARCHAR(511));
 
COPY acma.class_of_station FROM '/home/class_of_station.csv' CSV HEADER; 

create table acma.client(
 CLIENT_NO		DOUBLE PRECISION,
 LICENCEE               VARCHAR(201),
 TRADING_NAME           VARCHAR(100),
 ACN                    VARCHAR(100),
 ABN                    VARCHAR(14),
 POSTAL_STREET          VARCHAR(600),
 POSTAL_SUBURB          VARCHAR(480),
 POSTAL_STATE           VARCHAR(36),
 POSTAL_POSTCODE        VARCHAR(72),
 CAT_ID                 DOUBLE PRECISION,
 CLIENT_TYPE_ID         DOUBLE PRECISION,
 FEE_STATUS_ID          DOUBLE PRECISION);
 
COPY acma.client FROM '/home/client.csv' CSV HEADER; 

create table acma.client_type(
 TYPE_ID		DOUBLE PRECISION,
 NAME                   VARCHAR(240));
 
COPY acma.client_type FROM '/home/client_type.csv' CSV HEADER; 

create table acma.device_details(
 SDD_ID   				BIGINT,
 LICENCE_NO                             VARCHAR(63),
 DEVICE_REGISTRATION_IDENTIFIER         VARCHAR(63),
 FORMER_DEVICE_IDENTIFIER               VARCHAR(63),
 AUTHORISATION_DATE                     TIMESTAMP(0),
 CERTIFICATION_METHOD                   VARCHAR(255),
 GROUP_FLAG                             VARCHAR(255),
 SITE_RADIUS                            DOUBLE PRECISION,
 FREQUENCY                              DOUBLE PRECISION,
 BANDWIDTH                              DOUBLE PRECISION,
 CARRIER_FREQ                           DOUBLE PRECISION,
 EMISSION                               VARCHAR(63),
 DEVICE_TYPE                            VARCHAR(1),
 TRANSMITTER_POWER                      DOUBLE PRECISION,
 TRANSMITTER_POWER_UNIT                 VARCHAR(31),
 SITE_ID                                VARCHAR(31),
 ANTENNA_ID                             VARCHAR(31),
 POLARISATION                           VARCHAR(3),
 AZIMUTH                                DOUBLE PRECISION,
 HEIGHT                                 DOUBLE PRECISION,
 TILT                                   DOUBLE PRECISION,
 FEEDER_LOSS                            DOUBLE PRECISION,
 LEVEL_OF_PROTECTION                    DOUBLE PRECISION,
 EIRP                                   DOUBLE PRECISION,
 EIRP_UNIT                              VARCHAR(31),
 SV_ID                                  BIGINT,
 SS_ID                                  BIGINT,
 EFL_ID                                 VARCHAR(40),
 EFL_FREQ_IDENT                         VARCHAR(31),
 EFL_SYSTEM                             VARCHAR(63),
 LEQD_MODE                              VARCHAR(1),
 RECEIVER_THRESHOLD                     DOUBLE PRECISION,
 AREA_AREA_ID                           BIGINT,
 CALL_SIGN                              VARCHAR(255),
 AREA_DESCRIPTION                       VARCHAR(9),
 AP_ID                                  BIGINT,
 CLASS_OF_STATION_CODE                  VARCHAR(31),
 SUPPLIMENTAL_FLAG                      VARCHAR(199),
 EQ_FREQ_RANGE_MIN                      DOUBLE PRECISION,
 EQ_FREQ_RANGE_MAX                      DOUBLE PRECISION,
 NATURE_OF_SERVICE_ID                   VARCHAR(3),
 HOURS_OF_OPERATION                     VARCHAR(11),
 SA_ID                                  BIGINT,
 RELATED_EFL_ID                         DOUBLE PRECISION,
 EQP_ID                                 BIGINT,
 ANTENNA_MULTI_MODE                     VARCHAR(3),
 POWER_IND                              VARCHAR(14),
 LPON_CENTER_LONGITUDE                  DOUBLE PRECISION,
 LPON_CENTER_LATITUDE                   DOUBLE PRECISION,
 TCS_ID                                 BIGINT,
 TECH_SPEC_ID                           VARCHAR(63),
 DROPTHROUGH_ID                         VARCHAR(63),
 STATION_TYPE                           VARCHAR(511),
 STATION_NAME                           VARCHAR(63));
 
COPY acma.device_details FROM '/home/device_details.csv' CSV HEADER; 

create table acma.fee_status(
 FEE_STATUS_ID		DOUBLE PRECISION,
 FEE_STATUS_TEXT        VARCHAR(100));
 
COPY acma.fee_status FROM '/home/fee_status.csv' CSV HEADER; 

create table acma.industry_cat(
 CAT_ID			DOUBLE PRECISION,
 DESCRIPTION            VARCHAR(240),
 NAME                   VARCHAR(120));

COPY acma.industry_cat FROM '/home/industry_cat.csv' CSV HEADER; 

create table acma.licence(
 LICENCE_NO		VARCHAR(63),
 CLIENT_NO              DOUBLE PRECISION,
 SV_ID                  BIGINT,
 SS_ID                  BIGINT,
 LICENCE_TYPE_NAME      VARCHAR(63),
 LICENCE_CATEGORY_NAME  VARCHAR(95),
 DATE_ISSUED            TIMESTAMP(0),
 DATE_OF_EFFECT         TIMESTAMP(0),
 DATE_OF_EXPIRY         TIMESTAMP(0),
 STATUS                 VARCHAR(10),
 STATUS_TEXT            VARCHAR(256),
 AP_ID                  BIGINT,
 AP_PRJ_IDENT           VARCHAR(511),
 SHIP_NAME              VARCHAR(255),
 BSL_NO                 VARCHAR(31));

COPY acma.licence FROM '/home/licence.csv' CSV HEADER; 

create table acma.licence_service(
 SV_ID			BIGINT,
 SV_NAME                VARCHAR(63));

COPY acma.licence_service FROM '/home/licence_service.csv' CSV HEADER; 

create table acma.licence_status(
 STATUS			VARCHAR(10),
 STATUS_TEXT            VARCHAR(511));

COPY acma.licence_status FROM '/home/licence_status.csv' CSV HEADER; 

create table acma.licence_subservice(
 SS_ID			BIGINT,
 SV_SV_ID               BIGINT,
 SS_NAME                VARCHAR(95));

COPY acma.licence_subservice FROM '/home/licence_subservice.csv' CSV HEADER; 

create table acma.licensing_area(
 LICENSING_AREA_ID	VARCHAR(31),
 DESCRIPTION            VARCHAR(511));

COPY acma.licensing_area FROM '/home/licensing_area.csv' CSV HEADER; 

create table acma.nature_of_service(
 CODE			VARCHAR(31),
 DESCRIPTION            VARCHAR(511));

COPY acma.nature_of_service FROM '/home/nature_of_service.csv' CSV HEADER; 

create table acma.reports_text_block(
 RTB_ITEM		VARCHAR(15),
 RTB_CATEGORY           VARCHAR(255),
 RTB_DESCRIPTION        VARCHAR(255),
 RTB_START_DATE         TIMESTAMP(0),
 RTB_END_DATE           TIMESTAMP(0),
 RTB_TEXT               VARCHAR(4000));

COPY acma.reports_text_block FROM '/home/reports_text_block.csv' CSV HEADER; 

create table acma.satellite(
 SA_ID			BIGINT,
 SA_SAT_NAME            VARCHAR(31),
 SA_SAT_LONG_NOM        DOUBLE PRECISION,
 SA_SAT_INCEXC          DOUBLE PRECISION,
 SA_SAT_GEO_POS         VARCHAR(1),
 SA_SAT_MERIT_G_T       DOUBLE PRECISION);

COPY acma.satellite FROM '/home/satellite.csv' CSV HEADER; 

create table acma.site(
 SITE_ID		VARCHAR(31),
 LATITUDE               DOUBLE PRECISION,
 LONGITUDE              DOUBLE PRECISION,
 NAME                   VARCHAR(767),
 STATE                  VARCHAR(80),
 LICENSING_AREA_ID      DOUBLE PRECISION,
 POSTCODE               VARCHAR(18),
 SITE_PRECISION         VARCHAR(31),
 ELEVATION              DOUBLE PRECISION,
 HCIS_L2		VARCHAR(31));

COPY acma.site FROM '/home/site.csv' CSV HEADER; 

ALTER TABLE acma.site ADD COLUMN geom geometry(Point, 4326);
UPDATE acma.site SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);

create materialized view if not exists acma.wireless
as 
	select dev.device_registration_identifier, dev.frequency, dev.bandwidth, dev.device_type, dev.height, 
	st.geom, st.latitude, st.longitude, st.site_precision,
	lic.licence_type_name, lic.licence_category_name,
	clt.licencee, clt.abn, cltt.name
	from acma.device_details as dev left join acma.site as st on dev.site_id = st.site_id
	left join acma.licence as lic on lic.licence_no = dev.licence_no
	left join acma.client as clt on lic.client_no = clt.client_no
	left join acma.client_type as cltt on cltt.type_id = clt.client_type_id
	where st.geom is not null;
	
create index on acma.wireless using GIST(geom);
refresh materialized view acma.wireless;
