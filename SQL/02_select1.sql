select *
  from emp;

/*
    <리터럴>
        SELECT 절에 리터럴을 사용하면 테이블에 존재하는 데이터처럼 조회가 가능하다.
        리터럴은 RESULT SET의 모든 행에 반복적으로 출력된다.
*/

select '안녕',
       emp_name
       || '님의 급여는'
       || salary
       || '원 입니다.'
  from emp;

-- 형식을 지정해서 문자열로 변경하는 함수
select to_char(
	salary,
	'999,999,999'
)
  from emp;

/*
    <연결 연산자> 문자열 연결 ||
    여러 컬럼 값을 하나의 컬럼인것 처럼 연결 하거나 컬럼과 리터럴을 연결 하기 위해 사용
*/
select '안녕' as "안녕",
       emp_name
       || '님의 급여는'
       || to_char(
	       salary,
	       '999,999,999'
       )
       || '원 입니다.' 급여
  from emp;

-- 00사원의 급여는 00원 입니다.
-- 타이틀 : 사원급여
select emp_name
       || '사원의 급여는'
       || to_char(
	salary,
	'999,999,999'
)
       || '원 입니다.' "사원급여"
  from emp;

  /*
    <DISTINCT> 중복제거
        컬럼에 포함된 중복 값을 한 번씩만 표시하고자 할 때 사용한다.
        SELECT 절에 한 번만 기술할 수 있다.
        컬럼이 여러 개이면 컬럼 값들이 모두 동일해야 중복 값으로 판단되어 중복이 제거된다.
*/

select distinct job_code
  from emp;

select job_code
  from emp;

select distinct job_code 직급코드,
                dept_code 부서코드
  from emp;

/*
    <WHERE 절>
        [표현법]
            SELECT 컬럼, 컬럼, ..., 컬럼
              FROM 테이블명
             WHERE 조건식;
             
        - 조회하고자 하는 테이블에서 해당 조건에 만족하는 결과만을 조회하고자 할 때 사용한다.
        - 조건식에는 다양한 연산자들을 사용할 수 있다.
        
    <비교 연산자>
        >, <, >=, <= : 대소 비교
        =            : 동등 비교
        !=, ^=, <>   : 같지 않다
*/

-- EMP 테이블에서 부서 코드가 D9와 일치하는 사원들의 모든 컬럼(*) 정보 조회

select *
  from emp
  -- 쿼리는 대소문자를 구분하지 않지만 데이터는 대소문자를 구분한다.
 where dept_code = 'D9';

 -- 부서테이블의 부서코드가 D9와 일치하는 모든 내용을 조회
select *
  from dept
 where dept_id = 'D9';

-- EMP 테이블에서 부서코드가 D9가 아닌 사원들의 사번, 사원명, 부서코드 조회
select emp_id 직원코드,
       emp_name 직원명,
       dept_code 부서코드
  from emp
--  부정연산자는 3가지 방식이 존재
-- !=, ^=, <>
--  where dept_code != 'D9'
--  where dept_code <> 'D9'
 where dept_code^= 'D9'
 order by dept_code desc;

-- EMP 테이블에서 급여가 400만원 이상인 직원들의 직원명, 부서코드, 급여조회
select emp_name 직원,
       dept_code 직원코드,
       salary 급여
  from emp
 where salary >= 4000000;

 ------------------ 실습 문제 -----------------
-- 1. EMP 테이블에서 재직 중(ENT_YN 컬럼 값이 'N')인 직원들의 사번, 이름, 입사일 조회 
select emp_id 사번,
       emp_name 이름,
       hire_date 입사일
  from emp
 where ent_yn = 'N';

-- 2. EMP 테이블에서 연봉이 5000만원 이상인 직원의 직원명, 급여, 연봉, 입사일 조회 
-- 연봉 : (급여 * 보너스율 + 급여) * 12
-- null의 연산결과는 null이므로
-- nvl함수를 이용하여 0으로 바꿔준다!
select emp_name 직원명,
       to_char(
	       salary,
	       '999,999,999'
       ) 급여,
       to_char(
	       (salary * nvl(
		       bonus,
		       0
	       ) + salary) * 12,
	       '999,999,999'
       ) 연봉,
       hire_date 입사일
  from emp
 where ( salary * nvl(
	bonus,
	0
) + salary ) * 12 >= 50000000;

/*
    <논리 연산자>
        여러 개의 조건을 엮을 때 사용한다.
        AND (~ 이면서, 그리고)
        OR  (~ 이거나, 또는)
*/
-- EMP 테이블에서 부서 코드가 D6이면서 급여가 300만원 이상인 직원들의 사번, 직원명, 부서 코드, 급여 조회
select emp_no,
       emp_name,
       dept_code,
       salary
  from emp
 where dept_code = 'D6'
   and salary >= 3000000;
