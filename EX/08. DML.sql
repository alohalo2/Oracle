-- 1. DML(DATA MANIPULATION LANGUAGE): 汽戚斗 繕拙 情嬢
-- 汽戚斗研 煽舌, 呪舛 肢薦馬澗 情嬢稽 INSERT INTO, UPDATE SET, DELETE FROM戚 糎仙廃陥.
-- DML精 闘沓先芝聖 刃戟馬奄 是背辞 牌雌 COMMIT戚蟹 ROLLBACK聖 疑鋼廃陥.
-- 1-1. INSERT INTO: 砺戚鷺拭 汽戚斗研 煽舌馬澗 誤敬嬢
-- 析採 鎮軍拭 企廃 汽戚斗研 煽舌
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9997', '舌掩至', '竺域', SYSDATE);
COMMIT;

SELECT *
	FROM EMP;
	
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9996', '績鴬舛', '鯵降', SYSDATE);
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9995', '畠掩疑', '噺域', SYSDATE);
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9994', '繕佐繕', '走据', SYSDATE);
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9993', '舛亀穿', '井慎', SYSDATE);
-- COMMIT戚 降持廃 拙穣拭 企背辞澗 ROLLBACK生稽 昼社拝 呪 蒸陥.
ROLLBACK;

-- INSERT INTO 獣 走舛廃 鎮軍税 鯵呪人 展脊拭 限澗 汽戚斗研 脊径背醤 廃陥.
INSERT INTO EMP(ENO, ENAME, JOB, HDATE) VALUES('9997', '舌掩至', '竺域');
INSERT INTO EMP(SAL) VALUES('けけけけけけけけ');
-- VARCHAR 展脊税 収切 葵戚 NUMBER 展脊生稽 莫痕発戚 析嬢蟹檎辞 煽舌吉陥.
INSERT INTO EMP(SAL) VALUES('123897');

-- 乞窮 鎮軍税 汽戚斗研 煽舌拝 凶澗 鎮軍走舛聖 持繰背亀 吉陥.
INSERT INTO EMP(ENO, ENAME, JOB, MGR, HDATE, SAL, COMM, DNO)
	VALUES ('9996', '績鴬舛', '噺域', '0001', SYSDATE, 4000, 300, '10');

INSERT INTO EMP VALUES ('9995', '繕佐繕', '噺域', '0201', SYSDATE, 3700, 280, '20');

COMMIT;

-- 陥勲税 汽戚斗研 SELECT 姥庚聖 戚遂背辞 煽舌
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

-- DNO戚 30昔 紫据 鯉系聖 EMP 砺析鷺拭辞 繕噺背辞 EMP_DNO30拭 煽舌
INSERT INTO EMP_DNO30
SELECT *
	FROM EMP
	WHERE DNO = '30';
COMMIT;

SELECT *
	FROM EMP_DNO30;

-- SELECT 姥庚聖 戚遂背辞 陥勲税 汽戚斗研 煽舌馬澗汽 働舛 鎮軍税 汽戚斗幻 煽舌
-- DNO戚 10昔 紫据税 紫据腰硲, 紫据戚硯幻 EMP 砺戚鷺拭辞 繕噺背辞 EMO_DNO30 砺戚鷺拭 煽舌
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
	 WHERE LOC = '辞随';
COMMIT;

/*DROP TABLE COURSE_PROFESSOR;*/ -- TABLE 肢薦

CREATE TABLE COURSE_PROFESSOR(
	CNUM VARCHAR2(8),
	COURSE_NAME VARCHAR2(20),
	ST_NUM NUMBER(1, 0),
	PNUM VARCHAR2(8),
	PROFESSOR_NAME VARCHAR2(20)
);

-- 乞窮 引鯉税 引鯉腰硲, 引鯉戚硯, 俳繊, 眼雁馬澗 嘘呪税 嘘呪腰硲, 嘘呪戚硯 COURSE_PROFESSOR 煽舌
-- 眼雁嘘呪亜 蒸澗 引鯉精 眼雁嘘呪腰硲人 戚硯聖 NULL稽 煽舌

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

-- 1-2. UPDATE SET: 汽戚斗研 呪舛馬澗 誤敬嬢
-- WHERE 箭聖 紫遂馬走 省生檎 乞窮 汽戚斗亜 呪舛吉陥.

UPDATE EMP_DNO30 
	SET MGR = '0002';

