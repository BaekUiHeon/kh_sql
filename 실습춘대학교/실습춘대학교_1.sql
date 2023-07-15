select department_name 학과명,category 계열 from tb_department;  --1번

select department_name||'의 정원은',capacity||'명 입니다' from tb_department; --2번

select student_name from tb_student
where department_no ='001' and  absence_yn='Y' and substr(student_ssn,8,1)='2';--3번

select student_name from tb_student
where student_no in('A513079','A513090','A513091','A513110','A513119');--4번

select department_name, category from tb_department--5번
where capacity between 20 and 30;

select professor_name from tb_professor --6번
where department_no is null;

select student_no,student_name from tb_student
where department_no not null; --7번

select class_no from tb_class
where preattending_class_no is not null; --8번

select distinct category from tb_department; --9번

select student_no, student_name,student_ssn from tb_student --10번
where substr(student_address,1,2)='전주' and extract(year from entrance_date)='2002' and absence_yn='N'; 
;





