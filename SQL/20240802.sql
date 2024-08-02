DROP TABLE MEMBER_GRADE;

-- 도서관리 프로그램을 만들기 위한 테이블 만들기 
-- 제약조건에 이름을 부여및 COMMENT 추가

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUB) 
--  1) 컬럼 : P_NO(출판사 번호 - P00001) -- 기본 키
--           PUB_NAME(출판사명) -- NOT NULL
--           PHONE(출판사 전화번호)
--           DELYN(삭제 여부)     -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(등록일)  -- 기본값으로 SYSDATE, NOT NULL
DROP TABLE TB_PUB;

CREATE      TABLE       TB_PUB(
    P_NO        CHAR(6)         CONSTRAINT PK_P_NO     PRIMARY KEY
    , PUB_NAME  VARCHAR2(20)    NOT NULL
    , PHONE     VARCHAR2(20)
    , DELYN     CHAR(1)         DEFAULT 'N'         CHECK (DELYN IN('Y', 'N'))
    , REGDATE   DATE            DEFAULT SYSDATE     NOT NULL
);


--  2) 3개 정도의 샘플 데이터 추가하기
INSERT INTO TB_PUB  VALUES ('P00001','출판사1','000-0000-0001','N',SYSDATE);
INSERT INTO TB_PUB  VALUES ('P00002','출판사2','000-0000-0002','N',SYSDATE);
INSERT INTO TB_PUB  VALUES ('P00003','출판사3','000-0000-0003','N',SYSDATE);
INSERT INTO TB_PUB VALUES ('P00004', '문학동네', '02-222-3333', DEFAULT, DEFAULT);
INSERT INTO TB_PUB (P_NO, PUB_NAME) VALUES ('P00005', '한빛미디어');
INSERT INTO TB_PUB (P_NO, PUB_NAME, PHONE) VALUES ('P00006', '길벗', '031-222-3333');
COMMIT;

--  3) 커멘트 달기
COMMENT ON TABLE TB_PUB IS '출판사';

COMMENT ON COLUMN TB_PUB.P_NO       IS '출판사 번호';
COMMENT ON COLUMN TB_PUB.PUB_NAME   IS '출판사 이름';
COMMENT ON COLUMN TB_PUB.PHONE      IS '출판사 전화번호';
COMMENT ON COLUMN TB_PUB.DELYN      IS '삭제여부';
COMMENT ON COLUMN TB_PUB.REGDATE    IS '등록일';


-- 2. 도서들에 대한 데이터를 담기 위한 도서 테이블 (TB_BOOK)
--  1) 컬럼 : B_NO (도서번호 - B00001) -- 기본 키
--           TITLE (도서명)        -- NOT NULL
--           AUTHOR(저자명)        -- NOT NULL
--           PRICE(가격)
--           P_NO(출판사 번호)     -- 외래 키(TB_PUB 테이블을 참조)
--           RENTYN(대여여부)      -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           DELYN(삭제 여부)      -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(등록일)       -- 기본값으로 SYSDATE, NOT NULL
DESC TB_PUB;
DROP TABLE TB_BOOK;

CREATE      TABLE       TB_BOOK (
    B_NO        CHAR(6)             CONSTRAINT PK_B_NO          PRIMARY KEY
    , TITLE     VARCHAR2(100)       NOT NULL
    , AUTHOR    VARCHAR2(20)        NOT NULL
    , PRICE     NUMBER
    , P_NO      CHAR(6)             REFERENCES TB_PUB (P_NO)    ON DELETE CASCADE
    , RENTYN    CHAR(1)             DEFAULT 'N'                 CHECK (RENTYN IN ('Y','N')) 
    , DELYN     CHAR(1)             DEFAULT 'N'                 CHECK (DELYN IN ('Y','N'))
    , REGDATE   DATE                DEFAULT SYSDATE             NOT NULL
);

COMMENT ON TABLE TB_BOOK IS '책';

