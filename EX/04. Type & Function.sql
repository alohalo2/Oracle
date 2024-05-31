-- 1. ������ �Լ�
-- ������ �Լ��� �ϳ��� �����͸� �޾Ƽ� �ϳ��� ������� �����ϴ� �Լ��̴�.
-- ������ �Լ����� �����Լ�, �����Լ�, ��¥�Լ�, �Ϲ��Լ� ���� �����Ѵ�.

-- 1-1. �����Լ�
-- LOWER: �����ڸ� �ҹ��ڷ� ��ȯ�ؼ� ���� 
-- UPPER: �����ڸ� �빮�ڷ� ��ȯ�ؼ� ����
-- INITCAP: �������� ù ���ڸ� �빮�ڷ� ������ ���ڴ� �ҹ��ڷ� ��ȯ�ؼ� ����
SELECT DNO
	 , LOWER(DNAME)
	 , UPPER(DNAME)
	 , INITCAP(DNAME)
	FROM DEPT;

-- �μ��̸��� �빮������ �ҹ������� �� �� ���� ��
-- LOWER�� ����ؼ� �ҹ��ڷ� ��
SELECT DNO
	 , DNAME
	 , LOC
	 , DIRECTOR
	FROM DEPT
	WHERE LOWER(DNAME) = 'erp';

-- 1-2. ���� ���� �Լ�
-- CONCAT(������1, ������2): ������1�� ������2�� ���յ� ���ο� ������ ����
SELECT CONCAT(SNAME, AVR)
	FROM STUDENT;

-- CONCAT �Լ��� �Ű������� �� ���� ���� �� �־ �������� �����ͳ� �ٸ� ǥ���� �ְ� ���� ���� ||�� �����Ͽ� ����Ѵ�.
SELECT CONCAT(SNAME, ': ' || AVR)
	FROM STUDENT;

-- CONCAT�� �̿��ؼ� �μ���ȣ, �μ��̸�, ������ �μ���ȣ : �μ��̸� : ���� ���·� ��ȸ�ϼ���.
SELECT CONCAT(DNO, ' : ' || DNAME || ' : ' || LOC) AS "�μ���ȣ : �μ��̸� : ����"
	FROM DEPT;

--SUBSTR(������, �����ε���, ����): �޾ƿ� �����Ϳ��� ���� �ε������� ������ŭ �����͸� �߶� ����
-- ���� �߿� �������� ������ ������ȣ, �����̸�, ���� ��ȸ
SELECT PNO
	 , PNAME
	 , ORDERS
	FROM PROFESSOR
	WHERE SUBSTR(ORDERS, 1, 1) = '��';

SELECT ENAME
	 , SUBSTR(ENAME, 2) -- 2��° ���ں��� ���
	 , SUBSTR(ENAME, -2) -- �ڿ��� �� ��° ���ں��� ���
	 , SUBSTR(ENAME, 1, 2) -- ù ��° ���ں��� �� ����
	 , SUBSTR(ENAME, -2, 2) -- �ڿ��� �� ��° ���ں��� �� ����
	FROM EMP;

-- LENTH: �������� ���̸� ����
-- LENTHB: �������� ���̸� BYTE ������ ����
-- ����Ŭ�� �⺻ ���ڼ��� AL32UTF8 => ��� ������ �ٸ� ���ڴ� 3BYTE�� ���
SELECT DNAME
	 , LENGTH(DNAME)
	 , LENGTHB(DNAME)
	FROM DEPT;

-- INSTR(������, ����): �����Ϳ��� �־��� ������ ��ġ�� ����
-- DUAL ���̺�: ����Ŭ���� �����ϴ� ������ ���̺�
--			  �����ϰ� ��¥�� ���� �Ǵ� ������� �������ؼ� ���
--			  DUAL ���̺��� �����ڴ� SYS���������� ��� ����ڿ��� ����� �����ϴ�.
SELECT INSTR('DATABASE', 'A') -- ù ��° A�� ��ġ
	 , INSTR('DATABASE', 'A', 3) -- �� ��° ������ T������ ù ��° A�� ��ġ
	 , INSTR('DATABASE', 'A', 1, 3) -- ù ��° ������ D ������ �� ��° A�� ��ġ
	FROM DUAL;

