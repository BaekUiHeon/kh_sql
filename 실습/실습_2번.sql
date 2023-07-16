select * from job; --1번

select job_name from job; --2번

select * from department; --3번

select * from employee;

select emp_name,email,phone,hire_date from employee; --4번

select hire_date,emp_name,salary from employee; --5번

select emp_name dlfma,salary*12 연봉,salary*(12)*(1+nvl(bonus,0)) "총수령액(보너스포함)" --6번
,salary*(12)*(1+nvl(bonus,0))*0.97 실수령액 from employee;

select emp_name,salary,hire_date,phone from employee --7번
    where sal_level='S1';

select emp_name,salary,salary*(12)*(1+nvl(bonus,0))*0.97 실수령액,hire_date --8번
    from employee
    where salary*(12)*(1+nvl(bonus,0))*0.97 >50000000;

select * from employee --9번
where salary>4000000 and job_code='J2';

select emp_name,dept_code,hire_date from employee --10번
where hire_date<'020101' and dept_code in('D5','D9');

select * from employee --11번
where hire_date between '900101' and '010101'; 

select * from employee --12번
where emp_name like('%연');

select emp_name,phone from employee --13번
where phone not like('010%');

select * from employee --14번
where email like('____#_%') escape '#' and dept_code in('D9','D6')
and hire_date between '900101' and '001201' and salary>=2700000;

select emp_name,substr(emp_no,1,2) 년도, --15번
substr(emp_no,3,2) 월,
substr(emp_no,5,2) 일
from employee;

select emp_name,rpad(substr(emp_no,1,7),14,'*') from employee; --16번

select emp_name,round(abs(hire_date-sysdate),0) 근무일수1, --17번
        round(abs(sysdate-hire_date),0) 근무일수2 from employee;
        
select * from employee --18번
where  mod(emp_id,2)=1;

select * from employee --19번
where (sysdate-hire_date)/365>20;

select emp_name 사원명,to_char(salary,'L9,999,999') 급여 from employee; --20번

select emp_name, dept_code, substr(emp_no,1,2)||'년' ||substr(emp_no,3,2)||'월' || --21번
substr(emp_no,5,2)||'일' 생년월일 from employee;

select emp_id,emp_name,dept_code,decode(dept_code,'D5','총무부','D6','기획부','D9','영업부') --22번
    from employee
    where dept_code in('D5','D6','D9')
    order by dept_code;
    
select emp_name,substr(emp_no,1,6),substr(emp_no,8,14),substr(emp_no,1,6)+substr(emp_no,8,14) --23번
from employee
where emp_id='201';


select sum(salary*12*(1+nvl(bonus,0))) --24번
from employee
where dept_code='D5'
group by dept_code;


select count(*), count(case when substr(hire_date,1,2)='01' then 1 end) as "2001",
                 count(case when substr(hire_date,1,2)='02' then 1 end) as "2002",
                 count(case when substr(hire_date,1,2)='03' then 1 end) as "2003",
                 count(case when substr(hire_date,1,2)='04' then 1 end) as "2004"
                 from employee;
                 
                 
 























    





