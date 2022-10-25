
SELECT USER
FROM DUAL;
--==>> SCOTT


PURGE RECYCLEBIN;
--==>>RECYCLEBIN이(가) 비워졌습니다.

SELECT *
FROM TAB;


DESC TBL_BOARD;

--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD이(가) 삭제되었습니다.

--○ 게시판 전용 테이블 생성 (TBL_BOARD)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                    NOT NULL   -- 게시물 번호
, NAME      VARCHAR2(30)                 NOT NULL   -- 게시물 작성자
, PWD       VARCHAR2(20)                NOT NULL    -- 게시물 암호
, EMAIL     VARCHAR2(50)                            -- 작성자 이메일
, SUBJECT   VARCHAR2(100)               NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)              NOT NULL    -- 게시물 내용
, IPADDR    VARCHAR2(20)                            -- 접속한 클라이언트의 ip 주소
, HITCOUNT NUMBER      DEFAULT 0       NOT NULL     -- 게시물 조회수
, CREATED   DATE        DEFAULT SYSDATE NOT NULL    -- 게시물 작성일
, CONSTRAINT BORAD_NUM_PK PRIMARY KEY(NUM)          -- 게시물 번호에 PK 제약조건 설정
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.

--○ 확인
SELECT *
FROM TBL_BOARD;

--○ 게시물 번호의 최댓값을 얻어내는 퀴리문 구성
SELECT NVL(MAX(NUM,0)) AS MAXNUM
FROM TBL_BOARD;
-->> 잘못됨

SELECT NVL(MAX(NUM),0) AS MAXNUM
FROM TBL_BOARD;


--○ 한 줄 구성
SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD
;


INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1,'고연수', '1234', 'soo@test.com', '제목테스트','내용테스트','211.238.142.60', 0, SYSDATE);

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1,'고연수', '1234', 'soo@test.com', '제목테스트','내용테스트','211.238.142.60', 0, SYSDATE)
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;

--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>> 1

--○ 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 읽어오는 쿼리문 구성
-- 번호, 이름, 제목, 조회수, 작성일
-- 7번페이지의 게시물, 8번페이지의 게시물 보이는게 달라져야한다.

SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
ORDER BY NUM DESC;

-- RNUM 등장
SELECT ROWNUM RNUM, DATA.*
FROM 
(
    SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    ORDER BY NUM DESC
) DATA;

-- 번호를 꽉 채운 RNUM 조건문 등장
SELECT *
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM 
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <=10;


--> 한 줄 구성
SELECT * FROM ( SELECT ROWNUM RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM >=1 AND RNUM <=10
;


--> 컬럼을 선택하여 다시 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM >=1 AND RNUM <=10
;

--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
-- 요즘엔 별도의 로그기록을 남겨서 조회수를 컨트롤한다.
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1 
WHERE NUM = 1;


--> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM = 1
;
--==>> 1 행 이(가) 업데이트되었습니다.
SELECT *
FROM TBL_BOARD;
--==>> 1	고연수	1234	soo@test.com	제목테스트	내용테스트	211.238.142.60	1	2022-10-21



-- 커밋 트랜젝션 처리
COMMIT;
--==>> 커밋 완료.

--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
    , IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;

-->> 한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CRESTED FROM TBL_BOARD WHERE NUM=1
;
--==>> 1	고연수	1234	soo@test.com	제목테스트	내용테스트	211.238.142.60	1	2022-10-21

--○ 특정 게시물을 삭제하는(제거하는) 쿼리문 구성
SELECT *
FROM TBL_BOARD
WHERE NUM = 1;

DELETE
FROM TBL_BOARD
WHERE NUM = 1;

DELETE FROM TBL_BOARD WHERE NUM = 1
;
--==>> 1 행 이(가) 삭제되었습니다.

-- 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 특정 게시물을 수정하는 쿼리문 구성
UPDATE TBL_BOARD
SET NAME='한은영', PWD='9876', EMAIL='young@test.com', SUBJECT='변경테스트', CONTENT='내용변경'
WHERE NUM=1;

--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='한은영', PWD='9876', EMAIL='young@test.com', SUBJECT='변경테스트', CONTENT='내용변경' WHERE NUM=1
;
--==>> 1 행 이(가) 업데이트되었습니다.
SELECT *
FROM TBL_BOARD;
--==>> 1	한은영	9876	young@test.com	변경테스트	내용변경	211.238.142.60	1	2022-10-21


-- 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ 지금 열람하고있는 게시물의 이전 게시물, 다음 게시물을 읽어 오는 쿼리문 작성 해보기.
-- 게시물 다음 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM > 500;
--> 한 줄 구성

SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM > 500
;
--==>> -1

-- 게시물 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM < 500;
--> 한 줄 구성

SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM < 500
;
--==>>1

--○ 게시물 검색 기능 관련 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE'%날씨%';

--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE SUBJECT LIKE '%날씨%'
;
--==> 0 COUNT 해서 얻어내는 거라서 레코드가 없으면 null 이 아니라 0이 나온다. 

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE NAME LIKE '%동현%';


SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE CONTENT LIKE '%음식%';