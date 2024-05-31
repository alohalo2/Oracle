-- 1. DML(DATA MANIPULATION LANGUAGE): ������ ���� ���
-- �����͸� ����, ���� �����ϴ� ���� INSERT INTO, UPDATE SET, DELETE FROM�� �����Ѵ�.
-- DML�� Ʈ������� �Ϸ��ϱ� ���ؼ� �׻� COMMIT�̳� ROLLBACK�� �����Ѵ�.
-- 1-1. INSERT INTO: ���̺� �����͸� �����ϴ� ��ɾ�
-- �Ϻ� �÷��� ���� �����͸� ����
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9997', '����', '����', SYSDATE);
COMMIT;

SELECT *
	FROM EMP;
	
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9996', '�Ӳ���', '����', SYSDATE);
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9995', 'ȫ�浿', 'ȸ��', SYSDATE);
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9994', '������', '����', SYSDATE);
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9993', '������', '�濵', SYSDATE);
-- COMMIT�� �߻��� �۾��� ���ؼ��� ROLLBACK���� ����� �� ����.
ROLLBACK;

-- INSERT INTO �� ������ �÷��� ������ Ÿ�Կ� �´� �����͸� �Է��ؾ� �Ѵ�.
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9997', '����', '����');
INSERT INTO EMP(SAL) VALUES('����������������');
-- VARCHAR Ÿ���� ���� ���� NUMBER Ÿ������ ����ȯ�� �Ͼ�鼭 ����ȴ�.
INSERT INTO EMP(SAL) VALUES('123897');

-- ��� �÷��� �����͸� ������ ���� �÷������� �����ص� �ȴ�.
INSERT INTO EMP(ENO, ENAME, JOB, MGR, HDATE, SAL, COMM, DNO)
	VALUES ('9996', '�Ӳ���', 'ȸ��', '0001', SYSDATE, 4000, 300, '10');

INSERT INTO EMP VALUES ('9995', '������', 'ȸ��', '0201', SYSDATE, 3700, 280, '20');

COMMIT;

-- �ٷ��� �����͸� SELECT ������ �̿��ؼ� ����
CREATE TABLE EMP_DNO30(
	ENO VARCHAR2(4),
	ENAME VARCHAR2(20),
	JOB VARCHAR2(10),
	MGR VARCHAR2(4),
	HDATE DATE,
	SAL NUMBER(5, 0),
	COMM NUMBER(5, 0),
	DNO VARCHAR2(2)
);

-- DNO�� 30�� ��� ����� EMP ���Ϻ��� ��ȸ�ؼ� EMP_DNO30�� ����
INSERT INTO EMP_DNO30
SELECT *
	FROM EMP
	WHERE DNO = '30';
COMMIT;

SELECT *
	FROM EMP_DNO30;

-- SELECT ������ �̿��ؼ� �ٷ��� �����͸� �����ϴµ� Ư�� �÷��� �����͸� ����
-- DNO�� 10�� ����� �����ȣ, ����̸��� EMP ���̺��� ��ȸ�ؼ� EMO_DNO30 ���̺� ����
INSERT INTO EMP_DNO30(ENO, ENAME)
SELECT ENO 
	 , ENAME 
	 FROM EMP
	 WHERE DNO = '10';
COMMIT;

INSERT INTO EMP_DNO30(ENO, ENAME)
SELECT DNO
	 , DNAME
	 FROM DEPT
	 WHERE LOC = '����';
COMMIT;

/*DROP TABLE COURSE_PROFESSOR;*/ -- TABLE ����

CREATE TABLE COURSE_PROFESSOR(
	CNUM VARCHAR2(8),
	COURSE_NAME VARCHAR2(20),
	ST_NUM NUMBER(1, 0),
	PNUM VARCHAR2(8),
	PROFESSOR_NAME VARCHAR2(20)
);

-- ��� ������ �����ȣ, �����̸�, ����, ����ϴ� ������ ������ȣ, �����̸� COURSE_PROFESSOR ����
-- ��米���� ���� ������ ��米����ȣ�� �̸��� NULL�� ����

INSERT INTO COURSE_PROFESSOR
SELECT C.CNO
	 , C.CNAME
	 , C.ST_NUM 
	 , P.PNO
	 , P.PNAME
	 FROM COURSE C
	 LEFT JOIN PROFESSOR P
	   ON C.PNO = P.PNO; 
COMMIT;

SELECT *
	FROM COURSE_PROFESSOR;

-- 1-2. UPDATE SET: �����͸� �����ϴ� ��ɾ�
-- WHERE ���� ������� ������ ��� �����Ͱ� �����ȴ�.

UPDATE EMP_DNO30 
	SET MGR = '0002';

