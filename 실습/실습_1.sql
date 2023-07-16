select * from emp 
where comm is not null; --1번

select * from emp 
where comm is null or comm=0; --2번

select * from emp --3번
where mgr is null; 

select * from emp  --4번
order by sal desc; 

select * from emp --5번
order by sal desc,comm desc;

select empno,ename,job,hiredate from emp --6번
order by hiredate;

select empno,ename from emp--7번
order by empno desc;

select empno,hiredate,ename,sal from emp 
order by deptno asc, hiredate desc; 

select sysdate from dual;--9번

select empno,ename,trunc(sal,-2) from emp;--10번

select * from emp --11번
where mod(empno,2)=1;

select ename,extract(year from hiredate) 년도, extract(month from hiredate) 월 from emp; --12번

select * from emp --13번
where extract(month from hiredate)=9;

select * from emp --14번
where extract(year from hiredate)=1981;

select * from emp --15번
where ename like('%E');

select * from emp --16번
where ename like('__R%');

select empno,ename,hiredate,hiredate+ INTERVAL '40' year from emp; --17번

select * from emp --18번
where (sysdate-hiredate)/365 > 38;

select extract(year from sysdate) from dual; --19번










