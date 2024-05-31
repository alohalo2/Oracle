-- 1. CONSTRAINT(��������): ���������� �������� ��Ȯ���� ���Ἲ�� �������ִ� �����͸� �����ϴ� ��Ģ
-- 						 �������ǿ��� PK, FK, UK, NOT NULL, DEFAULT, CHECK ���� �����Ѵ�.
-- 1-1. PK(PRIMARY KEY): ���̺� �ĺ��� ������ �ϴ� �÷��� ����
--					     PK�� ������ �÷��� �����ʹ� �����ؾ� �ϸ�(UK), ���� ���ҵ� �ϸ�(INDEX),
--						 NULL���� ����� �� ����(NOT NULL).
-- ���� �÷� PK�� ���̺� ����
CREATE TABLE EMP_PK1 (
	-- �ý��ۿ��� �������Ǹ��� �ڵ����� ����
	ENO NUMBER(4) PRIMARY KEY,
	ENAME VARCHAR2(20),
	JOB VARCHAR2(10),
	HDATE DATE,
	DNO NUMBER(2)
);

-- PK�� ������ �÷��� �����ʹ� ������ ��(UK)�� ������ �ϱ� ������ �ߺ��� �����͸� ������ �� ����.
INSERT INTO EMP_PK1
VALUES (1, '���õ', '����', SYSDATE, 1);
COMMIT;

INSERT INTO EMP_PK1
VALUES (1, '�Ӳ���', '�м�', SYSDATE, 2);

-- PK�� ������ �����ʹ� NULL ���� ���� �� ����.(NOT NULL)
INSERT INTO EMP_PK1
VALUES (NULL, '�Ӳ���', '�м�', SYSDATE, 2);

INSERT INTO EMP 
VALUES (NULL, '�Ӳ���', 'ȸ��', NULL, SYSDATE, 5000, 600, NULL);
INSERT INTO EMP 
VALUES ('9999', '�Ӳ���', 'ȸ��', NULL, SYSDATE, 5000, 600, NULL);
COMMIT;

-- �������Ǹ��� �޾Ƽ� PK ����
CREATE TABLE STUDENT_PK1 (
	SNO NUMBER(6) CONSTRAINT STUDENT_SNO_PK PRIMARY KEY,
	SNAME VARCHAR2(20),
	MAJOR VARCHAR2(10),
	SYEAR NUMBER(1)
);

-- ���̺��� �����ϸ鼭 �÷��� ��� ���� �Ŀ� PK ����
CREATE TABLE DEPT_PK1(
	DNO NUMBER(2),
	DNAME VARCHAR2(10),
	LOC VARCHAR2(10),
	DIRECTOR NUMBER(4),
	CONSTRAINT DEPT_DNO_PK PRIMARY KEY(DNO)
);

-- ���� �÷� PK ����
-- ��� ���̺��� PK�� �� ���� ������ �� �ִ�.
CREATE TABLE PROFESSOR_PK1(
	PNO NUMBER(4),
	PNAME VARCHAR2(20),
	SECTION VARCHAR2(10),
	ORDERS VARCHAR2(10),
	HIREDATE DATE,
	CONSTRAINT PK_PROFESSOR_PNO_PNAME PRIMARY KEY(PNO, PNAME)
);

-- ���� �÷����� PK�� �����ϰ� �Ǹ� PK�� ������ �÷����� ������ ������ ��� PK�� �ν��Ѵ�.
-- PK�� ������ �÷����� ������ ��� �ߺ��ž� �ߺ����� �ν��Ѵ�.
INSERT INTO PROFESSOR_PK1
VALUES (1, '���õ', 'ȭ��', '������', SYSDATE);
COMMIT;

INSERT INTO PROFESSOR_PK1
VALUES (1, 'ȫ�浿', '����', '�α���', SYSDATE);
COMMIT;

INSERT INTO PROFESSOR_PK1
VALUES (1, '���õ', '����', '�α���', SYSDATE);

-- PK�� ������ ��� �÷��� NULL ���� ������ �ʴ´�.
INSERT INTO PROFESSOR_PK1
VALUES (NULL, '���õ', '����', '�α���', SYSDATE);

