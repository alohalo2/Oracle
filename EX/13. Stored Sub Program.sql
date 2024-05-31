-- 1. Stored Sub Program: PL/SQL�� �ۼ��� ���α׷����� ����Ŭ ���ο� �����ߴٰ� �ʿ��� ������ ����� �� �ִµ�
--                        ����Ŭ ���ο� ����Ǵ� PL/SQL ���α׷����� Stored Sub Program�̶�� �Ѵ�.
--                        Stored Prcedure, Stored Function, Trigger ���� �ִ�.
-- 1-1. Stored Prcedure
-- �Ķ���Ͱ� ���� ���ν���
-- ���ν����� ����
CREATE OR REPLACE PROCEDURE PRO_NOPAPRM
IS 
    ENO VARCHAR2(8);
    ENAME VARCHAR2(20);
BEGIN
    ENO := '1111';
    ENAME := '�̼���';
    
    INSERT INTO EMP(ENO, ENAME)
    VALUES(ENO, ENAME);
    COMMIT;

END;
/

-- ���ν����� ����
EXEC PRO_NOPAPRM;

SELECT *
    FROM EMP
    WHERE ENO = '1111';

-- �����ȣ, �л���ȣ, �л��̸�, �⸻��� ������ �����ϴ� ���̺� ����
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
          
-- �л��� �⸻��� ������ ����� �����ϴ� ���̺�
CREATE TABLE T_ST_AVG_RES1(
    SNO VARCHAR2(8),
    SNAME VARCHAR2(20),
    AVG_RES NUMBER(5, 2)
);

-- T_ST_SC1 ���̺��� �����͸� �����ؼ� T_ST_AVG_RES1 ���̺� �����͸� �����ϴ�
-- ���ν��� P_ST_AVG_RES�� �����ϼ���.(Ŀ�����)
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
VALUES ('1211', '999999', '���õ', 100);
COMMIT;




