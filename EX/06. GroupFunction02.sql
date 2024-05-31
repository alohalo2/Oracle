-- 1. �׷�ȭ ���� �Լ�
-- 1-1.  ROLLUP (������� �ϳ��� ������ �׷�ȭ)
-- ó������ GROUP BY�� ������ ��� �÷����� �׷�ȭ�� ����� �����ְ�
-- �������ʹ� �������� ������ �÷��� �ϳ��� �� �׷�ȭ�� ����� �����ִٰ�
-- ���������� �׷�ȭ���� ���� ��ü �����Ϳ� ���� ����� �����ش�.
-- ROLLUP�� ������� �ʾ��� ��
SELECT DNO
	 , JOB
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY DNO, JOB;
	 
-- ROLLUP ��� ��	
	SELECT DNO
	 , JOB
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY ROLLUP(DNO, JOB);
 
SELECT DNO
	 , JOB
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY DNO, JOB;

SELECT DNO
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY DNO;	

SELECT MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP;
	 
-- ROLLUP �Լ��� �̿��ؼ� ������ �г⺰ �������, ������ ����, �ְ� ���� ��ȸ
-- ������ �������, ������ ����, �ְ� ���� ��ȸ
-- ��ü �л��� ���� �������, ������ ����, �ְ� ���� ��ȸ
SELECT NVL(MAJOR, '��ü�л�') 
	 , SYEAR 
	 , AVG(AVR)
	 , SUM(AVR)
	 , MAX(AVR)
	 , COUNT(*)
	FROM STUDENT
	GROUP BY ROLLUP (MAJOR, SYEAR);

-- 1-2. CUBE (��� ��쿡 ���� �׷�ȭ)
-- ROLLUP �Լ��� ��������� ���������� ���� ����� �ٸ���.
-- RULLUP �Լ��� GROUP BY�� ������ �÷��� �ڿ������� �ϳ��� ���鼭 �׷�ȭ�� �����Ѵٸ�
-- CUBE �Լ��� GROUP BY�� ������ �÷��� ��� ���տ� ���� �׷�ȭ�� �����Ѵ�.
-- ROLLUP ��� ��
SELECT MAJOR
	 , SYEAR
	 , SEX
	 , AVG(AVR)
	 , SUM(AVR)
	 , MAX(AVR)
	 , COUNT(*)
	 FROM STUDENT
	 GROUP BY ROLLUP(MAJOR, SYEAR,SEX);
	
-- CUBE ��� ��
SELECT MAJOR
	 , SYEAR
	 , SEX
	 , AVG(AVR)
	 , SUM(AVR)
	 , MAX(AVR)
	 , COUNT(*)
	 FROM STUDENT
	 GROUP BY CUBE(MAJOR, SYEAR,SEX);
	
-- 1-3. GROUPING SETS: GROUP BY�� ������ �÷����� ���� �׷�ȭ�� ����� �����ش�.
SELECT DNO
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY DNO
UNION	
SELECT JOB
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY JOB;
	
SELECT DNO
	 , JOB
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 FROM EMP
	 GROUP BY GROUPING SETS (DNO, JOB);
	
-- 1-4. GROUPING, GROUPING_ID
-- ������ �÷��� ���� �׷�ȭ ���θ� Ȯ���ϴ� �Լ�
-- GROUPING �Լ��� �Ű������� �ϳ��� ������ �� �ְ�
-- GROUPING_ID �Լ��� �Ű������� �������� �÷��� ������ �� �ִ�.
-- GROUPING �Լ��� �׷�ȭ�� ��������� 0, �׷�ȭ�� ������� �ʾ����� 1
-- GROUPING_ID �Լ��� ������ �÷��� ������ ���� �׷�ȭ�� ��������� 0, �׷�ȭ�� ������� �ʾ����� 1
-- �� �������� �����Ͽ� ����� �������� ����Ѵ�.
-- GROUPING(DNO), GROUPING(JOB), GROUPING_ ID(DNO, JOB)
--      0              0            ������: 00 -> ������: 0
--      1              0            ������: 10 -> ������: 2
--      0              1            ������: 01 -> ������: 1
--      1              1            ������: 11 -> ������: 3
SELECT DNO
	 , JOB
	 , MAX(SAL)
	 , SUM(SAL)
	 , AVG(SAL)
	 , COUNT(*)
	 , GROUPING(DNO)
	 , GROUPING(JOB)
	 , GROUPING_ID(DNO, JOB)
	 FROM EMP
	 GROUP BY CUBE(DNO, JOB);
	 