INSERT INTO PROFESSOR_PK1
VALUES (2, NULL, '����', '�α���', SYSDATE);


CREATE TABLE BOARD(
	BOARD_NO NUMBER(10),
	BOARD_TITLE VARCHAR2(1000),
	CONSTRAINT PK_BOARD_BOARD_NO PRIMARY KEY(BOARD_NO)
);

CREATE TABLE BOARD_FILE(
	BOARD_NO NUMBER(10),
	BOARD_FILE_NO NUMBER(10),
	BOARD_FILE_NAME VARCHAR2(1000),
	CONSTRAINT PK_BOARD_FILE_FILE_NO PRIMARY KEY(BOARD_FILE_NO)
);

INSERT INTO BOARD
VALUES(1, '�Խñ� 1');

INSERT INTO BOARD
VALUES(2, '�Խñ� 2');
COMMIT;

INSERT INTO BOARD_FILE
VALUES (1, 1, '�Խñ�1 - ÷������1');

INSERT INTO BOARD_FILE
VALUES (1, 2, '�Խñ�1 - ÷������2');
COMMIT;

INSERT INTO BOARD_FILE
VALUES (2, 3, '�Խñ�2 - ÷������1');

INSERT INTO BOARD_FILE
VALUES (2, 1, '�Խñ�2 - ÷������1');
COMMIT;

CREATE TABLE BOARD_FILE_MULTIPK(
	BOARD_NO NUMBER(10),
	BOARD_FILE_NO NUMBER(10),
	BOARD_FILE_NAME VARCHAR2(1000),
	CONSTRAINT PK_BOARD_FILE_BOARD_FILE_NO PRIMARY KEY(BOARD_NO, BOARD_FILE_NO)
);

INSERT INTO BOARD_FILE_MULTIPK
VALUES (1, 1, '�Խñ�1 - ÷������1');

INSERT INTO BOARD_FILE_MULTIPK
VALUES (1, 2, '�Խñ�1 - ÷������2');
COMMIT;

INSERT INTO BOARD_FILE_MULTIPK
VALUES (2, 1, '�Խñ�2 - ÷������1');
INSERT INTO BOARD_FILE_MULTIPK
VALUES (2, 2, '�Խñ�2 - ÷������2');
COMMIT;

SELECT *
	FROM BOARD_FILE_MULTIPK;

SELECT *
	FROM BOARD_FILE;

-- ���� ���̺� PK �߰�
-- ���� ���̺��� ������ �����ϴ� �۾��̶� ALTER TABLE ������ ����Ѵ�.
-- PK�� ������ �÷��� �����Ϳ� �ߺ����̳� NULL���� ����� �ȴ�.
ALTER TABLE PROFESSOR 
	ADD CONSTRAINT PK_PROFESSOR_PNO PRIMARY KEY(PNO);

-- ���� ���̺� �����÷� PK �߰�
ALTER TABLE SCORE 
	ADD CONSTRAINT PK_SCORE_SNO_CNO PRIMARY KEY(SNO, CNO);

-- PK ����
-- ALTER TABLE ������ �̿�
-- �������Ǹ��� �̿��� ����
ALTER TABLE SCORE
	DROP CONSTRAINT PK_SCORE_SNO_CNO;

-- �������Ǹ� ���� ����
ALTER TABLE PROFESSOR 
	DROP PRIMARY KEY;

-- 1-2. FOREIGN KEY(�ܷ�Ű, ����Ű): �ٸ� ���̺��� PK�� UK�� ������ �÷��� �����Ͽ� ���������� ����
--				 				������ �÷��� �����ϴ� �����͸� ������ �� �ִ� ���������� �����ȴ�.
--								���̺��� ���踦 �ξ��ִ� ��������
--								�����ϴ� ���̺��� �θ� ���̺��� �ǰ� �����ؿ��� ���̺��� �ڽ� ���̺��� �ż�
--							    ���̺��� ���Ӱ��踦 �����Ѵ�. �θ����̺� �����ϴ� �����͸� ���尡��
-- 							    ���迡�� 1:1, 1:N, N:1, N:N �� �پ��� ���°� �����Ѵ�.
-- DEPT_PK1 ���̺��� PK�� ������ DNO�� ������ FK�� ���� EMP_FK1 ���̺� ����
CREATE TABLE EMP_FK1 (
	ENO NUMBER(4),
	ENAME VARCHAR2(20),
	-- FK�� ������ �÷��� ������ Ÿ���� �����ϴ� �÷��� ������ Ÿ�԰� ��ġ�ؾ� �Ѵ�.
	-- DEPT_PK1���̺� DNO�÷��� ������ �����͵鸸 DNO �÷��� ������ �� �ִ�.
	DNO NUMBER(4) CONSTRAINT FK_EMP_DNO
				  REFERENCES DEPT_PK1(DNO)
);

