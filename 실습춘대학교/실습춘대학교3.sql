select student_name,student_address from tb_student --1번
order by student_name asc;

select student_name,student_ssn from tb_student --2번
where absence_yn='Y'
order by substr(student_ssn,1,2) desc;

select student_name 학생이름,student_no 학번,student_address 거주지주소 from tb_student --3번
where student_address like('%강원도%') or student_address like('%경기도%') and substr(student_no,1,1)='9';

select professor_name, professor_ssn from tb_professor --4번
where department_no=005
order by professor_ssn
;

select student_no, point from tb_grade --5번
where class_no='C3118100' and term_no='200402'
order by point desc,student_no asc;

select student_no, student_name, department_name from tb_student join tb_department using(department_no) --6번
order by student_name;

select class_name,department_name from tb_class join tb_department using (department_no); --7번

select class_name,professor_name from tb_class_professor join tb_professor using (professor_no) join tb_class using(class_no); --8번

select class_name,professor_name from tb_class_professor join tb_professor p using (professor_no) join tb_class using(class_no) --9번
join tb_department d on(p.department_no=d.department_no and d.category='인문사회')
;

select student_no 학번,student_name 이름,round(avg(point),1) 전체평점 from tb_student join tb_grade using(student_no) --10번
where department_no='059'
group by student_no,student_name;


    
select department_name 학과이름, student_name 학생이름, professor_name 지도교수이름 --11번
    from tb_student 
    join tb_department  using (department_no)
    join tb_professor  on (professor_no=coach_professor_no)
    where student_no='A313047';
    
select student_name,term_no as "TERM_NAME" --12번
from tb_student s join tb_grade g on 
(g.student_no=s.student_no)
where substr(term_no,1,4)='2007' and class_no='C2604100';

select class_name, department_name --13번
    from tb_class c
    join tb_class_professor cp using (class_no)
    join tb_department using (department_no) --13번
    where category='예체능' and professor_no is null;
;

select student_name, professor_name --14번
    from tb_student 
    join tb_department using(department_no)
    join tb_professor on (COACH_PROFESSOR_NO=PROFESSOR_NO)
    where department_name='서반아어학과';
    
    


            
            

            