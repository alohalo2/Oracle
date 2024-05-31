-- 1. Inner Join
-- JOIN�� ���� ���̺� �л�Ǿ� �ִ� �����͸� �� ���� ��ȸ�ϱ� ���� ����ϴ� ���
-- JOIN���� INNER JOIN�� OUTER JOIN�� �����Ѵ�.
-- JOIN ������ �׻� ���� �÷��� �ش��ϴ� ������ ON ���� �������� �Ѵ�.
-- Inner Join�� �� ���̺� ����� �����͸� ��ȸ�ϴ� ���
-- �� ���̺� �����ϴ� ����� �÷��� ���� �������� ����Ѵ�.
-- �л��� �л���ȣ, �л��̸�, �����ȣ, �⸻��� ���� ��ȸ
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , SC.RESULT
	FROM STUDENT ST
	INNER JOIN SCORE SC
	   ON ST.SNO = SC.SNO
	ORDER BY ST.SNO;
	
SELECT *
	FROM STUDENT
	ORDER BY SNO;
	
SELECT *
	FROM SCORE
	ORDER BY SNO;
	
-- �����ȣ, �����̸�, ��米�� ��ȣ, ��米�� �̸� ��ȸ(COURSE, PROFESSOR ���̺� ����)
SELECT C.CNO
	 , C.CNAME
	 , C.PNO
	 , P.PNAME
	FROM COURSE C
	INNER JOIN PROFESSOR P
	   ON C.PNO = P.PNO;
	  
-- INNER JOIN���� INNER�� ���� �����ϴ�.
SELECT C.CNO
	 , C.CNAME
	 , C.PNO
	 , P.PNAME
	FROM COURSE C
	JOIN PROFESSOR P
	   ON C.PNO = P.PNO;

-- 1-1. �����
-- ������� ����� �÷��� �����Ͱ� ���� �����͸��� ��ȸ�ϴ� ����
-- ����� �����ȣ, ����̸�, ����, �޿�, ���ʽ�, �μ���ȣ, �μ��̸�, �μ����� ��ȸ
-- ANSI ǥ�� ���
SELECT E.ENO	
	 , E.ENAME
	 , E.JOB
	 , E.SAL
	 , E.COMM
	 , E.DNO
	 , D.DNO
	 , D.DNAME
	 , D.LOC
	FROM EMP E
	JOIN DEPT D
	  ON E.DNO = D.DNO;
	 
-- ORACLE������ ����ϴ� ����� JOIN
SELECT E.ENO	
	 , E.ENAME
	 , E.JOB
	 , E.SAL
	 , E.COMM
	 , E.DNO
	 , D.DNO
	 , D.DNAME
	 , D.LOC
	FROM EMP E
	   , DEPT D
	WHERE E.DNO = D.DNO;

-- �� �� ���̺� �̻��� ���̺� ����
-- �л��� �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��缺�� ��ȸ
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , C.CNAME
     , SC.RESULT
    FROM STUDENT ST
    JOIN SCORE SC
      ON ST.SNO = SC.SNO
    JOIN COURSE C
      ON SC.CNO = C.CNO
     ORDER BY SNO;

-- �л��� �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��缺��, ��米�� ��ȣ, ��米�� �̸� ��ȸ
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , C.CNAME
     , SC.RESULT
     , C.PNO
     , P.PNAME 
    FROM STUDENT ST
    JOIN SCORE SC
      ON ST.SNO = SC.SNO
    JOIN COURSE C
      ON SC.CNO = C.CNO
    JOIN PROFESSOR P
      ON C.PNO = P.PNO
     ORDER BY SNO;

