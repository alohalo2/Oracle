-- 1. OBJECT(��ü): �����ͺ��̽��� ������ ���� �� ������ �����ϰ� �ϱ� ���� ������� �Ǵ� ����� �����ϴ� ����
-- 				   ���̺�, �ε���, ����, ������, �ó��,.. �� �پ��� ��ü�� �����Ѵ�.
-- 1-1. ������ ����: ����ڰ� ���� ������ ���̺��� �ƴ� �����ͺ��̽��� ���ɰ� ���õ� ���̺�� �����ͺ��̽� ������ ������ �� �ڵ�����
--               �����Ǵ� ���̺��. ���� ������ �Ұ����ϰ� �����Ǵ� �����̺�� SELECT ��ɸ� �̿��� �� �ִ�.
-- C##STUDY ������ ����� �� �ִ� ������ ���� ��ȸ
SELECT *
	FROM DICT;
	
-- C##STUDY ������ ��ȸ�� �� �ִ� ���� ���� ������ ����
SELECT *
	FROM DICTIONARY
	WHERE TABLE_NAME LIKE 'V$%';
	
-- C##STUDY�� �����ϰ� �ִ� ���̺� ��� ��ȸ
SELECT U.TABLE_NAME
	 , A.OWNER 
	FROM USER_TABLES U
	JOIN ALL_TABLES A
	  ON U.TABLE_NAME = A.TABLE_NAME
	WHERE A.OWNER = 'C##STUDY';

-- C##STUDY ������ ����� �� �ִ� ��� ���̺� ��� ��ȸ
-- C##STUDY�� ���� DBA ������ �ֱ� ������ ������ �������� ������ �� �ִ� ��� ���̺��� ����� �� �ִ�.
SELECT *
	FROM ALL_TABLES;

-- ������(SYS) ������ �����ϰ� �ִ� �ý��� ���� �������� ����ִ� ���̺� ��� ��ȸ
SELECT *
	FROM DBA_TABLES;

-- ���� �����ͺ��̽��� ������ �������� Ȯ��
SELECT SID
	 , OSUSER
	 , SERIAL#
	 , PROGRAM
	FROM V$SESSION;

-- DB�� �� �ɷ��� �� ���� ������ ��������� ��ɾ�
-- DBA ������ �ִ� ������ ��� ����
-- ALTER SYSTEM KILL SESSION 'SID, SERIAL#' IMMEDIATE;
ALTER SYSTEM KILL SESSION '1589, 51817' IMMEDIATE;

-- �� �ɸ� ��ü Ȯ��
SELECT OBJECT_ID
	 , SESSION_ID
	 , ORACLE_USERNAME
	 , OS_USER_NAME
	FROM V$LOCKED_OBJECT;

-- Ʈ������� �����Ű�� �ʰ� ���ɱ�
UPDATE STUDENT_COPY1  
	SET 
		SNO = '222222';
	
-- �� �ɸ� ���� Ȯ��
SELECT L.OBJECT_ID
	 , S.SID
	 , L.ORACLE_USERNAME
	 , S.SERIAL#
	 , S.OSUSER
	 , S.PROGRAM
	 , T.SQL_TEXT
	FROM V$SESSION S
	JOIN V$LOCKED_OBJECT L
	  ON S.SID = L.SESSION_ID
	JOIN V$SQLTEXT T
	  ON S.SQL_ADDRESS = T.ADDRESS;

ALTER SYSTEM KILL SESSION '615, 20518' IMMEDIATE;

SELECT *
	FROM STUDENT_COPY1 sc ;

SELECT A.*
	 , B.*
	 , C.*
	FROM TABLEA A
	   , TABLEB B
	   , TABLEC C;
	  
