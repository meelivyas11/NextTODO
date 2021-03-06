--------------------------------------------------------
--  File created - Friday-April-07-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BUSINESS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHAMBER"."BUSINESS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence CHAMBER_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHAMBER"."CHAMBER_INFO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence ROLES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHAMBER"."ROLES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence TABLE_ROTATOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHAMBER"."TABLE_ROTATOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table ASSIGNED_POSITION
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."ASSIGNED_POSITION" 
   (	"ASSIGNED_POSITION_ID" NUMBER(10,0), 
	"COMMITTEE_ID" NUMBER(10,0), 
	"CONTACT_ID" NUMBER(10,0), 
	"ASSIGNED_POSITION_TYPE" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BUSINESS
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."BUSINESS" 
   (	"BUSINESS_ID" NUMBER(10,0), 
	"COMPANY_NAME" VARCHAR2(50 BYTE), 
	"ADDRESS_1" VARCHAR2(50 BYTE), 
	"ADDRESS_2" VARCHAR2(50 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE" VARCHAR2(20 BYTE), 
	"ZIP" VARCHAR2(20 BYTE), 
	"PRIMARY_PHONE" VARCHAR2(30 BYTE), 
	"SECONDARY_PHONE" VARCHAR2(30 BYTE), 
	"CATEGORY_1" VARCHAR2(50 BYTE), 
	"SUBCATEGORY_1" VARCHAR2(50 BYTE), 
	"CATEGORY_2" VARCHAR2(50 BYTE), 
	"SUBCATEGORY_2" VARCHAR2(50 BYTE), 
	"ADDITIONAL_OFFICES" VARCHAR2(50 BYTE), 
	"POTENTIAL_MEMBER" NUMBER(1,0), 
	"MMCC_MEMBER_DATE_FROM" DATE, 
	"MMCC_MEMBER_DATE_TO" DATE, 
	"BUSSINESS_COMMENT" BLOB, 
	"ADVANTAGE_CARD" BLOB, 
	"CREATED_BY" VARCHAR2(30 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(30 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3), 
	"IMAGES" BLOB, 
	"ACCEPTS_CHAMBER_GIFT_CARDS" NUMBER(1,0), 
	"NUMBER_OF_FULL_TIME_EMPLOYEES" VARCHAR2(30 BYTE), 
	"NUMBER_OF_PART_TIME_EMPLOYEES" VARCHAR2(30 BYTE), 
	"URL_LINK" BLOB, 
	"SHOW_ON_MEMBER_WEBSITE" NUMBER(1,0), 
	"MEMBERSHIP_PRICING_ID" NUMBER(10,0), 
	"TOWNS_ID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("BUSSINESS_COMMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ADVANTAGE_CARD") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("IMAGES") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("URL_LINK") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table BUSINESS_CONTACT_PIVOT
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."BUSINESS_CONTACT_PIVOT" 
   (	"BUSINESS_CONTACT_PIVOT_ID" NUMBER(10,0), 
	"BUSINESS_ID" NUMBER(10,0), 
	"CONTACT_ID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHAMBER_INFO
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."CHAMBER_INFO" 
   (	"CHAMBER_INFO_ID" NUMBER(10,0), 
	"TABLE_ROTATOR_ID" NUMBER(10,0), 
	"ADVERTISEMENT_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(50 BYTE), 
	"ADDRESS" VARCHAR2(50 BYTE), 
	"CITY" VARCHAR2(20 BYTE), 
	"STATE" VARCHAR2(20 BYTE), 
	"LOGO" BLOB, 
	"FACEBOOK_URL" BLOB, 
	"TWITTER_URL" BLOB, 
	"LINKEDIN_URL" BLOB, 
	"HOME_PAGE_IMAGE_URL" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("LOGO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FACEBOOK_URL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("TWITTER_URL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("LINKEDIN_URL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("HOME_PAGE_IMAGE_URL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table CHAMBER_STAFF
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."CHAMBER_STAFF" 
   (	"CHAMBER_STAFF_ID" NUMBER(10,0), 
	"CHAMBER_INFO_ID" NUMBER(10,0), 
	"FIRST_NAME" VARCHAR2(30 BYTE), 
	"LAST_NAME" VARCHAR2(30 BYTE), 
	"POSITION" VARCHAR2(30 BYTE), 
	"LINKEDIN_URL" BLOB, 
	"CHAMBER_STAFF_COMMENT" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("LINKEDIN_URL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("CHAMBER_STAFF_COMMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table COMMITTEE
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."COMMITTEE" 
   (	"COMMITTEE_ID" NUMBER(10,0), 
	"SUB_COMMITTEE_ID" NUMBER(10,0), 
	"COMMITTEE_NAME" VARCHAR2(50 BYTE), 
	"MEETING_DATES" VARCHAR2(50 BYTE), 
	"NOTES" BLOB, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NOTES") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table CONTACT
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."CONTACT" 
   (	"CONTACT_ID" NUMBER(10,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"MIDDLE_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(20 BYTE), 
	"SUFFIX" VARCHAR2(20 BYTE), 
	"ADDRESS_1" VARCHAR2(50 BYTE), 
	"ADDRESS_2" VARCHAR2(50 BYTE), 
	"CITY" VARCHAR2(50 BYTE), 
	"STATE" VARCHAR2(20 BYTE), 
	"ZIP" VARCHAR2(20 BYTE), 
	"WORK_EMAIL" VARCHAR2(50 BYTE), 
	"PERSONAL_EMAIL" VARCHAR2(50 BYTE), 
	"WORK_PHONE" VARCHAR2(20 BYTE), 
	"CELL_PHONE" VARCHAR2(20 BYTE), 
	"VOLUNTEER" NUMBER(1,0), 
	"LAST_VOLUNTEER_DATE" DATE, 
	"PRIMARY_CONTACT" NUMBER(1,0), 
	"RSVP" NUMBER(1,0), 
	"NEWSLETTER" NUMBER(1,0), 
	"WHO_ARE_THEY" VARCHAR2(20 BYTE), 
	"DISTRICT" VARCHAR2(20 BYTE), 
	"PARTY" VARCHAR2(20 BYTE), 
	"WHO_ARE_THEY_DATE_FROM" DATE, 
	"WHO_ARE_THEY_DATE_TO" DATE, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3), 
	"USERNAME" BLOB, 
	"PASSWORDS" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("USERNAME") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("PASSWORDS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table EVENTS
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."EVENTS" 
   (	"EVENTS_ID" NUMBER(10,0), 
	"CONTACT_ID" NUMBER(10,0), 
	"EVENT_NAME" VARCHAR2(50 BYTE), 
	"EVENT_DATE" VARCHAR2(50 BYTE), 
	"EVENT_LOCATION" VARCHAR2(50 BYTE), 
	"EVENT_ADDRESS" VARCHAR2(50 BYTE), 
	"EVENT_CITY" VARCHAR2(50 BYTE), 
	"EVENT_STATE" VARCHAR2(20 BYTE), 
	"EVENT_ZIP" VARCHAR2(20 BYTE), 
	"EVENTS_SUMMARY" BLOB, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3), 
	"ALLOW_REGISTER" NUMBER(1,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("EVENTS_SUMMARY") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table EVENT_CONTACT
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."EVENT_CONTACT" 
   (	"EVENT_CONTACT_ID" NUMBER(10,0), 
	"EVENTS_ID" NUMBER(10,0), 
	"HOW_PAID" VARCHAR2(20 BYTE), 
	"PRICE" VARCHAR2(20 BYTE), 
	"PREPAID" VARCHAR2(20 BYTE), 
	"VOLUNTEER" NUMBER(1,0), 
	"EVENT_CONTACT_COMMENT" BLOB, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("EVENT_CONTACT_COMMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table GIFT_CERTS
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."GIFT_CERTS" 
   (	"GIFT_CERTS_ID" NUMBER(10,0), 
	"TRANSACTION_DATE" TIMESTAMP (3), 
	"DENOMINATION" VARCHAR2(20 BYTE), 
	"CERT_NUMBER" VARCHAR2(20 BYTE), 
	"TOTAL_NUMBER" VARCHAR2(20 BYTE), 
	"BUSINESS_ID" NUMBER(10,0), 
	"CONTACT_ID" NUMBER(10,0), 
	"CASH_AMOUNT" VARCHAR2(20 BYTE), 
	"CHECK_AMOUNT" VARCHAR2(20 BYTE), 
	"CHECK_NUMBER" VARCHAR2(50 BYTE), 
	"CREDIT_CARD" VARCHAR2(50 BYTE), 
	"STAFF" VARCHAR2(20 BYTE), 
	"GIFT_CERTS_COMMENTS" BLOB, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("GIFT_CERTS_COMMENTS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table MARKETING
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."MARKETING" 
   (	"MARKETING_ID" NUMBER(10,0), 
	"CONTACT_ID" NUMBER(10,0), 
	"CONTACT_DATE" TIMESTAMP (3), 
	"MEMO" BLOB, 
	"FOLLOW_UP_DATE" TIMESTAMP (3), 
	"TOS_DESCRIPTION" VARCHAR2(50 BYTE), 
	"DATE_TOS_ID_SENT" TIMESTAMP (3), 
	"HOW_TOS_ID_SENT" VARCHAR2(50 BYTE), 
	"PROCESSED_DATE" TIMESTAMP (3), 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MEMO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table MEMBERSHIP_PRICING
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."MEMBERSHIP_PRICING" 
   (	"MEMBERSHIP_PRICING_ID" NUMBER(10,0), 
	"CLASS_OF_MEMBERSHIP" VARCHAR2(30 BYTE), 
	"PRICES" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROLES
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."ROLES" 
   (	"ROLE_ID" NUMBER(10,0), 
	"CONTACT_ID" NUMBER(10,0), 
	"BUSINESS_ADMIN" NUMBER(1,0), 
	"BUSINESS_USER_EVENT_POSTING" NUMBER(1,0), 
	"BUSINESS_USER_JOB_POSTING" NUMBER(1,0), 
	"BUSINESS_USER_UPDATE_WEBSITE" NUMBER(1,0), 
	"BUSINESS_USER_MEMBER_NEWS" NUMBER(1,0), 
	"CHAMBER_STAFF" NUMBER(1,0), 
	"CONTACT" NUMBER(1,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TABLE_ROTATOR
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."TABLE_ROTATOR" 
   (	"TABLE_ROTATOR_ID" NUMBER(10,0), 
	"BUSINESS_ID" NUMBER(10,0), 
	"TABLE_ROTATOR_COMMENT" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("TABLE_ROTATOR_COMMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table TOS
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."TOS" 
   (	"TOS_DESCRIPTION" VARCHAR2(50 BYTE), 
	"MEMO" BLOB, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MEMO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table TOWNS
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."TOWNS" 
   (	"TOWNS_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"TOWNS_COMMENT" BLOB, 
	"MAP" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("TOWNS_COMMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("MAP") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table WHO_ARE_THEY
--------------------------------------------------------

  CREATE TABLE "CHAMBER"."WHO_ARE_THEY" 
   (	"WHO_ARE_THEY" VARCHAR2(20 BYTE), 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATED_DATE" TIMESTAMP (3), 
	"LAST_MODIFIED_BY" VARCHAR2(20 BYTE), 
	"LAST_MODIFIED_DATE" TIMESTAMP (3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into CHAMBER.ASSIGNED_POSITION
SET DEFINE OFF;
REM INSERTING into CHAMBER.BUSINESS
SET DEFINE OFF;
REM INSERTING into CHAMBER.BUSINESS_CONTACT_PIVOT
SET DEFINE OFF;
REM INSERTING into CHAMBER.CHAMBER_INFO
SET DEFINE OFF;
REM INSERTING into CHAMBER.CHAMBER_STAFF
SET DEFINE OFF;
REM INSERTING into CHAMBER.COMMITTEE
SET DEFINE OFF;
REM INSERTING into CHAMBER.CONTACT
SET DEFINE OFF;
REM INSERTING into CHAMBER.EVENTS
SET DEFINE OFF;
REM INSERTING into CHAMBER.EVENT_CONTACT
SET DEFINE OFF;
REM INSERTING into CHAMBER.GIFT_CERTS
SET DEFINE OFF;
REM INSERTING into CHAMBER.MARKETING
SET DEFINE OFF;
REM INSERTING into CHAMBER.MEMBERSHIP_PRICING
SET DEFINE OFF;
REM INSERTING into CHAMBER.ROLES
SET DEFINE OFF;
REM INSERTING into CHAMBER.TABLE_ROTATOR
SET DEFINE OFF;
REM INSERTING into CHAMBER.TOS
SET DEFINE OFF;
REM INSERTING into CHAMBER.TOWNS
SET DEFINE OFF;
REM INSERTING into CHAMBER.WHO_ARE_THEY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_EVENT_CONTACT
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_EVENT_CONTACT" ON "CHAMBER"."EVENT_CONTACT" ("EVENT_CONTACT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_EVENTS" ON "CHAMBER"."EVENTS" ("EVENTS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MARKETING
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_MARKETING" ON "CHAMBER"."MARKETING" ("MARKETING_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASSIGNED_POSITION
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_ASSIGNED_POSITION" ON "CHAMBER"."ASSIGNED_POSITION" ("ASSIGNED_POSITION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COMMITTEE
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_COMMITTEE" ON "CHAMBER"."COMMITTEE" ("COMMITTEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TOS
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_TOS" ON "CHAMBER"."TOS" ("TOS_DESCRIPTION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_WHO_ARE_THEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_WHO_ARE_THEY" ON "CHAMBER"."WHO_ARE_THEY" ("WHO_ARE_THEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BUSINESS
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_BUSINESS" ON "CHAMBER"."BUSINESS" ("BUSINESS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CONTACT
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_CONTACT" ON "CHAMBER"."CONTACT" ("CONTACT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BUSINESS_CONTACT_PIVOT
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_BUSINESS_CONTACT_PIVOT" ON "CHAMBER"."BUSINESS_CONTACT_PIVOT" ("BUSINESS_CONTACT_PIVOT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_GIFT_CERTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHAMBER"."PK_GIFT_CERTS" ON "CHAMBER"."GIFT_CERTS" ("GIFT_CERTS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table EVENT_CONTACT
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."EVENT_CONTACT" ADD CONSTRAINT "PK_EVENT_CONTACT" PRIMARY KEY ("EVENT_CONTACT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."EVENT_CONTACT" MODIFY ("EVENT_CONTACT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CONTACT
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."CONTACT" ADD CONSTRAINT "PK_CONTACT" PRIMARY KEY ("CONTACT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."CONTACT" MODIFY ("CONTACT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TABLE_ROTATOR
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."TABLE_ROTATOR" ADD PRIMARY KEY ("TABLE_ROTATOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."TABLE_ROTATOR" MODIFY ("TABLE_ROTATOR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHAMBER_STAFF
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."CHAMBER_STAFF" ADD PRIMARY KEY ("CHAMBER_STAFF_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."CHAMBER_STAFF" MODIFY ("CHAMBER_STAFF_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TOWNS
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."TOWNS" ADD PRIMARY KEY ("TOWNS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."TOWNS" MODIFY ("TOWNS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WHO_ARE_THEY
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."WHO_ARE_THEY" ADD CONSTRAINT "PK_WHO_ARE_THEY" PRIMARY KEY ("WHO_ARE_THEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."WHO_ARE_THEY" MODIFY ("WHO_ARE_THEY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GIFT_CERTS
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."GIFT_CERTS" ADD CONSTRAINT "PK_GIFT_CERTS" PRIMARY KEY ("GIFT_CERTS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."GIFT_CERTS" MODIFY ("GIFT_CERTS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ASSIGNED_POSITION
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."ASSIGNED_POSITION" ADD CONSTRAINT "PK_ASSIGNED_POSITION" PRIMARY KEY ("ASSIGNED_POSITION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."ASSIGNED_POSITION" MODIFY ("ASSIGNED_POSITION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHAMBER_INFO
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."CHAMBER_INFO" ADD PRIMARY KEY ("CHAMBER_INFO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."CHAMBER_INFO" MODIFY ("CHAMBER_INFO_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMMITTEE
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."COMMITTEE" ADD CONSTRAINT "PK_COMMITTEE" PRIMARY KEY ("COMMITTEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."COMMITTEE" MODIFY ("COMMITTEE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TOS
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."TOS" ADD CONSTRAINT "PK_TOS" PRIMARY KEY ("TOS_DESCRIPTION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."TOS" MODIFY ("TOS_DESCRIPTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBERSHIP_PRICING
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."MEMBERSHIP_PRICING" ADD PRIMARY KEY ("MEMBERSHIP_PRICING_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."MEMBERSHIP_PRICING" MODIFY ("MEMBERSHIP_PRICING_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLES
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."ROLES" ADD PRIMARY KEY ("ROLE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."ROLES" MODIFY ("ROLE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUSINESS
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."BUSINESS" ADD CONSTRAINT "PK_BUSINESS" PRIMARY KEY ("BUSINESS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."BUSINESS" MODIFY ("BUSINESS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUSINESS_CONTACT_PIVOT
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."BUSINESS_CONTACT_PIVOT" ADD CONSTRAINT "PK_BUSINESS_CONTACT_PIVOT" PRIMARY KEY ("BUSINESS_CONTACT_PIVOT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."BUSINESS_CONTACT_PIVOT" MODIFY ("BUSINESS_CONTACT_PIVOT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENTS
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."EVENTS" ADD CONSTRAINT "PK_EVENTS" PRIMARY KEY ("EVENTS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."EVENTS" MODIFY ("EVENTS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MARKETING
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."MARKETING" ADD CONSTRAINT "PK_MARKETING" PRIMARY KEY ("MARKETING_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHAMBER"."MARKETING" MODIFY ("MARKETING_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ASSIGNED_POSITION
--------------------------------------------------------

  ALTER TABLE "CHAMBER"."ASSIGNED_POSITION" ADD CONSTRAINT "FK_ASSIGNED_POSITION_COMMITTEE" FOREIGN KEY ("COMMITTEE_ID")
	  REFERENCES "CHAMBER"."COMMITTEE" ("COMMITTEE_ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHAMBER_INFO_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHAMBER"."CHAMBER_INFO_SEQ_TR" 
 BEFORE INSERT ON Chamber_Info FOR EACH ROW
  WHEN (NEW.Chamber_Info_ID IS NULL) BEGIN
 SELECT Chamber_Info_seq.NEXTVAL INTO :NEW.Chamber_Info_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Chamber_Staff]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Chamber_Staff(
	Chamber_Staff_ID Number(10)  NOT NULL,
	Chamber_Info_ID Number(10) NULL,
	First_Name varchar2(30) NULL,
	Last_Name varchar2(30) NULL,
	Position varchar2(30) NULL,
	Linkedin_URL blob NULL,
	Comment blob NULL,
PRIMARY KEY 
(
	Chamber_Staff_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Chamber_Staff_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Chamber_Staff_seq_tr
 BEFORE INSERT ON Chamber_Staff FOR EACH ROW
 WHEN (NEW.Chamber_Staff_ID IS NULL)
BEGIN
 SELECT Chamber_Staff_seq.NEXTVAL INTO :NEW.Chamber_Staff_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Committee]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Committee(
	Committee_ID Number(10)  NOT NULL,
	Sub_Committee_ID Number(10) NULL,
	Committee_Name varchar2(50) NULL,
	Meeting_Dates varchar2(50) NULL,
	Notes blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Committee PRIMARY KEY 
(
	Committee_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Committee_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Committee_seq_tr
 BEFORE INSERT ON Committee FOR EACH ROW
 WHEN (NEW.Committee_ID IS NULL)
BEGIN
 SELECT Committee_seq.NEXTVAL INTO :NEW.Committee_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Contact(
	Contact_ID Number(10)  NOT NULL,
	First_Name varchar2(20) NULL,
	Middle_Name varchar2(20) NULL,
	Last_Name varchar2(20) NULL,
	Title varchar2(20) NULL,
	Suffix varchar2(20) NULL,
	Address_1 varchar2(50) NULL,
	Address_2 varchar2(50) NULL,
	City varchar2(50) NULL,
	State varchar2(20) NULL,
	Zip varchar2(20) NULL,
	Work_Email varchar2(50) NULL,
	Personal_Email varchar2(50) NULL,
	Work_Phone varchar2(20) NULL,
	Cell_Phone varchar2(20) NULL,
	Volunteer Number(1) NULL,
	Last_Volunteer_Date date NULL,
	Primary_Contact Number(1) NULL,
	RSVP Number(1) NULL,
	Newsletter Number(1) NULL,
	Who_Are_They varchar2(20) NULL,
	District varchar2(20) NULL,
	Party varchar2(20) NULL,
	Who_Are_They_Date_From date NULL,
	Who_Are_They_Date_To date NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
	Username blob NULL,
	Passwords blob NULL,
 CONSTRAINT PK_Contact PRIMARY KEY 
(
	Contact_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Contact_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Contact_seq_tr
 BEFORE INSERT ON Contact FOR EACH ROW
 WHEN (NEW.Contact_ID IS NULL)
BEGIN
 SELECT Contact_seq.NEXTVAL INTO :NEW.Contact_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Event_Contact]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Event_Contact(
	Event_Contact_ID Number(10)  NOT NULL,
	Events_ID Number(10) NULL,
	How_Paid varchar2(20) NULL,
	Price varchar2(20) NULL,
	Prepaid varchar2(20) NULL,
	Volunteer Number(1) NULL,
	Comment blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Event_Contact PRIMARY KEY 
(
	Event_Contact_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Event_Contact_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Event_Contact_seq_tr
 BEFORE INSERT ON Event_Contact FOR EACH ROW
 WHEN (NEW.Event_Contact_ID IS NULL)
BEGIN
 SELECT Event_Contact_seq.NEXTVAL INTO :NEW.Event_Contact_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Events]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Events(
	Events_ID Number(10)  NOT NULL,
	Contact_ID Number(10) NULL,
	Event_Name varchar2(50) NULL,
	Event_Date varchar2(50) NULL,
	Event_Location varchar2(50) NULL,
	Event_Address varchar2(50) NULL,
	Event_City varchar2(50) NULL,
	Event_State varchar2(20) NULL,
	Event_Zip varchar2(20) NULL,
	Summary blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
	Allow_Register Number(1) NULL,
 CONSTRAINT PK_Events PRIMARY KEY 
(
	Events_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Events_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Events_seq_tr
 BEFORE INSERT ON Events FOR EACH ROW
 WHEN (NEW.Events_ID IS NULL)
BEGIN
 SELECT Events_seq.NEXTVAL INTO :NEW.Events_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Gift_Certs]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Gift_Certs(
	Gift_Certs_ID Number(10)  NOT NULL,
	Transaction_Date Timestamp(3) NULL,
	Denomination varchar2(20) NULL,
	Cert_Number varchar2(20) NULL,
	Total_Number varchar2(20) NULL,
	Business_ID Number(10) NULL,
	Contact_ID Number(10) NULL,
	Cash_Amount varchar2(20) NULL,
	Check_Amount varchar2(20) NULL,
	Check_Number varchar2(50) NULL,
	Credit_Card varchar2(50) NULL,
	Staff varchar2(20) NULL,
	Comments blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Gift_Certs PRIMARY KEY 
(
	Gift_Certs_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Gift_Certs_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Gift_Certs_seq_tr
 BEFORE INSERT ON Gift_Certs FOR EACH ROW
 WHEN (NEW.Gift_Certs_ID IS NULL)
BEGIN
 SELECT Gift_Certs_seq.NEXTVAL INTO :NEW.Gift_Certs_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Marketing]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Marketing(
	Marketing_ID Number(10)  NOT NULL,
	Contact_ID Number(10) NULL,
	Contact_Date Timestamp(3) NULL,
	Memo blob NULL,
	Follow_Up_Date Timestamp(3) NULL,
	TOS_Description varchar2(50) NULL,
	Date_TOS_ID_Sent Timestamp(3) NULL,
	How_TOS_ID_Sent varchar2(50) NULL,
	Processed_Date Timestamp(3) NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Marketing PRIMARY KEY 
(
	Marketing_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Marketing_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Marketing_seq_tr
 BEFORE INSERT ON Marketing FOR EACH ROW
 WHEN (NEW.Marketing_ID IS NULL)
BEGIN
 SELECT Marketing_seq.NEXTVAL INTO :NEW.Marketing_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Membership_Pricing]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Membership_Pricing(
	Membership_Pricing_ID Number(10)  NOT NULL,
	Class_Of_Membership varchar2(30) NULL,
	Prices varchar2(50) NULL,
PRIMARY KEY 
(
	Membership_Pricing_ID 
) 
);


-- Generate ID using sequence and trigger
CREATE SEQUENCE Membership_Pricing_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Membership_Pricing_seq_tr
 BEFORE INSERT ON Membership_Pricing FOR EACH ROW
 WHEN (NEW.Membership_Pricing_ID IS NULL)
BEGIN
 SELECT Membership_Pricing_seq.NEXTVAL INTO :NEW.Membership_Pricing_ID FROM DUAL;
END;
/
ALTER TRIGGER "CHAMBER"."CHAMBER_INFO_SEQ_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ROLES_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHAMBER"."ROLES_SEQ_TR" 
 BEFORE INSERT ON Roles FOR EACH ROW
  WHEN (NEW.Role_ID IS NULL) BEGIN
 SELECT Roles_seq.NEXTVAL INTO :NEW.Role_ID FROM DUAL;
END;
/
ALTER TRIGGER "CHAMBER"."ROLES_SEQ_TR" ENABLE;
