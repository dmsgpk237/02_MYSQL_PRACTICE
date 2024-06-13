-- 1. 영어영문학과(학과코드 `002`) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른순으로 표시하는 SQL 문장을 작성하시오.
    -- ( 단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)

    select
        tb_student.STUDENT_NO,
        tb_student.STUDENT_NAME,
        tb_student.ENTRANCE_DATE
    from
        tb_student
    where
        DEPARTMENT_NO = 2
    order by ENTRANCE_DATE asc;


-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다.
    -- 그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자.

    select
        tb_professor.PROFESSOR_NAME,
        tb_professor.PROFESSOR_SSN
    from
        tb_professor
    where
        length(PROFESSOR_NAME) != length('세글자');


-- 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오.
    -- 단 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오.
    -- (단, 교수 중 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 한다. 나이는 ‘만’으로 계산한다.)

    select
        tb_professor.PROFESSOR_NAME 교수이름,
        right(2024 - left(PROFESSOR_SSN, 2), 2) 나이
    -- 2024 - 주민번호 앞자리 2개 = 19__ , 여기서 앞에 19를 삭제해줌
    from
        tb_professor
    order by PROFESSOR_SSN desc;


-- 4. 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오.
    -- 출력 헤더는’이름’ 이 찍히도록 핚다. (성이 2 자인 경우는 교수는 없다고 가정하시오)

    select
        substring(PROFESSOR_NAME, 2, 4)
    from
        tb_professor;

-- 5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가?
    -- 이때, 만 19살이 되는 해에 입학하면 재수를 하지 않은 것으로 간주한다.

    select
        tb_student.STUDENT_NO,
        tb_student.STUDENT_NAME
    from
        tb_student
    where
        substring((left(ENTRANCE_DATE, 4)) - (left(STUDENT_SSN, 2)), 3) > 19;
    -- 입학년도 - 주민번호 앞자리 2개 = 19__ , 여기서 앞 2개 빼주고 19 이상 조건을 주면 됨


-- 6. 2020년 크리스마스는 무슨 요일이었는가?

    /* 도저히 모르겠습니다 넘어가겠습니다. */


-- 7. STR_TO_DATE('99/10/11', '%y/%m/%d') STR_TO_DATE('49/10/11', '%y/%m/%d')은
    -- 각각 몇 년 몇 월 몇 일을 의미할까? 또 STR_TO_DATE('70/10/11', '%y/%m/%d')
    -- STR_TO_DATE('69/10/11', '%y/%m/%d') 은 각각 몇 년 몇 월 몇 일을 의미할까?



-- 8. 학번이 A517178 인 한아름 학생의 학점 총 평점을 구하는 SQL 문을 작성하시오.
    -- 단, 이때 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.



-- 9. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 만들어 결과값이 출력되도록 하시오.



-- 10. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는 알아내는 SQL 문을 작성하시오.



-- 11. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오.
    -- 단, 이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고,
    -- 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.



-- 12. 학과 별 휴학생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을 작성하시오.



-- 13. 춘 대학교에 다니는 동명이인(同名異人) 학생들의 이름을 찾고자 한다. 어떤 SQL 문장을 사용하면 가능하겠는가?



-- 14. 학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 ,
    -- 총평점을 구하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지만 반올림하여 표시한다.