-- 1-2. ������
-- �� ������ �ش� �÷��� ������ ���� ũ�� ������, ���̰����� �ε�ȣ�� BETWEEN AND ���� �̿��ؼ� ���ϴ� ���� ����
-- �л��� �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��� ����, �⸻��� ������ ��� ��ȸ
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , C.CNAME
	 , SC.RESULT
	 , GR.GRADE 
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	JOIN COURSE C
	  ON SC.CNO = C.CNO
	JOIN SCGRADE GR
	--�����λ��
	  ON SC.RESULT <= GR.HISCORE 
	 AND SC.RESULT >= GR.LOSCORE
	ORDER BY ST.SNO, SC.CNO;

-- �л��� �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��� ����, �⸻��� ������ ��� ��ȸ(BETWEEN AND �� ���)
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , C.CNAME
	 , SC.RESULT
	 , GR.GRADE 
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	JOIN COURSE C
	  ON SC.CNO = C.CNO
	JOIN SCGRADE GR
	--�����λ��
	  ON SC.RESULT BETWEEN GR.LOSCORE AND GR.HISCORE 
	ORDER BY ST.SNO, SC.CNO;

-- ����� �����ȣ, ����̸�, �޿�, �޿���� ��ȸ(EMP, SALGRADE)
SELECT E.ENO 
	 , E.ENAME 
	 , E.SAL 
	 , S.GRADE 
	FROM EMP E
	JOIN SALGRADE S
	  ON E.SAL BETWEEN S.LOSAL AND S.HISAL;
	 
-- 1-3. ��������
-- ���εǴ� �� ���̺��� ������ �� ���������̶� �θ���.
-- ����� �����ȣ, ����̸�, �����ȣ, ����̸�
SELECT E.ENO
	 , E.ENAME
	 , E.MGR
	 , EM.ENAME 
	FROM EMP E
	JOIN EMP EM
	  ON E.MGR = EM.ENO;

-- 1-4. CROSS JOIN
-- ���� ���̺��� ������ �� ���� ������ �������� ������ cross join�� �Ͼ��.
-- cross join�� ���εǴ� ��� ���̺��� �����͵��� 1��1�� ���εǾ� ��ȸ�Ǵ� �����̴�.
-- ���̺���� ������ ���� �׻� ���� ������ ����Ͽ� cross join�� �Ͼ�� �ʵ��� �Ѵ�.
SELECT ST.SNO
	 , ST.SNAME
	 , SC.CNO
	 , C.CNAME
	 , SC.RESULT
	FROM STUDENT ST
	   , SCORE SC
	   , COURSE C;

-- 2. OUTER JOIN
-- OUTER JOIN�� INNER JOIN ����� �߰��� ������ �Ǵ� ���̺� �����ִ� �����͸� ��ȸ�ϴ� ���
-- ������ �Ǵ� ���̺��� OUTER JOIN �տ� LEFT, RIGHT, FULL�� �����Ѵ�.
-- LEFT�� ���� ���̺��� �����ϸ� FROM ���� ����� ���̺��� ������ �ǰ�
-- RIGHT�� ���� ���̺��� �����ϸ� ���εǴ� ���̺��� ������ �ȴ�.
-- FULL�� ���� ���̺��� �����ϸ� FROM�� ���̺�� ���εǴ� ���̺� ��ΰ� ������ �Ǿ� INNER JOIN ����� 
-- FROM �� ���̺��� �����ϴ� �����Ϳ� ���εǴ� ���̺��� �����ϴ� �����͵� ��� �߰��� ��ȸ�Ѵ�.
	  
-- 2-1. LEFT OUTER JOIN
-- FROM ���� ���̺��� �����ϴ� �����͸� �߰��� ��ȸ�ϴ� JOIN
-- �л��� �л���ȣ, �л��̸�, �⸻��� ������ ��ȸ�ϴ� �� �⸻��� ������ �������� �ʴ� �л��� ������ ��ȸ
INSERT INTO STUDENT VALUES('999999', '���õ', '��', 1, '�İ�', 3.0);
COMMIT;

-- ANSI ǥ�� ���
SELECT ST.SNO
	 , ST.SNAME
	 , SC.RESULT
	FROM STUDENT ST
	LEFT OUTER JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	ORDER BY ST.SNO DESC;

