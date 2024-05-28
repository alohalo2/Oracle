--1) WITH 절을 이용하여 정교수만 모여있는 가상테이블 하나와 일반과목(과목명에 일반이 포함되는)들이 모여있는 가상테이블 하나를 생성하여 
--   일반과목들을 강의하는 교수의 정보 조회하세요.(과목번호, 과목명, 교수번호, 교수이름)
WITH 
	JUNGPRO AS (
		SELECT P.PNO
			 , P.PNAME
			 , P.ORDERS
			FROM PROFESSOR P
			WHERE P.ORDERS = '정교수'
	), 
	NOMALCNAME AS (
		SELECT C.CNO
			 , C.CNAME
			 , C.PNO
			FROM COURSE C
			WHERE C.CNAME LIKE '%일반%'
	)
SELECT NOMALCNAME.CNO
	 , NOMALCNAME.CNAME
	 , JUNGPRO.PNO
	 , JUNGPRO.PNAME
	FROM JUNGPRO
	JOIN NOMALCNAME
	  ON JUNGPRO.PNO = NOMALCNAME.PNO;

--2) WITH 절을 이용하여 급여가 3000이상인 사원정보를 갖는 가상테이블 하나와 보너스가 500이상인 사원정보를 갖는 가상테이블 하나를 생성하여
--   두 테이블에 모두 속해있는 사원의 정보를 모두 조회하세요.
WITH 
	OVER3000 AS (
		SELECT *
			FROM EMP
			WHERE SAL >= 3000
	), 
	COMMOVER500 AS (
		SELECT *
			FROM EMP
			WHERE COMM >= 500
	)
SELECT *
	FROM OVER3000
	JOIN COMMOVER500
	  ON OVER3000.ENO = COMMOVER500.ENO;
	 
--3) WITH 절을 이용하여 평점이 3.3이상인 학생의 목록을 갖는 가상테이블 하나와 학생별 기말고사 평균점수를 갖는 가상테이블 하나를 생성하여
--   평점이 3.3이상인 학생의 기말고사 평균 점수를 조회하세요.
WITH
	AVGOVER AS (
		SELECT SNO 
			 , AVR
			FROM STUDENT
			WHERE AVR >= 3.3
	),
	AVGRESULT AS (
		SELECT SNO
			 , AVG(RESULT) AS AVG_RESULT
			FROM SCORE
			GROUP BY SNO
	)
SELECT AVGOVER.SNO
	 , AVGRESULT.AVG_RESULT
	FROM AVGOVER
	JOIN AVGRESULT
	  ON AVGOVER.SNO = AVGRESULT.SNO

--4) WITH 절을 이용하여 부임일자가 25년이상된 교수정보를 갖는 가상테이블 하나와 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 기말고사성적을
--   갖는 가상테이블 하나를 생성하여 기말고사 성적이 90이상인 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 교수이름, 기말고사성적을 조회하세요.
WITH
	OVERHIREDATE25 AS (
		SELECT *
			FROM PROFESSOR
			WHERE (MONTHS_BETWEEN(SYSDATE, HIREDATE)) >= 300 
	),
	OVERRESULT90 AS (
		SELECT C.CNO
			 , C.CNAME
			 , ST.SNO
			 , ST.SNAME
			 , P.PNO
			 , P.PNAME
			 , SC.RESULT
			FROM SCORE SC
			JOIN STUDENT ST
			  ON SC.SNO = ST.SNO
			JOIN COURSE C
			  ON C.CNO = SC.CNO
			JOIN PROFESSOR P
			  ON C.PNO = P.PNO
			WHERE SC.RESULT >= 90
	)
SELECT OVERRESULT90.CNO
	 , OVERRESULT90.CNAME
	 , OVERRESULT90.SNO
	 , OVERRESULT90.SNAME
	 , OVERRESULT90.PNO
	 , OVERRESULT90.PNAME
	 , OVERRESULT90.RESULT
	FROM OVERHIREDATE25
	JOIN OVERRESULT90
	  ON OVERHIREDATE25.PNO = OVERRESULT90.PNO;
	
