--춘 대학교 워크북 과제
--SQL01_SELECT(Basic)

-- 1번
-- 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"으로 표시하도록 한다.
SELECT  DEPARTMENT_NAME "학과 명"
        , CATEGORY  "계열"
FROM    TB_DEPARTMENT;

-- 2번
-- 학과의 학과 정원을 다음과같은 형태로 화면에 출력한다.
-- 00학과의 정원은 00명입니다.
SELECT  DEPARTMENT_NAME || '학과의 정원은 ' || CAPACITY || '명입니다.' "학과의 정원"
FROM    TB_DEPARTMENT;

-- 3번
-- "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이 들어왔다. 누구인가?
-- (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)
SELECT  STUDENT_NAME
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = (
        SELECT  DEPARTMENT_NO
        FROM    TB_DEPARTMENT
        WHERE   DEPARTMENT_NAME = '국어국문학과'   
)
AND     SUBSTR(STUDENT_SSN, 8, 1) IN ('2','4')
AND     ABSENCE_YN = 'Y';

-- JOIN을 이용하는 경우
SELECT  STUDENT_NAME
FROM    TB_STUDENT
JOIN    TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE   DEPARTMENT_NAME = '국어국문학과'
AND     SUBSTR(STUDENT_SSN, 8, 1) IN ('2','4')
AND     ABSENCE_YN = 'Y';



-- 4번 
-- 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시하고자 한다.
-- 그 대상자들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL구문을 작성하시오.
-- A513079, A513090, A513091, A513110, A513119
SELECT  STUDENT_NAME
FROM    TB_STUDENT
WHERE   STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');

-- 5번
-- 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오.
SELECT  DEPARTMENT_NAME, CATEGORY
FROM    TB_DEPARTMENT
WHERE   CAPACITY BETWEEN 20 AND 30;

-- 6번
-- 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다.
-- 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.
SELECT  PROFESSOR_NAME
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO IS NULL;

-- 7번
-- 혹시 전상상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다.
-- 어떠한 SQL문장을 사용하면 될 것인지 작성하시오.
-- (SELECT STUDENT_NAME 등도 가능) 
SELECT  STUDENT_NAME
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO IS NULL;

-- 8번
-- 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는 과목들은 어떤 과목인지 과목 번호를 조회해 보시오.
SELECT  CLASS_NO
FROM    TB_CLASS
WHERE   PREATTENDING_CLASS_NO IS NOT NULL;

-- 9번
-- 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해 보시오.
 SELECT DISTINCT CATEGORY
 FROM   TB_DEPARTMENT;

-- 10번
-- 02학번 전주 거주자들의 모임을 만들려고 한다. 
-- 휴학한 사람들은 제외한 재학중인 학생들의 
-- 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.
SELECT  STUDENT_NO, STUDENT_NAME, STUDENT_SSN, STUDENT_ADDRESS
FROM    TB_STUDENT
WHERE   ABSENCE_YN = 'N'
AND     ENTRANCE_DATE BETWEEN '2002/01/01' AND '2002/12/31'
AND     SUBSTR(STUDENT_ADDRESS,1,2) = '전주';

-- T)
SELECT  STUDENT_NO, STUDENT_NAME, STUDENT_SSN, STUDENT_ADDRESS
FROM    TB_STUDENT
WHERE   ABSENCE_YN = 'N'
AND     TO_CHAR (ENTRANCE_DATE, 'YYYY') = 2002
AND     EXTRACT(YEAR FROM EM)
AND     STUDENT_ADDRESS LIKE '%전주%';

--춘 대학교 워크북 과제
--SQL02_SELECT(Function)

-- 1번
-- 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른 순으로 표시하는 SQL문장을 작성하시오.
-- (단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
SELECT  STUDENT_NO      "학번"
        , STUDENT_NAME  "이름"
        , ENTRANCE_DATE "입학년도"
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = (
SELECT  DEPARTMENT_NO
FROM    TB_DEPARTMENT
WHERE   DEPARTMENT_NAME = '영어영문학과'
)
ORDER BY ENTRANCE_DATE;

-- T)
SELECT  STUDENT_NO      "학번"
        , STUDENT_NAME  "이름"
        , ENTRANCE_DATE "입학년도"
