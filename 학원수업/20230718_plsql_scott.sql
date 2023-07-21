set serveroutput on;

begin 
dbms_output.put_line('HELLO WORLD');
END;
/

DECLARE
    EMP_ID NUMBER;
    EMP_NAME VARCHAR(30);
BEGIN
    EMP_ID:=888;
    EMP_NAME:='배장남';
    DBMS_OUTPUT.PUT_LINE('EMP_ID:' ||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME:'||EMP_NAME);
    END;
    /
    
DECLARE
    emp_id employee.emp_id%type;
    EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME
    INTO EMP_ID,EMP_NAME
    FROM EMPLOYEE
    WHERE EMP_ID='&EMP_ID';
    DBMS_OUTPUT.PUT_LINE('EMP_ID:'||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME:'||EMP_NAME);
    END;
/

DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT * INTO E
    FROM EMPLOYEE
    WHERE EMP_ID ='&EMP_ID';
    DBMS_OUTPUT.PUT_LINE('EMP_ID:'||E.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME:'||E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMP_NO:'||E.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('SALARY:'||E.SALARY);
END;
/

-- set define off; 
-- set feedback off;



create or replace procedure pro_dept_insert -- procedure(함수) 선언
is                                          -- declare 대체문
begin                                       -- 실행문
    insert into dept values('a','a','a');   -- dept에 하나의 레코드를 넣어준다.
    commit;                                 -- commit
end;                                        -- 여기까지가 pro_dept_insert의 정의.
/

select * from dept;
select * from user_procedures;  

exec pro_dept_insert; -- procedure 실행
delete from dept      -- 실행에 의한 레코드 삭제
where deptno=50;      --  ""

create or replace procedure my_procedure
is
dept1 dept%rowtype;
begin
select * into dept1 from dept;
end;
/

exec my_procedure;
select * from dept;
delete from dept
where deptno=50;



SELECT * FROM EMPLOYEE;
------- ROW TYPE로 변수 선언하기
DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT * INTO E
    FROM EMPLOYEE
    WHERE EMP_ID='&EMP_ID';
    DBMS_OUTPUT.PUT_LINE('EMP_ID'||E.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME:'||E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMP_NO:'||E.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('SALARY:'||E.SALARY);
    END;
    /
    
-- 테이블 타입의 변수 선언과 초기화, 변수 값 출력

DECLARE --선언시작
    TYPE EMP_ID_TABLE IS TABLE OF EMPLOYEE.EMP_ID%TYPE -- EMP_ID_TABLE 선언
    INDEX BY BINARY_INTEGER;                --인덱싱 방법정의             
    TYPE EMP_NAME_TABLE IS TABLE OF EMPLOYEE.EMP_NAME%TYPE -- EMP_NAME_TABLE 선언
    INDEX BY BINARY_INTEGER;                --인덱싱 방법정의      
    
    EMP_ID_TABLE EMP_ID_TABLE;              -- 테이블을 이용한 변수선언
    EMP_NAME_TABLE EMP_NAME_TABLE;          -- 테이블을 이용한 변수선언
    I BINARY_INTEGER:=0;                    -- FOR문을 위한 변수 I 선언
    
    BEGIN                                   -- 실행문시작
        FOR K IN (SELECT EMP_ID,EMP_NAME FROM EMPLOYEE) LOOP --K는 IN안에 있는 RESULTSET을 의미, 이용하여 FOR문을 실행
            I:=I+1; --증감식
            EMP_ID_TABLE(i):=K.EMP_ID; -- K객체를 이용하여 EMP_ID_TABLE의 I번째에 값을 삽입
            EMP_NAME_TABLE(I):=K.EMP_NAME; -- ""
            END LOOP; -- 반복문 종료
            FOR J IN 1..I LOOP -- 1부터 I번까지 반복문실행
                DBMS_OUTPUT.PUT_LINE('EMP_ID:'||EMP_ID_TABLE(J)||', EMP_NAME:'||EMP_NAME_TABLE(J)); -- 삽입한 컬럼 출력
                    END LOOP; -- 반복문 종료 
            END; --BEGIN문 종료 
            /
            
    -- 레코드 타입의 변수 선언과 초기화, 변수 값 출력.
    DECLARE --선언
        TYPE EMP_RECORD_TYPE IS RECORD( --레코드클래스 선언
            EMP_ID EMPLOYEE.EMP_ID%TYPE, --EMP_ID형 변수선언
            EMP_NAME EMPLOYEE.EMP_NAME%TYPE, --NAME형 변수선언
            DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE, --DEPARTMENT의 DEPT_TITLE형 변수선언
            JOB_NAME JOB.JOB_NAME%TYPE -- JOB의 NAME형 변수선언
            );
            
            EMP_RECORD EMP_RECORD_TYPE; -- 선언된 레코드클래스의 객체생성.
        BEGIN
            SELECT EMP_ID,EMP_NAME,DEPT_TITLE,JOB_NAME INTO EMP_RECORD
            FROM EMPLOYEE E, DEPARTMENT D,JOB J
            WHERE E.DEPT_CODE = D.DEPT_ID
            AND E.JOB_CODE = J.JOB_CODE
            AND EMP_NAME = '&EMP_NAME';
            
    DBMS_OUTPUT.PUT_LINE('사번:'||EMP_RECORD.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름:'||EMP_RECORD.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('부서:'||EMP_RECORD.DEPT_TITLE);
    DBMS_OUTPUT.PUT_LINE('직급:'||EMP_RECORD.JOB_NAME);
    END;
    /
        
    
    DECLARE
        EMP_ID EMPLOYEE.EMP_ID%TYPE;
        EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
        DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
        NATIONAL_CODE LOCATION.NATIONAL_CODE%TYPE;
        TEAM VARCHAR(20);
    
    BEGIN 
        SELECT EMP_ID,EMP_NAME,DEPT_TITLE,NATIONAL_CODE
        INTO EMP_ID,EMP_NAME,DEPT_TITLE,NATIONAL_CODE
        FROM EMPLOYEE E, DEPARTMENT D, LOCATION L
        WHERE E.DEPT_CODE =D.DEPT_ID
        AND D.LOCATION_ID =L.LOCAL_CODE
        AND EMP_ID='&EMP_ID';
        
        IF(NATIONAL_CODE='KO') THEN TEAM:='국내팀';
        ELSE TEAM:='해외팀';
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('사번:'||EMP_ID);
        DBMS_OUTPUT.PUT_LINE('이름:'||EMP_NAME);
        DBMS_OUTPUT.PUT_LINE('부서:'||DEPT_TITLE);
        DBMS_OUTPUT.PUT_LINE('소속:'||TEAM);
        END;
        /
        
        DECLARE
            DUP_EMPNO EXCEPTION;
            PRAGMA EXCEPTION_INIT(DUP_EMPNO,-00001);
        BEGIN
            UPDATE EMPLOYEE
            SET EMP_ID='&사번'
            WHERE EMP_ID=200;
        EXCEPTION
            WHEN DUP_EMPNO
            THEN DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다.');
        END;
        /
        
create or replace procedure PRO_EMP_ARG_TEST
    (ARG_EMPNO IN EMP.EMPNO%TYPE,
    ARG_ENAME OUT EMP.ENAME%TYPE,
    ARG_SAL OUT EMP.SAL%TYPE,
    ARG_JOB OUT EMP.JOB%TYPE )
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('ARG_EMPNO:'||ARG_EMPNO);
    SELECT ENAME,SAL,JOB
    INTO ARG_ENAME,ARG_SAL,ARG_JOB
    FROM EMP
    WHERE EMPNO=ARG_EMPNO;
    DBMS_OUTPUT.PUT_LINE('ARG_ENAME:'||ARG_ENAME);
    END;
/
VARIABLE VAR_EMP_NAME VARCHAR2(30);
VARIABLE VAR_SAL VARCHAR2(30);
VARIABLE VAR_BONUS VARCHAR2(30);
EXEC PRO_EMP_ARG_TEST(7369,:VAR_EMP_NAME,:VAR_SAL,:VAR_BONUS);

SELECT * FROM EMP;

CREATE OR REPLACE PROCEDURE PRO_ALL_EMP
IS
BEGIN
    FOR E IN(SELECT * FROM EMPLOYEE) LOOP
        SELECT_EMPID(E.EMP_ID, :E.EMP_NAME, :E.SALARY,:E.BONUS);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GUGUDAN
IS
I BINARY_INTEGER:=9;
J BINARY_INTEGER:=9;
BEGIN
    FOR I IN 2..9 LOOP
        DBMS_OUTPUT.PUT_LINE(I||'단');
        FOR J IN 1..9 LOOP
            DBMS_OUTPUT.PUT('  '||I||'*'||J||'='||I*J);
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    END;
/
EXEC GUGUDAN;
