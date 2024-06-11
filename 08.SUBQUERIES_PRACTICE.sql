
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
-- 모르겠음 못 풀었음, 답이 이상하게 나옴

    select
        emp_name,
        dept_code,
        salary
    from
        employee
    where
        salary > all(
        select
            avg(salary)
        from
            employee)
    order by dept_code asc;

    select
        a.emp_name,
        b.dept_title
    from
        employee a
            left join department b
                      on a.dept_code = b.dept_id
    order by emp_name;


-- 상관서브쿼리문제
-- EMPLOYEE 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

    select
        a.emp_name,
        b.dept_title,
        a.salary
    from
        employee a
    join department b
    where
        exists(
            select
                emp_name,
                dept_title,
                salary
            from
                department
        );

    select
        a.emp_name,
        b.dept_title,
        a.salary
    from
        employee a, -- 이 테이블을
        department b
    where salary >= (
        select
            max(salary)
        from
            employee
        where
            salary = a.salary -- 여기서 가져다 쓴다.
    );



    select
        a.emp_name,
        b.dept_title
    from
        employee a
            left join department b
                      on a.dept_code = b.dept_id
    order by emp_name;


-- EMPLOYEE 테이블에서 각 직급별 평균 급여보다 높은 급여를 받는 직원의 이름, 직급, 급여를 조회하시오.



-- EXISTS 절 문제
-- DEPARTMENT 테이블에서 직원이 있는 부서의 부서명을 조회하시오.


-- EMPLOYEE 테이블에서 급여가 가장 높은 직원의 이름과 급여를 조회하시오. (NOT EXISTS 사용)


-- CTE 문제
-- EMPLOYEE 테이블에서 각 부서별 평균 급여를 계산하고,
-- 평균 급여가 4000000 이상인 부서의 부서명과 평균 급여를 조회하시오.
