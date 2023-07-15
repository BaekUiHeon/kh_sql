insert into tb_class_type values('01','�����ʼ�'); --1��
insert into tb_class_type values('02','��������');
insert into tb_class_type values('03','�����ʼ�');
insert into tb_class_type values('04','���缱��');
insert into tb_class_type values('05','������');

select * from tb_class_type;

create table tb_�л��Ϲ����� as
(select student_no �й�,student_name �л��̸�, student_address �ּ� from tb_student); --2��


create table tb_������а� as --3��
    (select student_no �й�, student_name �л��̸�, 
    extract(year from to_date(substr(student_ssn,1,6),'rrmmdd')) ����⵵,
        professor_name �����̸�
        from tb_student s
        join tb_professor on(COACH_PROFESSOR_NO=professor_no)
        where s.department_no='001'
    );
    
select * from tb_������а�;

update tb_department  --4��
set capacity = round(capacity*1.1,0);

update tb_student --5��
set student_address='����� ���α� ���ε� 181-21'
where student_no='A413042';

update tb_student --6��
set student_ssn = concat(substr(student_ssn,1,7),'*******');
set student_ssn = concat(substr(student_ssn,1,7),lpad('*','7','*')); --2���� ��� 

select * from tb_student;

update tb_grade --7��
set point=3.5
where 
class_no=
    (select class_no from tb_class
    where class_name='�Ǻλ�����')
    and
student_no=
    (select student_no from tb_student
    where student_name='�����' and department_no=(select department_no from tb_department where department_name='���а�')
    );
    
update tb_grade  --8��
set point=null
where student_no in(select student_no from tb_student where ABSENCE_YN='Y');

select * from tb_grade join tb_student using (student_no) --8��
where absence_yn='Y';
    