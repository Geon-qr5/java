 CREATE TABLE "USER01"."TB_BOOK" 
   (	"B_NO" CHAR(6 BYTE), 
	"TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"AUTHOR" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PRICE" NUMBER, 
	"P_NO" CHAR(6 BYTE), 
	"RENTYN" CHAR(1 BYTE) DEFAULT 'N', 
	"DELYN" CHAR(1 BYTE) DEFAULT 'N', 
	"REGDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"R_NO" CHAR(6 BYTE), 
	 CHECK (RENTYN IN ('Y','N')) ENABLE, 
	 CHECK (DELYN IN ('Y','N')) ENABLE, 
	 CONSTRAINT "PK_B_NO" PRIMARY KEY ("B_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 FOREIGN KEY ("P_NO")
	  REFERENCES "USER01"."TB_PUB" ("P_NO") ON DELETE CASCADE ENABLE, 
	 FOREIGN KEY ("R_NO")
	  REFERENCES "USER01"."TB_RENT" ("R_NO") ENABLE
   )