INSERT INTO DEPT_PK1
VALUES (1, '����', '����', 1);
INSERT INTO DEPT_PK1
VALUES (2, '�м�', '����', 2);
COMMIT;

SELECT *
	FROM DEPT_PK1;

INSERT INTO EMP_FK1
VALUES (1, 'ȫ�浿', 1);
INSERT INTO EMP_FK1
VALUES (2, '�Ӳ���', 2);
COMMIT;

-- �θ����̺��� DEPT_PK1�� �������� �ʴ� DNO 3��
-- �ڽ����̺��� EMP_FK1�� DNO�� ����� �� ����.
INSERT INTO EMP_FK1
VALUES (3, '����', 3);

-- �ĺ��� ������ ���� �ʾƼ� �ߺ��� ���� ������ ������ �� �ִ�.
INSERT INTO EMP_FK1
VALUES (3, '����', 1);
COMMIT;

SELECT *
	FROM EMP_FK1;

-- FK�� NULL���� ������ �� �ִ�.
INSERT INTO EMP_FK1
VALUES (4, '���õ', NULL);
COMMIT;

-- FK�� ���谡 �����Ǹ� �θ����̺��� �������� �����̳� ������ �����Ӱ� ������� �ʴ´�.
-- �ڽ����̺��� ����ϰ� �ִ� �θ����̺��� �����Ͱ� ����� �����̳� ������ �����ϴ�.
INSERT INTO DEPT_PK1
VALUES (3, 'ȸ��', '����', 3);
COMMIT;

DELETE FROM DEPT_PK1
	WHERE DNO = 1;

UPDATE DEPT_PK1 
	SET
		DNO = 4
	WHERE DNO = 1;

DELETE FROM DEPT_PK1
	WHERE DNO = 3;
ROLLBACK;

UPDATE DEPT_PK1
	SET
		DNO = 4
	WHERE DNO = 3;
COMMIT;

SELECT *
	FROM DEPT_PK1;

-- �÷��� ��� �����ϰ� FK ����
-- CASCADE �ɼ� �߰��Ͽ� ����, ORACLE������ DELETE CASCADE �ɼǸ� �߰� ����
-- CASCADE �ɼ��� �θ����̺� �������� �����̳� ������ �Ͼ ���
-- �ڽ����̺��� �����͵� �����̳� ������ �Ͼ�� �ɼ�
CREATE TABLE EMP_FK2(
	ENO NUMBER(4),
	ENAME VARCHAR2(20),
	DNO NUMBER(4),
	CONSTRAINT FK_EMP_FK2_DNO FOREIGN KEY(DNO)
		REFERENCES DEPT_PK1(DNO)
		ON DELETE CASCADE
);

INSERT INTO EMP_FK2
VALUES (1, 'ȫ�浿', 1);
INSERT INTO EMP_FK2
VALUES (2, '�Ӳ���', 2);
INSERT INTO EMP_FK2
VALUES (3, '����', 1);
COMMIT;

SELECT *
	FROM EMP_FK2;

DROP TABLE EMP_FK1;

-- ON DELETE CASCADE �ɼǿ� ���ؼ� �θ����̺��� DEPT_PK1�� �����͸� �����ϸ�
-- �����ϰ� �ִ� �ڽ����̺��� EMP_FK2������ �����Ͱ� �����ȴ�.
DELETE FROM DEPT_PK1
	WHERE DNO = 1;
COMMIT;

