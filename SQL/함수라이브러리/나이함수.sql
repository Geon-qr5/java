--------------------------------------------------------
--  파일이 생성됨 - 금요일-8월-09-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function GET_AGE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USER02"."GET_AGE" 
(
-- 문자열을 매게변수로 받아서
  SSN IN VARCHAR2 
  -- 숫자를 반환하는 함수
) RETURN NUMBER
AS
-- 변수 선언
    AGE NUMBER;
BEGIN
-- 코드작성
SELECT  TO_CHAR(SYSDATE,'YYYY') - (DECODE (SUBSTR(SSN,8,1),1,19,2,19,3,20,4,20) || SUBSTR(SSN,1,2)) 나이
-- 조회결과를 변수에 담기
INTO    AGE
FROM    DUAL;
-- 반환
  RETURN AGE;
END GET_AGE;

/
