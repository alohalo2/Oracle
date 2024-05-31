-- 1. �������Լ�(GROUP �Լ�)
-- ������ �Լ��� �������� �����Ͱ� ���ͼ� �������� �����Ͱ� ���ϵǴ� �Լ�
-- �׷��Լ��� ������ �Լ��� ���Եȴ�.
-- �׷��Լ��� �����͵��� ��踦 ���� �Լ����� ��κ��̸� GROUP BY��� Ű����� �Բ� ���ȴ�.
-- GROUP BY�� �����͵��� ��踦 ���µ� � �÷��� �������� �׷�ȭ�Ͽ� ��踦 ������ �����ϴ� �����̴�.
-- �׷��Լ��� ����� �� ������ ���� SELECT ���� ���Ե� ��� �÷����� GROUP BY ���� ��õž� �Ѵ�.
-- �г⺰ �л����� ������ ����� ���ϴ� �׷��Լ�
SELECT *
	FROM STUDENT
	ORDER BY SYEAR;

SELECT SYEAR
	 , SNAME 
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY SYEAR, SNAME
	ORDER BY SYEAR, SNAME;

-- SELECT���� ���Ե� �÷����� ��� GROUP BY�� ��õž� �ϴ� ��Ģ������ �����Ͱ� �����ȴ�.
SELECT SYEAR
	 , MAJOR
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY SYEAR, MAJOR
	ORDER BY SYEAR;

-- ���ϴ� ����Լ� �����͸� ��ȸ�ϴ� ������ ���������� ���� �ٸ� �����͵�� �����Ͽ� ����Ѵ�.
SELECT ST.SNO
	 , ST.SNAME
	 , ST.MAJOR
	 , ST.SYEAR
	 , ST.AVR
	 , A.AVR
	FROM STUDENT ST
	JOIN (
		SELECT SYEAR
			 , AVG(AVR) AS AVR
			FROM STUDENT
			GROUP BY SYEAR
			ORDER BY SYEAR
	) A
	ON ST.SYEAR = A.SYEAR;
	
-- 1-1. MAX: �����͵��� �ְ� ���� ��ȸ�ϴ� �׷��Լ�
-- ���� �⸻����� �ְ��� ��ȸ
SELECT CNO
	 , MAX(RESULT)
	FROM SCORE
	GROUP BY CNO;

-- ���� �⸻��� �ְ��� ��ȸ�ϴµ� �����ȣ, �����̸�, ���� ��ȸ
SELECT SC.CNO
	 , C.CNAME
	 , MAX(SC.RESULT)
	FROM SCORE SC
	JOIN COURSE C
	  ON SC.CNO = C.CNO
	GROUP BY SC.CNO, C.CNAME;

-- ���� �⸻��� �ְ��� ��ȸ�ϴµ� �����ȣ, �����̸�, �л���ȣ, �л��̸�, ���� ��ȸ
SELECT A.CNO
	 , A.CNAME
	 , ST.SNO
	 , ST.SNAME 
	 , ST.SYEAR 
	 , ST.MAJOR
	 , A.MAX_RESULT
	FROM (
		SELECT SC.CNO
			 , C.CNAME
			 , MAX(SC.RESULT) AS MAX_RESULT
			FROM SCORE SC
			JOIN COURSE C
			  ON SC.CNO = C.CNO
			GROUP BY SC.CNO, C.CNAME
	) A
	JOIN SCORE SSC
	  ON A.CNO = SSC.CNO 
	 AND A.MAX_RESULT = SSC.RESULT 
	JOIN STUDENT ST
	  ON SSC.SNO = ST.SNO;

-- �߸��� ����
SELECT SC.CNO
	 , C.CNAME
	 , ST.SNO
	 , ST.SNAME
	 , MAX(SC.RESULT) AS MAX_RESULT
	FROM SCORE SC
	JOIN COURSE C
	  ON SC.CNO = C.CNO
	JOIN STUDENT ST
	  ON SC.SNO = ST.SNO
	GROUP BY SC.CNO, C.CNAME, ST.SNO, ST.SNAME;

-- ������ ��ü�� ���� ��踦 ������ GROUP BY�� ������� �ʴ´�.
SELECT MAX(AVR)
    FROM STUDENT;
    
-- 1-2. MIN: �׷�ȭ�� �������� �ּҰ��� ��ȸ�ϴ� �Լ�
-- �г� �� ���� ���� ��ȸ(�г�, ����)
SELECT SYEAR
	 , MIN(AVR)
	FROM STUDENT
	GROUP BY SYEAR
	ORDER BY SYEAR;

-- �μ���ȣ, �μ��� ���� �޿� ��ȸ
SELECT DNO
	 , MIN(SAL)
	FROM EMP
	GROUP BY DNO
	ORDER BY DNO;

-- �μ���ȣ, �μ��̸�, �μ��� ���� �޿� ��ȸ
SELECT E.DNO
	 , D.DNAME
	 , MIN(E.SAL)
	FROM EMP E
	JOIN DEPT D
	  ON E.DNO = D.DNO
	GROUP BY E.DNO, D.DNAME
	ORDER BY E.DNO;

-- �μ���ȣ, �μ��̸�, �μ��� ���� �޿�, �����޿��� �ش��ϴ� �����ȣ, ����̸� ��ȸ
-- �߸��� GROUP BY
SELECT E.DNO
	 , D.DNAME
	 , MIN(E.SAL)
	 , E.ENO
	 , E.ENAME
	FROM EMP E
	JOIN DEPT D
	  ON E.DNO = D.DNO
	GROUP BY E.DNO, D.DNAME, E.ENO, E.ENAME
	ORDER BY E.DNO;

