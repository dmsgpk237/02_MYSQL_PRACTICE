
-- EMPLOYEE 테이블에서 JOB_CODE별 평균 급여를 조회하시오.

    select
        job_code,
        avg(salary)
    from
        employee
    group by job_code;

-- EMPLOYEE 테이블에서 SAL_LEVEL별 최소 급여를 조회하시오.

    select
        sal_level,
        min(salary)
    from
        employee
    group by sal_level;


-- EMPLOYEE 테이블에서 DEPT_CODE별 직원 수를 조회하되, 직원 수가 3명 이상인 부서만 조회하시오.

    select
        dept_code,
        count(job_code)
    from
        employee
    group by dept_code
    having count(job_code) >= 3;

-- EMPLOYEE 테이블에서 JOB_CODE별 평균 급여를 조회하되, 평균 급여가 4000000 이상인 직급만 조회하시오.

-- 이건 내가 처음에 쓴 거
    select
        job_code,
        avg(salary)
    from
        employee
    group by job_code
    order by
        job_code asc,
        avg(salary) >= 4000000;

-- -----------------------------------------
-- 이건 다시 작성해서 된 것.
    select
        job_code,
        avg(salary)
    from
        employee
    group by job_code
    having
        avg(salary) >= 4000000;

-- EMPLOYEE 테이블에서 DEPT_CODE와 JOB_CODE별 총 급여와 각 DEPT_CODE별 총 급여를 ROLLUP을 사용하여 조회하시오.

-- 강사님이 다시 알려주셨음
-- 이 쿼리 안에서의 rollup 기능은 dept_code와 job 코드를 그룹화 한 것에 경우의 수를 다 더한 것을 보여준다.
-- dept_ 1 job_ 1 , dept_ 1 job_ 2 => 이거 2개 다 합친 값을 보여줌

    select
        dept_code,
        job_code,
        count(*),
        sum(salary)
    from
        employee
    group by
        dept_code,
        job_code
    with rollup;
