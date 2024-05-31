-- 1. �⺻ Select ����
-- 1-1. �������̺��� �����ȣ, �����̸�, ����, ��米����ȣ ��ȸ
SELECT CNO
	 , CNAME
	 , ST_NUM
	 , PNO
	FROM COURSE;

-- 1-2. �л����̺��� �л���ȣ�� �л��̸� ��ȸ
SELECT SNO
	 , SNAME
	FROM STUDENT;
	
-- 1-3. ��ȸ�� ���̺��� ��� �÷��� �����͸� ��ȸ�� ���� �÷��� ��� *�� ����ص� �ȴ�.
SELECT *
	FROM DEPT;

-- 2. �÷��̳� ���̺� ��Ī ���̱�
-- 2-1. �÷��� ��Ī���̱�
-- ��ȸ�ؿ� �������� �÷��� ��Ī�� ���� �� �ִ�. ��ȸ�� �����ʹ� ���ο� �������̺��� �����ϴµ�
-- �������̺��� �÷����� ���� ��Ī���� �Ҵ�ȴ�. ��Ī�� �ѱ۷� �ٿ��� �����ϳ� ��κ� ����� ���δ�.
-- AS Ű���带 �̿��ؼ� ��Ī�� ���� �� �ִµ� AS Ű����� ���� �����ϴ�.
SELECT PNO AS PRFESSOR_NO
	 , PNAME AS �����̸�
	 , ORDERS ����
	FROM PROFESSOR;

-- 2-2. ���̺� ��Ī ���̱�
-- ���̺� ���� ��Ī�� Select �����ȿ��� ����ϱ� ���� ��Ī�̴�.
-- �������� ���̺��� ���ÿ� ��ȸ�� �� �ַ� ���ȴ�.
-- �������� ���̺��� ���ÿ� ��ȸ�ϸ� � ���̺��� �÷����� ��ȣ������ ��찡 �ִµ� �� ��츦 ����ϱ� ����
-- ����̺��� �÷����� ��Ȯ�ϰ� ���ֱ� ���� �ַ� ���
SELECT STUDENT.SNO
	 , STUDENT.SNAME
	FROM STUDENT;

-- ���̺� ��Ī�� �� ���� AS Ű���带 ����� �� ����. ���̺�� �ڿ� �ٷ� ���� ��Ī�� �޾��ش�.
SELECT ST.SNO
	 , ST.SNAME
	FROM STUDENT ST;

-- �������� ���̺� ���� ��ȸ�� ��ȣ�� �÷��� ���
SELECT SNO
	 , SNAME
	 , RESULT
	FROM STUDENT
	JOIN SCORE
	ON STUDENT.SNO = SCORE.SNO;

SELECT ST.SNO
	 , ST.SNAME
	 , SC.RESULT
	FROM STUDENT ST
	JOIN SCORE SC
	ON ST.SNO = SC.SNO;

-- 3. NULL�� �������� ó������� �����ϴ� NVL
SELECT DNO
	 , DNAME
	 , LOC
	 , DIRECTOR
	FROM DEPT;

SELECT DNO
	 , DNAME
	 , LOC
	 , NVL(DIRECTOR, '�������') AS DIRECTOR
	FROM DEPT;

-- 3-1. ������̺��� �����ȣ, ����̸�, �޿�, ���ʽ�(COMM) ��ȸ�ϴµ�
-- ���ʽ��� NULL�� ����� 0���� ��ȸ
SELECT ENO
	 , ENAMe
	 , SAL
	 , NVL(COMM, 0) AS COMM
	FROM EMP;

-- 3-1. ������̺��� �����ȣ, ����̸�, �޿�, ���ʽ�(COMM) ��ȸ�ϴµ�
-- ���ʽ��� NULL�� ����� SAL / 12�� ��ȸ
SELECT ENO
	 , ENAMe
	 , SAL
	 , NVL(COMM, SAL / 12) AS COMM
	FROM EMP;

