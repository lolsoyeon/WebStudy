SELECT USER
FROM DUAL;
--==>> SCOTT


DESC TBL_SCORE;
/*
이름   널?       유형           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
KOR           NUMBER(3)    
ENG           NUMBER(3)    
MAT           NUMBER(3) 
*/
--○ 기존 테이블 제거
DROP TABLE TBL_SCORE PURGE;
-->>Table TBL_SCORE이(가) 삭제되었습니다.

DROP SEQUENCE SCORESEQ;
-->> Sequence SCORESEQ이(가) 삭제되었습니다.

-- 시퀀스 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.'

--○ 실습테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_SCORE
( SID NUMBER        NOT NULL
, NAME VARCHAR2(30)
, KOR NUMBER(3)     CHECK(KOR BETWEEN 1 AND 100)
, ENG NUMBER(3)     CHECK(ENG BETWEEN 1 AND 100)
, MAT NUMBER(3)     CHECK(MAT BETWEEN 1 AND 100)
, CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_SCORE이(가) 생성되었습니다.

-- 데이터 입력 쿼리문
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES (SCORESEQ.NEXTVAL, '엄소연', 90, 99,98);

-->> 한 줄 구성

INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES (SCORESEQ.NEXTVAL, '엄소연', 90, 99,98)
;
--==>> 1 행 이(가) 삽입되었습니다.


-- 확인
SELECT *
FROM TBL_SCORE;
--==>> 1	엄소연	90	99	98

-- 테이블 데이터 전체 조회 쿼리문 구성
SELECT SID, NAME, KOR, ENG, MAT
FROM TBL_SCORE;

-->한 줄 구성 
SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE
;

-- 인원수 조회 쿼리문
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
-->한 줄 구성 
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--○ 커밋
COMMIT;

SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS 총점, (KOR+ENG+MAT)/3 AS 평균
FROM TBL_SCORE
ORDER by 1;

SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS 총점, (KOR+ENG+MAT)/3 AS 평균 FROM TBL_SCORE
;



-- 데이터 추가
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES (SCORESEQ.NEXTVAL, '박원석', 90, 90, 90)
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 커밋
COMMIT;