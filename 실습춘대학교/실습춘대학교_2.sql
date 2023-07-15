select student_no 학번,student_name 이름,entrance_date 입학년도 from tb_student
order by entrance_date; --1번

select professor_name, professor_ssn from tb_professor
where length(professor_name) ^= 3; --2번

select professor_name 교수이름, --3번
case when substr(professor_ssn,1,2)<50 then floor((100*365+sysdate-to_date(substr(professor_ssn,1,6),'rrmmdd'))/365)
else floor((sysdate - to_date(substr(professor_ssn,1,6),'rrmmdd'))/365)
end as 나이 from tb_professor;
-- 50년 이하에 대해서 'rrmmdd'는 2000년대로 인식하므로, 100(일)*365로 100년을 더해줌
-- 교수들은 전부 1900년대생으로 보았으므로 가능한 식임. 

select substr(professor_name,2) 이름 from tb_professor; --4번

select entrance_date, student_ssn,extract(year from entrance_date)- extract(year from to_date(substr(student_ssn,1,2),'rr')) from tb_student;

select student_no,student_name from tb_student --5번
where extract(year from entrance_date)- extract(year from to_date(substr(student_ssn,1,2),'rr'))<20;

select to_char((to_date('20201225','yyyymmdd')),'DAY') from dual;  --6번

select extract(year from to_date('99/10/11','yy/mm/dd')) yy표현,extract(year from to_date('49/10/11','yy/mm/dd')) yy표현, --7번
extract(year from to_date('99/10/11','rr/mm/dd')) rr표현,extract(year from to_date('49/10/11','rr/mm/dd')) rr표현 from dual;
--yy은 2000년대를 의미, rr은 50년을 기준으로 50부터는 1900년대, 49년도이하는 2000년대 의미

select student_no,student_name from tb_student --8번
where student_no not like('A%');

select round(avg(point),1) 평점 from tb_grade --9번
where student_no='A517178'
group by student_no;

select department_no,count(student_no) from tb_student --10번
group by department_no
order by department_no asc;

select count(student_no) as "count(*)" from tb_student --11번
where COACH_PROFESSOR_NO is null;


select * from tb_grade;

with year_grade as (select substr(term_no,3,2) 년도,student_no 학번,point 학점 from tb_grade where student_no='A112113') --12번
select 년도,round(avg(학점),1) "년도별 평점" from year_grade
group by 년도;

select department_no 학과코드명,count(student_no) "휴학생 수" from tb_student --13번
where ABSENCE_YN='Y'
group by department_no
order by department_no;

select 동일이름,동명인수 from( --14번
select student_name 동일이름,count(student_name) 동명인수 from tb_student
group by student_name)
where 동명인수>1;


with grade as(select substr(term_no,1,4) 년도, substr(term_no,6,1) 학기, avg(point) 평점 --15번
from tb_grade
where student_no='A112113'
group by term_no
)
select 년도,학기,round(평점,1) from
grade

union

select 년도,' ' 학기 , round(avg(평점),1) from grade
group by 년도

union

select '3000' 년도,' '학기,round(avg(평점),1) from grade;