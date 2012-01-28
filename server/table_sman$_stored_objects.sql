
PROMPT ===========================================
PROMPT Create indexes on SMAN$_STORED_OBJECTS
PROMPT ===========================================


  CREATE INDEX "SMAN$_STORED_OBJECTS_LABEL_IDX" ON "SMAN$_STORED_OBJECTS" ("LABEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "&&DATA_MD" ;
 
PROMPT ===========================================
PROMPT Add constraints on SMAN$_STORED_OBJECTS
PROMPT ===========================================


  ALTER TABLE "SMAN$_STORED_OBJECTS" ADD CONSTRAINT "SMAN$_STORED_OBJECTS_CHK" CHECK (OBJECT_TYPE IN ('ALL_GRANTS','ALL_PUBLIC_SYNONYMS','DEPLOY','DB_LINK','FUNCTION','MATERIALIZED VIEW','PACKAGE','PROCEDURE','SEQUENCE','SYNONYM','TABLE','TRIGGER','TYPE','VIEW')) ENABLE;
 
  ALTER TABLE "SMAN$_STORED_OBJECTS" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "SMAN$_STORED_OBJECTS" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "SMAN$_STORED_OBJECTS" MODIFY ("STORE_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "SMAN$_STORED_OBJECTS" MODIFY ("LABEL" NOT NULL ENABLE);
 
  ALTER TABLE "SMAN$_STORED_OBJECTS" ADD CONSTRAINT "SMAN$_STORED_OBJECTS_CMP_FK" FOREIGN KEY ("CMP_CMP_ID")
	  REFERENCES "SMAN$_COMPONENT" ("CMP_ID") ENABLE;
 