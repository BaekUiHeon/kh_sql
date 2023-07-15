select student_name,student_address from tb_student --1��
order by student_name asc;

select student_name,student_ssn from tb_student --2��
where absence_yn='Y'
order by substr(student_ssn,1,2) desc;

select student_name �л��̸�,student_no �й�,student_address �������ּ� from tb_student --3��
where student_address like('%������%') or student_address like('%��⵵%') and substr(student_no,1,1)='9';

select professor_name, professor_ssn from tb_professor --4��
where department_no=005
order by professor_ssn
;

select student_no, point from tb_grade --5��
where class_no='C3118100' and term_no='200402'
order by point desc,student_no asc;

select student_no, student_name, department_name from tb_student join tb_department using(department_no) --6��
order by student_name;

select class_name,department_name from tb_class join tb_department using (department_no); --7��

select class_name,professor_name from tb_class_professor join tb_professor using (professor_no) join tb_class using(class_no); --8��

select class_name,professor_name from tb_class_professor join tb_professor p using (professor_no) join tb_class using(class_no) --9��
join tb_department d on(p.department_no=d.department_no and d.category='�ι���ȸ')
;

select student_no �й�,student_name �̸�,round(avg(point),1) ��ü���� from tb_student join tb_grade using(student_no) --10��
where department_no='059'
group by student_no,student_name;


    
select department_name �а��̸�, student_name �л��̸�, professor_name ���������̸� --11��
    from tb_student 
    join tb_department  using (department_no)
    join tb_professor  on (professor_no=coach_professor_no)
    where student_no='A313047';
    
select student_name,term_no as "TERM_NAME" --12��
from tb_student s join tb_grade g on 
(g.student_no=s.student_no)
where substr(term_no,1,4)='2007' and class_no='C2604100';

select class_name, department_name --13��
    from tb_class c
    join tb_class_professor cp using (class_no)
    join tb_department using (department_no) --13��
    where category='��ü��' and professor_no is null;
;

select student_name, professor_name --14��
    from tb_student 
    join tb_department using(department_no)
    join tb_professor on (COACH_PROFESSOR_NO=PROFESSOR_NO)
    where department_name='���ݾƾ��а�';
    

select student_no,student_name,department_name,round(avg(point),1) --15��
from tb_student join tb_department using (department_no)
join tb_grade using(student_no)
where ABSENCE_YN='N'
group by student_no,student_name,department_name
having avg(point)>=4;

select class_no, class_name, round(avg(point),8) --16��
    from tb_class c join tb_grade using (class_no)
    where department_no=34 and class_name not like('%��%')
    group by class_no,class_name
    ;

select student_name, student_address --17��
    from tb_student
    where department_no=(select department_no from tb_student where student_name='�ְ���')
    ;
    
select student_no,student_name from( --18��
select rownum, student_no,student_name 
    from (
    select student_no,student_name,avg(point)
    from tb_student 
    join tb_grade using (student_no)
    where department_no='001'
    group by student_no,student_name
    order by avg(point) desc
    )
    where rownum=1
    );
    
select department_name, round(avg(point),1) --19��
    from tb_student 
    join tb_grade using (student_no)
    join tb_department using (department_no)
    where category=(select category from tb_department where department_name='ȯ�������а�')
    group by department_name;
    
    
    


    


            
            

            