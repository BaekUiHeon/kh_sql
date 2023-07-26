create table tb_category( --1번
                        name varchar2(10),
                        use_yn  char(1) default 'Y'
                        );
                        
create table tb_class_type( --2번
                        no varchar2(5) constraint tb_class_type primary key,
                        name varchar2(10) 
                        );
                        
alter table tb_category add constraint pk_category primary key(name); --3번

alter table tb_class_type modify name not null; --4번

alter table tb_class_type modify no varchar2(10);  --5번
alter table tb_category modify name varchar2(20);
alter table tb_class_type modify name varchar2(20);

 
alter table tb_class_type rename column name to class_type_name; --6번
alter table tb_class_type rename column no to class_type_no;
alter table tb_category rename column class_type_no to category_name;

alter table tb_category rename constraint pk_category to pk_name; --7번
alter table tb_class_type rename constraint tb_class_type to pk_no;

insert into tb_category values('공학','Y'); --8번
insert into tb_category values('자연과학','Y');
insert into tb_category values('의학','Y');
insert into tb_category values('예체능','Y');
insert into tb_category values('인문사회','Y');
commit;

alter table tb_department add constraint fk_department_category foreign key(category) references tb_category(category_name); --9번

create view VW_학생일반정보 as --10번
(select student_no 학번,student_name 학생이름,student_address 주소 from tb_student);

create view VW_지도면담 as --11번
    select student_no 학생이름, department_name 학과이름, professor_name 지도교수이름 
    from tb_student join tb_department using(department_no)
    left join tb_professor on professor_no=COACH_PROFESSOR_NO
    order by department_name;
    
    select * from VW_지도면담;
    
    create view VW_학과별학생수 as  -- 12번
    select department_name,count(student_no) student_count from tb_student join tb_department using (department_no)
    group by department_name;
    
    select * from VW_학과별학생수;
    
    update VW_학생일반정보 --13번
    set 학생이름='백의헌'
    where 학번='A213046';
    
    
    create view VW_읽기전용 as --14번
    select * from tb_category
    with read only;
    
    create or replace view VW_인기과목 as  --15번
    select rownum 순번,과목번호,과목이름,누적수강생수 as "누적수강생수(명)" from (
    select class_no 과목번호, class_name 과목이름, count(*) as 누적수강생수
        from tb_grade 
        join tb_class using (class_no)
        where substr(term_no,1,4) in ('2009','2008','2007')
        group by class_no,class_name
        order by "누적수강생수" desc
        );
        
    select * from VW_인기과목
    where 순번<=3
    order by rownum asc;