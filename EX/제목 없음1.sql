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
    