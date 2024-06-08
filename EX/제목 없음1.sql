SELECT A.CNO
     , A.CNAME
     , P.PNO
     , A.AVG_RES
    FROM (
        SELECT C.CNO
             , C.CNAME
             , C.PNO
             , ROUND(AVG(SC.RESULT), 2) AS AVG_RES
            FROM COURSE C
            JOIN SCORE SC
              ON C.CNO = SC.CNO
            GROUP BY C.CNO, C.CNAME, C.PNO
            ORDER BY C.CNO, C.CNAME
          ) A
            JOIN PROFESSOR P
              ON P.PNO = A.PNO;
              
SELECT *
    FROM STUDENT
    WHERE SNO = '555555';
                       
SELECT *
    FROM BOOKS
    WHERE BNO = 1;

SELECT * FROM V$SQL; -- 이전에 작성했던 쿼리 전체를 보여주는 쿼리

CREATE TABLE BOOKS (
    BNO NUMBER UNIQUE,
    BTITLE VARCHAR2(300),
    AUTHOR VARCHAR2(100),
    PUBLISHER VARCHAR2(200),
    GENRE VARCHAR2(100),
    IS_LOANED NUMBER,
    LOAN_DATE DATE
);

DROP TABLE BOOKS;
COMMIT;

CREATE TABLE USERS(
    ID VARCHAR2(100),
    PW VARCHAR2(100),
    USERNAME VARCHAR2(50)
);
COMMIT;

SELECT B.LOAN_DATE,
     , A.DIFF_DATE
     FROM BOOKS B
     JOIN (
        SELECT TRUNC(SYSDATE - TO_DATE('2020/06/09', 'YYYY/MM/DD'))
            FROM DUAL;
            ) A
        ON B.LOAN_DATE = A.LOAN_DATE;

UPDATE BOOKS
    SET
        LOAN_DATE = NULL
    WHERE BNO = 1;
COMMIT;