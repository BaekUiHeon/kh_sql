insert into TBL_WRITER values('MAN1','WRITER1','PASS1','email@a.com');
insert into TBL_BOARD (SUBJECT,CONTENT,ID) values('jsp쉽네요','jsp쉽습니다','MAN1');
select ID,WRITER,PASSWORD,EMAIL_ADDRESS from TBL_WRITER;
select * from TBL_BOARD;

select * from 
(select tb1.*,rownum rn from(
(select IDX,SUBJECT,CONTENT,to_char(WDATE,'yyyy-mm-dd'),ID from TBL_BOARD order by IDX) Tb1)
where rn between ? and ?);

select * from tbl_comment;

insert into tbl_comment (idx,content,id) values();

select * from tbl_like;

select * from tbl_board;

select * from tbl_writer;

select ccidx,depth,step,content,cidx,id,wdate,writer 
from (select * from tbl_comment where idx=1) join tbl_writer using (id) 

order by step asc,ccidx,step desc;