-- TRIM
-- TRIM(leading ���ξ� FROM ������): �����Ϳ��� ���ξ �ش��ϴ� ���� �տ��� ����
-- TRIM(trailing ���̾� FROM ������): �����Ϳ��� ���̾ �ش��ϴ� ���� �ڿ��� ����
-- TRIM(both ���� FROM ������): �����Ϳ��� ���ڿ� �ش��ϴ� ���� ��, �ڿ��� ����
-- TRIM(������): �����Ϳ��� ��,���� ���� ����
SELECT TRIM(LEADING '0' FROM '000123000')
	 , TRIM(TRAILING '0' FROM '000123000')
	 , TRIM(BOTH '0' FROM '000123000') -- BOTH�� ���� ����
	 , TRIM('    0 0 0 1 2 3 0 0 0    ')
	FROM DUAL;

-- LPAD(������, ����, ����): ������ ���̿��� �������� ���̸� �� ������ ���̸�ŭ ���ڷ� �տ� ä���ִ� �Լ�
-- RPAD(������, ����, ����): ������ ���̿��� �������� ���̸� �� ������ ���̸�ŭ ���ڷ� �ڿ� ä���ִ� �Լ�
-- LPAD, RPAD: ��� ������ ������ ���ڸ� 2BYTE ���, ���̴� BYTE ������ �����Ѵ�.
SELECT LPAD(ENAME, 10, '*')
	 , RPAD(ENAME, 10, '*')
	FROM EMP;

-- ������ ���̰� �������� ���̺��� �۰ų� ������ ���ڸ� ������ �ʴ´�.
SELECT LPAD(ENAME, 6, '*')
	 , RPAD(ENAME, 6, '*')
	FROM EMP;

-- ����� �����ȣ, ����̸��� ��ȸ�ϴµ� ����̸����� ������ �� ���ڸ� ���� ��ȸ
SELECT ENO
	 , SUBSTR(ENAME, 1, LENGTH(ENAME) - 1)
	FROM EMP;

-- 1-3. ���ڿ� ġȯ�Լ�
-- TRANSLATE
-- ġȯ�� ���ڿ� ���Ե� ��� ���ڸ� ġȯ�Ѵ�.
SELECT TRANSLATE('World of War', 'Wo', '--')
	FROM DUAL;

-- REPLACE
-- ġȯ�� ���ڿ��� ������ ���ڿ��� ġȯ�Ѵ�.
SELECT REPLACE('World of War', 'Wo', '--')
	FROM DUAL;

-- 1-4. ���� �Լ�
-- ROUND(������, �Ҽ��� �ڸ���): ������ �Ҽ��� �ڸ������� �ݿø��Ͽ� ��ȯ
SELECT ROUND(123.45678, 3)
	FROM DUAL;

-- �л��� �л���ȣ, �л��̸�, ����, �г�, 4.5 �������� ġȯ�� ������ ��ȸ�ϴ� �� ������ �Ҽ��� ��°���� ��ȸ(ROUND �Լ� ���)
SELECT SNO
	 , SNAME
	 , MAJOR
	 , SYEAR
	 , AVR
	 , ROUND(AVR * 1.125 , 2)
	FROM STUDENT;

-- TRUNC(������, �Ҽ��� �ڸ���): ������ �Ҽ��� �ڸ������� �����Ͽ� ��ȯ
SELECT TRUNC(123.45678, 3)
	FROM DUAL;

-- MOD(������1, ������2): ������1���� ������2�� ���� ������ ����
SELECT MOD(10, 4)
	FROM DUAL;

-- POWER(������1, ������2): ������1�� ������2 ������ ���� ����(������1�� ������2��)
SELECT POWER(3, 3)
	FROM DUAL;

-- CEIL(������): �����ͺ��� ū ���� ���� ���� ����
-- FLOOR(������): �����ͺ��� ���� ���� ū ���� ����
SELECT CEIL(2.59)
	 , FLOOR(2.59)
	FROM DUAL;

-- SQRT(������): �������� ������ ���� ����
SELECT SQRT(9)
	 , SQRT(25)
	 , SQRT(100)
	FROM DUAL;

