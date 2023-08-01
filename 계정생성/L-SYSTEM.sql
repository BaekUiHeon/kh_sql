--select * from user_tables;
--alter session set "_ORACLE_SCRIPT"=true;
--create user scott identified by tiger;
--grant connect,resource, dba to scott;
--connect scott/tiger;


alter session set "_ORACLE_SCRIPT"=true;
create user semi identified by semi;
grant connect,resource, dba to semi;
connect semi/semi;

drop user semi;