-- ����Լ��� ���� �������� �ʰ� �Ϸ��� ����Լ��� ��ȸ�ϴ� ������ ���������� �ۼ��Ѵ�.
SELECT A.DNO
	 , A.DNAME
	 , A.MIN_SAL
	 , EE.ENO 
	 , EE.ENAME 
	FROM (
		SELECT E.DNO
			 , D.DNAME
			 , MIN(E.SAL) AS MIN_SAL
			FROM EMP E
			JOIN DEPT D
			  ON E.DNO = D.DNO
			GROUP BY E.DNO, D.DNAME
			ORDER BY E.DNO
	) A
	JOIN EMP EE
	  ON A.DNO = EE.DNO
	 AND A.MIN_SAL = EE.SAL;
	
-- 1-3. SUM: �׷�ȭ�� �������� ������ ���ϴ� �Լ�
-- ������� ������ ���ʽ��� ����
SELECT JOB
	 , SUM(NVL(COMM, 0))
	FROM EMP
	GROUP BY JOB;

-- 1-4. COUNT: �׷�ȭ�� �����Ϳ� ���� ������ ��ȸ�ϴ� �Լ�
-- COUNT(*): ��� �÷������Ϳ� ���� ���� ������ ����. Ư�� �÷��� NULL�� ���ԵǾ� �־ ������ �����Ѵ�.
-- COUNT(Ư�� �÷���): Ư�� �÷��� ���� ��� ���� ������ ����. ������ �÷��� NULL�� ������ ī������ ���� �ʴ´�.
-- �μ��� ����� ��ȸ
SELECT DNO
	 , COUNT(*)
	FROM EMP
	GROUP BY DNO;

SELECT DNO
	 , COUNT(DNO)
	FROM EMP
	GROUP BY DNO;

-- 1-5. AVG: �׷�ȭ�� �����Ϳ� ���� ��հ��� ���ϴ� �Լ�
-- ������ �г⺰ ��� ���� ��ȸ
SELECT MAJOR
	 , SYEAR
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY MAJOR, SYEAR
	ORDER BY MAJOR, SYEAR;

-- ������ �г⺰ �л��� ��ȸ
SELECT MAJOR
	 , SYEAR
	 , COUNT(*)
	FROM STUDENT
	GROUP BY MAJOR, SYEAR 
	ORDER BY MAJOR, SYEAR;

-- 1-6. HAVING: GROUP BY �� ��õ� �÷��� ���� ������ ���� �� �ִ� ����
-- �μ���ȣ�� 10, 20, 30�� ���� ��� �޿� ��ȸ
SELECT DNO
	 , AVG(SAL)
	FROM EMP 
	GROUP BY DNO 
	HAVING DNO IN ('10', '20', '30');

SELECT DNO
	 , AVG(SAL)
	FROM EMP
	WHERE DNO IN ('10', '20', '30')
	GROUP BY DNO;

-- AND/OR ������ ������ �ۼ��� �� �ְ�
-- HAVING ������ ����Լ��� ���� ���ǵ� �ۼ��� �� �ִ�.
SELECT DNO
	 , AVG(SAL)
	FROM EMP 
	GROUP BY DNO 
	HAVING DNO IN ('10', '20', '30')
	   AND AVG(SAL) >= 3000;
	  
-- HAVING ������ GROUP BY�� ��õ��� �ʾҰų� ����Լ��� �ƴ� ������ �ۼ��� �� ����
SELECT DNO
	 , AVG(SAL)
	FROM EMP 
	GROUP BY DNO 
	HAVING COMM >= 300;

-- WHERE �������� ����Լ��� ���� ������ �ۼ��� �� ����.
SELECT DNO
	 , AVG(SAL)
	FROM EMP
	WHERE AVG(SAL) <= (
						  SELECT MAX(SAL)
						  	  FROM EMP
					  )
	GROUP BY DNO;

-- ����Լ��� ���� ������ WHERE ������ ����Ϸ��� ����Լ��� ������ ������ ���������� ���´�
SELECT A.*
	FROM (
		SELECT DNO
			 , AVG(SAL) AS AVG_SAL
			FROM EMP
		GROUP BY DNO
	) A
	WHERE A.AVG_SAL <= (
						  SELECT MAX(SAL)
						  	  FROM EMP
					   );

-- �ӿ�⵵�� 2000�� �����̰� �ӿ�⵵�� ������ ������ �� ��ȸ
SELECT TRUNC(HIREDATE, 'YYYY')
	 , COUNT(*)
	FROM PROFESSOR
	GROUP BY TRUNC(HIREDATE, 'YYYY')
	HAVING TRUNC(HIREDATE, 'YYYY') < TO_DATE('2000/01/01', 'YYYY/MM/DD')
	ORDER BY TRUNC(HIREDATE, 'YYYY');

SELECT TO_CHAR(HIREDATE, 'YYYY')
	 , COUNT(*)
	FROM PROFESSOR
	GROUP BY TO_CHAR(HIREDATE, 'YYYY')
	HAVING TO_CHAR(HIREDATE, 'YYYY') < '2000'
	   AND COUNT(*) > 5
	ORDER BY TO_CHAR(HIREDATE, 'YYYY');






   
   
   
   
   
   
   
   
   
   
   
   