-- 1. Stored Sub Program: PL/SQL로 작성된 프로그램들을 오라클 내부에 저장했다가 필요할 때마다 사용할 수 있는데
--                        오라클 내부에 저장되는 PL/SQL 프로그램들을 Stored Sub Program이라고 한다.
--                        Stored Prcedure, Stored Function, Trigger 등이 있다.
-- 1-1. Stored Prcedure
-- 파라미터가 없는 프로시저
-- 프로시져의 선언
CREATE OR REPLACE PROCEDURE PRO_NOPAPRM
IS 
    ENO VARCHAR2(8);
    ENAME VARCHAR2(20);
BEGIN
    ENO := '1111';
    ENAME := '이순신';
    
    INSERT INTO EMP(ENO, ENAME)
    VALUES(ENO, ENAME);
    COMMIT;

END;
/

-- 프로시저의 실행
EXEC PRO_NOPAPRM;

SELECT *
    FROM EMP
    WHERE ENO = '1111';

-- 과목번호, 학생번호, 학생이름, 기말고사 점수를 저장하는 테이블 생성
CREATE TABLE T_ST_SC1
AS SELECT SC.CNO
        , SC.SNO
        , ST.SNAME
        , SC.RESULT
        FROM SCORE SC
        JOIN STUDENT ST
          ON SC.SNO = ST.SNO;
          
SELECT * 
    FROM T_ST_SC1;
          
-- 학생별 기말고사 성적의 평균을 저장하는 테이블
CREATE TABLE T_ST_AVG_RES1(
    SNO VARCHAR2(8),
    SNAME VARCHAR2(20),
    AVG_RES NUMBER(5, 2)
);

-- T_ST_SC1 테이블의 데이터를 참조해서 T_ST_AVG_RES1 테이블에 데이터를 저정하는
-- 프로시저 P_ST_AVG_RES를 생성하세요.(커서사용)
CREATE OR REPLACE PROCEDURE P_ST_AVG_RES
IS 
CURSOR T_ST_SC_CUR IS
   SELECT TST.SNO
        , TST.SNAME
        , AVG(TST.RESULT)
        FROM T_ST_SC1 TST
        GROUP BY TST.SNO, TST.SNAME;
        
    TYPE T_ST_AVG_RES1_REC IS RECORD(
         T_ST_AVG_RES1_ROW T_ST_AVG_RES1%ROWTYPE
    );

    TSTAVGRES1REC T_ST_AVG_RES1_REC;
    
BEGIN
    DELETE FROM T_ST_AVG_RES1;
    
    OPEN T_ST_SC_CUR;
    
    LOOP
        FETCH T_ST_SC_CUR INTO TSTAVGRES1REC.T_ST_AVG_RES1_ROW;
        EXIT WHEN T_ST_SC_CUR%NOTFOUND;
        
        INSERT INTO T_ST_AVG_RES1
        VALUES TSTAVGRES1REC.T_ST_AVG_RES1_ROW;
        COMMIT;
 
    END LOOP;
    CLOSE T_ST_SC_CUR;
    
END;
/

EXEC P_ST_AVG_RES;

SELECT *
    FROM T_ST_AVG_RES1;

INSERT INTO T_ST_SC1
VALUES ('1211', '999999', '고기천', 100);
COMMIT;




