-- 총 급여의 합계, 부서별 급여의 합계, 부서별 직급의 급여의 합계
-- 부서별 급여의 합계
-- 소계, 중계, 합계

-- GROUPING 묶였는지 여부 확인 / 1이면 묶여있음
SELECT  NVL(DEPT_CODE, '부서없음'), JOB_CODE, SUM(SALARY)
        , GROUPING(DEPT_CODE), GROUPING(JOB_CODE), COUNT(*)
FROM    EMP
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);

-- 구분 추가
SELECT  NVL(DEPT_CODE, '부서없음'), JOB_CODE, SUM(SALARY)
        , CASE  WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 1
                THEN '부서별 합계'
                WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 1
                THEN '총 합계'
                ELSE ' '
            END 구분
        , GROUPING(DEPT_CODE), GROUPING(JOB_CODE), COUNT(*)
FROM    EMP
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);