-- FK�鼭 PK������ �ϴ� �÷��� ���� ���̺� ����
-- COURSE�� CNO�� FK�� �޾ƿ��鼭 PK�� ����
ALTER TABLE COURSE ADD CONSTRAINT PK_SCORE_CNO PRIMARY KEY(CNO);

-- 1:1 ���谡 ������ FK
-- COURSE ���̺��� CNO �����ʹ� �ߺ��� �� ����
-- SCORE_PK1_FK1 ���̺��� CNO �����ʹ� �ߺ��� �� ����.
CREATE TABLE SCORE_PK1_FK1(
	CNO VARCHAR2(8),
	SNO VARCHAR2(8),
	RESULT NUMBER(3),
	CONSTRAINT PK_SCORE_PK1_FK1_CNO PRIMARY KEY(CNO),
	CONSTRAINT FK_SCORE_PK1_FK1_CNO FOREIGN KEY(CNO)
		REFERENCES COURSE(CNO)
);

-- FK�鼭 �ĺ��� ������ �ϱ� ������ �������� �ߺ��� ������ �ʰ� NULL ���� ������ �� ����.
INSERT INTO SCORE_PK1_FK1 
VALUES('1214', '111111', 100);
COMMIT;

INSERT INTO SCORE_PK1_FK1 
VALUES('1214', '222222', 95);

INSERT INTO SCORE_PK1_FK1
VALUES(NULL, '333333', 80);

-- PK�� ���̺� �� ���� ������ �� �� ������
-- FK�� ���� �� ������ �� �ִ�.
-- STUDENT ���̺��� SNO�� �����ϰ�, COURSE�� CNO�� �����ؼ� FK�� �����ϰ�
-- SNO, CNO�� ������ PK�� �����ϴ� ���̺� ST_SCORE_PK_FK�� �����ϼ���.(SNO, CNO�� �÷����� ����)
ALTER TABLE STUDENT ADD CONSTRAINT PK_STUDENT_SNO PRIMARY KEY(SNO); -- PK�� �����Ϸ��� ������ �ߺ����� ����� �Ѵ�, FK�� PK�� UK�� �����Ǿ�߸� ������ �� �ִ�.

CREATE TABLE ST_SCORE_PK_FK(
	SNO VARCHAR2(8),
	CNO VARCHAR2(8),
	CONSTRAINT PK_ST_SCORE_SNO_CNO PRIMARY KEY(SNO, CNO),
	CONSTRAINT FK_ST_SCORE_SNO FOREIGN KEY(SNO)
		REFERENCES STUDENT(SNO),
	CONSTRAINT FK_ST_SCORE_CNO FOREIGN KEY(CNO)
		REFERENCES COURSE(CNO)
);

-- STUDENT ���̺� SNO�� �����ϴ� �����Ϳ� COURSE ���̺� CNO�� �����ϴ� �����͸� ������ �� �ְ�
-- �������� ������ �ߺ��̸� �ȵǰ� NULL ���� ������� �ʴ� ���̺�
INSERT INTO ST_SCORE_PK_FK
VALUES('913901', '1211');
INSERT INTO ST_SCORE_PK_FK
VALUES('913901', '1212');

COMMIT;

INSERT INTO ST_SCORE_PK_FK
VALUES(NULL, '1211');
INSERT INTO ST_SCORE_PK_FK
VALUES('913901', NULL);

INSERT INTO ST_SCORE_PK_FK
VALUES('913901', '9123');

INSERT INTO ST_SCORE_PK_FK
VALUES('123456', '1211');

-- 1�� 1 ����
-- �θ����̺� �����ϴ� �����Ͱ� �ڽ����̺��� �ϳ��� ������ �� �ִ� ����
CREATE TABLE MEMBER(
    ID NUMBER(2),
    USERNAME VARCHAR2(100),
    PASSWORD VARCHAR2(100),
    CONSTRAINT PK_USER_ID PRIMARY KEY(ID)
);

CREATE TABLE MEMBER_DETAIL(
    ID NUMBER(9),
    NICKNAME VARCHAR2(100),
    TELNUM VARCHAR2(100),
    EMAIL VARCHAR2(100),
    CONSTRAINT PK_MEMBER_DETAIL_ID PRIMARY KEY(ID),
    CONSTRAINT FK_MEMBER_DETAIL_ID FOREIGN KEY(ID)
        REFERENCES MEMBER(ID)    
);

