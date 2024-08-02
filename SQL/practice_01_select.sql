-- EMP 테이블에서 부서 코드가 D9와 일치하는 사원들의 모든 컬럼(*) 정보 조회
SELECT *
FROM EMP
WHERE DEPT_CODE = 'D9';

 -- 부서테이블의 부서코드가 D9와 일치하는 모든 내용을 조회
SELECT *
FROM DEPT
WHERE DEPT_ID = 'D9';

-- EMP 테이블에서 부서코드가 D9가 아닌 사원들의 사번, 사원명, 부서코드 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, DEPT_CODE 부서코드
FROM EMP
WHERE DEPT_CODE != 'D9';

-- EMP 테이블에서 급여가 400만원 이상인 직원들의 직원명, 부서코드, 급여조회
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드, to_char(SALARY,'999,999,999') 급여
FROM EMP
WHERE SALARY >= 4000000;

 ------------------ 실습 문제 -----------------
-- 1. EMP 테이블에서 재직 중(ENT_YN 컬럼 값이 'N')인 직원들의 사번, 이름, 입사일 조회 
SELECT EMP_ID 사번, EMP_NAME 이름, HIRE_DATE 입사일
FROM EMP
WHERE ENT_YN = 'N';

-- 2. EMP 테이블에서 연봉이 5000만원 이상인 직원의 직원명, 급여, 연봉, 입사일 조회 
-- 연봉 : (급여 * 보너스율 + 급여) * 12
SELECT EMP_NAME 직원명, SALARY 급여, (SALARY * NVL(BONUS,0)+SALARY)*12 연봉, HIRE_DATE 입사일
FROM EMP
WHERE (SALARY * NVL(BONUS,0)+SALARY)*12 >= 50000000;

-- EMP 테이블에서 부서 코드가 D6이면서 급여가 300만원 이상인
-- 직원들의 사번, 직원명, 부서 코드, 급여 조회
SELECT EMP_ID 사번, EMP_NAME 직원명, DEPT_CODE 부서코드, SALARY 급여
FROM EMP
WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;

-- EMP 테이블에서 급여가 400만원 이상 이고, 직급 코드가 J2인 사원의 모든 컬럼 조회
SELECT *
FROM EMP
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

-- EMP 테이블에서 급여가 350만원 이상 600만원 이하를 받는 직원의
-- 사번, 직원명, 부서 코드, 급여 조회
SELECT EMP_ID 사번, EMP_NAME 직원명, DEPT_CODE 부서코드, SALARY 급여
FROM EMP
WHERE SALARY BETWEEN 3500000 AND 6000000;

-- emp 테이블에서 입사일 '90/01/01' ~ '01/01/01'인 사원의 모든 컬럼 조회
SELECT *
FROM EMP
WHERE HIRE_DATE BETWEEN '1990/01/01' AND '2001/01/01';

-- EMP 테이블에서 성이 전 씨인 사원의 사원명, 급여, 입사일 조회
SELECT EMP_NAME 사원명, SALARY 급여, HIRE_DATE 입사일
FROM EMP
WHERE EMP_NAME LIKE '전%';

-- EMP 테이블에서 이름 중에 '하'가 포함된 사원의 사원명, 주민번호, 부서 코드 조회
SELECT EMP_NAME 사원명, EMP_NO 주민번호, DEPT_CODE 부서코드
FROM EMP
WHERE EMP_NAME LIKE '%하%';

-- EMP 테이블에서 전화번호 4번째 자리가 9로 시작하는 사원의
-- 사번, 사원명, 전화번호, 이메일 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, PHONE 전화번호, EMAIL 이메일
FROM EMP
WHERE PHONE LIKE '___9%';

-- EMP 테이블에서 이메일 중 _ 앞 글자가 3자리인 이메일 주소를 가진 사원의
-- 사번 사원명, 이메일 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, EMAIL 이메일
FROM EMP
WHERE EMAIL LIKE '___$_%' ESCAPE '$';

-- EMP 테이블에서 김씨 성이 아닌 직원 사번, 사원명, 입사일 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, HIRE_DATE 입사일
FROM EMP
WHERE NOT EMP_NAME LIKE '김%';

------------------- 실습 문제 -------------------
-- 1. EMP 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호 조회
SELECT      EMP_NAME    이름
            , PHONE     전화번호
FROM        EMP
WHERE NOT   PHONE        LIKE        '010%';

-- 2. DEPT 테이블에서 해외영업부에 대한 모든 컬럼 조회
SELECT      *
FROM        DEPT
WHERE       DEPT_TITLE      LIKE        '해외영업_부';


-- 보너스를 받고 있는 사람을 조회
-- 사원명, 보너스율
SELECT      EMP_NAME        사원명
            , BONUS         보너스율
FROM        EMP
WHERE       BONUS           IS NOT NULL;

-- 보너스를 받지 못하는 사람 조회


-- EMP 테이블에서 관리자(사수)가 없는 사원 이름, 부서 코드 조회 


-- EMP 테이블에서 부서 배치를 받진 않았지만 보너스는 받는 사원의 사원명, 부서 코드, 보너스 조회 


-- EMP 테이블에서 D5 부서원들과 D6부서원들, D8 부서원들의 사원명, 부서코드, 급여 조회


-- EMP 테이블에서 직급 코드가 J2 또는 J7 직급인 사원들 중
-- 급여가 200만원 이상인 사원들의 모든 컬럼 조회


 -- EMP 테이블에서 BONUS로 내림차순 정렬
 -- (단, BONUS 값이 일치할 경우 그때는 SALARY 가지고 오름차순정렬)
 -- 사원명 보너스 급여