FROM    TB_STUDENT S, TB_DEPARTMENT D
WHERE   S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     DEPARTMENT_NAME = '영어영문학과'
ORDER BY ENTRANCE_DATE;

-- 2번
-- 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다.
-- 그 교수의 이름과 주민번호를 화면에 출력하는 SQL문장을 작성해보자.
-- (*이때 올바르게 작성한 SQL 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇인지 생각해볼 것) 
SELECT  PROFESSOR_NAME, PROFESSOR_SSN
FROM    TB_PROFESSOR
WHERE   NOT LENGTH(PROFESSOR_NAME) = 3;

-- T)
SELECT  PROFESSOR_NAME, LENGTH(PROFESSOR_NAME)
FROM    TB_PROFESSOR
WHERE   NOT LENGTH(PROFESSOR_NAME) = 3;

SELECT  PROFESSOR_NAME, LENGTH(PROFESSOR_NAME)
FROM    TB_PROFESSOR
WHERE   PROFESSOR_NAME NOT LIKE '___';


-- 3번
-- 춘 기술대학교의 남자 교수들의 이름을 출력하는 SQL 문장을 작성하시오. 단 이때 나이가 적은 사람에서 많은 사람 순서
-- (나이가 같다면 이름의 가나다 순서)로 화면에 출력되도록 만드시오.
-- (단, 교수 중 2000년 이후 출생자는 없으며 출력 헤더는 "교수이름"으로 한다. 나이는 '만'으로 계산한다.)
-- 실행 월에 따라 결과 값 다를 수 있으므로 PROFESSOR_SSN 같이 SELECT 해서 확인해보기!!
SELECT  PROFESSOR_NAME "교수이름"
FROM    TB_PROFESSOR
WHERE   SUBSTR(PROFESSOR_SSN,8,1) IN ('1','3')
ORDER BY SUBSTR(PROFESSOR_SSN,1,2) DESC
        , PROFESSOR_NAME;

-- T)
SELECT  PROFESSOR_NAME "교수이름", TO_CHAR(SYSDATE, 'YYYY') - ('19' || SUBSTR(PROFESSOR_SSN,1,2))+1 "나이"
FROM    TB_PROFESSOR
WHERE   SUBSTR(PROFESSOR_SSN,8,1) IN (1,3)
ORDER BY 나이, 1;

-- 🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔
-- 나이 계산하기 다시확인필요!!!!!!
SELECT  DECODE  (
        SUBSTR(PROFESSOR_SSN,8,1)
        , 1     , 19
        , 2     , 19
        , 3     , 20
        , 4     , 20
) || SUBSTR(PROFESSOR_SSN,1,2) 년도, '19' || SUBSTR(PROFESSOR_SSN,1,2) 년
FROM TB_PROFESSOR;

-- SELECT  TO_DATE(2023,'YYYY'), FLOOR(MONTHS BETWEEN(SYSDATE, TO_DATE(2023,'YYYY'))/12)
-- FROM DUAL;

-- RR : 50보다 크면 이전세기, 작으면 현재 세기
SELECT TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR-MM-DD')
FROM TB_PROFESSOR;

-- 함수를 이용하여 나이 계산하기 / 함수는 제작한거! - 내용확인
SELECT  GET_AGE(STUDENT_SSN)
FROM    TB_STUDENT;

-- 4번
-- 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오. 출력 헤더는 "이름"이 찍히도록 한다.
-- (성이 2자인 경우의 교수는 없다고 가정하시오)
SELECT  SUBSTR(PROFESSOR_NAME,2) "이름"
FROM    TB_PROFESSOR;

-- 5번
-- 춘 기술대학교의 재수생 입학자 학번과 이름을 표시하시오.(이때, 19살에 입학하면 재수를 하지 않은 것으로 간주)
-- 문제에서 요구하는 내용은 현역과 삼수생을 모두 제외한 재수생만 추려내는 것 (삼수생도 포함한 결과는 245행)
-- 0301생인 김정현 학생을 제외시키기 위해 19 초과 20 이하라는 조건식 사용