-- SIGN(������): �������� ��ȣ�� �Ǵ����ִ� �Լ�. �����Ͱ� ������ -1, ����� 1, 0�̸� 0�� ����
SELECT SIGN(-123)
	 , SIGN(0)
	 , SIGN(456)
	FROM DUAL;
	
-- 1-5. ��¥ ����
SELECT SYSDATE
	 , SYSDATE + 100 -- ���ó�¥���� 100�� ��
	 , SYSDATE - 100 -- ���ó�¥���� 100�� ��
	 , SYSDATE + 3 / 24 -- ����ð����κ��� 3�ð� ��
	 , SYSDATE - 5 / 24 -- ����ð����κ��� 5�ð� ��
	 , SYSDATE - TO_DATE('20230523', 'YYYYMMDD') -- �� ��¥���� ����
	 -- ��¥�� TRUNC �Լ��� ����ϸ� �ð� �� �ʸ� 00:00:00�� �ʱ�ȭ�Ѵ�.
	 , TRUNC(SYSDATE) - TO_DATE('20230523', 'YYYYMMDD')
	FROM DUAL;

-- 1999�� 1�� 1�Ϻ��� 100�� �� ���� ������ ������ ������ȣ, �����̸�, �������� ��ȸ
SELECT PNO
	 , PNAME
	 , HIREDATE
	FROM PROFESSOR
	WHERE HIREDATE 
		BETWEEN TO_DATE('19990101', 'YYYYMMDD') 
		AND TO_DATE('19990101', 'YYYYMMDD') + 100;

-- 1-6. ��¥ �Լ�
-- ROUND(��¥, ��¥ ����): ������ ��¥ ���������� ��¥�� ������ ������ ��¥�� �ʱ�ȭ. �������� ��¥�� �����̻� �������� �ø��ȴ�.
SELECT ROUND(SYSDATE, 'DD')
	FROM DUAL;

SELECT ROUND(TO_DATE('20241124', 'YYYYMMDD'), 'MM')
	FROM DUAL;

-- TRUNC(��¥, ��¥ ����): ������ ��¥ ���������� ��¥�� ������ ������ ��¥�� �ʱ�ȭ. �������� ��¥�� �׳� �ʱ�ȭ.
SELECT SYSDATE
	 , TRUNC(SYSDATE, 'YYYY')
	 , TRUNC(SYSDATE, 'MM')
	 , TRUNC(SYSDATE, 'DD')
	FROM DUAL;

-- MONTHS_BETWEEN(��¥1, ��¥2): ��¥1���� ��¥2�� �� ���� ���̸� �������� ġȯ�ؼ� ����
SELECT MONTHS_BETWEEN(TRUNC(SYSDATE, 'DD'), TO_DATE('20230831', 'YYYYMMDD'))
	FROM DUAL;

-- ADD_MONTHS(��¥, ����): ��¥���� ���ڸ�ŭ�� �������� ���� ��¥ ����
SELECT ADD_MONTHS(SYSDATE, 5)
	FROM DUAL;

-- NEXT_DAY(��¥, ����): ��¥ ���Ŀ� ó������ ������ ������ ��¥ ����
SELECT NEXT_DAY(SYSDATE, '�Ͽ���')
	FROM DUAL;

-- LAST_DAY(��¥): ��¥�� �����ϰ� �ִ� ���� ������ ��¥�� ����
SELECT LAST_DAY(SYSDATE)
	FROM DUAL;

-- ����� �����ȣ, ����̸�, �Ի���, �Ի��� +100���� ��¥, �Ի��� +10���� ��¥ ��ȸ
SELECT ENO
	 , ENAME
	 , HDATE
	 , HDATE + 100
	 , ADD_MONTHS(HDATE, 120)
	FROM EMP;
	
-- 1-7. ��ȯ�Լ�
-- TO_CHAR(��¥�� ����, ��ȯ�� ���ڿ��� ����������): �Ű������� ���� ��¥�� ���� �����͸� ������ �������� ��ȯ�� ���ڿ��� ����
-- ���ڸ� ���ڿ��� ��ȯ
SELECT TO_CHAR(10000000, '999,999,999') -- 9�ڸ����� ���ڸ� ǥ���ϰ� 3�ڸ����� ��ǥ ǥ��
	 , TO_CHAR(1000000, '099,999,999') -- 9�ڸ����� ���ڸ� ǥ���ϰ� 3�ڸ����� ��ǥ ǥ��, 0�� �ٿ��� ǥ��
	FROM DUAL;

