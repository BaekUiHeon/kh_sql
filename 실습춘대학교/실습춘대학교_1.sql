select department_name �а���,category �迭 from tb_department;  --1��

select department_name||'�� ������',capacity||'�� �Դϴ�' from tb_department; --2��

select student_name from tb_student
where department_no ='001' and  absence_yn='Y' and substr(student_ssn,8,1)='2';--3��

select student_name from tb_student
where student_no in('A513079','A513090','A513091','A513110','A513119');--4��

select department_name, category from tb_department--5��
where capacity between 20 and 30;

select professor_name from tb_professor --6��
where department_no is null;

select student_no,student_name from tb_student
where department_no not null; --7��

select class_no from tb_class
where preattending_class_no is not null; --8��

select distinct category from tb_department; --9��

select student_no, student_name,student_ssn from tb_student --10��
where substr(student_address,1,2)='����' and extract(year from entrance_date)='2002' and absence_yn='N'; 
;





