
SELECT * FROM USER_TABLES;


----------------------------------BLOG 관련 TABLE-----------------------------------------

--BLOG 생성(여행일정 생성)할때 기본적으로 들어가는 테이블
--USER_ID와 BLOG SEQ에 PK를 주면 DAY별로 행이 추가될수없기때문에 PK는제외
CREATE TABLE BLOG_DETAIL(
	USER_ID VARCHAR2(50) NOT NULL,
	BLOG_SEQ NUMBER NOT NULL,
	BLOG_CREATE_DATE DATE NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(1000),
	AREA_NAME VARCHAR2(500) NOT NULL,
	TOUR_SEQ NUMBER NOT NULL,
	TOUR_DATE DATE NOT NULL, 
	PLACE VARCHAR2(4000) NOT NULL,
	IMG_PATH VARCHAR2(2000) NOT NULL,
	HEART_COUNT NUMBER DEFAULT 0 NOT NULL,
	COMMENT_COUNT NUMBER DEFAULT 0 NOT NULL,
	HITS_COUNT NUMBER DEFAULT 0 NOT NULL,
	CONSTRAINT FK_BLOG_DETAIL_USERID FOREIGN KEY(USER_ID) REFERENCES T_USER(USER_ID),
	CONSTRAINT PK_BLOG_DETAIL PRIMARY KEY(USER_ID, BLOG_SEQ, TOUR_SEQ)
);
delete FROM BLOG_DETAIL;

--PK : ID + BLOGSEQ + COMMENTSEQ
CREATE TABLE BLOG_COMMENT(
	USER_ID VARCHAR2(50) NOT NULL,
	BLOG_SEQ NUMBER NOT NULL,
	COMMENT_SEQ NUMBER NOT NULL,
	COMMENT_DATE DATE NOT NULL,
	COMMENT_ID VARCHAR2(50) NOT NULL,
	COMMENT_CONTENT VARCHAR2(500) NOT NULL,
	CONSTRAINT FK_BLOG_COMMENT_USERID FOREIGN KEY(USER_ID) REFERENCES T_USER(USER_ID),
	CONSTRAINT PK_BLOG_COMMENT PRIMARY KEY(USER_ID, BLOG_SEQ, COMMENT_SEQ)
);


--------BLOG SELECT ONE--------
CREATE OR REPLACE VIEW V_BLOG_ONE
AS
	SELECT A.USER_ID, A.PENALTY, B.BLOG_SEQ, B.BLOG_CREATE_DATE, B.TITLE, B.CONTENT, B.IMG_PATH,
			B.AREA_NAME, B.TOUR_SEQ, B.TOUR_DATE, B.PLACE, B.HEART_COUNT, B.COMMENT_COUNT, B.HITS_COUNT 
	FROM T_USER A, BLOG_DETAIL B
	WHERE A.USER_ID = B.USER_ID
	AND A.ACTIVE = 'Y'
	ORDER BY A.USER_ID, B.BLOG_SEQ, B.TOUR_SEQ;
	
SELECT * FROM V_BLOG_ONE WHERE USER_ID = 'ILNAM' AND BLOG_SEQ = 1;
DROP VIEW V_BLOG_ONE;
------------------------------------------------------------------------
--------BLOG SELECT ALL--------
CREATE OR REPLACE VIEW V_BLOG_LIST
AS
	SELECT A.USER_ID, A.PENALTY, B.BLOG_SEQ, B.BLOG_CREATE_DATE, B.TITLE, B.CONTENT, B.AREA_NAME, 
			(SELECT MIN(TOUR_DATE)
			 FROM BLOG_DETAIL
			 WHERE USER_ID = A.USER_ID
			 AND BLOG_SEQ = B.BLOG_SEQ) AS MINDATE,
			(SELECT MAX(TOUR_DATE)
			 FROM BLOG_DETAIL
			 WHERE USER_ID = A.USER_ID
			 AND BLOG_SEQ = B.BLOG_SEQ) AS MAXDATE
			 ,B.IMG_PATH, B.HEART_COUNT, B.COMMENT_COUNT, B.HITS_COUNT 
	FROM T_USER A, BLOG_DETAIL B
	WHERE A.USER_ID = B.USER_ID
	AND A.ACTIVE = 'Y'
	AND B.TOUR_SEQ = 1
	ORDER BY B.HEART_COUNT DESC, B.HITS_COUNT DESC, B.BLOG_SEQ ASC;
	
