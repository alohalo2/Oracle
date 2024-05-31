-- 1. �߰����� ����
-- 1-1. NATURAL JOIN: ���������� ������� �ʾƵ� �ڵ����� ���ε� �÷��� �����ؼ� ������ ���ִ� ����
-- ���εǴ� �÷��� ���̺��� ��Ī�� ����� �� ����.
-- �л��� �л���ȣ, �л��̸�, �����ȣ, �⸻��� ���� ��ȸ
-- ���� JOIN ���
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , SC.RESULT
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	ORDER BY ST.SNO, SC.CNO;
	
-- NATURAL JOIN ���
SELECT SNO
	 , ST.SNAME
	 , SC.CNO
	 , SC.RESULT
	FROM STUDENT ST
	NATURAL JOIN SCORE SC
	ORDER BY SNO, SC.CNO;

-- NATURAL JOIN�� �̿��ؼ� �л���ȣ, �л��̸�, �ش��л��� �⸻��� ������� ��ȸ
SELECT SNO
	 , ST.SNAME
	 , AVG(SC.RESULT)
	FROM STUDENT ST
	NATURAL JOIN SCORE SC
	GROUP BY SNO, ST.SNAME
	ORDER BY SNO;

SELECT SNO
	 , AVG(RESULT)
	FROM SCORE
	GROUP BY SNO
	ORDER BY SNO;

-- NATURAL JOIN�� �̿��ؼ� �ִ�޿��� 4000���� �̻��� �μ���ȣ, �μ��̸�, �ִ�޿� ��ȸ
SELECT DNO
	 , D.DNAME 
	 , MAX(E.SAL)
	FROM EMP E
	NATURAL JOIN DEPT D
	GROUP BY DNO, D.DNAME
	HAVING MAX(E.SAL) >= 4000
	ORDER BY DNO;
	
-- NATURAL JOIN�� ���̺����� �� �𸣴� �����ڰ� ������ ���� �� �����ϰ� ���� �� �ְ�
-- ���ε� �÷��� ������ CROSS JOIN �Ͼ�� ������ ���� ���Ǵ� JOIN ����� �ƴϴ�.
SELECT ST.SNO
	 , ST.SNAME
	 , P.PNO
	 , P.PNAME
	FROM STUDENT ST
	NATURAL JOIN PROFESSOR P;

-- 1-2. JOIN ~ USING
-- USING ���� ���ε� �÷��� �Ұ�ȣ�� ��� ���. ���ε� �÷��� ���̺� ��Ī(�ĺ���)�� ����� �� ����.
-- �л��� �л���ȣ, �л��̸�, �ش� �л��� �⸻��� ������ ���
SELECT SNO
	 , ST.SNAME
	 , AVG(SC.RESULT)
	FROM STUDENT ST
	JOIN SCORE SC
	USING (SNO)
	GROUP BY SNO, ST.SNAME
	ORDER BY SNO;

-- ������ 3������ ������ �����ȣ, �����̸�, ����, ������ȣ, �����̸� ��ȸ(JOIN ~ USING �� ���)
SELECT C.CNO
	 , C.CNAME
	 , C.ST_NUM
	 , PNO
	 , P.PNAME
	FROM COURSE C
	JOIN PROFESSOR P
--	  ON C.PNO = P.PNO
	USING(PNO)
	WHERE C.ST_NUM = 3;

-- 2. �����÷� IN��
-- �������� �÷��� ���� �������� �����͸� ���ϰ� ���� �� ����ϴ� ����
-- (�÷�1, �÷�2) IN ((������1-1, ������2-1), (������1-2, ������2-2), ...., (������1-N, ������2-N))
-- => (�÷�1 = ������1-1 AND �÷�2 = ������2-1) OR (�÷�1 = ������1-2 AND �÷�2 = ������2-2) OR .... 
-- OR (�÷�1 = ������1-N AND �÷�2 = ������2-N)
-- �μ���ȣ�� 10�̸鼭 ������ �м��̳� ������ ����� �����ȣ, ����̸�, ����, �μ���ȣ ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , DNO
	FROM EMP
	WHERE DNO = '10'
	  AND JOB IN ('����', '�м�');
	 
SELECT ENO
	 , ENAME
	 , JOB
	 , DNO
	FROM EMP
	WHERE (DNO, JOB) IN (('10', '����'), ('10', '�м�'));

SELECT ENO
	 , ENAME
	 , JOB
	 , DNO
	FROM EMP
	WHERE (DNO = '10' AND JOB = '����') 
	   OR (DNO = '10' AND JOB = '�м�');

-- ���� �÷� IN���� ����ؼ� ȭ�а� 1�г� �л��̰ų� �����а� 3�г��� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE (MAJOR, SYEAR) IN (('ȭ��', 1), ('����', 3));
	  
-- ���� �÷� IN���� ����ؼ� �μ���ȣ�� 01�̳� 02�鼭 �����ȣ�� 0001�� ����� �����ȣ, ����̸�, �����ȣ, �μ���ȣ ��ȸ
SELECT ENO
	 , ENAME
	 , MGR
	 , DNO
	FROM EMP
	WHERE (DNO, MGR) IN (('01', '0001'), ('02', '0001'));
	  
-- ���� �÷� IN���� ����ؼ� �⸻��� ������ ����� 48���̻��� ������ �����ȣ, �����̸�, �⸻��� �������, ������ȣ, �����̸� ��ȸ
SELECT SC.CNO
	 , C.CNAME
	 , AVG(SC.RESULT)
	 , C.PNO
	 , P.PNAME
	FROM SCORE SC
	JOIN COURSE C
	  ON SC.CNO = C.CNO 
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO 
	GROUP BY SC.CNO, C.CNAME, C.PNO, P.PNAME 
	HAVING AVG(SC.RESULT) >= 48;
	