INSERT INTO MEMBER
VALUES (1, 'bit', '!dkdlxl1234');
COMMIT;

INSERT INTO MEMBER_DETAIL
VALUES (1, 'bitcamp', '0101111111', 'bit@bit.COM');

INSERT INTO MEMBER_DETAIL
VALUES (1, 'bit1111', '0102222222','bit11@bit.COM');

SELECT M.ID
     , M.USERNAME
     , M.PASSWORD
     , MD.NICKNAME
     , MD.TELNUM
     , MD.EMAIL
     FROM MEMBER M
     JOIN MEMBER_DETAIL MD
       ON M.ID = MD.ID
     WHERE M.ID = 1;

-- 1�� N����, N�� 1����: �θ����̺� �����ϴ� �����Ͱ� �ڽ����̺� ������ �����ϴ� ����
 DROP TABLE BOARD;
 
 CREATE TABLE BOARD(
    BOARD_ID NUMBER(10),
    BOARD_TITLE VARCHAR2(1000),
    BOARD_CONTENT VARCHAR2(2000),
    CONSTRAINT PK_BOARD_BOARD_ID PRIMARY KEY(BOARD_ID)
 );

CREATE TABLE BOARD_FILE_FK(
    BOARD_ID NUMBER(10),
    FILE_ID NUMBER(10),
    FILE_NAME VARCHAR2(1000),
    CONSTRAINT PK_BOARD_FILE_FK_FILE_ID PRIMARY KEY(FILE_ID),
    CONSTRAINT FK_BOARD_FILE_FK_BOARD_ID FOREIGN KEY(BOARD_ID)
        REFERENCES BOARD(BOARD_ID)
);

INSERT INTO BOARD
VALUES (1, 'AAAA', 'AAAA');
COMMIT;

INSERT INTO BOARD_FILE_FK
VALUES (1, 1, '�Խñ�1 - ÷������1');
INSERT INTO BOARD_FILE_FK
VALUES (1, 2, '�Խñ�1 - ÷������2');
INSERT INTO BOARD_FILE_FK
VALUES (1, 3, '�Խñ�1 - ÷������3');
COMMIT;

SELECT B.BOARD_ID
     , B.BOARD_TITLE
     , B.BOARD_CONTENT
     , BF.FILE_ID
     , BF.FILE_NAME
     FROM BOARD B
     JOIN BOARD_FILE_FK BF
       ON B.BOARD_ID = BF.BOARD_ID;
   
-- N�� N����(�ٴ�� ����): �� ���� ���̺��� �����Ͱ� �������� �����ϴ� N�� N���谡 ���ε� ����
-- �߰��� ���ε� ���̺��� �ʿ��ϴ�
CREATE TABLE LECTURE(
    LECTURE_ID NUMBER(9),
    LECTURE_NAME VARCHAR2(30),
    CONSTRAINT PK_LECTURE_LECTURE_ID PRIMARY KEY(LECTURE_ID)
);
  
CREATE TABLE STUD(
    STUDENT_ID NUMBER(9),
    STUDENT_NAME VARCHAR2(30),
    CONSTRAINT PK_STUD_STUDENT_ID PRIMARY KEY(STUDENT_ID)
);

-- LECTURE���̺�� STUD���̺��� N�� N����� ���ε� ���̺�
CREATE TABLE LECTURE_STUDENT(
    LECTURE_ID NUMBER(9),
    STUDENT_ID NUMBER(9),
    CONSTRAINT PK_LECTURE_STUDENT_IDS PRIMARY KEY(LECTURE_ID, STUDENT_ID),
    CONSTRAINT FK_LECTURE_STUDENT_L_ID FOREIGN KEY(LECTURE_ID)
        REFERENCES LECTURE(LECTURE_ID),
    CONSTRAINT FK_LECTURE_STUDENT_S_ID FOREIGN KEY(STUDENT_ID)
        REFERENCES STUD(STUDENT_ID)
);

INSERT INTO LECTURE
VALUES(1, '�ڹ�');
INSERT INTO LECTURE
VALUES(2, '����Ŭ');
COMMIT;


