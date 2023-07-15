select student_no �й�,student_name �̸�,entrance_date ���г⵵ from tb_student
order by entrance_date; --1��

select professor_name, professor_ssn from tb_professor
where length(professor_name) ^= 3; --2��

select professor_name �����̸�, --3��
case when substr(professor_ssn,1,2)<50 then floor((100*365+sysdate-to_date(substr(professor_ssn,1,6),'rrmmdd'))/365)
else floor((sysdate - to_date(substr(professor_ssn,1,6),'rrmmdd'))/365)
end as ���� from tb_professor;
-- 50�� ���Ͽ� ���ؼ� 'rrmmdd'�� 2000���� �ν��ϹǷ�, 100(��)*365�� 100���� ������
-- �������� ���� 1900�������� �������Ƿ� ������ ����. 

select substr(professor_name,2) �̸� from tb_professor; --4��

select entrance_date, student_ssn,extract(year from entrance_date)- extract(year from to_date(substr(student_ssn,1,2),'rr')) from tb_student;

select student_no,student_name from tb_student --5��
where extract(year from entrance_date)- extract(year from to_date(substr(student_ssn,1,2),'rr'))<20;

select to_char((to_date('20201225','yyyymmdd')),'DAY') from dual;  --6��

select extract(year from to_date('99/10/11','yy/mm/dd')) yyǥ��,extract(year from to_date('49/10/11','yy/mm/dd')) yyǥ��, --7��
extract(year from to_date('99/10/11','rr/mm/dd')) rrǥ��,extract(year from to_date('49/10/11','rr/mm/dd')) rrǥ�� from dual;
--yy�� 2000��븦 �ǹ�, rr�� 50���� �������� 50���ʹ� 1900���, 49�⵵���ϴ� 2000��� �ǹ�

select student_no,student_name from tb_student --8��
where student_no not like('A%');

select round(avg(point),1) ���� from tb_grade --9��
where student_no='A517178'
group by student_no;

select department_no,count(student_no) from tb_student --10��
group by department_no
order by department_no asc;

select count(student_no) as "count(*)" from tb_student --11��
where COACH_PROFESSOR_NO is null;


select * from tb_grade;

with year_grade as (select substr(term_no,3,2) �⵵,student_no �й�,point ���� from tb_grade where student_no='A112113') --12��
select �⵵,round(avg(����),1) "�⵵�� ����" from year_grade
group by �⵵;

select department_no �а��ڵ��,count(student_no) "���л� ��" from tb_student --13��
where ABSENCE_YN='Y'
group by department_no
order by department_no;

select �����̸�,�����μ� from( --14��
select student_name �����̸�,count(student_name) �����μ� from tb_student
group by student_name)
where �����μ�>1;


with grade as(select substr(term_no,1,4) �⵵, substr(term_no,6,1) �б�, avg(point) ���� --15��
from tb_grade
where student_no='A112113'
group by term_no
)
select �⵵,�б�,round(����,1) from
grade

union

select �⵵,' ' �б� , round(avg(����),1) from grade
group by �⵵

union

select '3000' �⵵,' '�б�,round(avg(����),1) from grade;