--1) STUDENT 테이블을 참조하여 ST_TEMP 테이블을 만들고 모든 학생의 성적을 4.5만점 기준으로 수정하세요
	 
	 
CREATE TABLE ST_TEMP 
	AS 
	SELECT SNO
		 , SNAME
		 , SEX
		 , SYEAR
		 , MAJOR
		 , (AVR * 1.125) AS AVR_UPDATE
		FROM STUDENT;

SELECT *
	FROM ST_TEMP;

DROP TABLE ST_TEMP; 
	 
--2) PROFESSOR 테이블을 참조하여 PF_TEMP 테이블을 만들고 모든 교수의 부임일자를 100일 앞으로 수정하세요
CREATE TABLE PF_TEMP 
	AS 
		SELECT PNO
			 , PNAME
			 , SECTION 
			 , ORDERS
			 , (HIREDATE + 100) AS HIREDATE100
			FROM PROFESSOR;

SELECT *
	FROM PF_TEMP;

--3) ST_TEMP 테이블에서 화학과 2학년 학생의 정보를 삭제하세요
DELETE FROM ST_TEMP
	WHERE MAJOR = '화학' AND SYEAR = 2;

SELECT *
	FROM ST_TEMP;

--4) PF_TEMP 테이블에서 조교수의 정보를 삭제하세요
DELETE FROM PF_TEMP
	WHERE ORDERS = '조교수';

SELECT *
	FROM PF_TEMP;

--5) EMP 테이블을 참조하여 EMP2 테이블을 만들고 
-- DNO = 30인 사원의 보너스를 15프로 상승시킨 값으로 변경하시고 
-- DNO = 10인 사원의 보너스를 5프로 상승시킨 값으로 변경,
-- DNO = 20인 사원의 급여를 10프로 상승시킨 값으로 변경하세요.
CREATE TABLE EMP2
	AS 
		SELECT *
			FROM EMP;

SELECT *
	FROM EMP2;

UPDATE EMP2
	SET COMM = COMM * 1.15
	WHERE DNO = '30';
COMMIT;

DROP TABLE EMP2;

UPDATE EMP2
	SET COMM = COMM * 1.05
	WHERE DNO = '10';
COMMIT;

UPDATE EMP2
	SET COMM = COMM * 1.1
	WHERE DNO = '20';
COMMIT;

--6) 화학과 2학년 학생중 기말고사 성적의 등급이 A, B인 정보를 갖는 테이블 SCORE_STGR을 생성하세요.(SNO, SNAME, MAJOR, SYEAR, CNO, CNAME, RESULT, GRADE)
CREATE TABLE SCORE_STGR 
	AS 
		SELECT ST.SNO
			 , ST.SNAME
			 , ST.MAJOR
			 , ST.SYEAR
			 , C.CNO
			 , C.CNAME
			 , SC.RESULT
			 , GR.GRADE
			FROM STUDENT ST
			JOIN SCORE SC
			  ON ST.SNO = SC.SNO 
			JOIN COURSE C
			  ON C.CNO = SC.CNO 
			JOIN SCGRADE GR
			  ON SC.RESULT BETWEEN GR.LOSCORE AND GR.HISCORE 
			WHERE ST.MAJOR = '화학'
			  AND ST.SYEAR = 2
			  AND GR.GRADE IN ('A', 'B');
			  
SELECT *
	FROM SCORE_STGR;

--7) 생물학과 학생중 평점이 2.7이상인 학생이 수강중인 과목의 정보를 갖는 테이블 ST_COURSEPF를 생성하세요. (SNO, SNAME, CNO, CNAME, PNO, PNAME, AVR)
CREATE TABLE ST_COURSEPF
	AS 
		SELECT ST.SNO 
			 , ST.SNAME 
			 , C.CNO 
			 , C.CNAME 
			 , P.PNO 
			 , P.PNAME 
			 , ST.AVR 
			FROM STUDENT ST
			JOIN SCORE SC
			  ON ST.SNO = SC.SNO 
			JOIN COURSE C
			  ON SC.CNO = C.CNO 
			JOIN PROFESSOR P
			  ON C.PNO = P.PNO 
			WHERE MAJOR = '생물'
			  AND AVR >= 2.7;	
			  
SELECT *
	FROM ST_COURSEPF;			  
			  
			  
			  
			  