-- 1-2. INDEX: ���̺� ������ �߰��Ͽ� �˻��ӵ��� ����Ű�� ��ü
-- EMP ���̺� �����Ͱ� 1000000���� ������
-- INDEX�� ���� ��
-- SELECT *
--	  FROM EMP
--	  WHERE ENO = '499999'
-- ENO 1������ �ϳ��� �����ϸ鼭 ���ؼ� ������.
-- INDEX�� ������
-- SELECT *
--	  FROM EMP
--	  WHERE ENO = '499999'
-- ENO 500000������ ������ ū�� ��
-- ENO 250000������ ������ ū�� ��
-- ENO 375000������ ������ ū�� ��
-- �����Ͱ� õ���� �̻�Ǵ� ���̺� �ε����� �����ؾ� �ε����� ȿ���� �����Ѵ�.
-- �ε����� �����ε����� ������ε����� ���� �� �ִ�.
-- �����ε����� �ε����� ������ �÷��� �����Ͱ� �ߺ��Ǹ� �ȵǴ� �ε���(PK, UK)
-- ������ε����� �ε����� ������ �÷��� �����Ͱ� �ߺ��ǵ� �Ǵ� �ε���(���� �ε����� ����)
-- ����� �ε��� ����
-- STUDENT ���̺� SNAME�� �ε����� ����
CREATE INDEX STUDENT_SNAME_IDX
	ON STUDENT(SNAME);
	  
-- ������ �÷��� �����Ͽ� ���� �ε����� ����
CREATE INDEX PROFESSOR_PNO_PNAME_IDX
	ON PROFESSOR(PNO, PNAME);
	  
-- ������ �̿��� �ε��� ����
-- �ϳ��� ���̺� ������ �ε��� ���� ����
-- STUDENT ���̺� 4.5�� �������� ȯ��� ������ �ε����� ����
CREATE INDEX STUDENT_CONVERT_AVR_IDX
	ON STUDENT(AVR * 1.125);
	  
-- EMP ���̺� 50% �λ�� �޿��� �ε����� ����
CREATE INDEX EMP_CONVERT_SAL_IDX
	ON EMP(SAL * 1.5);
	  
-- ������ �ε��� ��ȸ ����
SELECT UI.INDEX_NAME 
	 , UI.TABLE_NAME 
	 , UIC.COLUMN_NAME 
	 , UIC.COLUMN_POSITION 
	 , UI.UNIQUENESS 
	FROM USER_INDEXES UI
	JOIN USER_IND_COLUMNS UIC
	  ON UI.INDEX_NAME = UIC.INDEX_NAME;

-- �ε��� ����
DROP INDEX EMP_CONVERT_SAL_IDX;

-- 1-3. VIEW: ��õ ���̺���� �����͸� �������� ��Ƽ� �����ϴ� ������ ���̺�
--			  ��õ ���̺��� �����Ͱ� ����Ǹ� VIEW ���̺��� �����͵� �ڵ����� ����ȴ�.
--			  �ܼ� VIEW�� ���� VIEW�� ������ �ǰ�
-- �ܼ� VIEW: ��õ ���̺��� �ϳ��� VIEW ���̺�. DML(INSERT, UPDATE, DELETE) ������ ��� ����
-- ���� VIEW: �������� ��õ ���̺��� �����ؼ� ������ VIEW ���̺�. DML(INSERT, UPDATE, DELETE) ������ ��� �Ұ���
-- �ַ� ��赥���ͳ� ��õ ���̺��� �����Ͱ� ���÷� ����� �� VIEW�� �����ؼ� �����͸� ���� �� ����Ѵ�.
-- ���� �а��� �⸻��� ������ ��� ������ �����ϴ� VIEW ����(���� VIEW)
DROP VIEW V_COURSE_MAJOR_AVRRES;

CREATE OR REPLACE VIEW V_COURSE_MAJOR_AVGRES(
	COURSE_NUM,
	COURSE_NAME,
	MAJOR_NAME,
	AVG_RESULT
) AS (
	SELECT SC.CNO
		 , C.CNAME
		 , ST.MAJOR
		 , ROUND(AVG(SC.RESULT), 2)
		FROM SCORE SC
		JOIN COURSE C
		  ON SC.CNO = C.CNO
		JOIN STUDENT ST
		  ON ST.SNO = SC.SNO
		GROUP BY SC.CNO, C.CNAME, ST.MAJOR
);