COMMIT;

SELECT *
	FROM EMP_DNO30;

-- WHERE ���� Ư�� �����͸� ����
-- EMP_DNO30���̺��� ENO 2007�� ����� �޿��� 3100���� ����
UPDATE EMP_DNO30 
	SET 
		SAL = 3100
	WHERE ENO = '2007';
COMMIT;

-- �������� �÷� �����͸� �� ���� ������ ���� ������ �÷��� ,�� ��� ����
-- EMP_DNO30���̺��� ENO�� 3004�� ����� ������ �濵���� MGR�� 2003���� HDATE�� ���ó�¥�� SAL�� 5000����
-- COMM�� 500���� ����
UPDATE EMP_DNO30 
	SET 
		JOB = '�濵',
		MGR = '2003',
		HDATE = SYSDATE,
		SAL = 5000,
		COMM = 500
	WHERE ENO = '3004';
COMMIT;

DELETE  FROM EMP_DNO30;
COMMIT;

INSERT INTO EMP_DNO30
SELECT *
	FROM EMP;
COMMIT;

-- EMP_DNO30 ���̺��� DNO�� 20, 30�μ��� 60�μ��� �����ϰ�
-- �ش� �μ��� ������� ���ʽ��� 50%�λ�
UPDATE EMP_DNO30 
	SET
		DNO = '60',
		COMM = COMM * 1.5
	WHERE DNO IN (20,30);
COMMIT;

SELECT *
	FROM EMP_DNO30;

-- ���������� �̿��� ������ ����
-- SET ���� ���������� ����� ������ �÷��� ������ŭ ()���� �÷��� �����ϰ� = ������ ���������� �ۼ��Ѵ�.
-- ()�� ���� �÷��� ������ Ÿ���� ���������� ����� �������� �÷������� Ÿ���� ��ġ�ؾ� �Ѵ�.
-- ���������� ����� �� �ุ ��ȸ�ž� �Ѵ�.

CREATE TABLE DEPT_COPY1
	AS SELECT * FROM DEPT;

-- DEPT_COPY1 ���̺��� DNO�� 20,30�� �μ��� 50�μ��� ����
UPDATE DEPT_COPY1 
	SET
		(DNO, DNAME, LOC, DIRECTOR) = (
										SELECT DNO 
											 , DNAME 
											 , LOC 
											 , DIRECTOR 
											 FROM DEPT
											 WHERE DNO = '50'
									   )
	WHERE DNO IN ('20', '30');
COMMIT;

SELECT * 
	FROM DEPT_COPY1;

-- DEPT_COPY1 ���̺��� DNO�� 40�� �μ��� DIRECTOR�� 
-- EMP���̺��� �ְ�޿��� �޴� ������� ����
UPDATE DEPT_COPY1 
	SET 
		DIRECTOR = (
						SELECT ENO
							FROM EMP 
							WHERE SAL = (
									SELECT MAX(SAL)
										FROM EMP
							)
				 	)
	WHERE DNO = '40';
COMMIT;

SELECT * 
	FROM DEPT_COPY1;

-- 1-3. DELETE FROM: �����͸� �����ϴ� ��ɾ�
-- �� ������ �����͸� �����ϱ� ������ �÷��� ������ �ʿ䰡 ����.
-- WHERE ���� ������� ������ ���̺��� ��� �����͸� �����Ѵ�.
DELETE FROM DEPT_COPY1;
COMMIT;

-- WHERE ���� Ư�� �����͸� ����
DELETE FROM EMP_DNO30
	WHERE DNO IN ('01','10');
COMMIT;

SELECT *
	FROM EMP_DNO30;

-- WHERE ���� ���������� Ư�� �����͸� ������ ���� �ִ�.
DELETE FROM EMP_DNO30
	WHERE ENO IN (
		SELECT ENO
			FROM EMP_DNO30
			WHERE SAL >= 4000
	);
COMMIT;

CREATE TABLE STUDENT_COPY1
	AS SELECT * FROM STUDENT;

-- STUDENT_COPY1 ���̺��� �⸻��� ������ ����� 60�� ������ �л��� ��� ����
DELETE FROM STUDENT_COPY1
	WHERE SNO IN (
		SELECT SNO -- ��ȸ�� �����͸� �� �����ϱ�, ���ǿ� �ش��ϴ� ������ �� ��ȸ ��Ͽ� ���� �ʿ�� ����
			FROM SCORE 
			GROUP BY SNO
			HAVING AVG(RESULT) <= 60
	);
COMMIT;

SELECT *
	FROM STUDENT_COPY1; -- 60�� �̻��̰ų� �����Ͱ� ���� �л��鸸 ����
	