SELECT SC.CNO
	 , C.CNAME
	 , AVG(SC.RESULT)
	 , C.PNO
	 , P.PNAME
	FROM SCORE SC
	JOIN COURSE C
	  ON SC.CNO = C.CNO 
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO 
	GROUP BY SC.CNO, C.CNAME, C.PNO, P.PNAME 
	HAVING (SC.CNO, C.PNO) IN (
		SELECT S.CNO
			 , CO.PNO
			FROM SCORE S
			JOIN COURSE CO
			  ON S.CNO = CO.CNO
			GROUP BY S.CNO, CO.PNO
			HAVING AVG(S.RESULT) >= 48
	);
	
-- 3. WITH
-- SELECT ������ ���۵Ǳ� ���� �������̺��� ���� �����ϴ� ���
-- SELECT���� ���۵ǰ� �������̺��� �����ϴ� ������������ �ӵ��� ������ ������ ���� ���ȴ�.
-- ���������� �ʹ� ���� ����ϸ� ������ �ӵ��� �����ϰ� �������� ������ WITH ���� ������ �� ����ؾ� �Ѵ�.
-- SELECT���� ���� WITH���� �������̺��� �����Ѵ�.
WITH DNO10 AS(
	SELECT ENO
		 , ENAME
		 , DNO
		 FROM EMP
		 WHERE DNO = '10'
)
SELECT DNO10.*
	 , D.DNAME
	 FROM DNO10
	 JOIN DEPT D
	   ON DNO10.DNO = D.DNO;
	  
-- �⸻��� ������ ����� 50�� �̻��� �����ȣ, �����̸�, �⸻��� ������ ��������� ������ 
-- �������̺� OVER50�� WITH���� �����ϰ� �ش� ������ �����ϴ� �л����� �л� ������ȸ
-- �����ȣ, �����̸�, ���� �⸻��� ������ �������, �л���ȣ, �л��̸� ��ȸ
WITH OVER50 AS (
	SELECT SC.CNO
		 , C.CNAME
		 , AVG(SC.RESULT) AS AVG_RESULT
		 FROM COURSE C
		 JOIN SCORE SC
		   ON C.CNO = SC.CNO
		 GROUP BY SC.CNO, C.CNAME
		 HAVING AVG(SC.RESULT) >= 50
) 
SELECT OVER50.CNO
	 , OVER50.CNAME
	 , OVER50.AVG_RESULT
	 , ST.SNO
	 , ST.SNAME
	 FROM OVER50
	 JOIN SCORE SSC
	   ON SSC.CNO = OVER50.CNO
	 JOIN STUDENT ST
	   ON SSC.SNO = ST.SNO;
	  
-- WITH ���� �� ���̻��� �������̺��� ���� ���� ,�� �����ؼ� �����.
WITH
	DNO10 AS(
		SELECT ENO
			 , ENAME
			 , DNO
			 FROM EMP
			 WHERE DNO = '10'
	),
	JOBDEV AS (
		SELECT ENO
			 , ENAME
			 , JOB
			 FROM EMP
			 WHERE JOB = '����'
	),
	OVER3000 AS (
		SELECT ENO
			 , ENAME
			 , SAL
			 FROM EMP
			 WHERE SAL >= 3000
	)
SELECT DNO10.ENO
	 , DNO10.ENAME
	 , DNO10.DNO
	 , JOBDEV.JOB
	 , OVER3000.SAL
	 FROM DNO10
	 JOIN JOBDEV
	   ON DNO10.ENO = JOBDEV.ENO
	 JOIN OVER3000
	   ON DNO10.ENO = OVER3000.ENO;
	  
-- ȭ�а� 1�г� �л��� �л���ȣ, �л��̸�, �г��� ������ �ִ� �������̺� CHMSTU��
-- ����� ȭ���� ���Ե� ������ �����ȣ, �����̸�, �⸻��� ����, �л���ȣ�� ������ �������̺� CHMRES�� WITH ���� �����ϰ�
-- ȭ�а� 1�г� �л��� �л���ȣ, �л��̸�, �л��� �⸻��� ������ �������(�Ҽ��� ��° �ڸ����� ǥ��)�� ��ȸ
WITH 
	CHMSTU AS(
		SELECT ST.SNO
			 , ST.SNAME
			 , ST.SYEAR
			FROM STUDENT ST
			WHERE MAJOR = 'ȭ��'
			  AND SYEAR = 1
	),
	CHMRES AS (
		SELECT C.CNO
			 , C.CNAME
			 , SC.RESULT 
			 , ST.SNO
			 FROM COURSE C
			 JOIN SCORE SC
			   ON C.CNO = SC.CNO
			 JOIN STUDENT ST
			   ON SC.SNO = ST.SNO
			 WHERE C.CNAME LIKE '%ȭ��%'
	)
SELECT CHMSTU.SNO
	 , CHMSTU.SNAME
	 , ROUND(AVG(CHMRES.RESULT), 2)
	 FROM CHMSTU
	 JOIN CHMRES
	   ON CHMSTU.SNO = CHMRES.SNO
	 GROUP BY CHMSTU.SNO, CHMSTU.SNAME
	 ORDER BY CHMSTU.SNO;
	 
	   
	




