-- 🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔
-- 나이 계산하기 다시확인필요!!!!!!
SELECT  나이
FROM    (
SELECT  SUBSTR(ENTRANCE_DATE,1,4) - ('19'||SUBSTR(STUDENT_SSN,1,2)) 나이
FROM    TB_STUDENT
WHERE   SUBSTR(STUDENT_SSN,8,1) = '1'
UNION ALL
SELECT  SUBSTR(ENTRANCE_DATE,1,4) - ('20'||SUBSTR(STUDENT_SSN,1,2)) 나이
FROM    TB_STUDENT
WHERE   SUBSTR(STUDENT_SSN,8,1) = '3'
)
WHERE   나이 > 19;

SELECT  AGE
FROM    (
SELECT  SUBSTR(ENTRANCE_DATE,1,4) - (DECODE(SUBSTR(STUDENT_SSN,8,1), 1, 19, 2 , 19, 3, 20, 4, 20) || SUBSTR(STUDENT_SSN,1,2)) AGE
FROM    TB_STUDENT
)
WHERE   AGE > 19;




-- T)

-- 입학년도 - 탄생년도
SELECT  ENTRANCE_DATE
FROM    TB_STUDENT;

-- 다시 확인!
SELECT  SUBSTR(ENTRANCE_DATE,1,4)
FROM    TB_STUDENT;

SELECT  (DECODE(SUBSTR(STUDENT_SSN,8,1), 1, 19, 2 , 19, 3, 20, 4, 20) || SUBSTR(STUDENT_SSN,1,2))
FROM    TB_STUDENT;

SELECT *
FROM (
SELECT  SUBSTR(ENTRANCE_DATE,1,4) - (DECODE(SUBSTR(STUDENT_SSN,8,1), 1, 19, 2 , 19, 3, 20, 4, 20) || SUBSTR(STUDENT_SSN,1,2)) 나이
FROM    TB_STUDENT
)
WHERE 나이>19;

SELECT *
FROM    (
SELECT  ENTRANCE_DATE, GET_AGE(STUDENT_SSN) 나이, TO_CHAR(ENTRANCE_DATE, 'YYYY')
                        - (DECODE(SUBSTR(STUDENT_SSN,8,1), 1, 19, 2 , 19, 3, 20, 4, 20) || SUBSTR(STUDENT_SSN,1,2)) + 1 입학나이
FROM    TB_STUDENT
)
WHERE   입학나이 >= 20;

-- 6번
-- 2024년 크리스마스는 무슨 요일인가?
--'DAY': 금요일 'DY': 금 'D': 6

SELECT  TO_CHAR(TO_DATE('2024/12/15'),'DAY')
FROM    DUAL;


-- 8번
-- 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다. 
-- 2000년도 이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.
SELECT  STUDENT_NO, STUDENT_NAME
FROM    TB_STUDENT
WHERE   NOT SUBSTR(STUDENT_NO,1,1) = 'A';

-- T)

SELECT  STUDENT_NO, STUDENT_NAME
FROM    TB_STUDENT
WHERE   NOT SUBSTR(STUDENT_NO,1,1) LIKE '%A%';


-- 9번
-- 학번이 A517178인 한아름 학생의 학점 총 평점을 구하는 SQL문을 작성하시오.
-- 단, 이때 출력 화면의 헤더는 "평점"이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.
SELECT ROUND((AVG(POINT)),1) "평점"
FROM    (
SELECT  POINT
FROM    TB_STUDENT S, TB_GRADE G
WHERE   S.STUDENT_NO = G.STUDENT_NO
AND     S.STUDENT_NO = 'A517178'
);

-- T)
SELECT ROUND(AVG(POINT),1) "평점"
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A517178';

-- 10번
-- 학과별 학생 수를 구하여 "학과번호", "학생수(명)"의 형태로 헤더를 만들어 결과값이 출력되도록 하시오.

SELECT  DEPARTMENT_NO "학과번호", SUM(DEPARTMENT_NO) "학생수(명)"
FROM    TB_STUDENT
GROUP BY DEPARTMENT_NO;

-- T)
SELECT  DEPARTMENT_NO 학과번호, COUNT(*)||'명' "학생수(명)"
FROM    TB_STUDENT
GROUP BY DEPARTMENT_NO;

-- 11번
-- 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는지 알아내는 SQL문을 작성하시오
SELECT  COUNT(STUDENT_NAME)
FROM    TB_STUDENT
WHERE   COACH_PROFESSOR_NO IS NULL;