COMMENT ON COLUMN TB_BOOK.B_NO      IS '책 번호';
COMMENT ON COLUMN TB_BOOK.TITLE     IS '책 이름';
COMMENT ON COLUMN TB_BOOK.AUTHOR    IS '작가명';
COMMENT ON COLUMN TB_BOOK.PRICE     IS '가격';
COMMENT ON COLUMN TB_BOOK.P_NO      IS '출판사 번호(F)';
COMMENT ON COLUMN TB_BOOK.RENTYN    IS '대여여부 Y : 대여가능 / N : 대여불가';
COMMENT ON COLUMN TB_BOOK.DELYN     IS '삭제여부';
COMMENT ON COLUMN TB_BOOK.REGDATE   IS '대여일자';


--  2) 5개 정도의 샘플 데이터 추가하기
INSERT INTO TB_BOOK VALUES ('B00001', '타이틀1', '작가1', '10000', 'P00001', 'N', 'N', SYSDATE);
INSERT INTO TB_BOOK VALUES ('B00002', '타이틀2', '작가2', '15000', 'P00001', 'N', 'N', SYSDATE);
INSERT INTO TB_BOOK VALUES ('B00003', '타이틀3', '작가3', '20000', 'P00002', 'N', 'N', SYSDATE);
INSERT INTO TB_BOOK VALUES ('B00004', '타이틀4', '작가4', '30000', 'P00003', 'N', 'N', SYSDATE);
INSERT INTO TB_BOOK VALUES ('B00005', '타이틀5', '작가5', '25000', 'P00002', 'N', 'N', SYSDATE);
COMMIT;


-- FK제약조건 위배시 데이터 입력 제한
INSERT INTO TB_BOOK VALUES ('B00005', '타이틀5', '작가5', '25000', 'P00010', 'N', 'N', SYSDATE);


-- 부모테이블 데이터 삭제시 참조하고 있는 자식테이블의 데이터도 함께 제거
-- , P_NO      CHAR(6)             REFERENCES TB_PUB (P_NO)    ON DELETE CASCADE
-- 구현완료

-- 3. 회원에 대한 데이터를 담기 위한 회원 테이블 (TB_MEMBER)
--  1) 컬럼 : M_NO(회원번호 - M00001) -- 기본 키
--           ID(아이디)   -- 중복 금지
--           PW(비밀번호) -- NOT NULL
--           NAME(회원명) -- NOT NULL
--           GENDER(성별)        -- 'M' 또는 'F'로 입력되도록 제한
--           ADDR(주소)       
--           PHONE(연락처)       
--           DELYN(탈퇴 여부)     -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(가입일)  -- 기본값으로 SYSDATE, NOT NULL

DROP TABLE TB_MEMBER;
DESC TB_MEMBER;

CREATE TABLE TB_MEMBER (
    M_NO            CHAR(6)         CONSTRAINT PK_M_NO      PRIMARY KEY
    , ID            VARCHAR2(20)    UNIQUE
    , PW            VARCHAR2(20)    NOT NULL
    , NAME          VARCHAR2(20)    NOT NULL
    , GENDER        CHAR(1)         CONSTRAINT GENDER       CHECK (GENDER IN('M','F'))
    , ADDR          VARCHAR2(100)
    , PHONE         VARCHAR2(20)
    , DELYN         CHAR(1)         DEFAULT 'N'             CHECK (DELYN IN('Y','N'))
    , REGDATE       DATE            DEFAULT SYSDATE         NOT NULL
);

COMMENT ON TABLE TB_MEMBER IS '사용자';

COMMENT ON COLUMN TB_MEMBER.M_NO    IS '사용자 번호';
COMMENT ON COLUMN TB_MEMBER.ID      IS '아이디';
COMMENT ON COLUMN TB_MEMBER.PW      IS '패스워드';
COMMENT ON COLUMN TB_MEMBER.NAME    IS '사용자 이름';
COMMENT ON COLUMN TB_MEMBER.GENDER  IS '사용자 성별';
COMMENT ON COLUMN TB_MEMBER.ADDR    IS '사용자 주소';
COMMENT ON COLUMN TB_MEMBER.PHONE   IS '전화번호';
COMMENT ON COLUMN TB_MEMBER.DELYN   IS '삭제여부';
COMMENT ON COLUMN TB_MEMBER.REGDATE IS '가입일';

