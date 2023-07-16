select * from employee;
select * from department;
select * from job;
select * from location;

select emp_name,emp_no,dept_title,job_name --1��
from (select emp_name,emp_no,dept_code,job_code from employee
      where emp_name like('��%')
      and substr(emp_no,8,1)=2
    )
     join department on dept_code=dept_id 
     join job using(job_code);
     

select  rownum,emp_id, emp_name, --2��
        extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2),'rr')) ����, 
        dept_title, job_name 
        from (
        select emp_id,emp_name,emp_no,dept_code,job_code 
        from employee
        order by extract(year from sysdate)- extract(year from to_date(substr(emp_no,1,2),'rr'))
        )
        join department on dept_code=dept_id
        join job using (job_code)
        where rownum = 1;
        
select emp_id, emp_name, job_name from --3��
    (select emp_id, emp_name,job_code from employee
    where emp_name like('%��%'))
    join job using(job_code);

select emp_name, job_name, dept_id, dept_title   --4��
    from (select emp_name,dept_code,job_code from employee
          where dept_code in('D5','D6')) emp 
    join department on dept_code=dept_id
    join job using (job_code);
    
select emp_name,bonus,dept_title,local_name -- 5��
    from employee
    join department on dept_code=dept_id
    join location on local_code=location_id
    where nvl(bonus,0)<>0;
    
select emp_name, job_name, dept_title,local_name --6��
    from employee
    join department on dept_code=dept_id
    join location on local_code=location_id
    join job using (job_code);
    
select emp_name, dept_title, local_name, case national_code --7��
                                         when 'KO' THEN '�ѱ�'
                                         when 'JP' THEN '�Ϻ�'
                                         when 'CH' THEN '�߱�'
                                         when 'US' THEN '�̱�'
                                         when 'RU' THEN '����'
                                         END 
    from employee
    join department on dept_code=dept_id
    join location on (local_code=location_id and local_code in('L1','L2'))
    join job using (job_code);
    
    select e1.emp_name, dept_code, e2.emp_name --8��
    from employee e1 
    join employee e2 using (dept_code)
    where e1.emp_name <> e2.emp_name;
    
    select emp_name, job_name, nvl(salary,0) --9��
    from (select emp_name,job_code,salary 
          from employee
          where job_code in('J4','J7')
          )
    join job using (job_code);
    

    select emp_id, emp_name, dept_title, job_name, hire_date --10��
        from(select emp_id, emp_name, dept_title, job_name, hire_date 
             ,salary*(1+nvl(bonus,0)) ����
             from employee
             join department on dept_code=dept_id
             join job using (job_code)
             order by ���� desc
             )
             where rownum<=5;
             
    select dept_title,sum(salary) -- 11-1,2��
    from employee 
    join department on dept_code=dept_id
    group by dept_title
    having sum(salary) > 0.2 * (select sum(salary) from employee);
    
    
    with allsum as (select sum(salary) as "��ü�޿�" from employee) -- 11-3��
    
    select dept_title,sum(salary)
    from employee
    join department on dept_code=dept_id
    group by dept_title
    having sum(salary) > 0.2 * (select sum(salary) from employee);
    
    select dept_title �μ���,sum(salary) �μ����޿� --12��
    from employee
    left join department on dept_id=dept_code
    group by dept_title;
    

    with sal_avg as (select avg(salary) ��� from employee),
         sal_sum as (select sum(salary) �޿��� from employee)
    select ��� from 
    sal_avg
    union
    select �޿��� from
    sal_sum;
    
    
    
    
        
    