-- 4. ���Ῥ����(||)
-- �� ���� �����ؼ� ��ȸ�ϰ� ���� �÷����� ||�� �̿��ؼ� ���� ��ȸ�� �� �ִ�.
-- 4-1. ����� �޿��� �̸��� -�� �����ؼ� ��ȸ
SELECT ENO
	 , ENAME || '-' || SAL
	FROM EMP;

-- 4-2. �л���ȣ�� �⸻��������� -�� �����ؼ� ��ȸ(SCORE)
SELECT SNO || '-' || RESULT AS �й�
	FROM SCORE;

-- 5. �ߺ������� DISTINCT
-- 5-1. �ߺ��� �������� �ʾ��� ��
SELECT JOB
	FROM EMP;

-- 5-2. DISTINCT ����ؼ� �ߺ����� ���� ��
SELECT DISTINCT JOB
	FROM EMP;

-- 5-3. �÷� �������� ���� DISTINCT
-- ���� ���� �÷��� ��ȸ�� �� DISTINCT�� �ɸ���
-- ��ȸ�� �������� �÷��� ������ �� �ϳ��� �ν��ؼ�
-- ��ȸ�� ��� �÷��� �����Ͱ� �ߺ��ž� �ߺ����� �ν��Ѵ�.
SELECT DISTINCT JOB
	 , MGR
	FROM EMP;

-- 6. ������ ���� ������ ���ϴ� ORDER BY
-- 6-1. �÷� �ϳ��� ����
-- ��������(ASC)�� ������ ���� ASC�� �����ص� �ȴ�.
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	ORDER BY SYEAR;

-- ��������(DESC)�� ������ ���� �׻� DESC�� ����ؾ� �Ѵ�.
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	ORDER BY SYEAR DESC;

-- DATABASE���� ������ ���ڷε� ����.
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	ORDER BY SNAME DESC;

-- 6-2. �÷� �������� ����
-- ó�� ������ �÷����� ������ �� ���¿��� ���� ������ �÷����� �����Ѵ�.
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	ORDER BY SYEAR, SNAME;

-- ORDER BY �������� �÷��� ������ ���� �� �÷��� ���Ĺ��(ASC, DESC)�� ���� ������ �� �ִ�.
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	ORDER BY SYEAR DESC, AVR;

SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	ORDER BY SYEAR, MAJOR, AVR;

-- 6-3. ��� ���̺��� �����ȣ, ����̸�, �μ���ȣ, �޿� ��ȸ�ϴµ�
-- �μ���ȣ�� ������ �޿��� ���� ������� ��ȸ
SELECT ENO
	 , ENAME
	 , DNO
	 , SAL
	FROM EMP
	ORDER BY DNO, SAL DESC;

-- 6-4. �÷��� ��Ī�� ���� ��쿡�� ��Ī���ε� ���İ���
SELECT ENO
	 , ENAME
	 , DNO AS �μ���ȣ
	 , SAL AS �޿�
	FROM EMP
	ORDER BY �μ���ȣ, �޿� DESC;

-- 7. ������ �ɾ ���ϴ� �����͸� ��ȸ�ϴ� WHERE ��
-- WHERE ���� FROM�̳� JOIN~ON�� ������ �ۼ��Ѵ�.
-- 7-1. WHERE ������ ���� ũ�⸦ ���� ���� �ڹٿ� ���������� �ε�ȣ�� ����Ѵ�.(>, <, >=, <=)
-- ����߿� �޿��� 3000�̻��� �����ȣ, ����̸�, �޿� ��ȸ
SELECT ENO
	 , ENAME
	 , SAL
	FROM EMP
	WHERE SAL >= 3000;

SELECT *
	FROM EMP;

-- �л� �߿� ������ 3.0 ������ �л���ȣ, �л��̸�, ����, �г�, ���� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	FROM STUDENT
	WHERE AVR <= 3.0;

-- 7-2. WHERE ������ ���� ���Ͽ��θ� ���� ���� =, !=�� ����Ѵ�.
-- ������ ȭ�а��� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE MAJOR = 'ȭ��';

-- ������ ȭ�а��� �ƴ� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE MAJOR != 'ȭ��';

