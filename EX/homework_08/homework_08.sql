--1) 과목번호, 과목이름, 과목별 평균 기말고사 성적을 갖는 레코드의 배열을 만들고
--   기본 LOOP문을 이용해서 모든 과목의 과목번호, 과목이름, 과목별 평균 기말고사 성적을 출력하세요.
DECLARE
    
    CURSOR COR_SC_CUR IS
        SELECT C.CNO
             , C.CNAME
             , AVG(SC.RESULT) AS AVG_RES
             FROM COURSE C
             JOIN SCORE SC
               ON C.CNO = SC.CNO
             GROUP BY C.CNO, C.CNAME;
	
    TYPE COR_SC_REC IS RECORD(
        CNO COURSE.CNO%TYPE,
        CNAME COURSE.CNAME%TYPE,
        AVG_RES SCORE.RESULT%TYPE 
    );
    
    CORSCREC COR_SC_REC;
    
    TYPE COR_SC_REC_ARR IS TABLE OF COR_SC_REC
    INDEX BY PLS_INTEGER;

    CORSCRECARR COR_SC_REC_ARR;

    IDX NUMBER := 1;
    
BEGIN
    
    OPEN COR_SC_CUR;

    LOOP
        FETCH COR_SC_CUR INTO CORSCRECARR(IDX).CNO, CORSCRECARR(IDX).CNAME, CORSCRECARR(IDX).AVG_RES;
        EXIT WHEN COR_SC_CUR%NOTFOUND;

        CORSCRECARR(IDX) := CORSCREC;
        IDX := IDX + 1;
        COMMIT;
    END LOOP;
    
    CLOSE COR_SC_CUR;
    
    FOR IDX IN 1 .. CORSCRECARR.COUNT 
    LOOP
        DBMS_OUTPUT.PUT_LINE('과목 번호: ' || CORSCRECARR(IDX).CNO);
        DBMS_OUTPUT.PUT_LINE('과목 이름: ' || CORSCRECARR(IDX).CNAME);
        DBMS_OUTPUT.PUT_LINE('평균 성적: ' || TO_CHAR(CORSCRECARR(IDX).AVG_RES));
    END LOOP;

END;
/

--2) 학생번호, 학생이름과 학생별 평균 기말고사 성적을 갖는 테이블 T_STAVGSC를 만들고
--   커서를 이용하여 학생번호, 학생이름, 학생별 평균 기말고사 성적을 조회하고 
--   조회된 데이터를 생성한 테이블인 T_STAVGSC에 저장하세요.
CREATE TABLE T_STAVGS (
    SNO VARCHAR2(8),
    SNAME VARCHAR2(20),
    RESULT NUMBER(3,0)
);

DECLARE

     CURSOR COR_SC_CUR2 IS
        SELECT ST.SNO
             , ST.SNAME
             , AVG(SC.RESULT) AS AVG_RES2
             FROM STUDENT ST
             JOIN SCORE SC
               ON ST.SNO = SC.SNO
             GROUP BY ST.SNO, ST.SNAME;

 TYPE T_STAVGSC_REC IS RECORD(
         T_STAVGSC_ROW T_STAVGSC%ROWTYPE
    );

    TSTAVGSCREC T_STAVGSC_REC;
    
BEGIN
    
    OPEN COR_SC_CUR2;
    
    LOOP
        FETCH COR_SC_CUR2 INTO TSTAVGSCREC.T_STAVGSC_ROW;
        EXIT WHEN COR_SC_CUR2%NOTFOUND;
        
        INSERT INTO T_STAVGSC
        VALUES TSTAVGSCREC.T_STAVGSC_ROW;
        COMMIT;
 
    END LOOP;
    CLOSE COR_SC_CUR2;
    
--    FOR IDX IN 1 .. T_STAVGS.COUNT 
--    LOOP
--        DBMS_OUTPUT.PUT_LINE('학생 번호: ' || T_STAVGS.SNO);
--        DBMS_OUTPUT.PUT_LINE('학생 이름: ' || T_STAVGS.SNAME);
--        DBMS_OUTPUT.PUT_LINE('평균 성적: ' || TO_CHAR(T_STAVGS).RESULT);
--    END LOOP;
END;
/

