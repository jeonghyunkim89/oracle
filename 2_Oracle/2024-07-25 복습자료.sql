-- ���� ����� ���� ���� �� �Ʒ� ������ �ۼ����ּ���.
-- ID/PW  :  C##TESTUSER / 1234
-- 1) ������ �������� ����
-- 2) ����� ���� �߰� ������ ����
CREATE USER C##TESTUSER IDENTIFIED BY "1234";
-- 3) �߰��� ������ ���� ����(�ּұ��� : ����-CONNECT / ������ ����- RESOURSE)
GRANT CONNECT, RESOURCE TO C##TESTUSER;

-- �Ʒ� ������ �߰��ϱ� ���� ���̺��� �������ּ���.
-- �� �÷��� ������ �߰����ּ���.
--=========================================================
/*
	- �л� ���� ���̺� : STUDENT
	- ���� ����
	  - �л� �̸�, ��������� NULL���� ������� �ʴ´�.
	  - �̸����� �ߺ��� ������� �ʴ´�.
	- ���� ������
		+ �л� ��ȣ ex) 1, 2, 3, ...
		+ �л� �̸� ex) '�踻��', '�ƹ���', ...
		+ �̸���    ex) 'kim12@kh.or.kr', 'dogdog@kh.or.kr', ...
		+ �������  ex) '24/07/25', '00/02/20', '88/12/25', ...
*/
CREATE TABLE STUDENT(
    ST_NO NUMBER,
    ST_NAME VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(30) UNIQUE, --UNIQUE�÷��������
    BIRTH_DATE DATE NOT NULL
    
    --, UNIQUE(EMAIL) -- UNIQUE���̺������
);

DROP TABLE STUDENT;

COMMENT ON COLUMN STUDENT.ST_NO IS '�л���ȣ';
COMMENT ON COLUMN STUDENT.ST_NAME IS '�л��̸�';
COMMENT ON COLUMN STUDENT.EMAIL IS '�̸���';
COMMENT ON COLUMN STUDENT.BIRTH_DATE IS '�������';

INSERT INTO STUDENT VALUES(1, '��ٿ�', 'kidawun@kh.or.kr', '95/04/01');
INSERT INTO STUDENT VALUES(2, NULL, 'inchang@kh.or.kr', NULL); -- > ST_NAME �÷��� NOT NULL ���࿡ �����!
INSERT INTO STUDENT VALUES(3, '���ǿ�', 'kidawun@kh.or.kr', NULL); -- > EMAIL �÷��� UNIQUE ���࿡ �����!

------------------------------------------------------------
/*
	- ���� ���� ���̺� : BOOK
	- ���� ����
	  - ����� ���ڸ��� NULL���� ������� �ʴ´�.
	  - ISBN ��ȣ�� �ߺ��� ������� �ʴ´�.
	- ���� ������
	  + ���� ��ȣ ex) 1, 2, 3, ...
	  + ���� ex) '�ﱹ��', '�����', '�ڽ���', ...
	  + ���� ex) '����', '�������丮', 'Į ���̰�', ...
	  + ������ ex) '14/02/14', '22/09/19', ...
	  + ISBN��ȣ ex) '9780394502946', '9780152048044', ...
*/

------------------------------------------------------------

CREATE TABLE BOOK(
    BK_NO NUMBER,
    TITLE VARCHAR2(200)NOT NULL,
    AUTHOR VARCHAR2(200)NOT NULL,
    PUB_DATE DATE,
    ISBN_NO VARCHAR2(20)CONSTRAINT ISBN_UQ UNIQUE --�����̸�������
);

COMMENT ON COLUMN BOOK.BK_NO IS '������ȣ';
COMMENT ON COLUMN BOOK.TITLE IS '����';
COMMENT ON COLUMN BOOK.AUTHOR IS '����';
COMMENT ON COLUMN BOOK.PUB_DATE IS '������';
COMMENT ON COLUMN BOOK.ISBN_NO IS '�Ϸù�ȣ(ISBN)';

INSERT INTO BOOK
    VALUES(1, '�����', '�������丮', '24/07/25', '9780152048044');
INSERT INTO BOOK
    VALUES(2, '�����2', '�������丮', '34/07/25', '9780152048044');
        -- > ISBN �÷��� UNIQUE���࿡ �����. �������뿡 ������ �������Ǹ����� ǥ�õ�!
--COMMIT; -- ����������
--ROLLBACK; --������������������