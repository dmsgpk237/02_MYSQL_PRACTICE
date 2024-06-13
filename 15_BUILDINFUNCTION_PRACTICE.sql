-- EMPLOYEE 테이블에서 각 직원의 이메일 주소에서 도메인 부분을 추출하여 출력하시오.

    select
        emp_name,
        substring_index(email, '@', -1)
    from employee;

-- EMPLOYEE 테이블에서 각 직원의 급여에서 10%를 감한 후, 이를 소수점 둘째 자리에서 반올림하여 출력하시오

    select
        emp_name,
        format((salary * 0.9), 2)
    from employee;

-- EMPLOYEE 테이블에서 각 부서의 평균 급여를 계산하고, 그 값을 '부서별 평균 급여는 X 원입니다' 형식의 문자열로 출력하시오.

    select
        dept_code,
        concat('부서별 평균 급여는 <', avg(salary), '원> 입니다.')
    from
        employee
    group by dept_code
    order by dept_code asc;


-- EMPLOYEE 테이블에서 각 직원의 입사 연도, 입사 월, 입사 일을 각각 조회하시오.

    select
        emp_id,
        emp_name,
        hire_date
    from
        employee;

-- EMPLOYEE 테이블에서 입사일이 2010년 1월 1일 이후인 직원들의 이름과 입사일을 조회하시오.

    select
        emp_id,
        emp_name,
        hire_date
    from
        employee
    where HIRE_DATE >= '2010-01-01'
    order by HIRE_DATE;