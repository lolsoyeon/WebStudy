SELECT USER
FROM DUAL;
--==>> SCOTT


DESC TBL_SCORE;
/*
�̸�   ��?       ����           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
KOR           NUMBER(3)    
ENG           NUMBER(3)    
MAT           NUMBER(3) 
*/
--�� ���� ���̺� ����
DROP TABLE TBL_SCORE PURGE;
-->>Table TBL_SCORE��(��) �����Ǿ����ϴ�.

DROP SEQUENCE SCORESEQ;
-->> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

-- ������ ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.'

--�� �ǽ����̺� ����(TBL_MEMBER)
CREATE TABLE TBL_SCORE
( SID NUMBER        NOT NULL
, NAME VARCHAR2(30)
, KOR NUMBER(3)     CHECK(KOR BETWEEN 1 AND 100)
, ENG NUMBER(3)     CHECK(ENG BETWEEN 1 AND 100)
, MAT NUMBER(3)     CHECK(MAT BETWEEN 1 AND 100)
, CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.

-- ������ �Է� ������
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES (SCORESEQ.NEXTVAL, '���ҿ�', 90, 99,98);

-->> �� �� ����

INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES (SCORESEQ.NEXTVAL, '���ҿ�', 90, 99,98)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


-- Ȯ��
SELECT *
FROM TBL_SCORE;
--==>> 1	���ҿ�	90	99	98

-- ���̺� ������ ��ü ��ȸ ������ ����
SELECT SID, NAME, KOR, ENG, MAT
FROM TBL_SCORE;

-->�� �� ���� 
SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE
;

-- �ο��� ��ȸ ������
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
-->�� �� ���� 
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--�� Ŀ��
COMMIT;

SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS ����, (KOR+ENG+MAT)/3 AS ���
FROM TBL_SCORE;

SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS ����, (KOR+ENG+MAT)/3 AS ��� FROM TBL_SCORE
;



-- ������ �߰�
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES (SCORESEQ.NEXTVAL, '�ڿ���', 90, 90, 90)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;