-- 7-3. WHERE ������ ������ ���� ���� �׻� �÷��� Ÿ�԰� ������ Ÿ���� ������ ���Ѵ�.
-- ������̺��� �޿� �÷��� NUMBERŸ���ε� ���ڿ��� �񱳸� �ϰ� �Ǹ�
-- �޿��÷��� �ִ� ��� �����Ͱ� ���ڿ��� ��ȯ�Ǵ� ������ �ʿ��ϴ�.
-- �����Ͱ� �������� ���������� ��ȯ�Ǵ� �ð��� ���� �ɸ��� ������ 
-- �׻� ���̺��� �÷� �����Ͱ� Ÿ�� ��ȯ�� �Ͼ�� �ʵ��� ������ �ۼ��ؾ� �Ѵ�.
-- �������� ����
SELECT ENO
	 , ENAME
	 , HDATE
	FROM EMP
	WHERE TO_CHAR(HDATE, 'YYYY-MM-DD:HH24:MI:SS') < '2000-10-10:23:59:59';

-- ������ ����
SELECT ENO
	 , ENAME
	 , HDATE
	FROM EMP
	WHERE HDATE < TO_DATE('2000-10-10:23:59:59', 'YYYY-MM-DD:HH24:MI:SS');

-- ����߿� ������ �濵�� ����� �����ȣ, ����̸�, ����, �޿�, ���ʽ� ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , SAL
	 , COMM
	FROM EMP
	WHERE JOB = '�濵';

-- 7-4. NULL�� ���� �񱳴� = NULL, != NULL�� ���� �ʰ� IS NULL, IS NOT NULL�̶�� Ư���� ������ �̿��Ѵ�.
-- ���ʽ��� NULL�� ����� �����ȣ, ����̸�, ����, �޿�, ���ʽ� ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , SAL
	 , COMM
	FROM EMP
	WHERE COMM IS NULL;

-- ���ʽ��� NULL�� �ƴ� ��� ����� �����ȣ, ����̸�, ����, �޿�, ���ʽ� ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , SAL
	 , COMM
	FROM EMP
	WHERE COMM IS NOT NULL;

-- �μ����̺��� ������ NULL�� �ƴ� �μ��� �μ���ȣ, �μ��̸� ��ȸ
SELECT DNO
	 , DNAME
	FROM DEPT
	WHERE DIRECTOR IS NOT NULL;

-- 7-5. ���ڿ��� ������ ������ ��ȸ(LIKE)
-- �л� �� �̸��� ��� ������ �л��� �л���ȣ, �л��̸� ��ȸ
SELECT SNO
	 , SNAME
	FROM STUDENT
	WHERE SNAME LIKE '%��';

-- ���� �߿� ȭ���� ���ԵǾ� �ִ� ������ �����ȣ, �����̸�, ���� ��ȸ
SELECT CNO
	 , CNAME
	 , ST_NUM
	FROM COURSE
	WHERE CNAME LIKE '%ȭ��%';

-- ���� �߿� �̸��� �������� ������ ������ȣ, �����̸� ��ȸ
SELECT PNO
	 , PNAME
	FROM PROFESSOR
	WHERE PNAME LIKE '___';

-- 8. ���� ������ ����� �ִ� AND, OR ��
-- 8-1. ���� ������ ��� �����ϴ� �����͸� ��ȸ�ϴ� AND ��
-- �л� �߿� 1�г��̸鼭 ���� �뾾�� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE SYEAR = 1
	  AND SNAME LIKE '��%';
	 
-- ��� �߿� ȸ������� �ϸ鼭 �޿��� 3000�̻��� �̸��� �� ������ ����� �����ȣ, ����̸�, ����, �޿� ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , SAL
	FROM EMP
	WHERE JOB = 'ȸ��'
	  AND SAL >= 3000
	  AND ENAME LIKE '___';

-- 8-2. ���� ���� �� �ϳ��� �����ϴ� �����͵��� ��� ��ȸ�ϴ� OR ��
-- �л� �� 1�г��̰ų� ���� �뾾�� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE SYEAR = 1
	   OR SNAME LIKE '��%';

-- ������ ȭ���̰ų� ������ �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE MAJOR = 'ȭ��'
	   OR MAJOR = '����';