-- 12번
-- 학번이 A112113인 김고운 학생의 년도 별 평점을 구하는 SQL문을 작성하시오.
-- 단, 이때 출력화면의 헤더는 "년도", "년도 별 평점"이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.

SELECT  SUBSTR(TERM_NO,1,4) "년도", AVG(POINT) "년도 별 평점"
FROM    TB_STUDENT S, TB_GRADE G
WHERE   S.STUDENT_NO = G.STUDENT_NO
AND     S.STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4);

-- 13번
-- 학과 별 휴학생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL문장을 작성하시오.
-- COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) 의 부연설명
-- 만일 ABSENCE_YN의 값이 'Y'였을 경우 COUNT(1)이 되어 갯수를 세게 되고
--     ABSENCE_YN의 값이 'Y'가 아니였을 경우 COUNT(NULL)이 되어 갯수를 세지 않게되는 원리!!

SELECT  DEPARTMENT_NO, COUNT(DECODE(ABSENCE_YN, 'Y',1,NULL))
FROM    TB_STUDENT
GROUP BY DEPARTMENT_NO;


-- 14번
-- 춘 대학교에 다니는 동명이인 학생들의 이름을 찾고자 한다.
-- 어떤 SQL 문장을 사용하면 가능하겠는가?
SELECT  N, S
FROM (
        SELECT  STUDENT_NAME N, COUNT(STUDENT_NAME) S
        FROM    TB_STUDENT
        GROUP BY STUDENT_NAME      
)
WHERE NOT S = 1;


-- 15번 // 내일수업때!
-- 학번이 A112113인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점, 총 평점을 구하는 SQL문을 작성하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)



--춘 대학교 워크북 과제
--SQL03_SELECT(Option)

-- 1번
-- 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.

SELECT  STUDENT_NAME "학생 이름", STUDENT_ADDRESS "주소지"
FROM    TB_STUDENT
ORDER BY STUDENT_NAME;

-- 2번
-- 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오

SELECT  STUDENT_NAME, STUDENT_SSN
FROM    TB_STUDENT
WHERE   ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;


-- 3번
-- 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오.
-- 단, 출력헤더에는 "학생이름", "학번", "거주지 주소"가 출력되도록 한다.

SELECT  STUDENT_NAME "학생이름", STUDENT_NO "학번", STUDENT_ADDRESS "거주지 주소"
FROM    TB_STUDENT
WHERE   SUBSTR(ENTRANCE_DATE,1,4) BETWEEN 1900 AND 1999
AND     (STUDENT_ADDRESS LIKE '%강원%'
OR      STUDENT_ADDRESS LIKE '%경기%');


-- 4번
-- 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오.
-- (법학과의 '학과 코드'는 학과 테이블을 조회해서 찾아 내도록 하자)

SELECT  PROFESSOR_NAME
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO = (
    SELECT  DEPARTMENT_NO
    FROM    TB_DEPARTMENT
    WHERE   DEPARTMENT_NAME = '법학과'   
)
ORDER BY PROFESSOR_SSN; 





-- 5번 // 이거도 15번과 같은?
-- 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다. 
-- 학점이 높은 학생부터 표시하고,
-- 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해 보시오.
-- 🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔




-- 6번
-- 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL문을 작성하시오.
SELECT  STUDENT_NO, STUDENT_NAME, D.DEPARTMENT_NAME
FROM    TB_STUDENT S, TB_DEPARTMENT D
WHERE   S.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY STUDENT_NAME;

-- ANSI
SELECT  STUDENT_NO, STUDENT_NAME, D.DEPARTMENT_NAME
FROM    TB_STUDENT S
JOIN    TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

-- 7번
-- 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL문장을 작성하시오.
SELECT  C.CLASS_NAME, D.DEPARTMENT_NAME
FROM    TB_CLASS C, TB_DEPARTMENT D
WHERE   C.DEPARTMENT_NO = D.DEPARTMENT_NO;

-- ANSI
SELECT  C.CLASS_NAME, D.DEPARTMENT_NAME
FROM    TB_CLASS C
JOIN    TB_DEPARTMENT D USING (DEPARTMENT_NO);


-- 8번
-- 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL문을 작성하시오.
SELECT  CLASS_NAME, PROFESSOR_NAME
FROM    TB_CLASS_PROFESSOR TCP, TB_CLASS C, TB_PROFESSOR P
WHERE   C.CLASS_NO = TCP.CLASS_NO
AND     P.PROFESSOR_NO = TCP.PROFESSOR_NO;