-- ��¥�� ���ڿ��� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
	 , TO_CHAR(SYSDATE, 'YYYY/MM/DD DAY')
	 , TO_CHAR(SYSDATE, '"������ "YYYY"�� " MM"�� " DD"���Դϴ�."')
	 , TO_CHAR(SYSDATE, 'DY"�����Դϴ�."')
	FROM DUAL;

SELECT TO_DATE('2024/05/24 15:18:00', 'YYYY/MM/DD HH24:MI:SS')
	FROM DUAL;

-- ������ �������� ���� �������� ǥ���ϼ���
-- 'OOO ������ �������� YYYY�� MM�� DD���Դϴ�.'
SELECT PNAME || ' ������ �������� ' || TO_CHAR(HIREDATE, 'YYYY"�� "MM"�� "DD"���Դϴ�."')
	FROM PROFESSOR;

-- �����߿� 3���� ������ ������ ����� �˻��ϼ���
SELECT PNO
	 , PNAME
	 , HIREDATE
	FROM PROFESSOR
	WHERE TO_CHAR(HIREDATE, 'MM') = '03';

-- TO_DATE(���ڿ� ������, ���ڿ� �������� ��¥ ����): �Ű������� ������ ��¥�������� �Ǿ��ִ� ���ڿ��� DATE Ÿ������ ��ȯ �� ����
SELECT TO_DATE('20240524154900', 'YYYYMMDDHH24MISS')
	 , TO_DATE('240524 15', 'YYMMDD HH24')
	 , TO_DATE('24', 'YY')
	 , TO_DATE('24', 'RR')
	 , TO_DATE('99', 'YY')
	 , TO_DATE('99', 'RR')
	 , TO_DATE('2024/05', 'YYYY/MM')
	FROM DUAL;

-- TO_NUMBER(���ڿ� ������, ���ڿ� �������� ���� ����): �Ű������� ������ ���� �������� �� ���ڿ��� NUMBER Ÿ������ ��ȯ �� ����
SELECT TO_NUMBER('-123.456', '999.999')
	 , TO_NUMBER('123', '999.99')
	 , TO_NUMBER('1234')
	FROM DUAL;

-- ROUND(�Ǽ�, �Ҽ���), TRUNC(�Ǽ�, �Ҽ���)
-- ROUND(�Ǽ�), TRUNC(�Ǽ�): ��������(�Ҽ��� ù °�ڸ�����) �ݿø�, ��������(�Ҽ��� ù °�ڸ�����) ����
SELECT ROUND(1.45, 0)
	 , ROUND(1.45)
	FROM DUAL;

-- 1-8. NVL: NULL ó�� �Լ�
-- ������ �����ȣ, �����̸�, ������ȣ, �����̸��� ��ȸ�ϴµ� ��米���� �������� ���� ����� ������ �������� ���� ������ ������ �Բ� ��ȸ
-- ��米���� NULL�� ������ ���������� ���� �������� �����̶�� ��ȸ�ϰ�
-- ������ NULL�� ������ ���������� ���� �������� �����̶�� ��ȸ
SELECT NVL(C.CNO, '���� �������� ����')
	 , NVL(C.CNAME, '���� �������� ����')
	 , NVL(P.PNO, '���� �������� ����')
	 , NVL(P.PNAME, '���� �������� ����')
	FROM COURSE C
	FULL OUTER JOIN PROFESSOR P
	  ON C.PNO = P.PNO;

-- 1-9. DECODE(�÷����̳� ��ȸ�ؿ� ������, ���� ��1, 
--			   �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��1�� ��ġ�� �� ����� ����, 
--			   �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��1�� ��ġ���� ���� ����� ����)
-- DECODE�� ���ǹ��� ó���ϴ� �������� ���ǿ��� ���� �־ ����� �� �ִ�.
SELECT ENO
	 , ENAME
	 , DNO
	 , DECODE(DNO, '10', '�λ���', '�ٸ� �μ�') AS "�μ���"
	FROM EMP
	ORDER BY DNO;

