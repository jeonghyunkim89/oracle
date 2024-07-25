-- 다음 사용자 계정 접속 후 아래 내용을 작성해주세요.
-- ID/PW  :  C##TESTUSER / 1234
-- 1) 관리자 계정으로 접속
-- 2) 사용자 계정 추가 쿼리문 실행
CREATE USER C##TESTUSER IDENTIFIED BY "1234";
-- 3) 추가한 계정에 권한 설정(최소권한 : 접속-CONNECT / 데이터 관리- RESOURSE)
GRANT CONNECT, RESOURCE TO C##TESTUSER;

-- 아래 내용을 추가하기 위한 테이블을 생성해주세요.
-- 각 컬럼별 설명을 추가해주세요.
--=========================================================
/*
	- 학생 정보 테이블 : STUDENT
	- 제약 조건
	  - 학생 이름, 생년월일은 NULL값을 허용하지 않는다.
	  - 이메일은 중복을 허용하지 않는다.
	- 저장 데이터
		+ 학생 번호 ex) 1, 2, 3, ...
		+ 학생 이름 ex) '김말똥', '아무개', ...
		+ 이메일    ex) 'kim12@kh.or.kr', 'dogdog@kh.or.kr', ...
		+ 생년월일  ex) '24/07/25', '00/02/20', '88/12/25', ...
*/
CREATE TABLE STUDENT(
    ST_NO NUMBER,
    ST_NAME VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(30) UNIQUE, --UNIQUE컬럼레벨방식
    BIRTH_DATE DATE NOT NULL
    
    --, UNIQUE(EMAIL) -- UNIQUE테이블레벨방식
);

DROP TABLE STUDENT;

COMMENT ON COLUMN STUDENT.ST_NO IS '학생번호';
COMMENT ON COLUMN STUDENT.ST_NAME IS '학생이름';
COMMENT ON COLUMN STUDENT.EMAIL IS '이메일';
COMMENT ON COLUMN STUDENT.BIRTH_DATE IS '생년월일';

INSERT INTO STUDENT VALUES(1, '기다운', 'kidawun@kh.or.kr', '95/04/01');
INSERT INTO STUDENT VALUES(2, NULL, 'inchang@kh.or.kr', NULL); -- > ST_NAME 컬럼이 NOT NULL 제약에 위배됨!
INSERT INTO STUDENT VALUES(3, '조건웅', 'kidawun@kh.or.kr', NULL); -- > EMAIL 컬럼이 UNIQUE 제약에 위배됨!

------------------------------------------------------------
/*
	- 도서 정보 테이블 : BOOK
	- 제약 조건
	  - 제목과 저자명은 NULL값을 허용하지 않는다.
	  - ISBN 번호는 중복을 허용하지 않는다.
	- 저장 데이터
	  + 도서 번호 ex) 1, 2, 3, ...
	  + 제목 ex) '삼국지', '어린왕자', '코스모스', ...
	  + 저자 ex) '지연', '생텍쥐페리', '칼 세이건', ...
	  + 출판일 ex) '14/02/14', '22/09/19', ...
	  + ISBN번호 ex) '9780394502946', '9780152048044', ...
*/

------------------------------------------------------------

CREATE TABLE BOOK(
    BK_NO NUMBER,
    TITLE VARCHAR2(200)NOT NULL,
    AUTHOR VARCHAR2(200)NOT NULL,
    PUB_DATE DATE,
    ISBN_NO VARCHAR2(20)CONSTRAINT ISBN_UQ UNIQUE --오류이름지어줌
);

COMMENT ON COLUMN BOOK.BK_NO IS '도서번호';
COMMENT ON COLUMN BOOK.TITLE IS '제목';
COMMENT ON COLUMN BOOK.AUTHOR IS '저자';
COMMENT ON COLUMN BOOK.PUB_DATE IS '출판일';
COMMENT ON COLUMN BOOK.ISBN_NO IS '일련번호(ISBN)';

INSERT INTO BOOK
    VALUES(1, '어린왕자', '생텍쥐페리', '24/07/25', '9780152048044');
INSERT INTO BOOK
    VALUES(2, '어린왕자2', '생텍쥐페리', '34/07/25', '9780152048044');
        -- > ISBN 컬럼이 UNIQUE제약에 위배됨. 오류내용에 설정한 제약조건명으로 표시됨!
--COMMIT; -- 데이터저장
--ROLLBACK; --데이터저장하지않음