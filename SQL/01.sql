-- system 계정으로 접근하고 계정을 생성하고 권한을 부여한다.
----------------------------------------------------
-- 사용자 생성및 권한 부여
-- 오라클에서 제공하는 객체를 만들고 수정하고 삭제
-- DDL
-- ctrl + enter
create user user01 IDENTIFIED by 1234;

-- 권한 부여 (접근, 리소스)
-- 실습테이블 설정
grant connect, resource to user01;
-----------------------------------------------------
-- 실습용 테이블생성
-----------------------------------------------------
-- user01계정으로 접속을 생성
-- 사용자 계정으로 접속하여 실습스크립트를 실행

select *         -- 조회할 컬럼명을 나열, * 테이블이 가진 모든 컬럼을 조회
from emp;    -- 테이블 이름
-- where
-- order by;
-- 테이블 이름 변경
-- sql 문장으로 실행 할 수도 있고 sqlDeveloper의 기능을 이용 할 수도 있다.
rename department to dept;

-- 사원 테이블에서 사원의 이름, 급여, 입사일을 조회 해보세요
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM emp
-- 조건절
-- ~으로 시작하는, ~으로 끝나는, ~을 포함하는, ~과 일치하는
-- 날짜, 숫자 비교
WHERE EMP_NAME = '송종기';

-- 급여가 300만원 이상인 사원의 이름과 직급코드를 조회 하시오.

SELECT EMP_NAME, JOB_CODE
FROM EMP
WHERE SALARY >= 3000000;
-- 정렬
-- ASC - 오름차순(기본)
-- DESC - 내림차순
-- ORDER BY EMP-NAME desc;

-- 한줄 주석
/*
여러줄 주석
SELECT 구문 : 테이블에 있는 데이터를 조회 할때 사용
SELECT 컬럼명, ...
FROM 테이블명
WHERE 조건 AND(OR) 조건
ORDER BY 정렬컬럼

- SELECT절을 통해서 조회된 결과물을 RESULT SET이라고 한다(조회된 행들의 집합)
- SELECT절에 나열되는 컬럼명은 FROM절에 기술된 테이블에 존재 하는 컬럼 이여야 한다!!!!!!!!
*/

-- EMPLOYEE 테이블에서 전체 사원의 사번, 이름, 월급을 조회
-- 별칭주기
-- 컬럼명 별칭
-- as 키워드를 붙일수도 있고 생략 할 수도 있다.
-- 별칭에 공백이나 특수문자가 있는경우 ""로 묶어주어야 한다.
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 월급
FROM EMP;
/*
<컬럼명에 별칭 지정하기>
[표현법] 컬럼명 AS 별칭 / 컬럼명 AS "별칭" / 컬럼명 별칭 / 컬럼명 "별칭"
- 산술연산을 하게 되면 컬럼명이 지저분해진다. 이때 컬럼명에 별칭을 부여해서 깔끔하게 보여줄 수 있다.
- 별칭을 부여할 때 띄어쓰기 혹은 특수문자가 포함될 경우에는 반드시 큰 따옴표("")로 감싸줘야 한다.
*/

SELECT EMP_ID as "사번", EMP_NAME as "이름", SALARY as "월급"
FROM EMP;

/*
<컬럼 값을 통한 산술연산>
SELECT 절에 컬럼명 입력 부분에서 산술 연산을 이용해서 결과를 조회할 수 있다.
*/

SELECT EMP_NAME, SALARY, SALARY * 12, BONUS
FROM EMP;

-- 보너스 구하기
-- 보너스율과 보너스를 함께 출력
-- 보너스를 포함한 급여 구하기
-- null의 연산결과는 null ---> nvl(컬럼,변경할값)함수를 이용해서 null이면 0으로 치환
-- nvl(bonus,0) : bonus컬럼의 값이 null 이라면 0으로 바꿔줘
-- 연산식이나 함수를 이용할 경우, 컬럼명이 연산식으로 변경됨
SELECT BONUS 보너스율, SALARY * NVL(BONUS,0)보너스, SALARY + SALARY * NVL(BONUS,0) "보너스를 포함한 급여"
FROM EMP;

-- DUAL : 테스트용 테이블
SELECT SYSDATE FROM DUAL;

-- 날짜출력형식 변경
-- 도구 > 환경설정 > 데이터베이스 > NLS
-- 오늘날짜 : sysdate
-- FLOOR : 소수점 버림 함수
-- 날짜와 날짜의 연산, 날짜와 숫자의 연산 -> 일수로 출력
SELECT SYSDATE, HIRE_DATE, SYSDATE - 2, FLOOR(SYSDATE - HIRE_DATE)
FROM EMP;

-- EMP 테이블에서 직원명, 연봉, 보너스가 포함된 연봉 조회
-- 컬럼명은 직원명, 연봉, 보너스가 포함된 연봉으로 한다.

SELECT EMP_NAME "직원명", SALARY*12 "연봉", (NVL(BONUS,0) * SALARY + SALARY)*12 "보너스가 포함된 연봉"
FROM EMP;

SELECT * FROM EMP;