-- DECODE(�÷����̳� ��ȸ�ؿ� ������, ���� ��1, 
--		  �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��1�� ��ġ�� �� ����� ����, 
--		  ���� ��2,
--		  �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��2�� ��ġ�� �� ����� ����, 
--		  ���� ��3,
--		  �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��3�� ��ġ�� �� ����� ����, 
--        ...
--        ���� ��N,
--		  �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��N�� ��ġ�� �� ����� ����, 
--        �÷��� �����ͳ� ��ȸ�ؿ� �����Ͱ� ���� ��N�� ��ġ���� ���� �� ����� ����(���� ���ǰ� ��� ��ġ���� �ʴ� ���))
SELECT ENO
	 , ENAME
	 , DNO
	 , DECODE(DNO, 
	 			'10', '�λ���', 
	 			'01', '�濵��',
	 			'02', '������',
	 			'�� �� �μ�') AS "�μ���"
	FROM EMP
	ORDER BY DNO;

-- ����� �����ȣ, ����̸�, ����, �޿�, �λ�޿� ��ȸ
-- ������ �����̸� 50%�λ�, ������ �濵�̸� 30%�λ�, �����̸� 20%�λ�, �� �� ������ 10%�̻� �� �λ�޿� ��ȸ
SELECT ENO
	 , ENAME
	 , JOB
	 , SAL
	 , DECODE(JOB,
	 			'����', SAL * 1.5,
	 			'�濵', SAL * 1.3,
	 			'����', SAL * 1.2,
	 			SAL * 1.1) AS CHANGED_SAL
	FROM EMP;

-- 1-10. CASE~WHEN~THEN~ELSE END
-- CASE (�÷���)
-- 	  WHEN ����1
--	  THEN ����1�� TRUE�� �� ó���� ����
-- 	  WHEN ����2
--	  THEN ����2�� TRUE�� �� ó���� ����
--    ...
-- 	  WHEN ����N
--	  THEN ����N�� TRUE�� �� ó���� ����
--	  ELSE
-- 	  �� ������ ��� FALSE�� �����Ϳ� ���� ó������
-- 	  END AS ��Ī
-- CASE ���� �÷��̳� �����͸� ������ ���(SWITCH CASE �� ó�� ���)
SELECT ENO
	 , ENAME
	 , COMM
	 , CASE NVL(COMM, -1)
	 	 WHEN 0 
	 	 THEN '���ʽ� ����'
	 	 WHEN -1
	 	 THEN '�ش����'
	   ELSE '���ʽ�: ' || COMM
	   END AS COMM_TXT
	 FROM EMP;

-- CASE ���� �÷��̳� �����͸� �������� ���� ���(WHEN ���� �񱳹��� ����Ͽ� ������ ������ �� �ִ�.)
SELECT ENO
	 , ENAME
	 , COMM
	 , CASE
	 	 WHEN COMM = 0
	 	 THEN '���ʽ� ����'
	 	 WHEN COMM IS NULL
	 	 THEN '�ش����'
	   ELSE '���ʽ�: ' || COMM
	   END AS COMM_TXT
	 FROM EMP;

	
-- ����� �����ȣ, ����̸�, ����, �޿�, �λ�޿� ��ȸ
-- ������ �����̸� 50%�λ�, ������ �濵�̸� 30%�λ�, �����̸� 20%�λ�, �� �� ������ 10%�̻� �� �λ�޿� ��ȸ
SELECT ENO
     , ENAME
 	 , JOB
 	 , SAL
 	 , CASE JOB
	 	 WHEN '����'
	 	 THEN SAL * 1.5
	 	 WHEN '�濵'
	 	 THEN SAL * 1.3
	 	 WHEN '����'
	 	 THEN SAL * 1.2
	   ELSE SAL * 1.1
	   END AS CHANGED_SAL
FROM EMP;


SELECT ENO
     , ENAME
 	 , JOB
 	 , SAL
 	 , CASE 
	 	 WHEN JOB = '����'
	 	 THEN SAL * 1.5
	 	 WHEN JOB = '�濵'
	 	 THEN SAL * 1.3
	 	 WHEN JOB = '����'
	 	 THEN SAL * 1.2
	   ELSE SAL * 1.1
	   END AS CHANGED_SAL
FROM EMP;