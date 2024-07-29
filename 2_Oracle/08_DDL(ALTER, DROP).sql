/*
    DDL : 데이터 정의언어 
    
    객체 생성(CREATE), 변경(ALTER), 삭제(DROP)하는 구문    
*/
/*
    ALTER : 객체를 변경하는 구문
    
    ALTER TABLE 테이블명 변경할내용
    
    * 변경되는 내용 *
        - 제약조건 추가 / 수정(삭제 -> 추가) / 삭제
        - 컬럼명/ 제약조건명/ 테이블명 변경
        - 컬럼 추가/ 수정/ 삭제
*/
/*
    * 컬럼 추가/ 수정/ 삭제
    
    - 컬럼 추가 : ALTER TABLE 테이블명 ADD 컬럼명 자료형 [기본값 | 제약조건]; 
*/
--DEPT_TABLE 테이블에 CNAME VARCHAR2(20) 컬럼추가
ALTER TABLE DEPT_TABLE ADD CNAME VARCHAR2(20);

SELECT * FROM DEPT_TABLE;

ALTER TABLE DEPT_TABLE ADD LNAME VARCHAR2(20) DEFAULT '한국';

/*
    컬럼 수정(MODIFY)

    - 데이터 타입 수정 : ALTER TABLE 테이블명 MODIFY 컬럼명 변경할데이터타입
    - 기본값 수정 : ALTER TABLE 테이블명 MODIFY 컬럼명 DEFAULT 변경할기본값
*/
-- DEPT_TABLE 테이블의 DEPT_ID 컬럼을 변경
-- * 크기를 2바이트 -> 5바이트로 변경
ALTER TABLE DEPT_TABLE MODIFY DEPT_ID CHAR(5);
-- * 숫자타입으로 변경
-- ALTER TABLE DEPT_TABLE MODIFY DEPT_ID NUMBER; -->형식 오류 발생! (기존 : 문자타입, 변경 : 숫자타입)
-- DEPT_TABLE 테이블의 DEPT_TITLE 컬럼을 변경
-- * 크기를 35바이트 -> 10바이트로 변경
-- ALTER TABLE DEPT_TABLE MODIFY DEPT_TITLE VARCHAR2(10); --> 크기 오류 발생!

-- * 크기를 35바이트 -> 50바이트로 변경
ALTER TABLE DEPT_TABLE MODIFY DEPT_TITLE VARCHAR2(50);

-- EMP_TABLE 테이블의 SALARY컬럼을 NUMBER -> VARCHAR2(50)으로 변경
--ALTER TABLE EMP_TABLE MODIFY SALARY VARCHAR2(50); --> 형식 오류 발생! <데이터 유형을 변경할 열은 비어 있어야 합니다>

-- 여러개의 컬럼 변경 가능!
ALTER TABLE DEPT_TABLE
    MODIFY DEPT_TITLE VARCHAR2(55)
    MODIFY LNAME DEFAULT '코리아';

/*
    컬럼 삭제 : DROP COLUMN 

    ALTER TABLE 테이블명 DROP COLUMN 컬럼명 
*/
-- DEPT_TABLE 테이블을 DEPT_COPY 테이블로 복제
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPT_TABLE;

SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY DROP COLUMN LNAME;
ALTER TABLE DEPT_COPY DROP COLUMN CNAME;
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_ID; --오류발생!
--> 테이블의 최소한의 한개의 컬럼은 존재해야함!
---------------------------------------------------------------------------
-- 제약조건 추가/삭제 (수정: 삭제->추가)
/*
    * 기본키 (PRIMARY KEY) : ALTER TABLE 테이블명 ADD PRIMARY KEY(컬럼명)
    * 외래키 (FOREIGN KEY) : ALTER TABLE 테이블명 ADD FOREIGN KEY(컬럼명) REFERENCES 참조할테이블명([참조할컬럼명])
    * UNIQUE (중복을 허용하지 않는 제약조건) : ALTER TABLE 테이블명 ADD UNIQUE(컬럼명)
    * CHECK (특정 값들만 저장하고자 할 때 사용하는 제약조건, NULL값 가능) : ALTER TABLE 테이블명 ADD CHECK(컬럼에 대한 조건식)
    * NOT NULL(NULL값을 허용하지 않는 제약조건) : ALTER TABLE 테이블명 MODIFY 컬럼명 NOT NULL
*/
-- DEPT_TABLE 테이블에 아래 제약조건을 추가
-- * DEPT_ID 컬럼에 PK(기본키) 제약조건 추가
-- * DEPT_TITLE 컬럼에 UNIQUE 제약조건 추가
-- * LNAME 컬럼에 NOT NULL 제약조건 추가
ALTER TABLE DEPT_TABLE
    ADD CONSTRAINT DT_PK PRIMARY KEY(DEPT_ID)
    ADD CONSTRAINT DT_UQ UNIQUE (DEPT_TITLE)
    MODIFY LNAME NOT NULL;
 
 /*
    [제약조건 삭제]
    ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명 / NOT NULL은 예외
    
    ALTER TABLE 테이블명 MODIFY 컬럼명 NULL  
*/
ALTER TABLE DEPT_TABLE DROP CONSTRAINT DT_PK;