--  2) 3개 정도의 샘플 데이터 추가하기
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00001', 'ID01', 'PW01', 'NAME01', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00002', 'ID02', 'PW02', 'NAME02', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00003', 'ID03', 'PW03', 'NAME03', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00004', 'ID04', 'PW04', '박서현', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00005', 'ID05', 'PW05', '지디', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00006', 'ID06', 'PW06', '홍형경', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00007', 'ID07', 'PW07', '아몰랑', SYSDATE);
INSERT INTO TB_MEMBER  (M_NO, ID, PW, NAME, REGDATE)
                VALUES ('M00008', 'ID08', 'PW08', '오늘도', SYSDATE);
COMMIT;



-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(TB_RENT)
--  1) 컬럼 : R_NO(대여번호 R00001) -- 기본 키
--           M_NO(대여 회원번호 M00001) -- 외래 키(TB_MEMBER와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           B_NO(대여 도서번호 B00001) -- 외래 키(TB_BOOK와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_DATE(대여일) -- 기본값 SYSDATE
--           RETURN_DATE(반납일)

DROP TABLE TB_RENT;

CREATE TABLE TB_RENT (
    R_NO            CHAR(6)     CONSTRAINT PK_R_NO              PRIMARY KEY
    , M_NO          CHAR(6)     REFERENCES TB_MEMBER (M_NO)
    , B_NO          CHAR(6)     REFERENCES TB_BOOK (B_NO)
    , RENT_DATE     DATE        DEFAULT SYSDATE
    , RETURN_DATE   DATE
);

-- 아이디가 M00001번인 사람이 B00003번책을 대여
INSERT INTO TB_RENT VALUES ('R00001', 'M00001', 'B00003', SYSDATE, NULL);
COMMIT;

-- 테이블의 데이터를 수정
UPDATE TB_BOOK SET RENTYN = 'Y' WHERE B_NO = 'B00001';

--------------------------------------------------
-- 도서 대여
--------------------------------------------------
-- 아이디가 M00002인 사람이 B00002번책을 대여
-- 1. 책의 상태를 확인
-- RENTYN == N 이면 대여처리, 아니면 오류 메세지
SELECT RENTYN FROM TB_BOOK WHERE B_NO = 'B00002';
SELECT * FROM TB_BOOK WHERE RENTYN = 'N';
-- 2. RENT 테이블에 대여 이력을 입력
INSERT INTO TB_RENT (R_NO,M_NO,B_NO) VALUES ('R00002','M00002','B00002');
-- 3. BOOK 테이블의 대여 여부를 업데이트
UPDATE TB_BOOK SET RENTYN = 'Y' WHERE B_NO = 'B00002';

--------------------------------------------------
-- 도서 반납
--------------------------------------------------
-- 1. 책의 상태를 확인
SELECT RENTYN FROM TB_BOOK WHERE B_NO = 'B00002';
-- RENT 테이블의 반납일을 업데이트
-- 도서테이블에 대여번호컬럼을 추가 합니다.
ALTER TABLE TB_BOOK ADD R_NO CHAR(6) REFERENCES TB_RENT (R_NO);
SELECT * FROM TB_BOOK WHERE B_NO = 'B00002';
UPDATE TB_BOOK SET R_NO = 'R00002' WHERE B_NO = 'B00002';

SELECT * FROM TB_RENT WHERE B_NO = 'B00002' AND RETURN_DATE IS NULL;
-- BOOK 테이블의 대여 여부 업데이트
UPDATE TB_RENT SET RETURN_DATE = SYSDATE
WHERE B_NO = 'B00002' AND RETURN_DATE IS NULL;

UPDATE TB_BOOK SET RENTYN = 'N'
WHERE B_NO = 'B00002';

ROLLBACK;
COMMIT;
SELECT * FROM TB_PUB;
SELECT * FROM TB_BOOK;
SELECT * FROM TB_MEMBER;
SELECT * FROM TB_RENT;

SELECT  RENT_DATE, TITLE, NAME
FROM    TB_RENT, TB_BOOK, TB_MEMBER
WHERE   TB_RENT.B_NO = TB_BOOK.B_NO
AND     TB_RENT.M_NO = TB_MEMBER.M_NO;

SELECT *
FROM TB_MEMBER
WHERE M_NO = 'M00001';