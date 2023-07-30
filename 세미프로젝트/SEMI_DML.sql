insert into TBL_WRITER values('MAN1','WRITER1','PASS1','email@a.com');
insert into TBL_BOARD (SUBJECT,CONTENT,ID) values('jsp쉽네요','jsp쉽습니다','MAN1');
select ID,WRITER,PASSWORD,EMAIL_ADDRESS from TBL_WRITER;
select * from TBL_BOARD;

select * from 
(select tb1.*,rownum rn from(
(select IDX,SUBJECT,CONTENT,to_char(WDATE,'yyyy-mm-dd'),ID from TBL_BOARD order by IDX) Tb1)
where rn between ? and ?);

