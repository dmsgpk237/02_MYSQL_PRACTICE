
-- EMPLOYEE 테이블에서 '해외영업1부'에 속한 모든 직원의 이름, 직급, 급여를 조회하시오.

    select
        emp_name 이름,
        job_code 직급,
        dept_code 부서코드,
        salary 급여
    from
        employee
    where
        dept_code in (
            select
                dept_code
            from
                employee
            where
                dept_code in ('D5')
              );


-- 강사님 답
    SELECT EMP_NAME, JOB_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = (
        SELECT DEPT_ID
        FROM DEPARTMENT
        WHERE DEPT_TITLE = '해외영업1부'
    );
-- >> 서브쿼리는 다른 위치에 있는 칼럼을 가지고 올 수 있구나, 아이가릿


-- EMPLOYEE 테이블에서 모든 직원의 평균 급여보다 높은 급여를 받는 직원의 이름과 급여를 조회하시오.

-- 모든 직원의 평균 급여 3047662.6087
    select
        avg(salary)
    from
        employee;

-- --------------------------

    select
        emp_name,
        salary
    from
        employee
    where salary > all (
        select
            avg(salary)
        from
            employee
              );
-- > all을 안 써도 결과 값이 나온다.


-- EMPLOYEE 테이블에서 각 부서의 평균 급여보다 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

-- 각 부서의 평균 급여를 먼저 구해보자
    select
        dept_code,
        avg(salary)
    from
        employee
    group by dept_code
    order by dept_code asc;

-- --------------------------

    select -- 보여줘
        a.emp_name, -- 이름이랑
        b.dept_title, -- 부서명이랑
        a.salary -- 월급을
    from -- 어디서
        employee a -- 임플로이에서
            join department b -- 근데 디팔트먼트를 조인해서
                      on a.dept_code = b.dept_id -- 어떤 걸 기준으로 하냐면, a.코드와 b.아이디를 기준으로
    where a.salary > ( -- 근데 이 조건에 맞는, 월급보다 큰
        select avg(salary) -- 보여줘 평균 월급
        from employee b-- 어디서, 임플로이에서
        where b.dept_code = a.dept_code -- 이 조건에 맞는, dept_code 와 a.dept_code 를 비교해서 같은 애들만 조건에 성립
        -- (?) 이게 이해가 안 감
        )
    order by emp_name; -- 이름순으로 순차 정렬해줘


-- 상관서브쿼리문제
-- EMPLOYEE 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

    select
        a.emp_name,
        b.dept_title,
        a.salary
    from
        employee a
    join department b
        on a.dept_code = b.dept_id
    where a.salary >= (
        select max(salary)
        from employee b
        where b.dept_code = a.dept_code
        )
    order by emp_name;


-- EMPLOYEE 테이블에서 각 직급별 평균 급여보다 높은 급여를 받는 직원의 이름, 직급, 급여를 조회하시오.

    select
        a.emp_name,
        a.salary,
        b.job_code
    from
        employee a
    join job b
        on a.job_code = b.job_code
    where a.salary > (
            select avg(salary)
            from
                employee
            where a.job_code = b.job_code
             );

    SELECT
        E.EMP_NAME, J.JOB_NAME, E.SALARY
    FROM
        EMPLOYEE E
             JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
    WHERE
        E.SALARY > (
        SELECT AVG(SALARY)
        FROM EMPLOYEE
        WHERE JOB_CODE = E.JOB_CODE

-- EXISTS 절 문제
-- DEPARTMENT 테이블에서 직원이 있는 부서의 부서명을 조회하시오.

#     SELECT D.DEPT_TITLE
#     FROM DEPARTMENT D
#     WHERE EXISTS (
#         SELECT 1
#         FROM EMPLOYEE E
#         WHERE E.DEPT_CODE = D.DEPT_ID
#     );

-- EMPLOYEE 테이블에서 급여가 가장 높은 직원의 이름과 급여를 조회하시오. (NOT EXISTS 사용)

-- CTE 문제
-- EMPLOYEE 테이블에서 각 부서별 평균 급여를 계산하고,
-- 평균 급여가 4000000 이상인 부서의 부서명과 평균 급여를 조회하시오.
