select * from emp 
where comm is not null; --1��

select * from emp 
where comm is null or comm=0; --2��

select * from emp --3��
where mgr is null; 

select * from emp  --4��
order by sal desc; 

select * from emp --5��
order by sal desc,comm desc;

select empno,ename,job,hiredate from emp --6��
order by hiredate;

select empno,ename from emp--7��
order by empno desc;

select empno,hiredate,ename,sal from emp 
order by deptno asc, hiredate desc; 

select sysdate from dual;--9��

select empno,ename,trunc(sal,-2) from emp;--10��

select * from emp --11��
where mod(empno,2)=1;

select ename,extract(year from hiredate) �⵵, extract(month from hiredate) �� from emp; --12��

select * from emp --13��
where extract(month from hiredate)=9;

select * from emp --14��
where extract(year from hiredate)=1981;

select * from emp --15��
where ename like('%E');

select * from emp --16��
where ename like('__R%');

select empno,ename,hiredate,hiredate+ INTERVAL '40' year from emp; --17��

select * from emp --18��
where (sysdate-hiredate)/365 > 38;

select extract(year from sysdate) from dual; --19��










