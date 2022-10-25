
SELECT USER
FROM DUAL;
--==>> SCOTT


PURGE RECYCLEBIN;
--==>>RECYCLEBIN��(��) ��������ϴ�.

SELECT *
FROM TAB;


DESC TBL_BOARD;

--�� ���� ���̺� ����
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� �Խ��� ���� ���̺� ���� (TBL_BOARD)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                    NOT NULL   -- �Խù� ��ȣ
, NAME      VARCHAR2(30)                 NOT NULL   -- �Խù� �ۼ���
, PWD       VARCHAR2(20)                NOT NULL    -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                            -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)               NOT NULL    -- �Խù� ����
, CONTENT   VARCHAR2(4000)              NOT NULL    -- �Խù� ����
, IPADDR    VARCHAR2(20)                            -- ������ Ŭ���̾�Ʈ�� ip �ּ�
, HITCOUNT NUMBER      DEFAULT 0       NOT NULL     -- �Խù� ��ȸ��
, CREATED   DATE        DEFAULT SYSDATE NOT NULL    -- �Խù� �ۼ���
, CONSTRAINT BORAD_NUM_PK PRIMARY KEY(NUM)          -- �Խù� ��ȣ�� PK �������� ����
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;

--�� �Խù� ��ȣ�� �ִ��� ���� ������ ����
SELECT NVL(MAX(NUM,0)) AS MAXNUM
FROM TBL_BOARD;
-->> �߸���

SELECT NVL(MAX(NUM),0) AS MAXNUM
FROM TBL_BOARD;


--�� �� �� ����
SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD
;


INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1,'����', '1234', 'soo@test.com', '�����׽�Ʈ','�����׽�Ʈ','211.238.142.60', 0, SYSDATE);

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1,'����', '1234', 'soo@test.com', '�����׽�Ʈ','�����׽�Ʈ','211.238.142.60', 0, SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� DB ���ڵ��� ������ �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;

--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>> 1

--�� Ư�� ������(���۹�ȣ ~ ����ȣ) �Խù��� ����� �о���� ������ ����
-- ��ȣ, �̸�, ����, ��ȸ��, �ۼ���
-- 7���������� �Խù�, 8���������� �Խù� ���̴°� �޶������Ѵ�.

SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
ORDER BY NUM DESC;

-- RNUM ����
SELECT ROWNUM RNUM, DATA.*
FROM 
(
    SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    ORDER BY NUM DESC
) DATA;

-- ��ȣ�� �� ä�� RNUM ���ǹ� ����
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


--> �� �� ����
SELECT * FROM ( SELECT ROWNUM RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM >=1 AND RNUM <=10
;


--> �÷��� �����Ͽ� �ٽ� �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM >=1 AND RNUM <=10
;

--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
-- ���� ������ �αױ���� ���ܼ� ��ȸ���� ��Ʈ���Ѵ�.
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1 
WHERE NUM = 1;


--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM = 1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
SELECT *
FROM TBL_BOARD;
--==>> 1	����	1234	soo@test.com	�����׽�Ʈ	�����׽�Ʈ	211.238.142.60	1	2022-10-21



-- Ŀ�� Ʈ������ ó��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
    , IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;

-->> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CRESTED FROM TBL_BOARD WHERE NUM=1
;
--==>> 1	����	1234	soo@test.com	�����׽�Ʈ	�����׽�Ʈ	211.238.142.60	1	2022-10-21

--�� Ư�� �Խù��� �����ϴ�(�����ϴ�) ������ ����
SELECT *
FROM TBL_BOARD
WHERE NUM = 1;

DELETE
FROM TBL_BOARD
WHERE NUM = 1;

DELETE FROM TBL_BOARD WHERE NUM = 1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� Ư�� �Խù��� �����ϴ� ������ ����
UPDATE TBL_BOARD
SET NAME='������', PWD='9876', EMAIL='young@test.com', SUBJECT='�����׽�Ʈ', CONTENT='���뺯��'
WHERE NUM=1;

--> �� �� ����
UPDATE TBL_BOARD SET NAME='������', PWD='9876', EMAIL='young@test.com', SUBJECT='�����׽�Ʈ', CONTENT='���뺯��' WHERE NUM=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
SELECT *
FROM TBL_BOARD;
--==>> 1	������	9876	young@test.com	�����׽�Ʈ	���뺯��	211.238.142.60	1	2022-10-21


-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ���� �����ϰ��ִ� �Խù��� ���� �Խù�, ���� �Խù��� �о� ���� ������ �ۼ� �غ���.
-- �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM > 500;
--> �� �� ����

SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM > 500
;
--==>> -1

-- �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM < 500;
--> �� �� ����

SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM < 500
;
--==>>1

--�� �Խù� �˻� ��� ���� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE'%����%';

--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE SUBJECT LIKE '%����%'
;
--==> 0 COUNT �ؼ� ���� �Ŷ� ���ڵ尡 ������ null �� �ƴ϶� 0�� ���´�. 

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE NAME LIKE '%����%';


SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE CONTENT LIKE '%����%';