-- VIEW ���̺��� ������ ��ȸ
SELECT *
	FROM V_COURSE_MAJOR_AVGRES
	ORDER BY COURSE_NUM, MAJOR_NAME;

-- VIEW ���̺��� ��õ ���̺��� �������� ������ �ޱ� ������
-- ��õ ���̺��� �����Ͱ� ����Ǹ� VIEW ���̺��� �����͵� �ڵ����� ����ȴ�.
UPDATE COURSE 
	SET
		CNAME = '�Ϲ�ȭ��1'
	WHERE CNAME = '�Ϲ�ȭ��';
COMMIT;
	  
-- �ܼ� VIEW ����
-- 1�г� �л��� ������ ������ �ִ� VIEW ����
CREATE OR REPLACE VIEW ST_JUNIOR(
	SNO,
	SNAME,
	MAJOR,
	SYEAR,
	AVR
) AS (
	SELECT SNO
		 , SNAME
		 , MAJOR
		 , SYEAR
		 , AVR
		FROM STUDENT
		WHERE SYEAR = 1
);

SELECT *
	FROM ST_JUNIOR;

-- �ܼ� VIEW������ DML�� ����� �����ϴ�.
INSERT INTO ST_JUNIOR
VALUES (
	'999998',
	'ȫ�浿',
	'�İ�',
	1,
	4.0
);
COMMIT;

SELECT *
	FROM STUDENT;

-- 1�г� �л��� ������ ��Ƴ��� VIEW�� ������ �ٸ� �г� �л��� �����͸� �߰��ص� VIEW������ ��ȸ���� �ʴ´�.
INSERT INTO ST_JUNIOR
VALUES (
	'999997',
	'�Ӳ���',
	'�İ�',
	3,
	2.56
);
COMMIT;

-- CHECK OPTION�� �߰��ϸ� ���������� �����Ǿ
-- ��ȸ�ؿ� ���ǿ� �´� �����͸� DML�� ������ �� �ְ� �ȴ�.
-- 4�г� �����͸� ��ȸ�ؼ� VIEW�� �����ϱ� ������
-- 4�г� �л��� ���� ������ ������ ����������.
CREATE OR REPLACE VIEW ST_SENIOR(
	SNO,
	SNAME,
	MAJOR,
	SYEAR,
	AVR
) AS (
	SELECT SNO
		 , SNAME
		 , MAJOR
		 , SYEAR
		 , AVR
		FROM STUDENT
		WHERE SYEAR = 4
)
WITH CHECK OPTION CONSTRAINT ST_SENIOR_CONSTRAINT;

INSERT INTO ST_SENIOR
VALUES (
	'999996',
	'������',
	'�İ�',
	4,
	3.13
);
COMMIT;

INSERT INTO ST_SENIOR
VALUES (
	'999995',
	'����',
	'�İ�',
	3,
	3.84
);
COMMIT;

-- �ζ��� VIEW(��������): FROM/JOIN ������ ���Ǵ� ���������� �ζ��� ���� �θ��⵵ �Ѵ�.
SELECT E.ENO
     , E.ENAME
     , E.DNO
     , B.MINSAL
     FROM EMP E
     JOIN (
        -- �ζ��� ��
        SELECT DNO 
             , MIN(SAL) AS MINSAL
             FROM EMP E2 
             GROUP BY DNO
     ) B
       ON E.DNO = B.DNO
      AND E.SAL = B.MINSAL;
  
-- ���� ����
DROP VIEW ST_JUNIOR;

