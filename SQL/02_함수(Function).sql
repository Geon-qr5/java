/*
    <함수>
        컬럼값을 읽어서 계산 결과를 반환한다.
          - 단일행 함수 : N개의 값을 읽어서 N개의 결과를 리턴한다. (매 행 함수 실행 -> 결과 반환)
          - 그룹 함수   : N개의 값을 읽어서 1개의 결과를 리턴한다. (하나의 그룹별로 함수 실행 -> 결과 반환)
        SELECT 절에 단일행 함수와 그룹 함수를 함께 사용하지 못한다. (결과 행의 개수가 다르기 때문에)
        함수를 기술할 수 있는 위치는 SELECT, WHERE, ORDER BY, GROUP BY, HAVING 절에 기술할 수 있다.
        (FROM절에는 테이블이름이 기술되므로 사용 할 수 없다)
*/ 

-- 단일행 함수
/*
    <문자관련 함수>
    1) LENGTH : 글자수를 반환
       LENGTHB : 글자의 바이트수를 반환
       한글은 한글자당 3BYTE(지정된 문자셋에 따라 다를수 있음)
       영어, 숫자, 특수문자 1BYTE
       
*/ 

SELECT length('오라클'), lengthb('오라클')
from dual;

SELECT SYSDATE
from dual;

/*
    DUAL 테이블
    - SYS 사용자가 소유하는 테이블
    - SYS 사용자가 소유하지만 모든 사용자가 접근 할 수 있다
    - 하나의 행, 하나의 컬럼을 가지고 있는 더미 테이블이다
    - 사용자가 함수를 계산하거나 오늘 날자를 출력할때 임시로 사용되는 테이블
*/ 

/*
    2) INSTR
        - INSTR(컬럼|'문자값', '문자'[, POSITION[, OCCURRENCE]])
        - 지정한 위치부터 지정된 숫자 번째로 나타나는 문자의 시작 위치를 반환한다.

        position : 양수 - 앞에서부터 // 음수 - 뒤에서부터
*/

-- 첫번째 나오는 B의 위치를 반환
SELECT instr('AABAACAABBAA','B') from dual;

-- 앞에서부터(양수) 두번째(2) 나오는 B의 위치를 반환
SELECT instr('AABAACAABBAA','B',1,2) from dual;

-- 앞에서부터(양수) 세번째(3) 나오는 B의 위치를 반환
SELECT instr('AABAACAABBAA','B',1,3) from dual;

-- 뒤에서부터(음수) 첫번째로 나오는 B의 위치를 반환
SELECT instr('AABAACAABBAA','B',-1) from dual;

-- 뒤에서부터(음수) 세번째(3) 나오는 B의 위치를 반환
SELECT instr('AABAACAABBAA','B',-1,3) from dual;

-- 찾으려는 문자열이 없는 경우 0 을 반환
SELECT instr('AABAACAABBAA','K') from dual;

-- 주민등록번호의 '-'의 위치 '621235-1985634'
SELECT EMP_NO, instr(EMP_NO,'-') from emp;
-- 이메일의 '@'의 위치 'sun_di@or.kr'
SELECT EMAIL, instr(EMAIL,'@') from emp;

SELECT EMP_NO, instr(EMP_NO,'-'), EMAIL, instr(EMAIL,'@') from emp;

/*
    3) SUBSTR
        - SUBSTR(컬럼|'문자값', POSITION[, LENGTH])
        - 문자데이터에서 지정한 위치부터 지정한 개수만큼의 문자열을 추출해서 반환한다.

    SUBSTR(컬럼명, 시작위치, 글자수)
*/ 

SELECT SUBSTR('show me the money', 7)
from dual;

SELECT SUBSTR('show me the money', 6, 2)
from dual;

SELECT SUBSTR('show me the money', -9, 3)
from dual;

-- 0또는 1을 넣으면 첫번째 문자 부터 가지고 나옴
SELECT SUBSTR('쇼우 미 더 머니', 1, 2)
from dual;

-- 사원테이블의 이메일 컬럼에서 이메일 아이디와 도메인 추출을 추출 해보세요
-- sun_di@or.kr  ->  아이디@도메인
-- 1) INSTR함수를 이용해서 @의 위치를 확인
-- 2) SUBSTR함수를 이용해서 문자열을 추출(시작위치, 문자의 갯수)
SELECT SUBSTR(EMAIL,0, INSTR(EMAIL,'@')-1) 아이디, SUBSTR(EMAIL, INSTR(EMAIL,'@')+1) 도메인 FROM EMP;

-- 사원 테이블의 주민등록 번호의 뒷번호 1번째 자리까지 추출
SELECT SUBSTR(EMP_NO, 1, INSTR(EMP_NO,'-')+1) || '******' 주민번호 FROM EMP;

-- 사원 테이블의 주민등록 번호의 뒷번호 1번째 자리 추출
SELECT '******-' || SUBSTR(EMP_NO, INSTR(EMP_NO,'-')+1, 1) || '******' 주민번호 FROM EMP;

-- 사원테이블에서 여자사원의 모든컬럼을 조회 하세요
SELECT *
FROM EMP
-- WHERE SUBSTR(EMP_NO,8,1) IN (2,4);
-- WHERE SUBSTR(EMP_NO,INSTR(EMP_NO,'-')+1,1) = '2' OR SUBSTR(EMP_NO,INSTR(EMP_NO,'-')+1,1) = '4';
WHERE SUBSTR(EMP_NO,INSTR(EMP_NO,'-')+1,1) IN (2,4);
-- 부서테이블에서 부서코드가 D1, D2, D3인 부서만 조회 하세요
SELECT *
FROM DEPT
-- WHERE DEPT_ID IN ('D1','D2','D3');
WHERE INSTR('D1|D2|D3', DEPT_ID)>0;

-- SELECT INSTR('D1|D2|D3', DEPT_ID) FROM DEPT;

/*
    4) LPAD/RPAD
        - 
        - 제시된 값에 임의의 문자를 왼쪽 또는 오른쪽에
          붙여 최종 N길이 만큼 문자열을 반환 한다.
        - 문자를 통일감 있게 표시하고자 할 때 사용
*/
-- 20만큼의 길이중 email은 오른쪽으로 정렬하고 공백을 왼쪽으로 채운다
-- 왼쪽을 공백으로 채워줌
SELECT EMAIL, LPAD(EMAIL, 20)
FROM EMP;

-- 오른쪽을 공백으로 채워줌
SELECT EMAIL, RPAD(EMAIL, 2)
FROM EMP;

-- 길이가 짧으면 지정된 자릿수만큼만 출력
SELECT EMAIL, LPAD(EMAIL,20,'*'), RPAD(EMAIL,20,'$'), RPAD(EMAIL,2)
FROM EMP;

-- 사원테이블에서 주민등록번호의 뒤1자리까지 추출하고 오른쪽에 *문자를 채워서 출력
SELECT EMP_NO, RPAD(SUBSTR(EMP_NO, 1,INSTR(EMP_NO,'-')+1),14,'*')
FROM EMP;