INSERT INTO STUD
VALUES(1, '���õ');
INSERT INTO STUD
VALUES(2, 'ȫ�浿');
INSERT INTO STUD
VALUES(3, '����');
COMMIT;

INSERT INTO LECTURE_STUDENT
VALUES (1, 1);
INSERT INTO LECTURE_STUDENT
VALUES (1, 2);
INSERT INTO LECTURE_STUDENT
VALUES (1, 3);

INSERT INTO LECTURE_STUDENT
VALUES (2, 1);
COMMIT;

SELECT LS.LECTURE_ID
     , L.LECTURE_NAME
     , LS.STUDENT_ID
     , S.STUDENT_NAME
     FROM LECTURE_STUDENT LS
     JOIN LECTURE L
       ON LS.LECTURE_ID = L.LECTURE_ID
     JOIN STUD S
      ON LS.STUDENT_ID = S.STUDENT_ID;

-- 1-3. UNIQUE KEY(UK): �ߺ����� ������� �ʴ� ��������(������ ���� ����)
--                      PK�� �ߺ��� �Ұ�, INDEX, NOT NULL ���������� ������ �ִ� �ݸ�
--                      UK�� �ߺ��� ���常 �Ұ��� ������ �ִ� ���� �����̴�. �׷��� NULL ���� ����ȴ�.
CREATE TABLE EMP_UK(
    ENO NUMBER(4) CONSTRAINT PK_EMP_ENO PRIMARY KEY,
    ENAME VARCHAR2(20) CONSTRAINT UK_EMP_UK_ENAME UNIQUE
);

-- UK�� �ߺ��� ���� ������ �����ϴ� ��������
INSERT INTO EMP_UK 
VALUES (1, '���õ');
COMMIT;
INSERT INTO EMP_UK 
VALUES (2, '���õ');

INSERT INTO EMP_UK 
VALUES (2, '���õB');
COMMIT;

-- UK�� ������ �÷����� NULL���� ����ǰ� NULL���� �ߺ��� ���ȴ�.
INSERT INTO EMP_UK
VALUES (3, NULL);
INSERT INTO EMP_UK
VALUES (4, NULL);
COMMIT;

SELECT *
    FROM EMP_UK;

-- ������ ��� �����ϰ� UK ����
CREATE TABLE DEPT_UK(
    DNO NUMBER(4),
    DNAME VARCHAR2(20),
    CONSTRAINT PK_DEPT_UK_DNO PRIMARY KEY(DNO),
    CONSTRAINT UK_DEPT_UK_DNAME UNIQUE(DNAME)
);

-- ���� ���̺� UK �߰�
ALTER TABLE PROFESSOR 
    ADD CONSTRAINT UK_PROFESSOR_PNO UNIQUE(PNO);

-- UK ����
-- �������� �����θ� ���� ������
ALTER TABLE DEPT_UK 
    DROP CONSTRAINT UK_DEPT_UK_DNAME;

-- 1-4. CHECK: �÷��� ����Ǵ� �����Ϳ� ������ �޾��ִ� ��������
--             CHECK�� �����Ǿ� �ִ� �÷��� �����ʹ� CHECK�� ������ ���ǿ� �����ϴ� �����͸� ����� �� �ִ�.
CREATE TABLE EMP_CHK(
    ENO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR(20) UNIQUE,
    SAL NUMBER(5, 0) CHECK(SAL >= 3000),
    COMM NUMBER(5, 0),
    CONSTRAINT CHK_EMP_CHK_COMM CHECK(COMM BETWEEN 100 AND 1000)
);

-- CHECK ���ǿ� �´� ������ ����
INSERT INTO EMP_CHK
VALUES (1, 'ȫ�浿', 3000, 300);
INSERT INTO EMP_CHK
VALUES (2, '���õ', 3100, 150);
COMMIT;

-- CHECK ���ǿ� ���� �ʴ� �������� ����
INSERT INTO EMP_CHK
VALUES (3, '����', 2800, 300);
INSERT INTO EMP_CHK
VALUES (4, '�Ӳ���', 4500, 90);

