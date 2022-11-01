# MySQL
## MySQL 작업

### MySQL 설치
  + 주소: https://dev.mysql.com/downloads/windows/installer/8.0.html
  
### 작업 설정
  + 주소, db명, 계정 알면 작업가능!
  + db명, table명, field명은 반드시 영어로
  + preference > appearance > font: Korean > Table Figure Title : 맑은고딕(실습때 table명을 부득이하게 한글로 써야하는 경우가 있어서) 
  + show databases;  //관리자의 권한에 따라 보이는 데이터베이스가 다르다.
  
### 테이블 생성 및 실행
  + 테이블 생성 순서
    ```
    1) 테이블명 
    2) 필드명 
    3) 각 필드의 데이터 타입 설정 
    4) 프라이머리 키 설정
    
  + 두 가지 방법
    ```
    1. schema창에서
      : 작업 db → tables → 우클릭 → create tables → Table-name, column Name, datatype 등 → appy
    2. 명령어 
      :  create table 테이블명 (
            필드명1 데이터타입 속성(auto_increment),
            필드명2 데이터타입(varchar(200))  속성(not null),
            필드명3 데이터타입 (varchar(2000)) 속성(not null),
            ...
            primary key (필드명)테이블명
         );
      
  * 대문자 입력: 키워드로 틀리면 안되는 것을 강조해서 적어줌
  * 프라이머리 키 필수 속성: Not Null, 유일한 값  ex) 주민번호 등

### 데이터 가공
  * use 데이터베이스 이름;  // 해당 데이터베이스 선택, 사용
  * select * from 테이블명; // 테이블에 있는 모든 데이터 출력
  * select * from 테이블명 where 컬럼명 like '% ... %';  // 컬럼에서 ...라는 내용을 포함한 모든 데이터 출력

### 데이터 입력
  ```
  1. 명령문
    insert into 테이블명(필드명) values('data', 'data', ...)   
    └> 전체 필드에 데이터를 넣는 경우 (필드명)을 생략할 수 있다. 필드를 여러개를 한 번에 입력가능! 필드명을 적으면 순서대로 데이터 입력! 
  2. 엑셀파일 활용
    1) column명이 없는 경우
       (1) mysql에 테이블 형태 만들어놓고
       (2) csv 형식으로 엑셀파일 저장
       (3) 워크벤치에 해당 테이블 우클릭 → Import
    2) column명 있는 경우
       (1) mysql에 테이블 없다
       (2) csv형식으로 엑셀파일 저장
       (3) 워크벤치 최상단 "Table" 우클릭 → Import
       * 단, Not Null 등의 속성이 설정되어 있지 않기 때문에 수정이 필요함
  ```        
    

## 기타 내용 정리
  * DB에서 field명은 column명과 유사한 개념으로 보면 된다.
  * sql 종류 
    ```
    1. DDL : Define (DB설계자용)
    2. DML: Manipulation (일반사용자용)
    3. DCL: Control (DBA용)

## Relation 
 1. 명령문
  ```
  alter table FK테이블명
	add constraint FK테이블명_PK테이블명_fk foreign key (필드명)
    references PK테이블명(필드명);
    
    * foreign key: 외래 키 
      - 역할: primery key와 연결되어 있는 키(relation 만든다.)
      - relation 확인: database → reverse engineer → stored Connection 선택→ Next 
      - 특징
          - 데이터를 넣기 전에 반드시 설계를 잘 해야 한다.
          - 참조무결성: relation을 맺을 때 primery key에 없는 url이 foreign key에 들어가면 안되므로 테이블 작성 후에 연결시켜준다.
          - relation 맺어진 상태에서는 primery data 못지운다.
      