-- 8-3. AND, OR ȥ�� ���
-- AND, OR�� ȥ���Ͽ� ����ϸ� ������ �˾ƺ��� ��������� ������
-- () ������ �켱������ �����ش�.
-- ������ ȭ���̰ų� ������ �л� �� 1�г��� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE (MAJOR = 'ȭ��'
	   OR MAJOR = '����')
	  AND SYEAR = 1;

-- �μ���ȣ�� 10�̰ų� 30�� ��� �� �޿��� 3000�̻��� ����� �����ȣ, ����̸�, �޿�, �μ� ��ȸ
SELECT ENO
	 , ENAME
	 , SAL
	 , DNO
	FROM EMP
	WHERE (DNO = 10
	   OR DNO = 30)
	  AND SAL >= 3000;
	 
-- 9. Ư���� ������ ������ �����ִ� BETWEEN AND ����
-- �޿��� 3000�̻� 5000������ ����� �����ȣ, ����̸�, �޿� ��ȸ
SELECT ENO
	 , ENAME
	 , SAL
	FROM EMP
	WHERE SAL BETWEEN 3000 AND 5000;
	 
SELECT ENO
	 , ENAME
	 , SAL
	FROM EMP
	WHERE SAL >= 3000 
	  AND SAL <= 5000;
	 
-- ������ 3.0�̻� 3.7�����̸鼭 �г��� 2�г��̻� 4�г������� �л��� �л���ȣ, �л��̸�, ����, �г�, ���� ��ȸ
SELECT SNO
	 , SNAME
	 , AVR
	 , SYEAR
	 , MAJOR
	FROM STUDENT
	WHERE AVR BETWEEN 3.0 AND 3.7

SELECT *
	FROM PROFESSOR;
	 
-- BETWEEN AND �������� �� ��¥ ������ �ִ� �����͵� ��ȸ�� �� �ִ�.
-- TO_DATE: �������� ������ ��¥�������� �����Ѵ�.
-- TO_DATE(���ڿ�, ���ڿ��� ��¥����)
-- 2000�� 1�� 1�� ~ 2001�� 12�� 31�� ���̿� ������ ������ ������ȣ, �����̸�, �������� ��ȸ
SELECT PNO
	 , PNAME
	 , HIREDATE
	FROM PROFESSOR
	WHERE HIREDATE
		BETWEEN TO_DATE('20000101 00:00:00', 'yyyymmdd hh24:mi:ss')
	 	    AND TO_DATE('2001/12/31 23:59:59', 'yyyy/mm/dd hh24:mi/ss');
	 
-- 10. �������� �����Ϳ� ���� ���ϴ� IN ��
-- ������ ȭ���̰ų� ������ �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE MAJOR = 'ȭ��'
	   OR MAJOR = '����';

SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE MAJOR IN ('ȭ��', '����');

-- �μ���ȣ�� 10�̰ų� 20�̰ų� 30�� ����� �����ȣ, ����̸�, ����, �μ���ȣ ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , DNO
	FROM EMP
	WHERE DNO IN ('10', '20', '30');
	 	   
-- ������ �����̰ų� �����̸鼭 1, 2, 3�г��� �л��� �л���ȣ, �л��̸�, ����, �г� ��ȸ	   
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE MAJOR IN ('����', '����')
	  AND SYEAR IN (1, 2, 3);
	 	   
-- ���� ��� DBMS���� ���ڿ��� ��������ǥ('')�� ǥ���Ѵ�.
-- ū ����ǥ("")�� �÷��� ���� ��Ī(alias)�� �ٿ��� ���� ����Ѵ�.
-- ������ �����̰ų� �濵�� ��� �߿� ���ʽ��� 700�̻��� ����� �����ȣ, ����̸�, ����, �޿�, ���ʽ� ��ȸ
SELECT ENO AS "�����ȣ"
	 , ENAME AS "����̸�"
	 , JOB AS "����"
	 , SAL AS "�޿�"
	 , COMM AS "���ʽ�"
	FROM EMP
	WHERE JOB IN ('����', '�濵')
	  AND COMM >= 700; 
