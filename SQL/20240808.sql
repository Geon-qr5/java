/*
    <다중열 서브 쿼리>
        조회 결과 값은 한 행이지만 나열된 컬럼 수가 여러 개일 때
*/

-- 다중열 서브쿼리를 작성 하는 방법
-- 비교연산자도 사용이 가능( =, IN ) 

-- 다중열 : 여러개의 컬럼을 이용하여 조회 / 직접 값을 넣어줄때는 괄호로 한번더 감싼다
SELECT  *
FROM    EMP
WHERE   (JOB_CODE, DEPT_CODE) = (('J1', 'D9'));

-- 1) 하이유 사원과 같은 부서 코드, 같은 직급 코드에 해당하는 사원들 조회
-- 하이유 사원의 부서 코드와 직급 코드 조회 -- (D5, J5) 

SELECT  *
FROM    EMP
WHERE   (DEPT_CODE, JOB_CODE) = (('D5', 'J5'));

-- 갯수와 타입이 일치해야 한다!
SELECT  *
FROM    EMP
WHERE   (DEPT_CODE, JOB_CODE) = (
    SELECT  DEPT_CODE, JOB_CODE
    FROM    EMP
    WHERE   EMP_NAME = '하이유'
);

-- 2) 박나라 사원과 직급 코드가 일치하면서 같은 사수를 가지고 있는 
-- 사원의 사번, 이름, 직급 코드, 사수 사번 조회
-- 박나라 사원의 직급 코드와 사수의 사번을 조회 -- (J7, 207)
SELECT  EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM    EMP
WHERE   (JOB_CODE, MANAGER_ID) = (
    SELECT  JOB_CODE, MANAGER_ID
    FROM    EMP
    WHERE   EMP_NAME = '박나라'
);

/*
    <다중행 다중열 서브 쿼리>
    서브 쿼리의 조회 결과값이 여러 행, 여러 열일 경우
*/ 

-- 1. 각 직급별로 최소 급여를 받는 사원들의 사번, 이름, 직급 코드, 급여 조회
-- 각 직급별 최소 급여 조회 
-- 다중행이 올 경우, IN을 이용한다!
SELECT  *
FROM    EMP
WHERE   (JOB_CODE, SALARY) IN (
    SELECT   JOB_CODE, MIN(SALARY)
    FROM     EMP
    GROUP BY JOB_CODE
);

-- 2) 각 부서별 최소 급여를 받는 사원들의 사번, 이름, 부서명, 급여 조회
-- 부서가 없는 사원은 부서없음으로 표시
-- 각 부서별 최소 급여 조회
SELECT  EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM    EMP
WHERE   (NVL (DEPT_CODE, '부서없음'), SALARY) IN (
    SELECT      NVL (DEPT_CODE, '부서없음'), MIN(SALARY)
    FROM        EMP
    GROUP BY    DEPT_CODE
);

--NULL은 비교대상이 되지 않으므로 제외됨 / 조인을 하면 조인대상에 포함되지않아 제외될수 있다.
SELECT  EMP_ID, EMP_NAME, DEPT_TITLE, SALARY
FROM    EMP, DEPT
WHERE   DEPT_CODE = DEPT_ID
AND     (NVL (DEPT_CODE, '부서없음'), SALARY) IN (
    SELECT      NVL (DEPT_CODE, '부서없음'), MIN(SALARY)
    FROM        EMP
    GROUP BY    DEPT_CODE
);


SELECT  EMP_ID, EMP_NAME, NVL ((SELECT DEPT_TITLE FROM DEPT WHERE DEPT_ID = DEPT_CODE), '부서없음'), SALARY
FROM    EMP
WHERE   (NVL (DEPT_CODE, '부서없음'), SALARY) IN (
    SELECT      NVL (DEPT_CODE, '부서없음'), MIN(SALARY)
    FROM        EMP
    GROUP BY    DEPT_CODE
);

-- 기준테이블(+)을 지정해주면 해결이 된다.
-- 조인조건에 일치하지 않는 데이터도 모두 조회 하기 위해
-- OUTER JOIN을 이용한다! 기준을 잡아주세요!
-- TO_CHAR에서 FM을 추가하면 앞 공백을 제거한다.
-- 오라클
SELECT  EMP_ID, EMP_NAME, NVL (DEPT_TITLE, '부서없음'), TO_CHAR(SALARY, 'FM999,999,999')
FROM    EMP, DEPT
WHERE   DEPT_CODE = DEPT_ID(+)
AND     (NVL (DEPT_CODE, '부서없음'), SALARY) IN (
    SELECT      NVL (DEPT_CODE, '부서없음'), MIN(SALARY)
    FROM        EMP
    GROUP BY    DEPT_CODE
);

-- ANSI
SELECT      EMP_ID, EMP_NAME, NVL (DEPT_TITLE, '부서없음'), SALARY
FROM        EMP
LEFT JOIN   DEPT ON (DEPT_CODE = DEPT_ID)
WHERE   (NVL (DEPT_CODE, '부서없음'), SALARY) IN (
    SELECT      NVL (DEPT_CODE, '부서없음'), MIN(SALARY)
    FROM        EMP
    GROUP BY    DEPT_CODE
);

/*
    <인라인 뷰>
        FROM 절에 서브 쿼리를 제시하고, 서브 쿼리를 수행한 결과를 테이블 대신 사용한다.
    1) 인라인 뷰를 활용한 TOP-N분석
*/
-- 전 직원중 급여가 가장 높은 사람 5명을 순위, 이름, 급여 조회
-- FROM -> SELECT(순번이 정해진다.) -> ORDER BY
-- ROWNUM : 조회된 순서대로 번호를 붙여 줍니다
--          ORDER BY절이 SELECT절 다음에 실행 되므로 ROWNUM이 붙고 난 후 정렬 
-- 테이블의 이름을 명시적으로 써줘야 함 
SELECT      ROWNUM, EMP.*
FROM        EMP;

-- 쿼리의 실행순서때문에 ROWNUM순서가 바뀜 / ORDER BY는 가장 마지막에 실행
SELECT      ROWNUM, EMP.*
FROM        EMP
ORDER BY    EMP_NAME;

-- 페이징 처리 - 부하를 줄이기 위해 10건씩 데이터를 조회
-- 정렬된 후 번호를 붙여준다!! / 1 -> 2 바꾸면 조회가 안됨 / 1부터생성되기때문에(?)
SELECT      ROWNUM, EMP.*
FROM        EMP
WHERE       ROWNUM BETWEEN 1 AND 10
ORDER BY    EMP_NAME;

-- 쿼리의 실행순서가 SELECT보다 WHERE가 우선되므로 WHERE에 RN을 사용 할 수 없다.
-- 쿼리 실행 순서 FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
SELECT  ROWNUM RN, T.*
FROM    (
    SELECT      *
    FROM        EMP
    ORDER BY    EMP_NAME
) T
WHERE   RN  BETWEEN 1 AND 10;

SELECT  *
FROM (
    SELECT  ROWNUM RN, T.*
    FROM    (
        SELECT      *
        FROM        EMP
        ORDER BY    EMP_NAME
    ) T
)
WHERE   RN  BETWEEN 1 AND 10;

-- 전 직원중 급여가 가장 높은 사람 5명을 순위, 이름, 급여 조회
SELECT  ROWNUM, EMP_NAME, SALARY
FROM    (
        SELECT  ROWNUM RN, T.*
    FROM    (
        SELECT      *
        FROM        EMP
        ORDER BY    SALARY DESC
    ) T
)
WHERE   ROWNUM BETWEEN 1 AND 5;