-- ANSI
SELECT  CLASS_NAME, PROFESSOR_NAME
FROM    TB_CLASS_PROFESSOR TCP
JOIN    TB_CLASS C USING (CLASS_NO)
JOIN    TB_PROFESSOR P USING (PROFESSOR_NO);


-- 9번
-- 8번의 결과 중 '인문 사회' 계열에 속한 과목의 교수 이름을 찾으려고 한다.
-- 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL문을 작성하시오.

SELECT  CLASS_NAME, PROFESSOR_NAME
FROM    TB_CLASS_PROFESSOR TCP, TB_CLASS C, TB_PROFESSOR P, TB_DEPARTMENT D
WHERE   C.CLASS_NO = TCP.CLASS_NO
AND     P.PROFESSOR_NO = TCP.PROFESSOR_NO
AND     P.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     CATEGORY = '인문사회';

-- ANSI / 같은 컬럼명이 3개 중복인경우 JOIN시 에러날 수 있으니 정확하게 명시할것!(3번째JOIN 확인)
SELECT  CLASS_NAME, PROFESSOR_NAME
FROM    TB_CLASS_PROFESSOR TCP
JOIN    TB_CLASS C USING (CLASS_NO)
JOIN    TB_PROFESSOR P USING (PROFESSOR_NO)
JOIN    TB_DEPARTMENT D ON (P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE   CATEGORY = '인문사회';
                        
-- 10번
-- '음악학과' 학생들의 평점을 구하려고 한다. 
-- 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 출력하는 SQL 문장을 작성하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)

SELECT  SN, S.STUDENT_NAME, AP
FROM (
SELECT  S.STUDENT_NO SN, ROUND(AVG(POINT),1) AP
FROM    TB_STUDENT S, TB_GRADE G, TB_DEPARTMENT D
WHERE   S.STUDENT_NO = G.STUDENT_NO
AND     S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     D.DEPARTMENT_NAME = '음악학과'
GROUP BY S.STUDENT_NO
), TB_STUDENT S
WHERE SN = S.STUDENT_NO;

-- 문제이해를 잘못함 실행은 가능;;; / 각 학과의 평균점수를 학생에게 뿌려주는 형태로 잘못 이해
SELECT  S.STUDENT_NO, S.STUDENT_NAME, "전체 평점"
FROM    (
    SELECT  DEPARTMENT_NAME "학과명", ROUND(AVG(POINT),1) "전체 평점"
    FROM    TB_STUDENT S, TB_DEPARTMENT D, TB_GRADE G
    WHERE   S.DEPARTMENT_NO = D.DEPARTMENT_NO
    AND     S.STUDENT_NO = G.STUDENT_NO
    GROUP BY DEPARTMENT_NAME   
) N, TB_DEPARTMENT D, TB_STUDENT S
WHERE   N."학과명" = D.DEPARTMENT_NAME
AND     D.DEPARTMENT_NO = S.DEPARTMENT_NO;

-- 11번
-- 학번이 A313047인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 전달하기 위한 
-- 학과 이름, 학생 이름과 지도 교수 이름이 필요하다.
-- 이때 사용할 SQL문을 작성하시오.

SELECT  D.DEPARTMENT_NAME, S.STUDENT_NAME, P.PROFESSOR_NAME
FROM    TB_STUDENT S, TB_DEPARTMENT D, TB_PROFESSOR P
WHERE   S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
AND     S.STUDENT_NO = 'A313047';

-- 12번
-- 2007년도에 '인간관계론' 과목을 수강한 학생을 찾아 
-- 학생이름과 수강학기를 표시하는 SQL 문장을 작성하시오.
SELECT  S.STUDENT_NAME, G.TERM_NO
FROM    TB_CLASS C, TB_GRADE G, TB_STUDENT S
WHERE   C.CLASS_NO = G.CLASS_NO
AND     G.STUDENT_NO = S.STUDENT_NO
AND     SUBSTR(G.TERM_NO,1,4) = 2007
AND     C.CLASS_NAME = '인간관계론';

