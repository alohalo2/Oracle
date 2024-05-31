-- 1. DDL(DATA DEFINITION LANGUAGER): ������ ����
-- �����͸� �����ϱ� ����  ��ü���� �����ϱ� ���� ��ɾ�
-- 1-1. CTREATE: ��ü�� �����ϱ� ���� ��ɾ�
-- CREATE ��ü��(TABLE, USER, INDEX, SEQUENCE....) ��ü�Ǻ�Ī(���̺��, ������, �ε�����, ��������....)
-- �ٸ� ���̺��� �����Ͽ� ���̺� ����
CREATE TABLE STUDENT_COPY2
	AS SELECT * FROM STUDENT;
	
SELECT *
	FROM STUDENT_COPY2;
	
-- ���ϴ� ��� �÷���� ������ ������ ���� �ִ�.
-- �÷��� Ÿ���� SELECT �������� ��ȸ�ؿ��� �������� Ÿ�԰� �������� ������ �ٲ� �� ����.
-- ������ �����ȣ, �����̸�, ��米����ȣ, ��米���̸�, ���� �⸻��� ������ ����� ����� ���̺� ����
CREATE TABLE COURSE_PROFESSOR_AVGRES(COURSE_NO, COURSE_NAME, PRO_NO, PRO_NAME, AVG_RESULT)
	AS SELECT SC.CNO
			, C.CNAME
			, C.PNO
			, P.PNAME
			, ROUND(AVG(SC.RESULT), 2)
			FROM COURSE C
			JOIN SCORE SC
			  ON C.CNO = SC.CNO
			JOIN PROFESSOR P
			  ON C.PNO = P.PNO
			GROUP BY SC.CNO, C.CNAME, C.PNO, P.PNAME;

SELECT *
	FROM COURSE_PROFESSOR_AVGRES;
	

-- �л���ȣ, �л��̸�, �л��� �⸻��� ������ �������(�Ҽ��� ��°�ڸ�), �л��� �⸻����� ��������� ����� ������ -- ����Լ� ���� ��κ� ���������� ���������
-- ���̺� ST_AVGRES_GRADE�� �����ϼ���.
-- �߸��� ����
CREATE TABLE ST_AVGRES_GRADE(STUDENT_NO, STUDENT_NAME, AVG_RESULT, GRADE_SCORE)
	AS SELECT ST.SNO
		 	, ST.SNAME
		 	, ROUND(AVG(SC.RESULT), 2)
		 	, GR.GRADE
			FROM STUDENT ST
			JOIN SCORE SC
			  ON ST.SNO = SC.SNO
			JOIN SCGRADE GR
			  ON SC.RESULT BETWEEN GR.LOSCORE AND GR.HISCORE
			GROUP BY ST.SNO, ST.SNAME, GR.GRADE;
		
SELECT *
	FROM ST_AVGRES_GRADE;

DROP TABLE ST_AVGRES_GRADE;

CREATE TABLE ST_AVGRES_GRADE(STUDENT_NO, STUDENT_NAME, AVG_RESULT, GRADE_SCORE)
	AS SELECT A.SNO
			, A.SNAME
			, A.AVG_RESULT
			, GR.GRADE
			FROM (
					SELECT ST.SNO
					 	 , ST.SNAME
					 	 , ROUND(AVG(SC.RESULT), 2) AS AVG_RESULT
						FROM STUDENT ST
						LEFT JOIN SCORE SC
						  ON ST.SNO = SC.SNO
						GROUP BY ST.SNO, ST.SNAME
			) A
			JOIN SCGRADE GR
			  ON A.AVG_RESULT BETWEEN GR.LOSCORE AND GR.HISCORE;
			 
SELECT *
	FROM ST_AVGRES_GRADE; -- 7�� ������ ��������, D�� C ��� ���̿� �������� ������

-- 1-2. ALTER: ��ü�� �����ϰų� ������ �� ����ϴ� ��ɾ�
-- ALTER ��ü�� (TABLEM, USER, SESSION, INDEX, SEQUENCE...) ��ü�Ǻ�Ī(���̺��, �ε�����, ������...)
--   �۾�����(SET, ADD, MODIFY, DROP...)
-- ADD: ���̺� �÷��߰�
-- ADD '�߰��� �÷��� �̸�' '�÷��� ������ Ÿ��'
ALTER TABLE EMP_DNO30 ADD ADDR VARCHAR2(1000);


-- RENAME: ���̺� �÷��� �̸� ����
-- RENAME COLUMN '���� ������� �÷���' TO '������ �÷���'
ALTER TABLE EMP_DNO30 RENAME COLUMN ADDR TO ADDRESS;

-- MODIFY: ���̺� �÷��� ������Ÿ���� ����
-- MODIFY '������ Ÿ���� ������ �÷���' '������ ������ Ÿ��'
-- ������ Ÿ���� ������ �÷��� �����Ͱ� ����־�� �Ѵ�.
ALTER TABLE EMP_DNO30 MODIFY COMM VARCHAR2(10);

ALTER TABLE EMP_DNO30 MODIFY ADDRESS NUMBER(10);

-- DROP: ���̺� �÷��� ����
-- DROP COLUMN '������ �÷���'
-- �÷��� ����Ǿ� �ִ� �����͵鵵 �Բ� �����ȴ�.
ALTER TABLE EMP_DNO30 DROP COLUMN ADDRESS;

-- 1-3. DROP: �����ͺ��̽��� ��ü�� �����ϴ� ��ɾ�
-- DROP ��ü��(TABLE, INDEX, SEQUENCE, USER, ...) ��ü�� ��Ī(���̺��, ������, �ε�����, ��������, ...)
DROP TABLE COURSE_PROFESSOR;

-- DROP TABLE ��ɾ�� ������ ���̺��� TIMESTAMP�� �̿��ؼ� �츱�� ����.
-- ENTERPRISE ���������� FLASHBACK�̶�� ����� �����ؼ� DROP ���̺� �츱 ���� �ִ�.
SELECT *
	FROM COURSE_PROFESSOR cp 
	AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '5' MINUTE);
	
-- TIMESTAMP�� DELETE �������� ������ ������ ����
DELETE FROM EMP_DNO30;
COMMIT;

SELECT * FROM EMP_DNO30;

INSERT INTO EMP_DNO30;
SELECT *
	FROM EMP_DNO30
	AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '5' MINUTE);
COMMIT;

-- 1-4. RENAME: ��ü�� �̸��� ����
-- RENAME '���� ��ü�� ��Ī' TO '������ ��ü�� ��Ī'
RENAME EMP_DNO30 TO EMP_DNO;

SELECT *
	FROM EMP_DNO;

-- 1-5. TRUNCATE: ���̺��� �����͸� ����
-- TRUNCATE TABLE '���̺��'
-- WHERE ���� ����� �� ��� ��� �����͸� �����Ѵ�.
-- TRUNCATE�� DDL�̱� ������ Ʈ������� �ٷ� ����Ǽ� ROLLBACK���� �۾��� ����� �� ����.
TRUNCATE TABLE EMP_DNO;


















