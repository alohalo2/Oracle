--1) 어제 만든 SCORE_STGR 테이블의 SNO 컬럼에 INDEX를 추가하세요.
CREATE INDEX SCORE_STGR_SNO_IDX
    ON SCORE_STGR (SNO);

--2) 어제 만든 ST_COURSEPF 테이블의 SNO, CNO, PNO 다중 컬럼에 INDEX를 추가하세요.
CREATE INDEX ST_COURSEPF_SNO_CNO_PNO_IDX
    ON ST_COURSEPF (SNO, CNO, PNO);

--뷰 이름은 자유
--1) 학생의 평점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_STUDENT_INFO_AVGRES(
    STUDENT_NUM,
    STUDENT_NAME,
    STUDENT_MAJOR,
    STUDENT_SYEAR,
    STUDENT_AVR_CONVERT
) AS (
    SELECT ST.SNO
         , ST.SNAME
         , ST.MAJOR
         , ST.SYEAR
         , ST.AVR * 1.125 AS AVR_CONVERT
        FROM STUDENT ST
);

SELECT *
    FROM V_STUDENT_INFO_AVGRES
    ORDER BY STUDENT_NUM, STUDENT_NAME;

--2) 각 과목별 기말고사 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_SCORE_CNAME_AVGRES(
    SCORE_CNAME,
    SCORE_AVG_RES
) AS (
        SELECT C.CNAME 
             , AVG(SC.RESULT) AS AVG_RES
            FROM SCORE SC
            JOIN COURSE C
              ON SC.CNO = C.CNO 
            GROUP BY C.CNAME
);

SELECT *
    FROM V_SCORE_CNAME_AVGRES
    ORDER BY SCORE_CNAME;

--3) 각 사원과 관리자(MGR)의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_EMP_MGR_NAME(
    EMP_NUM,
    EMP_NAME
) AS (
    SELECT DISTINCT E.ENO 
                  , E.ENAME 
                FROM EMP E
                LEFT JOIN (
                    SELECT MGR
                        FROM EMP
                ) A
                  ON E.ENO = A.MGR
);

SELECT *
    FROM V_EMP_MGR_NAME
    ORDER BY EMP_NUM;

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_STUDENT_CNAME_GRADE(
    STUDENT_SNO,
    STUDENT_SNAME,
    STUDENT_SEX,
    STUDENT_SYEAR,
    STUDENT_MAJOR,
    STUDENT_AVR,
    STUDENT_CNAME,
    STUDENT_GRADE
) AS (
     SELECT ST.SNO,
            ST.SNAME,
            ST.SEX,
            ST.SYEAR,
            ST.MAJOR,
            ST.AVR,
             A.CNAME,
             A.GRADE
        FROM STUDENT ST
        JOIN (
             SELECT DISTINCT SC.SNO
                           , C.CNAME
                           , GR.GRADE 
                        FROM COURSE C
                        JOIN SCORE SC
                          ON C.CNO = SC.CNO 
                        JOIN SCGRADE GR
                          ON SC.RESULT BETWEEN GR.LOSCORE AND GR.HISCORE  
    ) A
      ON ST.SNO = A.SNO
);

SELECT *
    FROM V_STUDENT_CNAME_GRADE
    ORDER BY STUDENT_SNO;


--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
SELECT DISTINCT ST.SNAME 
     , P.SECTION 
    FROM COURSE C 
    JOIN SCORE SC
      ON C.CNO  = SC.CNO 
    JOIN STUDENT ST
      ON SC.SNO = ST.SNO
    JOIN PROFESSOR P 
      ON C.PNO = P.PNO 
    WHERE SECTION = '물리'

CREATE OR REPLACE VIEW V_STUDENT_SECTION_NAME(
    STUDENT_NAME,
    STUDENT_SECTION,
    PROFESSOR_NAME
) AS (
    SELECT DISTINCT ST.SNAME 
                  , P.SECTION 
                  , P.PNAME
                FROM COURSE C 
                JOIN SCORE SC
                  ON C.CNO  = SC.CNO 
                JOIN STUDENT ST
                  ON SC.SNO = ST.SNO
                JOIN PROFESSOR P 
                  ON C.PNO = P.PNO 
                WHERE SECTION = '물리'
);

