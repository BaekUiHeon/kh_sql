select * from salgrade;
select * from emp;

select empno,ename,job,mgr,hiredate,sal,comm,deptno,grade --1번
    from emp 
    join salgrade on sal between losal and hisal
    order by grade,mgr desc;
    
select empno,ename,job,mgr,hiredate,sal,comm,deptno,grade --2번
    from emp 
    join salgrade on sal between losal and hisal
    where mgr is not null
    order by grade desc,sal asc;
    
    select grade,avg(sal*12+nvl(comm,0)) 평균연봉 from emp --3번
    join salgrade on sal between losal and hisal
    where deptno in('20','30')
    group by grade
    order by grade desc;
    
    select deptno,round(avg(sal*12+nvl(comm,0)),0) 평균연봉 --4번
    from emp
    where deptno in('20','30')
    group by deptno;
    
    select e.empno,e.ename,e.job,e.mgr,m.ename as "manager" --5번
    from emp e left join emp m on e.mgr=m.empno
    order by e.empno asc;
    
    select e.empno, e.ename, e.job, e.mgr,--6번
        (select g.ename 
        from emp g 
        where e.mgr=g.empno) 
        from emp e;
        
    select * from emp --7번
    where sal>(select sal from emp where ename='MARTIN')
                and (deptno=(select deptno from emp where ename='ALLEN')
    or deptno=20);
    
    select e.ename,(select m.ename from emp m where e.mgr=m.empno) --8번
        from emp e 
        where deptno=20;
        
    
    with empg as( select grade,ename,sal --9번
        from emp 
        join salgrade on sal between losal and hisal)
    --emp와 salgrade로 부터 grade,ename,sal을 추출함
    
    select grade,ename from empg g1  --grade 와 ename을 추출하는데
    join (select min(sal) minsal from empg -- min(sal)이 sal과 일치할때만 조인한것으로 부터 추출함.
          group by grade)
          on minsal=g1.sal;
          
    
     with empg as( select grade,ename,sal --10번
        from emp 
        join salgrade on sal between losal and hisal)
    
    select grade,min(sal),max(sal),round(avg(sal),2) from empg
    group by grade;
    
      
      with empg as( select grade,ename,sal --11번
        from emp 
        join salgrade on sal between losal and hisal)
        
      select grade,ename from empg 
      join (select grade,avg(sal) as "평균"
            from empg
            group by grade) using (grade)
      where sal between 평균*0.9 and 평균*1.1;
      
      select empno,ename,sal, --12번
            (case when loc='NEW YORK' then sal*1.02
                  when loc='DALLAS' then sal*1.05
                  when loc='CHICAGO' then sal*1.03
                  when loc='BOSTON' then sal*1.07
                  end) sal_subsidy
            from emp join dept using(deptno)
            order by (case when loc='NEW YORK' then sal*0.02
                  when loc='DALLAS' then sal*0.05
                  when loc='CHICAGO' then sal*0.03
                  when loc='BOSTON' then sal*0.07
                  end) desc;
        
      
    
    
    
          
          
          
        

    
    

    
    
    
   
    