-- 1-5. NOT NULL: �÷��� �����ͷ� NULL�� ������� �ʰ� �����ִ� ��������
CREATE TABLE EMP_NOT_NULL (
    ENO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(20) UNIQUE NOT NULL,
    JOB VARCHAR2(10) CHECK(JOB = '����') NOT NULL,
    DNO NUMBER(4) REFERENCES DEPT_PK1(DNO) NOT NULL 
);

DROP TABLE EMP_NOT_NULL;

-- NOT NULL ���������� ������ �÷��� �����ͷ� NULL �����ϸ� ������ �߻��Ѵ�.
INSERT INTO EMP_NOT_NULL 
VALUES (1, '���õ', NULL);
INSERT INTO EMP_NOT_NULL 
VALUES (2, NULL, '����');

-- ���� ���̺��� NOT NULL �������� �߰�
ALTER TABLE PROFESSOR 
    MODIFY PNO VARCHAR2(8) NOT NULL;

-- 1-6. DEFAULT: Ư�� �÷��� �����Ͱ� NULL�� ���ų� ������ �ʾ��� ���� ����ؼ� �⺻���� �����س��� ��������
-- DBMS���� DEFAULT�� NOT NULL�� ���� ���̰� ������
-- �⺻������ DEFAULT ���������� ���� �����Ǿ� �ϴ� DBMS�� ��κ��̴�.
CREATE TABLE EMP_DEFAULT(
    ENO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(20) NOT NULL UNIQUE,
    JOB VARCHAR2(10) DEFAULT '����' NOT NULL,
    HDATE DATE DEFAULT SYSDATE NOT NULL,
    DNO NUMBER(4) DEFAULT 0 NOT NULL
);

-- DEFAULT ���� ������ �÷��� ������ ������ �÷��鿡 ������ ����
INSERT INTO EMP_DEFAULT(ENO, ENAME)
VALUES (1, '���õ');
COMMIT;

SELECT *
    FROM EMP_DEFAULT;

-- 1-7. ���������� ��� �߰��� CREATE TABLE ����
-- FNO(PK, NUMBER(10)), FNAME(VARCHAR2(50)), NOT NULL, UNIQUE),
-- LOC(VARCHAR2(10), DEFAULT '����', NOT NULL) �÷��� ���� FACTORY1 �����ϼ���.

CREATE TABLE FACTORY1 (
    FNO NUMBER(10) PRIMARY KEY,
    FNAME VARCHAR2(50) NOT NULL UNIQUE,
    LOC VARCHAR2(10) DEFAULT '����' NOT NULL
);


-- GNO(NUMBER(5), PK), GNAME(VARCHAR2(50), NOT NULL), PRI(NUMBER(5), DEFAULT 10000)
-- FNO(NUMBER(10), FK(FACTORY1�� FNO), NOT NULL) �÷��� ���� GOODS1�� �����ϼ���.
CREATE TABLE GOODS1 (
    GNO NUMBER(5),
    GNAME VARCHAR2(50) NOT NULL,
    PRI NUMBER(5) DEFAULT 10000,
    FNO NUMBER(10) /*REFERENCES FACTORY1(FNO)*/ NOT NULL,
    CONSTRAINT PK_GOODS1_GNO PRIMARY KEY (GNO),
    CONSTRAINT FK_GOODS1_FNO FOREIGN KEY (FNO)
        REFERENCES FACTORY1(FNO)
);

-- PNO(NUMBER(6), PK), GNO(NUMBER(5), FK(GOODS1�� GNO), NOT NULL),
-- PRICE(NUMBER(5), DEFAULT 7000), PDATE(DATE, DEFAULT SYSDATE, NOT NULL)
-- �÷��� ���� PROD1 ���̺��� �����ϼ���.
CREATE TABLE PROD1 (
    PNO NUMBER(6),
    GNO NUMBER(5) /*REFERENCES GOODS1(GNO)*/ NOT NULL,
    PRICE NUMBER(5) DEFAULT 7000,
    PDATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT PK_PROD1_PNO PRIMARY KEY(PNO),
    CONSTRAINT FK_PROD1_GNO FOREIGN KEY(GNO)
        REFERENCES GOODS1(GNO)
);








   