SELECT * FROM V_BLOG_LIST;
DROP VIEW V_BLOG_LIST;
------------------------------------------------------------------------
-----------BLOG 게시판 (블로그 생성일 순으로 나오게)
CREATE OR REPLACE VIEW V_BLOG_LIST_DESC
AS
	SELECT A.USER_ID, A.PENALTY, B.BLOG_SEQ, B.BLOG_CREATE_DATE, B.TITLE, B.CONTENT, B.AREA_NAME, 
			(SELECT MIN(TOUR_DATE)
			 FROM BLOG_DETAIL
			 WHERE USER_ID = A.USER_ID
			 AND BLOG_SEQ = B.BLOG_SEQ) AS MINDATE,
			(SELECT MAX(TOUR_DATE)
			 FROM BLOG_DETAIL
			 WHERE USER_ID = A.USER_ID
			 AND BLOG_SEQ = B.BLOG_SEQ) AS MAXDATE
			 ,B.IMG_PATH, B.HEART_COUNT, B.COMMENT_COUNT, B.HITS_COUNT 
	FROM T_USER A, BLOG_DETAIL B
	WHERE A.USER_ID = B.USER_ID
	AND A.ACTIVE = 'Y'
	AND B.TOUR_SEQ = 1
	ORDER BY B.BLOG_CREATE_DATE DESC;
	
SELECT * FROM V_BLOG_LIST_DESC;

-------------------------------------------------------------------------
-----------블로그에 댓글달면 댓글생성 및 블로그테이블의 댓글카운트가 증가하는 프로시저 (이클립스에서는 아래 프로시저 생성안됨 디비버에서 생성완료)
CREATE OR REPLACE PROCEDURE BLOG_COMMENT_INPUT
(
	P_BLOGID IN VARCHAR2,
	P_BLOGSEQ IN NUMBER,
	P_COMMENTID IN VARCHAR2,
	P_CONTENT IN VARCHAR2
)
IS
BEGIN
	DECLARE
		SEQ NUMBER;
	BEGIN
		SELECT MAX(COMMENT_COUNT) INTO SEQ 
		FROM BLOG_DETAIL
		WHERE USER_ID = P_BLOGID
		AND BLOG_SEQ = P_BLOGSEQ;
		SEQ := SEQ + 1;
	
		INSERT INTO BLOG_COMMENT
		VALUES(P_BLOGID, P_BLOGSEQ, SEQ, SYSDATE, P_COMMENTID, P_CONTENT);
	
		UPDATE BLOG_DETAIL
		SET COMMENT_COUNT = SEQ
		WHERE USER_ID = P_BLOGID
		AND BLOG_SEQ = P_BLOGSEQ;
		
		COMMIT;
   	END;
END;
/
------------------------------------------------------------------------------
--(이클립스에서는 아래 프로시저 실행문 작동안됨 디비버에서 테스트완료)
BEGIN BLOG_COMMENT_INPUT('USER3',1,'USER5','HELLO EVERYONE'); END;
SELECT * FROM BLOG_DETAIL;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--블로그 조회수 관련 프로시저 (뷰에 조회수 있으므로 블로그가 클릭될때마다 HITCOUNT 증가시켜야함)

CREATE OR REPLACE PROCEDURE BLOG_HITSUP
(
	P_BLOGID IN VARCHAR2,
	P_BLOGSEQ IN NUMBER
)
IS
BEGIN
	DECLARE
		SEQ NUMBER;
	BEGIN
		SELECT MAX(HITS_COUNT) INTO SEQ 
		FROM BLOG_DETAIL
		WHERE USER_ID = P_BLOGID
		AND BLOG_SEQ = P_BLOGSEQ;
		SEQ := SEQ + 1;
	
		UPDATE BLOG_DETAIL
		SET HITS_COUNT = SEQ
		WHERE USER_ID = P_BLOGID
		AND BLOG_SEQ = P_BLOGSEQ;
		
		COMMIT;
   	END;
END;
/
--------------------------------------------------------------------------
BEGIN BLOG_HITSUP('USER3',2); END;
--------------------------------------------------------------------------






-------------------------블로그찜테이블(USERID, BLOGID, BLOGSEQ)
--pk (userid, blogid, blogseq)
CREATE TABLE BLOG_HEART(
	USER_ID VARCHAR2(50) NOT NULL,
	BLOG_ID VARCHAR2(50) NOT NULL,
	BLOG_SEQ NUMBER NOT NULL,
	CONSTRAINT FK_BLOG_HEART_USERID FOREIGN KEY(USER_ID) REFERENCES T_USER(USER_ID),
	CONSTRAINT PK_BLOG_HEART PRIMARY KEY(USER_ID, BLOG_ID, BLOG_SEQ)
);