-- CUBE �Լ��� �̿��ؼ�
-- ������ �г⺰ ������ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- ������ �г⺰ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- ������ ������ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- �г⺰ ������ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- ������ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- �г⺰ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- ������ �ְ� ����, ������ �հ�, ������ ���, �л��� ��ȸ
-- ��ü �����Ϳ� ���� �ְ� ������ �հ�, ������ ���, �л��� ��ȸ�ϴµ�
-- ������ ������ �г�, ����, �÷��� �׷�ȭ �ƴ��� Ȯ��
SELECT MAJOR 
	 , SYEAR 
	 , SEX
	 , MAX(AVR)
	 , SUM(AVR)
	 , AVG(AVR)
	 , COUNT(*) 
	 , GROUPING (MAJOR)
	 , GROUPING (SYEAR)
	 , GROUPING (SEX)
	 , GROUPING_ID (MAJOR, SYEAR, SEX)
	FROM STUDENT
	GROUP BY CUBE(MAJOR, SYEAR, SEX);

-- 1-5. LISTAGG: �׷�ȭ�� �÷��� ���ԵǴ� �����͸� Ȯ���ϰ� ���� �� ����ϴ� �Լ�
SELECT DNO
	 , COUNT(*) 
	 , LISTAGG(ENAME, ', ')
	   WITHIN GROUP(ORDER BY SAL DESC)
	FROM EMP
	GROUP BY DNO;

-- ������ �г⺰ �л��� ��ȸ(���Ե� �л��̸��� �Բ� ��ȸ(LISTAGG�Լ��� ����ؼ�), �������������� ����)
SELECT MAJOR
	 , SYEAR
	 , COUNT(*)
	 , LISTAGG(SNAME, ', ')
	   WITHIN GROUP(ORDER BY AVR DESC)
	  FROM STUDENT
	  GROUP BY MAJOR, SYEAR
	  ORDER BY MAJOR, SYEAR;

-- LISTAGG�� �����ڿ� WITHIN ���� ���� �����ϴ�.
SELECT MAJOR
	 , SYEAR
	 , COUNT(*)
	 , LISTAGG(SNAME) 
	 FROM STUDENT
	 GROUP BY MAJOR, SYEAR;
	
-- 1-6. PIVOT, UNPIVOT
-- PIVOT: ���� �� �����͵��� �÷����� �������ִ� �Լ�
-- UNPIVOT: ���� �÷����� �� �����ͷ� �������ִ� �Լ� 
SELECT *
	FROM(
		SELECT JOB
			 , SAL
			FROM EMP
		)
		PIVOT(
			MAX(SAL)
				FOR JOB IN(
					'�濵' AS "OPER",
					'����' AS "����",
					'ȸ��' AS "ACCOUNT",
					'����' AS "DEVELOP",
					'�м�' AS "�м�"
				)
		);

-- PIVOT�� FROM������ �׷�ȭ�� �÷�, ��賾 �÷��� ��ȸ�ϴ� ���������� ����ؾߵȴ�.(�������� ������� ������ ��� �÷����� GROUPȭ�� �ǹ�����.)
SELECT *
	FROM EMP
	PIVOT(
		MAX(SAL)
			FOR JOB IN (
				'�濵' AS "OPER",
				'����' AS "����",
				'ȸ��' AS "ACCOUNT",
				'����' AS "DEVELOP",
				'�м�' AS "�м�"
			)
	);

SELECT *
	FROM(
		SELECT JOB
			 , SAL
			FROM EMP
		)
		-- ����Լ��� ����ϴµ� GROUP BY�� ������� �ʴ� ������
		-- �����͵��� �÷����� ����Ǹ鼭 �÷��� �ߺ��� ���� �ʱ� ������ 
		-- ���� ���� ������ �ִ� �����ͳ��� �׷�ȭ�� �ڵ����� �Ͼ��.
		PIVOT(
			MAX(SAL)
				FOR JOB IN(
					'�濵' AS "OPER",
					'����' AS "����",
					'ȸ��' AS "ACCOUNT",
					'����' AS "DEVELOP",
					'�м�' AS "�м�"
				)
		);	 
	 
