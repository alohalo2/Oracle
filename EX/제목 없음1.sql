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
              
              