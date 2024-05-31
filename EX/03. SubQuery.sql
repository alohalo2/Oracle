-- 1. SUB QUERY
-- 1-1. ���� �� ��������
-- SELECT, FROM, JOIN, WHERE ������ ��밡���� ��������
-- �۰��������� �������ڰ� ���� �������� ������ȣ, �����̸� ��ȸ
SELECT PNO
	 , PNAME
	FROM PROFESSOR
	WHERE HIREDATE < (
						SELECT HIREDATE 
							FROM PROFESSOR
							WHERE PNAME = '�۰�'
					  );

-- ���ϴ� ������� �޿�(����)�� ���� ����� �����ȣ, ����̸�, �޿� ��ȸ
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	FROM EMP E
	WHERE E.SAL > (
					  SELECT SAL
					  	  FROM EMP
					  	  WHERE ENAME = '���ϴ�'
				  );
				 
-- �� ������ JOIN���� ����
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	 , A.SAL
	FROM EMP E
	JOIN (
		SELECT SAL 
			FROM EMP
			WHERE ENAME = '���ϴ�'
	) A
	ON E.SAL > A.SAL;
					 
-- ������ �Ϲ�ȭ�� �⸻��� �������� ���� �л��� �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��� ���� ��ȸ
-- ������ �Ϲ�ȭ�� �⸻��� ����
SELECT SC.RESULT
	FROM SCORE SC
	JOIN STUDENT ST
	  ON SC.SNO = ST.SNO
	JOIN COURSE C
	  ON SC.CNO = C.CNO 
	WHERE ST.SNAME = '����'
	  AND C.CNAME = '�Ϲ�ȭ��';

SELECT SST.SNO
	 , SST.SNAME
	 , SSC.CNO
	 , SSC.CNAME
	 , SCO.RESULT
	FROM STUDENT SST
	JOIN SCORE SCO
	  ON SST.SNO = SCO.SNO 
	JOIN COURSE SSC
	  ON SCO.CNO = SSC.CNO 
	 AND SSC.CNAME = '�Ϲ�ȭ��'
	JOIN (
		SELECT SC.RESULT
			FROM SCORE SC
			JOIN STUDENT ST
			  ON SC.SNO = ST.SNO
			JOIN COURSE C
			  ON SC.CNO = C.CNO 
			WHERE ST.SNAME = '����'
			  AND C.CNAME = '�Ϲ�ȭ��'
	) A
	  ON SCO.RESULT > A.RESULT;

-- 1-2. ������ ��������
-- ���������� ����� �������� ��������
-- FROM, JOIN, WHERE ������ ��밡��
-- �޿��� 3000�̻��� ����� �����ȣ, ����̸�, �޿� ��ȸ
SELECT ENO, ENAME, SAL
	FROM EMP
	WHERE SAL >= 3000;

-- FROM, JOIN ������ ���
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	FROM EMP E
	JOIN (
		SELECT ENO
			FROM EMP
			WHERE SAL >= 3000
	) A
	  ON E.ENO = A.ENO;
	
-- WHERE ������ ���
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	FROM EMP E
	WHERE E.ENO IN (
					  SELECT ENO
						  FROM EMP
						  WHERE SAL >= 3000
				   );

-- 1-3. ���߿� ��������
-- ���������� ����� �������̸鼭 ���߿��� ��������
-- FROM, JOIN �������� ��밡��
-- �����ȣ, �����̸�, ������ȣ, �����̸��� ��ȸ�ϴ� ���������� �ۼ��Ͽ�
-- �⸻��� ���� ���̺�� �����Ͽ� �����ȣ, �����̸�, ������ȣ, �����̸�, �⸻��� ������ ��ȸ
SELECT C.CNO
	 , C.CNAME
	 , P.PNO
	 , P.PNAME
	 , SC.RESULT
	FROM COURSE C
	JOIN SCORE SC
	  ON C.CNO = SC.CNO
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO;
	 
SELECT A.CNO
	 , A.CNAME
	 , A.PNO
	 , A.PNAME
	 , SC.RESULT
	FROM (
		SELECT C.CNO
			 , C.CNAME
			 , P.PNO
			 , P.PNAME
			FROM COURSE C
			JOIN PROFESSOR P
			  ON C.PNO = P.PNO
	) A
	JOIN SCORE SC
	  ON A.CNO = SC.CNO;

-- ���������� �׷��Լ��� �ַ� ���ȴ�.
SELECT ST.SNO
	 , ST.SNAME 
	 , AVG(SC.RESULT)
	FROM STUDENT ST
	JOIN SCORE SC
	  ON SC.SNO = ST.SNO
	GROUP BY ST.SNO, ST.SNAME;
	 
-- �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��� ����, �⸻��� ���� ���, ��� ������ȣ, ��� �����̸� ��ȸ�ϴ� ��
-- STUDENT, SCORE, SCGRADE ���̺��� ������ ��������1
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , SC.RESULT
	 , GR.GRADE
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO 
	JOIN SCGRADE GR
	  ON SC."RESULT" BETWEEN GR.LOSCORE AND GR.HISCORE;
	 
-- COURSE, PROFESSOR ���̺��� ������ ��������2 
SELECT C.CNO
	 , C.CNAME
	 , P.PNO
	 , P.PNAME
	FROM COURSE C
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO;
	 