SELECT *
    FROM V_STUDENT_SECTION_NAME
    ORDER BY STUDENT_NAME;

--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT ROWNUM
     , A.SNO
     , A.SNAME
     , A.AVR_CONVERT
     FROM (
        SELECT SNO
             , SNAME
             , AVR * 1.125 AS AVR_CONVERT
             FROM STUDENT ST
             ORDER BY AVR DESC
     )A
     WHERE ROWNUM <= 3;

--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT ROWNUM
     , A.CNAME
     , A.AVG_RES
     FROM (
        SELECT C.CNAME
             , AVG(SC.RESULT) AS AVG_RES
             FROM COURSE C 
             JOIN SCORE SC
               ON C.CNO = SC.CNO
             GROUP BY C.CNAME
             ORDER BY AVG_RES DESC
     )A
     WHERE ROWNUM <= 3;

--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT ROWNUM
     , A.CNAME
     , A.SYEAR
     , A.AVG_RES
     FROM (
        SELECT C.CNAME
             , ST.SYEAR
             , AVG(SC.RESULT) AS AVG_RES
             FROM COURSE C 
             JOIN SCORE SC
               ON C.CNO = SC.CNO
             JOIN STUDENT ST
               ON ST.SNO = SC.SNO
             GROUP BY C.CNAME, ST.SYEAR
             ORDER BY AVG_RES DESC
     )A
     WHERE ROWNUM <= 3;

--4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM
     , A.PNAME
     , A.CNAME
     , A.AVG_RES
     FROM (
        SELECT P.PNAME
             , C.CNAME
             , AVG(SC.RESULT) AS AVG_RES
             FROM PROFESSOR P 
             JOIN COURSE C
               ON P.PNO = C.PNO
             JOIN SCORE SC
               ON SC.CNO = C.CNO
             GROUP BY P.PNAME, C.CNAME
             ORDER BY AVG_RES DESC
     )A
     WHERE ROWNUM <= 3;

--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.
SELECT ROWNUM
     , A.PNAME
     , A.CNAME
     , A.AVG_RES
     FROM (
        SELECT P.PNAME
             , C.CNAME
             , AVG(SC.RESULT) AS AVG_RES
             FROM PROFESSOR P 
             JOIN COURSE C
               ON P.PNO = C.PNO
             JOIN 
               ON 
             JOIN STUDENT ST
               ON ST.SNO = C.SNO
             GROUP BY P.PNAME, C.CNAME
             ORDER BY AVG_RES DESC
     )A
     WHERE ROWNUM <= 3;


--1) CNO이 PK인 COURSE_PK 테이블을 생성하세요.(1번 방식으로)
CREATE TABLE COURSE_PK (
    CNO VARCHAR2(8) PRIMARY KEY,
    CNAME VARCHAR2(20),
    ST_NUM NUMBER(1, 0),
    PNO VARCHAR2(8)
);

--2) PNO이 PK인 PROFESSOR_PK 테이블을 생성하세요.(2번 방식으로)
CREATE TABLE PROFESSOR_PK(
    PNO VARCHAR2(8),
    PNAME VARCHAR2(20),
    SECTION VARCHAR2(20),
    ORDERS VARCHAR2(10),
    HIREDATE DATE,
    CONSTRAINT PROFESSOR_PNO_PK PRIMARY KEY(PNO)
);

--3) PF_TEMP 테이블에 PNO을 PK로 추가하세요.
ALTER TABLE PF_TEMP
    ADD CONSTRAINT PK_PF_TEMP_PNO PRIMARY KEY(PNO);

--4) COURSE_PROFESSOR 테이블에 CNO, PNO을 PK로 추가하세요.
CREATE TABLE COURSE_PROFESSOR(
    CNO VARCHAR2(8),
    CNAME VARCHAR2(20),
    PNO VARCHAR2(8),
    PNAME VARCHAR2(20)
);

