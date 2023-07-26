select * from job; --1��

select job_name from job; --2��

select * from department; --3��

select * from employee;

select emp_name,email,phone,hire_date from employee; --4��

select hire_date,emp_name,salary from employee; --5��

select emp_name dlfma,salary*12 ����,salary*(12)*(1+nvl(bonus,0)) "�Ѽ��ɾ�(���ʽ�����)" --6��
,salary*(12)*(1+nvl(bonus,0))*0.97 �Ǽ��ɾ� from employee;

select emp_name,salary,hire_date,phone from employee --7��
    where sal_level='S1';

select emp_name,salary,salary*(12)*(1+nvl(bonus,0))*0.97 �Ǽ��ɾ�,hire_date --8��
    from employee
    where salary*(12)*(1+nvl(bonus,0))*0.97 >50000000;

select * from employee --9��
where salary>4000000 and job_code='J2';

select emp_name,dept_code,hire_date from employee --10��
where hire_date<'020101' and dept_code in('D5','D9');

select * from employee --11��
where hire_date between '900101' and '010101'; 

select * from employee --12��
where emp_name like('%��');

select emp_name,phone from employee --13��
where phone not like('010%');

select * from employee --14��
where email like('____#_%') escape '#' and dept_code in('D9','D6')
and hire_date between '900101' and '001201' and salary>=2700000;

select emp_name,substr(emp_no,1,2) �⵵, --15��
substr(emp_no,3,2) ��,
substr(emp_no,5,2) ��
from employee;

select emp_name,rpad(substr(emp_no,1,7),14,'*') from employee; --16��

select emp_name,round(abs(hire_date-sysdate),0) �ٹ��ϼ�1, --17��
        round(abs(sysdate-hire_date),0) �ٹ��ϼ�2 from employee;
        
select * from employee --18��
where  mod(emp_id,2)=1;

select * from employee --19��
where (sysdate-hire_date)/365>20;

select emp_name �����,to_char(salary,'L9,999,999') �޿� from employee; --20��

select emp_name, dept_code, substr(emp_no,1,2)||'��' ||substr(emp_no,3,2)||'��' || --21��
substr(emp_no,5,2)||'��' ������� from employee;

select emp_id,emp_name,dept_code,decode(dept_code,'D5','�ѹ���','D6','��ȹ��','D9','������') --22��
    from employee
    where dept_code in('D5','D6','D9')
    order by dept_code;
    
select emp_name,substr(emp_no,1,6),substr(emp_no,8,14),substr(emp_no,1,6)+substr(emp_no,8,14) --23��
from employee
where emp_id='201';


select sum(salary*12*(1+nvl(bonus,0))) --24��
from employee
where dept_code='D5'
group by dept_code;


select count(*), count(case when substr(hire_date,1,2)='01' then 1 end) as "2001",
                 count(case when substr(hire_date,1,2)='02' then 1 end) as "2002",
                 count(case when substr(hire_date,1,2)='03' then 1 end) as "2003",
                 count(case when substr(hire_date,1,2)='04' then 1 end) as "2004"
                 from employee;
                 
                 
 



select * from user_tables;



















    





