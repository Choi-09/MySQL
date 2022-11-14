use 221108EX;

CREATE TABLE DEPT (
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);

CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

CREATE TABLE SALGRADE ( 
    GRADE TINYINT,
    LOSAL SMALLINT,
    HISAL SMALLINT 
);

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

select * from dept;

desc 221108ex.dept;
desc 221108ex.emp;

-- 1. where 조건 연산자 -- 
select * from emp where sal >=2500;

select * from emp where ename = 'KING';

select empno,ename from emp where ename like '%T%';
select empno, ename from emp where ename not like '%T%';

select empno, ename, comm from emp where comm = 300 or comm = 500 or comm = 1400;
select empno, ename, comm from emp  where comm in (300, 500, 1400);

-- between A and B : A,B를 포함시킨다
select empno, ename, sal from emp where sal between 1200 and 3500;
select empno, ename, sal from emp where sal not between 1200 and 3700;

select ename, empno, job, deptno from emp where deptno = 30 and job = 'MANAGER';

select empno, ename, deptno from emp where not deptno = 30;
select empno, ename, deptno from emp where deptno != 30;

select empno, ename, comm from emp where comm not in (300, 500, 1400);

select ename, job from emp where MGR is null;

-- 2: 두번째 컬럼, desc : 내림차순
select deptno, avg(sal) as '평균급여' from emp group by deptno order by 2 desc;

select deptno, count(*), count(comm) from emp group by deptno;

select deptno, max(sal),min(sal), avg(sal) from emp group by deptno order by 4 desc;

-- having은 group by절에서 생성된 결과값 중 원하는 조건에 부합하는 자료만 추출
select deptno, avg(sal) from emp group by deptno having avg(sal) >=2000;

select deptno, avg(sal) from emp where sal >= 1000 group by deptno having avg(sal) >=2000;

-- 급여가 높은 순으로 조회하되 급여가 같은 경우 이름의 철자가 빠른 사원 순으로 사번, 이름,월급여 조회
select empno, ename, sal from emp order by sal desc, ename asc;

-- 2. JOIN --
select ename, dname from emp,dept where emp.deptno = dept.deptno;  -- where 이하 조인조건
select e.ename, d.dname from emp e, dept D where e.deptno = d.deptno; -- alias

	-- 세 가지 모두 join 방식. 첫번째는 alia를 사용하지 않음. 세번째가 기본적으로 많이 씀.  
    -- inner join은 생략가능. 생략하면 inner join이다. 
select ename, dname from emp, dept where emp.deptno = deptdeptno;
select e.ename, d.dname from emp e, dept D where e.deptno = d.deptno;
select e.ename, m.ename from emp e inner join emp m on e.mgr = m.empno;

select * from  emp;

select e.ename, m.ename from emp e, emp m where e.mgr = m.empno;

select e.ename, d.dname from dept d left join emp e on d.deptno = e.deptno;
select e.ename, d.dname from dept d inner join emp e on d.deptno = e.deptno; 

select ename, comm, dname, loc from emp, dept where emp.deptno = dept.deptno and emp.comm is not null and emp.comm<>0; 

-- 3. 서브쿼리 --

select dname from dept where deptno = (select deptno from emp where ename = 'JONES');

select empno, ename, sal from emp where sal > (select avg(sal) from emp) order by sal desc;

-- q) 1) 부서번호가 10인사원중에서 최대급여를 받는 사원과 2) 동일한 급여를 받는 사원의 사원번호, 이름 조회
select empno, ename from emp where sal = (select max(sal) from emp where deptno = 10);