ALTER TABLE COURSE_PROFESSOR
    ADD CONSTRAINT PK_COURSE_PROFESSOR_CNO_PNO PRIMARY KEY(CNO, PNO);

--5) BOARD_NO(NUMBER)를 PK로 갖으면서 BOARD_TITLE(VARCHAR2(200)), BOARD_CONTENT(VARCHAR2(2000)), 
--   BOARD_WRITER(VARCHAR2(20)), BOARD_FRGT_DATE(DATE), BOARD_LMDF_DATE(DATE) 컬럼을 갖는 T_BOARD 테이블을 생성하세요.
CREATE TABLE T_BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200),
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_WRITER VARCHAR2(20),
    BOARD_FRGT_DATE DATE,
    BOARD_LMDF_DATE DATE
);

--6) BOARD_NO(NUMBER), BOARD_FILE_NO(NUMBER)를 PK로 갖으면서 BOARD_FILE_NM(VARCHAR2(200)), BOARD_FILE_PATH(VARCHAR2(2000)),
--   ORIGIN_FILE_NM(VARCHAR2(200)) 컬럼을 갖는 T_BOARD_FILE 테이블을 생성하세요.
CREATE TABLE T_BOARD_FILE(
    BOARD_NO NUMBER,
    BOARD_FILE_NO NUMBER,
    BOARD_FILE_NM VARCHAR2(200),
    BOARD_FILE_PATH VARCHAR2(2000),
    ORIGIN_FILE_NM VARCHAR2(200),
    CONSTRAINT PK_T_BOARD_FILE_BOARD_NO_FILE_NO PRIMARY KEY(BOARD_NO, BOARD_FILE_NO)
);

--7) 다음 구조를 갖는 테이블을 생성하세요.
--   T_SNS                              T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트위터                  3               30000                  2                  1
--                                                                               2                  2

CREATE TABLE T_SNS(
    SNS_NO NUMBER,
    SNS_NM VARCHAR2(200),
    CONSTRAINT PK_T_SNS_SNS_NO PRIMARY KEY(SNS_NO)
);

INSERT INTO T_SNS
VALUES (1, '페북');
INSERT INTO T_SNS
VALUES (2, '인스타');
INSERT INTO T_SNS
VALUES (3, '트위터');
COMMIT;

SELECT *
    FROM T_SNS;

CREATE TABLE T_SNS_DETAIL(
    SNS_NO NUMBER,
    SNS_UPL_NO NUMBER,
    CONSTRAINT PK_T_SNS_DETAIL_SNS_NO PRIMARY KEY(SNS_NO),
    CONSTRAINT FK_T_SNS_DETAIL_SNS_NO FOREIGN KEY(SNS_NO)
        REFERENCES T_SNS
);

INSERT INTO T_SNS_DETAIL 
VALUES (1, 4000);
INSERT INTO T_SNS_DETAIL 
VALUES (2, 10000);
INSERT INTO T_SNS_DETAIL 
VALUES (3, 30000);
COMMIT;

SELECT *
    FROM T_SNS_DETAIL;

CREATE TABLE T_SNS_UPLOADED(
    SNS_NO NUMBER,
    SNS_UPL_NO NUMBER,
    CONSTRAINT PK_T_SNS_UPLOADED_SNS_NO_SNS_UPL_NO PRIMARY KEY(SNS_NO, SNS_UPL_NO),
    CONSTRAINT FK_T_SNS_UPLOADED_SNS_NO FOREIGN KEY(SNS_NO)
        REFERENCES T_SNS_DETAIL
);

INSERT INTO T_SNS_UPLOADED 
VALUES (1, 1);
INSERT INTO T_SNS_UPLOADED
VALUES (1, 2);
INSERT INTO T_SNS_UPLOADED
VALUES (2, 1);
INSERT INTO T_SNS_UPLOADED
VALUES (2, 2);
COMMIT;

SELECT *
    FROM T_SNS_UPLOADED;