COMMIT;

SELECT *
	FROM EMP_DNO30;

-- WHERE 箭稽 働舛 汽戚斗幻 呪舛
-- EMP_DNO30砺戚鷺拭辞 ENO 2007昔 紫据税 厭食研 3100生稽 呪舛
UPDATE EMP_DNO30 
	SET 
		SAL = 3100
	WHERE ENO = '2007';
COMMIT;

-- 食君鯵税 鎮軍 汽戚斗研 廃 腰拭 呪舛拝 凶澗 呪舛拝 鎮軍聖 ,稽 広嬢辞 走舛
-- EMP_DNO30砺戚鷺拭辞 ENO戚 3004昔 紫据税 穣巷研 井慎生稽 MGR精 2003生稽 HDATE澗 神潅劾促稽 SAL精 5000生稽
-- COMM澗 500生稽 呪舛
UPDATE EMP_DNO30 
	SET 
		JOB = '井慎',
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

-- EMP_DNO30 砺戚鷺拭辞 DNO戚 20, 30採辞研 60採辞稽 搭杯馬壱
-- 背雁 採辞税 紫据級税 左格什研 50%昔雌
UPDATE EMP_DNO30 
	SET
		DNO = '60',
		COMM = COMM * 1.5
	WHERE DNO IN (20,30);
COMMIT;

SELECT *
	FROM EMP_DNO30;

-- 辞崎汀軒研 戚遂廃 汽戚斗 呪舛
-- SET 箭拭 辞崎汀軒税 衣引稽 蟹神澗 鎮軍税 鯵呪幻鏑 ()広精 鎮軍聖 走舛馬壱 = 陥製拭 辞崎汀軒研 拙失廃陥.
-- ()稽 広昔 鎮軍税 鯵呪人 展脊戚 辞崎汀軒税 衣引税 汽戚斗税 鎮軍鯵呪人 展脊戚 析帖背醤 廃陥.
-- 辞崎汀軒税 衣引澗 廃 楳幻 繕噺掬醤 廃陥.

CREATE TABLE DEPT_COPY1
	AS SELECT * FROM DEPT;

-- DEPT_COPY1 砺戚鷺拭辞 DNO戚 20,30昔 採辞研 50採辞人 搭杯
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

-- DEPT_COPY1 砺戚鷺拭辞 DNO戚 40昔 採辞税 DIRECTOR研 
-- EMP砺戚鷺拭辞 置壱厭食研 閤澗 紫据生稽 呪舛
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

-- 1-3. DELETE FROM: 汽戚斗研 肢薦馬澗 誤敬嬢
-- 楳 舘是稽 汽戚斗研 肢薦馬奄 凶庚拭 鎮軍聖 走舛拝 琶推亜 蒸陥.
-- WHERE 箭聖 紫遂馬走 省生檎 砺戚鷺税 乞窮 汽戚斗研 肢薦廃陥.
DELETE FROM DEPT_COPY1;
COMMIT;

-- WHERE 箭稽 働舛 汽戚斗幻 肢薦
DELETE FROM EMP_DNO30
	WHERE DNO IN ('01','10');
COMMIT;

SELECT *
	FROM EMP_DNO30;

-- WHERE 箭拭 辞崎汀軒稽 働舛 汽戚斗研 走舛拝 呪亀 赤陥.
DELETE FROM EMP_DNO30
	WHERE ENO IN (
		SELECT ENO
			FROM EMP_DNO30
			WHERE SAL >= 4000
	);
COMMIT;

CREATE TABLE STUDENT_COPY1
	AS SELECT * FROM STUDENT;

-- STUDENT_COPY1 砺戚鷺拭辞 奄源壱紫 失旋税 汝液戚 60繊 戚馬昔 俳持級 乞砧 肢薦
DELETE FROM STUDENT_COPY1
	WHERE SNO IN (
		SELECT SNO -- 繕噺拝 汽戚斗研 設 竺舛馬奄, 繕闇拭 背雁馬澗 鎧遂戚 伽 繕噺 鯉系拭 赤聖 琶推澗 蒸製
			FROM SCORE 
			GROUP BY SNO
			HAVING AVG(RESULT) <= 60
	);
COMMIT;

SELECT *
	FROM STUDENT_COPY1; -- 60繊 戚雌戚暗蟹 汽戚斗亜 蒸澗 俳持級幻 蟹身
	