-- 13번
-- 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아 
-- 그 과목 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.
-- 결과 행의 수는 동일하나 정렬 기준이 없어 다른 순서를 보임
-- 🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔
-- 담당교수를 배정받지 못한 과목이무슨말???

SELECT  C.CLASS_NAME, D.DEPARTMENT_NAME
FROM    TB_CLASS C, TB_DEPARTMENT D, TB_CLASS_PROFESSOR CP
WHERE   D.DEPARTMENT_NO = C.DEPARTMENT_NO
AND     C.CLASS_NO = CP.CLASS_NO
AND     D.CATEGORY = '예체능';

-- 14번
-- 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다. 
-- 학생이름과 지도교수 이름을 찾고 만일 지도 교수가 없는 학생일 경우
-- "지도교수 미지정"으로 표시하도록 하는 SQL 문을 작성하시오. 
-- 단 출력헤더는 "학생이름", "지도교수"로 표시하며 고학번 학생이 먼저 표시되도록 한다.
-- 🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔
-- 뭔가 이상..
SELECT  S.STUDENT_NAME, P.PROFESSOR_NAME
FROM    TB_DEPARTMENT D, TB_STUDENT S, TB_PROFESSOR P
WHERE   D.DEPARTMENT_NO = S.DEPARTMENT_NO
AND     D.DEPARTMENT_NO = P.DEPARTMENT_NO(+)
AND     D.DEPARTMENT_NAME = '서반아어학과';

-- 15번
-- 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 
-- 그 학생의 학번, 이름, 학과, 이름, 평점을 출력하는 SQL문을 작성하시오.
SELECT  S.STUDENT_NO, D.DEPARTMENT_NAME, S.STUDENT_NAME, AP
FROM    (
        SELECT  STUDENT_NO SN, ROUND(AVG(POINT),1) AP
        FROM    TB_GRADE
        GROUP BY STUDENT_NO
        ) JOIN1, TB_STUDENT S, TB_DEPARTMENT D
WHERE   JOIN1.SN = S.STUDENT_NO
AND     S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     AP >= 4.0;



-- 16번
-- 환경조경학과 전공과목들의 과목 별 평점을 파악할 수 있는 SQL 문을 작성하시오.
SELECT  JOIN1.CM, ROUND(AVG(POINT),1)
FROM    (
        SELECT  CLASS_NO CN ,CLASS_NAME CM
        FROM    TB_CLASS
        WHERE   DEPARTMENT_NO = (
                SELECT  DEPARTMENT_NO
                FROM    TB_DEPARTMENT
                WHERE   DEPARTMENT_NAME = '환경조경학과'
        )
        ) JOIN1, TB_GRADE G
WHERE   JOIN1.CN = G.CLASS_NO
GROUP BY JOIN1.CM;

-- 17번
-- 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는 SQL 문을 작성하시오.
SELECT  STUDENT_NAME, STUDENT_ADDRESS
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = (
SELECT  DEPARTMENT_NO
FROM    TB_STUDENT
WHERE   STUDENT_NAME = '최경희'
);

-- 18번
-- 국어국문학과에서 총점수가 가장 높은 학생의 이름과 학번을 표시하는 SQL문을 작성하시오
SELECT  *
FROM(
SELECT  S.STUDENT_NO SN, SUM(POINT) SP, S.STUDENT_NAME
FROM    TB_GRADE G, TB_STUDENT S, TB_DEPARTMENT D
WHERE   G.STUDENT_NO = S.STUDENT_NO
AND     S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     DEPARTMENT_NAME = '국어국문학과'
GROUP BY S.STUDENT_NO, S.STUDENT_NAME
ORDER BY SP DESC
) JOIN1
WHERE   JOIN1.SP = (
        SELECT  MAX(SP)
FROM    (
SELECT  S.STUDENT_NO SN, SUM(POINT) SP, S.DEPARTMENT_NO
FROM    TB_GRADE G, TB_STUDENT S, TB_DEPARTMENT D
WHERE   G.STUDENT_NO = S.STUDENT_NO
AND     S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND     DEPARTMENT_NAME = '국어국문학과'
GROUP BY S.STUDENT_NO, S.DEPARTMENT_NO)
);





-- 19번
-- 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 
-- 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL문을 찾아내시오.
-- 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록 하고, 
-- 평점은 소수점 한자리까지만 반올림하여 표시되도록 한다.