-- ORACLE�� ROWNUM: ��ȸ�� �����Ϳ� ���ȣ�� �ٿ��ִ� ��ü
-- �޿� �ֻ��� 3�� ��ȸ
SELECT ROWNUM
     , A.ENO
     , A.ENAME
     , A.SAL
     FROM (
        SELECT ENO
             , ENAME
             , SAL
             FROM EMP
             WHERE SAL IS NOT NULL 
             ORDER BY SAL DESC
     )A
     WHERE ROWNUM <= 3;

-- �߸��� ���� 
-- ������ �Ǳ� ���� ���ȣ�� �����Ǽ� ���ϴ� �����Ϳ� �ٸ� �����Ͱ� ��ȸ�ȴ�.
-- ���ĵ� �����Ϳ� ROWNUM�� ���� ������ ����ؾ� ����� �� �����͸� ��ȸ�� �� �ִ�.
SELECT ROWNUM
     , ENO
     , ENAME
     , SAL
     FROM EMP
     WHERE SAL IS NOT NULL 
       AND ROWNUM <= 3
     ORDER BY SAL DESC

-- ������ �⸻��� ������ ��� ������ �ֻ��� 3�� ������ ��ȸ(����, �⸻��� ������ ������� ��ȸ)
SELECT ROWNUM
     , A.MAJOR
     , A.AVG_RESULT
     FROM (
        SELECT ST.MAJOR
             , AVG(SC.RESULT) AS AVG_RESULT
             FROM STUDENT ST
             JOIN SCORE SC
               ON ST.SNO = SC.SNO
             GROUP BY ST.MAJOR
             ORDER BY AVG_RESULT DESC
     ) A
     WHERE ROWNUM <= 3;

-- ROWNUM ��ġ�� ���� ����� �ٲ�� ������ 
-- ��ġ�� �� ������ �ؾߵǰ� ROWNUM�� ��ȸ�ϴ� SELECT ���������� <, <=�θ� �񱳰� �����ϴ�.
-- ROWNUM�� ��ȸ�ϴ� SELECT ������ ���������� ��� ����ϸ� >, >=�� ���� �� �ִ�.
SELECT B.*
    FROM(
        SELECT ROWNUM AS RN
             , A.MAJOR
             , A.AVG_RESULT
             FROM (
                SELECT ST.MAJOR
                     , AVG(SC.RESULT) AS AVG_RESULT
                     FROM STUDENT ST
                     JOIN SCORE SC
                       ON ST.SNO = SC.SNO
                     GROUP BY ST.MAJOR
                     ORDER BY AVG_RESULT DESC
             ) A
    ) B
    WHERE B.RN > 3;

-- 1-4. SEQUENCE: ������ ���� ���� �������ִ� ��ü, �ַ� PK, UK�� �Բ� ���ȴ�.
-- SEQUENCE�� ����� ���̺� ����
CREATE TABLE EMP_COPY1(
    ENO NUMBER,
    ENAME VARCHAR2(20),
    JOB VARCHAR2(10),
    MGR NUMBER,
    HDATE DATE,
    SAL NUMBER(5, 0),
    COMM NUMBER(5, 0),
    DNO NUMBER
);

CREATE TABLE DEPT_COPY2 (
    DNO NUMBER,
    DNAME VARCHAR2(10),
    LOC VARCHAR2(10),
    DIRECTIOR NUMBER
);

-- SEQUENCE ����
-- �ɼ��� �߰��� SEQUENCE ����
CREATE SEQUENCE EMP_CO_ENO_SEQ1
    START WITH 1
    INCREMENT BY 2
    MAXVALUE 10
    NOMINVALUE 
    CYCLE 
    NOCACHE;

-- �ɼ��� ���� SEQUENCE ����
CREATE SEQUENCE DEPT_CO_DNO_SEQ;

-- SEQUENCE�� ���
-- ��������.NEXTVAL, ��������.CURRVAL
-- NEXTVAL: ���ο� ���� �Ҵ�
INSERT INTO EMP_COPY1 
VALUES (EMP_CO_ENO_SEQ1.NEXTVAL, '���õ', '����', 0, SYSDATE, 3000, 100, 0);
COMMIT;