-----찜 추가 프로시저 (유저가 특정 블로그 찜을하면 찜테이블에 등록이 되어야하고 해당 블로그테이블 찜컬럼 1개 증가되어야함



-----찜 삭제 프로시저 (유저가 특정 블로그 찜을 삭제하면 찜테이블에 등록이 삭제되어야하고 해당 블로그테이블 찜컬럼 1개 감소










--------------------------------------------------------------------------------
-----------------------장소찜테이블
CREATE TABLE PLACE_HEART(
	USER_ID VARCHAR2(50) NOT NULL,
	PLACE_ID VARCHAR2(300) NOT NULL,
	THUMBNAIL VARCHAR2(500) NOT NULL,
	PLACE_NAME VARCHAR2(300) NOT NULL,
	LATITUDE VARCHAR2(50) NOT NULL,
	LONGITUDE VARCHAR2(50) NOT NULL,
	PLACE_ADDRESS VARCHAR2(500) NOT NULL,
	NATION VARCHAR2(50) NOT NULL,
	CITY VARCHAR2(50) NULL,
	CONSTRAINT FK_PLACE_HEART_USERID FOREIGN KEY(USER_ID) REFERENCES T_USER(USER_ID),
	CONSTRAINT PK_PLACE_HEART PRIMARY KEY(USER_ID, PLACE_ID)
);
SELECT * FROM PLACE_HEART;
SELECT * FROM T_USER;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-----장소찜하기 프로시저
CREATE OR REPLACE PROCEDURE ADDHEART
(
	P_USERID IN VARCHAR2,
	P_PLACEID IN VARCHAR2,
	P_THUMBNAIL IN VARCHAR2,
	P_PLACENAME IN VARCHAR2,
	P_LATITUDE IN VARCHAR2,
	P_LONGTITUDE IN VARCHAR2,
	P_ADDRESS IN VARCHAR2,
	P_NATION IN VARCHAR2,
	P_CITY IN VARCHAR2,
	p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN 
	INSERT INTO PLACE_HEART 
	VALUES(P_USERID, P_PLACEID, P_THUMBNAIL, P_PLACENAME, P_LATITUDE, P_LONGTITUDE, P_ADDRESS, P_NATION, P_CITY);

	OPEN p_cursor FOR 
	SELECT COUNT(PLACE_ID) FROM PLACE_HEART WHERE PLACE_ID = P_PLACEID;
	EXCEPTION
		WHEN DUP_VAL_ON_INDEX THEN RETURN;
        WHEN no_data_found THEN
        dbms_output.put_line('does not exits.');
    COMMIT;
END;
/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-----찜삭제 프로시저
CREATE OR REPLACE PROCEDURE RMHEART
(
	P_USERID IN VARCHAR2,
	P_PLACEID IN VARCHAR2,
	p_cursor OUT SYS_REFCURSOR
)
IS 
BEGIN 
	DELETE FROM PLACE_HEART WHERE USER_ID = P_USERID AND PLACE_ID = P_PLACEID;
	IF SQL%ROWCOUNT = 0 THEN
    	RETURN;
	END IF;	

	OPEN p_cursor FOR 
	SELECT COUNT(PLACE_ID) FROM PLACE_HEART WHERE PLACE_ID = P_PLACEID;
	EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('does not exits.');
    COMMIT;
END;
/

--------------------------------------------------------------------------------
-----찜여부 확인
CREATE OR REPLACE PROCEDURE CONFIRM_HEART
(
	P_USERID IN VARCHAR2,
	P_PLACEID IN VARCHAR2,
	p_cursor OUT SYS_REFCURSOR
)
IS 
BEGIN 
	OPEN p_cursor FOR 
	SELECT PLACE_ID FROM PLACE_HEART WHERE PLACE_ID = P_PLACEID AND USER_ID = P_USERID;
	EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('does not exits.');
END;
/

--------------------------------------------------------------------------------
-----heart count 가져오기
CREATE OR REPLACE PROCEDURE GETHEARTCOUNT
(
	P_PLACEID IN VARCHAR2,
	p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN 
	OPEN p_cursor FOR 
	SELECT COUNT(PLACE_ID) FROM PLACE_HEART WHERE PLACE_ID = P_PLACEID;
	EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('does not exits.');
END;
/

-----heart count 프로시저 커서 테스트
DECLARE
v_cursor SYS_REFCURSOR;
emp_rec NUMBER;
BEGIN
GETHEARTCOUNT('ChIJgf4OJaelfDURmDvA_sHyPUM', v_cursor);
FETCH v_cursor INTO emp_rec;
DBMS_OUTPUT.PUT_LINE(emp_rec);
END;
--------------------------------------------------------------------------------









SELECT * FROM TEST;

SELECT * FROM TAB;
SELECT * FROM BLOG_NEWSBOARD;

SELECT * FROM V_BLOG_LIST_DESC;
SELECT * FROM V_BLOG_LIST; 