SELECT A.SNO
	 , A.SNAME
	 , A.RESULT
	 , A.GRADE
	 , B.CNO
	 , B.CNAME
	 , B.PNO
	 , B.PNAME
	FROM (
		SELECT ST.SNO
			 , ST.SNAME
			 , SC.CNO
			 , SC.RESULT
			 , GR.GRADE
			FROM STUDENT ST
			JOIN SCORE SC
			  ON ST.SNO = SC.SNO 
			JOIN SCGRADE GR
			  ON SC."RESULT" BETWEEN GR.LOSCORE AND GR.HISCORE
	) A
	JOIN (
		SELECT C.CNO
			 , C.CNAME
			 , P.PNO
			 , P.PNAME
			FROM COURSE C
			JOIN PROFESSOR P
			  ON C.PNO = P.PNO
	) B
	ON A.CNO = B.CNO;
					 

-- 2. ���տ�����
-- ���տ����ڴ� ���� �ٸ� �� ������ ����� ������, ������, ������ ���ִ� ������
-- 2-1. ������ ������(UNION, UNION ALL)
-- 2000�� ���Ŀ� ���ӵ� ������ ������ȣ, �����̸�, �������ڿ� 2000�� ���Ŀ� ä��� ����� �����ȣ, ����̸�, ä�����ڸ� ��ȸ
-- ù ��° �������� �÷��� ����, ������ Ÿ���� �����Ǳ� ������ �� ��° ������ ù ��° ������ �÷��� ����, ������ Ÿ���� ������Ѵ�.
SELECT PNO
	 , PNAME
	 , HIREDATE
	FROM PROFESSOR
	WHERE HIREDATE >= TO_DATE('2000', 'YYYY')
UNION
SELECT ENO
	 , ENAME
	 , HDATE
	FROM EMP
	WHERE HDATE >= TO_DATE('2000', 'YYYY');

-- UNION�� �ߺ��� �����ؼ� ������ ������ ���ش�.
-- ������ 3.0�̻��� �л��� �л���ȣ, �л��̸�, �г�, ������ �г��� 3�г��� �л��� �л���ȣ, �л��̸�, �г�, ������ �Բ� ��ȸ
-- �ߺ�����
SELECT SNO
	 , SNAME
	 , SYEAR
	 , AVR
	FROM STUDENT
	WHERE AVR >= 3.0
UNION 
SELECT SNO
	 , SNAME 
	 , SYEAR 
	 , AVR 
	FROM STUDENT
	WHERE SYEAR = 3
	ORDER BY SNO;

-- UNION ALL�� �ߺ��� �����͵� �Բ� �����´�.
-- ������ 3.0�̻��� �л��� �л���ȣ, �л��̸�, �г�, ������ �г��� 3�г��� �л��� �л���ȣ, �л��̸�, �г�, ������ �Բ� ��ȸ
-- �ߺ����� ����
SELECT SNO
	 , SNAME
	 , SYEAR
	 , AVR
	FROM STUDENT
	WHERE AVR >= 3.0
UNION ALL
SELECT SNO
	 , SNAME 
	 , SYEAR 
	 , AVR 
	FROM STUDENT
	WHERE SYEAR = 3
	ORDER BY SNO;

-- 2-2. ������ ������(MINUS)
-- ù ��° �������� �� ��° ������ ����� �����͸� ������ ����� ��ȸ�Ѵ�.
INSERT INTO EMP VALUES('9998', '������', '����', NULL, SYSDATE, 3200, 320, NULL);
COMMIT;

-- ���� �����̸鼭 ���������� ���� �ʴ� ����� �����ȣ, ����̸�, ���� ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	FROM EMP
	WHERE ENAME LIKE '����%'
	  AND JOB != '����';
	 
SELECT ENO
	 , ENAME
	 , JOB
	FROM EMP 
	WHERE ENAME LIKE '����%'
MINUS 
SELECT ENO
	 , ENAME 
	 , JOB 
	FROM EMP
	WHERE JOB = '����';

-- ������ �����ڸ� ����ؼ� ��米���� �������� ���� ������ �����ȣ, �����̸� ��ȸ
SELECT CNO
	 , CNAME
	FROM COURSE
	WHERE 1=1
MINUS
SELECT CNO
	 , CNAME
	FROM COURSE
	WHERE PNO IS NOT NULL;

-- 2-3. ������ ������(INTERSECT)
-- ù ��° ������ ������� �� ��° ������ ����� ����� ��ȸ
-- ������ �����ڸ� ����ؼ� ����, ȭ�а� �л��� ������ 3.0�̻��� �л��� �л���ȣ, �л��̸�, ����, ���� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , AVR
	FROM STUDENT
	WHERE MAJOR IN ('����', 'ȭ��')
INTERSECT
SELECT SNO
	 , SNAME 
	 , MAJOR 
	 , AVR 
	FROM STUDENT
	WHERE AVR >= 3.0;

SELECT SNO
	 , SNAME
	 , MAJOR
	 , AVR
	FROM STUDENT
	WHERE MAJOR IN ('����', 'ȭ��')
	  AND AVR >= 3.0;