INSERT INTO EMP_COPY1 
VALUES (EMP_CO_ENO_SEQ1.NEXTVAL, 'ȫ�浿', '����', 0, SYSDATE, 3300, 100, 0);
COMMIT;

SELECT *
    FROM EMP_COPY1;

-- CURRVAL: ������ ����ߴ� ������ ���� ����
INSERT INTO EMP_COPY1 
VALUES (EMP_CO_ENO_SEQ1.CURRVAL, '����', '����', 0, SYSDATE, 3500, 100, 0);
COMMIT;


-- �ɼ��� ���� SEQUENCE�� ���
INSERT INTO DEPT_COPY2
VALUES (DEPT_CO_DNO_SEQ.NEXTVAL, '����', '����', 0);
INSERT INTO DEPT_COPY2
VALUES (DEPT_CO_DNO_SEQ.NEXTVAL, '�濵', '����', 0);
INSERT INTO DEPT_COPY2
VALUES (DEPT_CO_DNO_SEQ.NEXTVAL, 'ȸ��', '����', 0);
INSERT INTO DEPT_COPY2
VALUES (DEPT_CO_DNO_SEQ.NEXTVAL, '�ѹ�', '����', 0);
INSERT INTO DEPT_COPY2
VALUES (DEPT_CO_DNO_SEQ.NEXTVAL, '�λ�', '����', 0);
COMMIT;

SELECT *
    FROM DEPT_COPY2;

-- ������ ������ ��ȸ ����
SELECT SEQUENCE_NAME
     , MAX_VALUE
     , MIN_VALUE
     , INCREMENT_BY
     , CACHE_SIZE
     , LAST_NUMBER
     , CYCLE_FLAG
    FROM USER_SEQUENCES;

-- CURRVAL�� �ַ� ���� ������ ���� �Ҵ�ƴ��� Ȯ���� �� ���
SELECT DEPT_CO_DNO_SEQ.CURRVAL
    FROM DUAL;

-- NEXTVAL�� ���ο� ���� �Ҵ�޾Ƽ� ���� ������ �� �ַ� ���
-- NEXTVAL�� ȣ��Ǹ� �������� ������ ���ο� ���� ����Ų��.
SELECT DEPT_CO_DNO_SEQ.NEXTVAL
    FROM DUAL;

-- �������� ����
-- �������� ��� �ɼ��� ������ �� ������ ���� ���� �������� ���Ѵ�.
ALTER SEQUENCE DEPT_CO_DNO_SEQ
    INCREMENT BY 5
    MAXVALUE 100
    CYCLE;

-- �������� ����
DROP SEQUENCE DEPT_CO_DNO_SEQ;

-- 1-5. SYNONYM: ����Ŭ ��ü�� ��Ī�� �޾��ִ� ��ü
-- ���� ������ ����ڿ��� ��� ����� �� �ִ� ���Ǿ� ����
CREATE SYNONYM DC
    FOR DEPT_COPY2;

SELECT *
    FROM DC;

-- PUBLIC Ű���带 ����ϸ� ����Ŭ�� ������ ��� �������� ��� ����� �� �ִ� ���Ǿ� ����
CREATE PUBLIC SYNONYM EC
    FOR C##STUDY.EMP_COPY1;

SELECT *
    FROM EC;

-- BOARD_MAIN --- �Խ��� ���� ���̺�
-- BOARD_APP --- �Խ��� DB �����
-- BOARD_MAIN�� �����ϴ� ���̺���� SYNONYM�� ���ؼ� BOARD_APP���� ����� �� �ִ� ���Ǿ �����ؼ� 
-- �����ڵ��� BOARD_APP ������ ���ؼ� DB ������ �� �ֵ��� �Ѵ�. (SELECT, INSERT, DELETE, UPDATE ���Ѹ� �༭ ���)
-- SYNONYM ����
DROP SYNONYM DC;

DROP PUBLIC SYNONYM EC;










	  
	   