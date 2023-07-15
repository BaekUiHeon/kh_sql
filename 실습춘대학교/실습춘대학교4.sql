create table tb_category( --1��
                        name varchar2(10),
                        use_yn  char(1) default 'Y'
                        );
                        
create table tb_class_type( --2��
                        no varchar2(5) constraint tb_class_type primary key,
                        name varchar2(10) 
                        );
                        
alter table tb_category add constraint pk_category primary key(name); --3��

alter table tb_class_type modify name not null; --4��

alter table tb_class_type modify no varchar2(10);  --5��
alter table tb_category modify name varchar2(20);
alter table tb_class_type modify name varchar2(20);

 
alter table tb_class_type rename column name to class_type_name; --6��
alter table tb_class_type rename column no to class_type_no;
alter table tb_category rename column class_type_no to category_name;

alter table tb_category rename constraint pk_category to pk_name; --7��
alter table tb_class_type rename constraint tb_class_type to pk_no;

insert into tb_category values('����','Y'); --8��
insert into tb_category values('�ڿ�����','Y');
insert into tb_category values('����','Y');
insert into tb_category values('��ü��','Y');
insert into tb_category values('�ι���ȸ','Y');
commit;

alter table tb_department add constraint fk_department_category foreign key(category) references tb_category(category_name); --9��

create view VW_�л��Ϲ����� as --10��
(select student_no �й�,student_name �л��̸�,student_address �ּ� from tb_student);

create view VW_������� as --11��
    select student_no �л��̸�, department_name �а��̸�, professor_name ���������̸� 
    from tb_student join tb_department using(department_no)
    left join tb_professor on professor_no=COACH_PROFESSOR_NO
    order by department_name;
    
    select * from VW_�������;
    
    create view VW_�а����л��� as  -- 12��
    select department_name,count(student_no) student_count from tb_student join tb_department using (department_no)
    group by department_name;
    
    select * from VW_�а����л���;
    
    update VW_�л��Ϲ����� --13��
    set �л��̸�='������'
    where �й�='A213046';
    
    
    create view VW_�б����� as --14��
    select * from tb_category
    with read only;
    
    create or replace view VW_�α���� as  --15��
    select rownum ����,�����ȣ,�����̸�,������������ as "������������(��)" from (
    select class_no �����ȣ, class_name �����̸�, count(*) as ������������
        from tb_grade 
        join tb_class using (class_no)
        where substr(term_no,1,4) in ('2009','2008','2007')
        group by class_no,class_name
        order by "������������" desc
        );
        
    select * from VW_�α����
    where ����<=3
    order by rownum asc;