-- EMP 테이블에서 급여가 400만원 이상 이고, 직급 코드가 J2인 사원의 모든 컬럼 조회
select *
  from emp
 where salary >= 4000000
   and job_code = 'J2';

-- EMP 테이블에서 급여가 350만원 이상 600만원 이하를 받는 직원의 사번, 직원명, 부서 코드, 급여 조회
select emp_no,
       emp_name,
       job_code,
       salary
  from emp
 where salary >= 3500000
   and salary <= 6000000;

select emp_no,
       emp_name,
       dept_code,
       salary
  from emp
-- where 비교 대상 컬럼 between 하한값 and 상한 값
 where salary between 3500000 and 6000000;

/*
    <BETWEEN AND>
        [표현법]
            WHERE 비교대상컬럼 BETWEEN 하한값 AND 상한값
            
        - WHERE 절에서 사용되는 구문으로 범위에 대한 조건을 제시할 때 사용한다.
        - 비교대상컬럼 값이 하한값 이상이고, 상한값 이하인 경우 TRUE를 리턴한다.
*/ 


-- emp 테이블에서 입사일 '90/01/01' ~ '01/01/01'd인 사원의 모든 컬럼 조회

select *
  from emp;

/*
    <LIKE>
        [표현법]
            WHERE 비교대상컬럼 LIKE '특정 패턴';
            
        - 비교하려는 컬럼 값이 지정된 특정 패턴에 만족할 경우 TRUE를 리턴한다.
        - 특정 패턴에는 '%', '_'를 와일드카드로 사용할 수 있다.
          '%' : 0글자 이상
            ex) 비교대상컬럼 LIKE '문자%'  => 비교대상컬럼 값 중에 '문자'로 시작하는 모든 행을 조회한다.
                비교대상컬럼 LIKE '%문자'  => 비교대상컬럼 값 중에 '문자'로 끝나는 모든 행을 조회한다.
                비교대상컬럼 LIKE '%문자%' => 비교대상컬럼 값 중에 '문자'가 포함되어 있는 모든 행을 조회한다.
                
          '_' : 1글자
            ex) 비교대상컬럼 LIKE '_문자'  => 비교대상컬럼 값 중에 '문자'앞에 무조건 한 글자가 오는 모든 행을 조회한다.
                비교대상컬럼 LIKE '__문자' => 비교대상컬럼 값 중에 '문자'앞에 무조건 두 글자가 오는 모든 행을 조회한다.
*/

-- EMP 테이블에서 성이 전 씨인 사원의 사원명, 급여, 입사일 조회
select emp_name 사원명,
       salary 급여,
       hire_date 입사일
  from emp
 where emp_name like '전%';

-- EMP 테이블에서 이름 중에 '하'가 포함된 사원의 사원명, 주민번호, 부서 코드 조회
select emp_name 사원명,
       emp_no 주민번호,
       dept_code 부서코드
  from emp
 where emp_name like '%하%';

-- EMP 테이블에서 전화번호 4번째 자리가 9로 시작하는 사원의 사번, 사원명, 전화번호, 이메일 조회
select emp_id 사번,
       emp_name 사원명,
       phone 전화번호,
       email 이메일
  from emp
 where phone like '____9%';

-- EMP 테이블에서 이메일 중 _ 앞 글자가 3자리인 이메일 주소를 가진 사원의 사번 사원명, 이메일 조회
-- $_
-- 이메일 주소에 _가 입력된 경우, _를 와일드 카드가 아닌 문자열로 사용
select emp_name 사원명,
       email 이메일
  from emp
-- WHERE EMAIL LIKE '____%'; -- 와일드카드와 문자가 구분되지 않음
-- 데이터로 처리할 값 앞에 임의의 문자를 제시하고 임의의 문자를 ESCAPE 옵션에 등록한다.
 where email like '___$_%' escape '$';

-- EMP 테이블에서 김씨 성이 아닌 직원 사번, 사원명, 입사일 조회
-- NOT 칼럼이름 LIKE ''
select emp_id 사번,
       emp_name 사원명,
       hire_date 입사일
  from emp
 where not emp_name like '김$';

------------------- 실습 문제 -------------------
-- 1. EMP 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호 조회
select emp_name 이름,
       phone 전화번호
  from emp
 where not phone like '010%';
-- 2. DEPT 테이블에서 해외영업부에 대한 모든 컬럼 조회
select *
  from dept
 where dept_title like '해외영업%';


 SELECT * 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT * FROM EMP;