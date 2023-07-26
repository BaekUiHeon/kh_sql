insert into tb_class_type values('01','전공필수'); --1번
insert into tb_class_type values('02','전공선택');
insert into tb_class_type values('03','교양필수');
insert into tb_class_type values('04','교양선택');
insert into tb_class_type values('05','논문지도');

select * from tb_class_type;

create table tb_학생일반정보 as
(select student_no 학번,student_name 학생이름, student_address 주소 from tb_student); --2번


create table tb_국어국문학과 as --3번
    (select student_no 학번, student_name 학생이름, 
    extract(year from to_date(substr(student_ssn,1,6),'rrmmdd')) 출생년도,
        professor_name 교수이름
        from tb_student s
        join tb_professor on(COACH_PROFESSOR_NO=professor_no)
        where s.department_no='001'
    );
    
select * from tb_국어국문학과;

update tb_department  --4번
set capacity = round(capacity*1.1,0);

update tb_student --5번
set student_address='서울시 종로구 숭인동 181-21'
where student_no='A413042';

update tb_student --6번
set student_ssn = concat(substr(student_ssn,1,7),'*******');
set student_ssn = concat(substr(student_ssn,1,7),lpad('*','7','*')); --2번쨰 방법 

select * from tb_student;

update tb_grade --7번
set point=3.5
where 
class_no=
    (select class_no from tb_class
    where class_name='피부생리학')
    and
student_no=
    (select student_no from tb_student
    where student_name='김명훈' and department_no=(select department_no from tb_department where department_name='의학과')
    );
    
update tb_grade  --8번
set point=null
where student_no in(select student_no from tb_student where ABSENCE_YN='Y');

select * from tb_grade join tb_student using (student_no) --8번
where absence_yn='Y';
    