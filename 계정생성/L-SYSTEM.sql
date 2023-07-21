--select * from user_tables;
--alter session set "_ORACLE_SCRIPT"=true;
--create user scott identified by tiger;
--grant connect,resource, dba to scott;
--connect scott/tiger;

select * from user_tables;

alter session set "_ORACLE_SCRIPT"=true;
create user kh identified by kh;
grant connect,resource, dba to kh;
connect kh/kh;