-- PIVOT���� ������ �÷����� SELECT ������ �ٷ� ��밡��	
SELECT OPER
	 , ����
	 , ACCOUNT
	 , DEVELOP
	 , �м�
	FROM(
		SELECT JOB
			 , SAL
			FROM EMP
		)
		PIVOT(
			MAX(SAL)
				FOR JOB IN(
					'�濵' AS "OPER",
					'����' AS "����",
					'ȸ��' AS "ACCOUNT",
					'����' AS "DEVELOP",
					'�м�' AS "�м�"
				)
		);	
	
-- ������ �г⺰ �ְ� ���� ��ȸ�ϴµ� PIVOT�� �̿��ؼ� ������ �÷����� ��ȸ
SELECT *
	FROM (
		 SELECT MAJOR
		 	  , SYEAR
		 	  , AVR
		 	  FROM STUDENT
		 )
		 PIVOT(
		 		MAX(AVR)
		 			FOR MAJOR IN(
		 				'�İ�' AS "�İ�",
		 				'ȭ��' AS "ȭ��",
		 				'����' AS "����",
		 				'����' AS "����",
		 				'�Ŀ�' AS "�Ŀ�",
		 				'����' AS "����"
		 			)
		 	  );

-- UNPIVOT
SELECT *
	FROM (
		SELECT MAX(DECODE(JOB, '�濵', SAL)) AS "�濵"
			 , MAX(DECODE(JOB, '����', SAL)) AS "����"
			 , MAX(DECODE(JOB, 'ȸ��', SAL)) AS "ȸ��"
			 , MAX(DECODE(JOB, '����', SAL)) AS "����"
			 , MAX(DECODE(JOB, '�м�', SAL)) AS "�м�"
			 FROM EMP
	);
		
SELECT *
	FROM (
		SELECT MAX(DECODE(JOB, '�濵', SAL)) AS "�濵"
			 , MAX(DECODE(JOB, '����', SAL)) AS "����"
			 , MAX(DECODE(JOB, 'ȸ��', SAL)) AS "ȸ��"
			 , MAX(DECODE(JOB, '����', SAL)) AS "����"
			 , MAX(DECODE(JOB, '�м�', SAL)) AS "�м�"
			 FROM EMP
	)		 	 
	UNPIVOT ( 
		MAX_SAL FOR J IN (
				�濵, ����, ȸ��, ����, �м�
		)
	);

--  ������, �Ϲ�ȭ��, ���ڹ������� �⸻��� ������ ����� ��ȸ�ϴµ� �����̸��� �÷����� ��ȸ
SELECT *
	FROM (
		SELECT C.CNAME
			 , S.RESULT
			FROM COURSE C
			JOIN SCORE S
			  ON C.CNO = S.CNO
	) 
	PIVOT(
		AVG(RESULT)
			FOR CNAME IN (
				'������' AS "������",
				'�Ϲ�ȭ��' AS "�Ϲ�ȭ��",
				'���ڹ�����' AS "���ڹ�����"
			)
	);

-- �Ʒ� �������� UNPIVOT�� �̿��ؼ� �� �����̸��� �൥���ͷ� ��ȸ
-- �⸻��� ��ռ��� �÷��� AVG_RESULT
-- �����̸��� COURSE_NAME���� ����
SELECT *
	FROM (
		SELECT AVG(DECODE(C.CNAME, '������', S.RESULT)) AS "������"
			 , AVG(DECODE(C.CNAME, '�Ϲ�ȭ��', S.RESULT)) AS "�Ϲ�ȭ��"
			 , AVG(DECODE(C.CNAME, '���ڹ�����', S.RESULT)) AS "���ڹ�����"
			 FROM COURSE C
			 JOIN SCORE S
			   ON C.CNO = S.CNO
	)
	UNPIVOT(
		AVG_RESULT FOR COURSE_NAME IN (
			������, �Ϲ�ȭ��, ���ڹ�����
		)
	);
	
	
	