-- ORACLE������ ����ϴ� LEFT OUTER JOIN ��� (+) ��ȣ�� �̿��Ѵ�
-- (+) ��ȣ�� LEFT OUTER JOIN�� RIGHT OUTER JOIN�� ��밡��
SELECT ST.SNO
	 , ST.SNAME
	 , SC.RESULT
	FROM STUDENT ST
	   , SCORE SC
	WHERE ST.SNO = SC.SNO(+)
	ORDER BY ST.SNO DESC;

-- �����ȣ, �����̸�, ������ȣ, �����̸��� ��ȸ�ϴµ� ��米���� �������� ���� ���������� ��ȸ
-- NVL ��米���� �������� ���� ������ ������ȣ�� �����̸��� ��米�� �������� ���� ���� ��ȸ
SELECT C.CNO 
	 , C.CNAME 
	 , NVL(C.PNO, '��米�� �������� ����') AS PNO 
	 , NVL(P.PNAME, '��米�� �������� ����') AS PNAME 
	FROM COURSE C
	LEFT OUTER JOIN PROFESSOR P
	  ON C.PNO = P.PNO;

-- ����� �����ȣ, ����̸�, �����ȣ, ����̸� ��ȸ�ϴ� �� ����� �������� ���� ����� ������ ��ȸ(��������)
SELECT E.ENO
	 , E.ENAME
	 , E.MGR
	 , EM.ENAME
	FROM EMP E
	LEFT OUTER JOIN EMP EM
	  ON E.MGR = EM.ENO;
	 
-- LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN ���� OUTER�� ���� �����ϴ�.
SELECT E.ENO
	 , E.ENAME
	 , E.MGR
	 , EM.ENAME
	FROM EMP E
	LEFT JOIN EMP EM
	  ON E.MGR = EM.ENO;
	 
	 
-- 2-2. RIGHT OUTER JOIN
-- INNER JOIN ��ȸ ����� �߰��� ���εǴ� ���̺��� �����ϴ� �����͸� ��ȸ�ϴ� JOIN
-- �����ȣ, �����̸�, ������ȣ, �����̸� ��ȸ�ϴµ� ���� �������� �������� ���� ���� ������ ��ȸ
SELECT C.CNO
	 , C.CNAME
	 , P.PNO
	 , P.PNAME
	FROM COURSE C
	RIGHT OUTER JOIN PROFESSOR P
	  ON C.PNO = P.PNO;
	 
SELECT C.CNO
	 , C.CNAME
	 , P.PNO
	 , P.PNAME
	FROM PROFESSOR P
	LEFT OUTER JOIN COURSE C
	  ON C.PNO = P.PNO;

-- 3. FULL OUTER JOIN
-- FULL OUTER JOIN�� INNER JOIN�� ��ȸ ����� FROM �� ���̺��� �����ϴ� ������, ���εǴ� ���̺��� �����ϴ� ������
-- ��� ��ȸ�ϴ� JOIN
-- �����ȣ, �����̸�, ������ȣ, �����̸� ��ȸ�ϴµ� ������ �������� ���� ����� �������� �������� ���� ������ ������ ��� ��ȸ
SELECT C.CNO
	 , C.CNAME
	 , P.PNO
	 , P.PNAME
	FROM COURSE C
	FULL OUTER JOIN PROFESSOR P
	  ON C.PNO = P.PNO;
	 
INSERT INTO EMP VALUES ('9999', '���õ', '����', NULL, SYSDATE, 3000, 300, NULL);
INSERT INTO DEPT VALUES ('70', '�м�', '����', NULL);
COMMIT;
-- ����� �����ȣ, ����̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϴµ� �μ��� �������� ���� ����� ������ ����� �Ѹ� �������� �ʴ� �μ���
-- ������ �Բ� ��ȸ
SELECT E.ENO
	 , E.ENAME
	 , D.DNO
	 , D.DNAME
	FROM EMP E
	FULL JOIN DEPT D
	  ON E.DNO = D.DNO;