ALTER TABLE DEPT_TABLE
    DROP CONSTRAINT DT_UQ
    MODIFY LNAME NULL;
---------------------------------------------------------------------------
-- 테이블 삭제
-- DROP TABLE 테이블명
DROP TABLE DEPT_TABLE;
-- 어딘가에 참조되고 있는 부모테이블은 삭제가 되지 않음
-- 그럼에도 지우고자 할 경우,1) 자식테이블을 먼저 삭제 후 부모테이블을 삭제
--                      2) 부모테이블만 삭제하는데, 제약조건까지 삭제
--                         DROP TABLE 테이블명 CASCADE CONSTRAINT
----------------------------------------------------------------------------
CREATE TABLE DEPT_TABLE
AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_TABLE;
/*
    컬럼명, 제약조건명, 테이블명 변경 (RENAME)
*/
-- 1) 컬럼명 변경 : RENAME COLUMN 기존컬럼명 TO 바꿀컬럼명
-- DEPT_TITLE 컬럼을 DEPT_NAME 변경
ALTER TABLE DEPT_TABLE RENAME COLUMN DEPT_TITLE TO DEPT_NAME;
-- 2) 제약조건명 변경 : RENAME CONSTRAINT 기존제약조건명 TO 바꿀제약조건명
ALTER TABLE DEPT_TABLE RENAME CONSTRAINT SYS_C008453 TO DT_DEPTID_NN;
-- 3) 테이블명 변경 : RENAME TO 바꿀테이블명
ALTER TABLE DEPT_TABLE RENAME TO DEPT_OVER;
-----------------------------------------------------------------------------
-- * TRUNCATE : 테이블 초기화
-- => DROP 과는 다르게 테이블의 데이터만을 전부 삭제하여 테이블의 초기상태로 돌려주는 것
SELECT * FROM DEPT_OVER;
TRUNCATE TABLE DEPT_OVER;
------------------------------------------------------------------------------
/*
- DDL은 오라클에서 제공되는 객체를 CREATE, ALTER, DROP하는 언어이다.
	+ 오라클의 객체 : 테이블, 사용자, 시퀀스, 뷰, 프로시저 등
	
- 테이블을 생성하는 SQL 구문 : CREATE
	CREATE TABLE 테이블명 (
		컬럼명 자료형(데이터 크기),
		컬럼명 자료형,
		...
	);
	
- CHAR 자료형은 문자(열)길이 이고, 최대 2000B까지 저장 가능
- VARCHAR2 자료형은 문자(열)길이 이고, 최대 4000B까지 저장 가능

- 컬럼에 설명을 추가하는 SQL 구문 : COMMENT
	COMMENT ON COLUMN 테이블명.컬럼명 IS '주석 내용';
	
- NULL 값을 허용하지 않도록 설정하는 제약 조건 : NOT NULL
	+ NOT NULL 방식만 가능
	
- 데이터의 중복을 허용하지 않도록 설정하는 제약 조건 : UNIQUE

- 특정 조건을 만족하는 데이터만 컬럼에 저장되도록 설정하는 제약 조건 : CHECK

- 기본키를 설정하는 SQL 구문 : PRIMARY KEY
	+ NOT NULL + UNIQUE ( 두 제약조건의 특징을 모두 가지고 있음 ! )

- 다른 테이블에 존재하는 값을 사용하기 위한 제약 조건 : FORIEGN KEY
	+ 삭제 옵션 +
	- 부모 테이블의 데이터 삭제 시 자식 테이블의 사용 중인 데이터가 있을 경우 삭제되지 않도록 하는 옵션 (기본값) : ON DELETE RESTRICTED
	- 부모 테이블의 데이터 삭제 시 자식 테이블의 해당 데이터를 null로 변경되도록 하는 옵션 : ON DELETE SET NULL
	- 부모 테이블의 데이터 삭제 시 자식 테이블의 해당 데이터도 같이 삭제되도록 하는 옵션 : ON DELETE CASCADE

- 제약 조건에 이름을 부여할 때 사용하는 키워드 : CONSTRAINT

- 데이터 추가 시 기본 값을 설정하기 위해 사용하는 키워드 : DEFUALT   
*/