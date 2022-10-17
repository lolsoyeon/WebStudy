SELECT USER
FROM DUAL;
--==>>SCOTT

SELECT *
FROM TAB;


PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

SELECT *
FROM TAB;

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER PURGE;
--==>>Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���� ������ ����
DROP SEQUENCE MEMBERSEQ; 
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� �ǽ����̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME VARCHAR2(30) NOT NULL
, TEL VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>>Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է� ������
INSERT INTO MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111');
--> �� �� ����

INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111')
;
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

--�� ���̺� ������ ��ü ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����

SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>1	������	010-1111-1111


--�� �ο��� Ȯ�� ������
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;

-->> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER;
--==>>1

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ������ �߰� �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '���ҿ�', '010-2222-2222')
;
--==>>1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
/*
1	������	010-1111-1111
2	���ҿ�	010-2222-2222
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.