-- 4. ���� ���̺� ����
-- ����� �����ȣ, ����̸�, �޿�, �޿����, �μ���ȣ, �μ��̸� ��ȸ�ϴµ� �μ��� �������� ���� ����� ������ ��ȸ
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	 , GR.GRADE
	 , E.DNO
	 , D.DNAME
	FROM EMP E
	JOIN SALGRADE GR
	  ON E.SAL BETWEEN GR.LOSAL AND GR.HISAL
	LEFT JOIN DEPT D
	  ON E.DNO = D.DNO;

-- ON������ ������ ������ �߰��� ���� WHERE ���� ����������
-- AND, OR�� ����ؼ� ������ ������ ����� �� �ִ�.
-- �޿��� 3000�̻��̰� �μ���ȣ�� 01, 10, 20, 60�� 
-- ����� �����ȣ, ����̸�, �޿�, �޿����, �μ���ȣ, �μ��̸� ��ȸ�ϴµ� �μ��� �������� ���� ����� ������ ��ȸ
-- OUTER JOIN�̶� ���������� �޶����� �ٸ� �����Ͱ� ������ �ȴ�.
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	 , GR.GRADE
	 , E.DNO
	 , D.DNAME
	FROM EMP E
	JOIN SALGRADE GR
	  ON E.SAL BETWEEN GR.LOSAL AND GR.HISAL
	 AND E.SAL >= 3000
	LEFT JOIN DEPT D
	  ON E.DNO = D.DNO
	 AND E.DNO IN ('01', '10', '20', '60'); 

-- �ٸ� �����Ͱ� ��ȸ�Ǵ� ����
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	 , GR.GRADE
	 , E.DNO
	 , D.DNAME
	FROM EMP E
	JOIN SALGRADE GR
	  ON E.SAL BETWEEN GR.LOSAL AND GR.HISAL
	LEFT JOIN DEPT D
	  ON E.DNO = D.DNO
	WHERE E.SAL >= 3000
      AND E.DNO IN ('01', '10', '20', '60'); 
	 
SELECT E.ENO
	 , E.ENAME
	 , E.DNO
	 , D.DNAME
	FROM EMP E
	LEFT JOIN DEPT D
	  ON E.DNO = D.DNO
	 AND E.DNO IN ('01', '10', '20', '60');

SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	 , GR.GRADE
	 , E.DNO
	 , D.DNAME
	FROM EMP E
	JOIN SALGRADE GR
	  ON E.SAL BETWEEN GR.LOSAL AND GR.HISAL
	 AND E.SAL >= 3000
	JOIN DEPT D
	  ON E.DNO = D.DNO
     AND E.DNO IN ('01', '10', '20', '60');
	 
SELECT E.ENO
	 , E.ENAME
	 , E.SAL
	 , GR.GRADE
	 , E.DNO
	 , D.DNAME
	FROM EMP E
	JOIN SALGRADE GR
	  ON E.SAL BETWEEN GR.LOSAL AND GR.HISAL
	JOIN DEPT D
	  ON E.DNO = D.DNO
	WHERE E.SAL >= 3000
	  AND E.DNO IN ('01', '10', '20', '60');

-- �л��� �л���ȣ, �л��̸�, �����ȣ, �����̸�, �⸻��� ����, �⸻��� ���� ���, ��米�� ��ȣ, ��米�� �̸� ��ȸ
SELECT P.PNO
	 , P.PNAME
	 , C.CNO
	 , C.CNAME
	 , SC."RESULT"
	 , GR.GRADE 
	 , ST.SNO 
	 , ST.SNAME
	FROM COURSE C
	JOIN SCORE SC
	  ON C.CNO = SC.CNO 
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO 
	JOIN SCGRADE GR
	  ON SC."RESULT" BETWEEN GR.LOSCORE AND GR.HISCORE 
	JOIN STUDENT ST
	  ON SC.SNO = ST.SNO;