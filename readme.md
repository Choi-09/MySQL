# MySQL
### MySQL 설치
  + 주소: https://dev.mysql.com/downloads/windows/installer/8.0.html
  
### 작업 설정
  + 주소, db명, 계정 알면 작업가능!
  + db명, table명, field명은 반드시 영어로
  + preference > appearance > font: Korean > Table Figure Title : 맑은고딕(실습때 table명을 부득이하게 한글로 써야하는 경우가 있어서) 
  + show databases;  //관리자의 권한에 따라 보이는 데이터베이스가 다르다.

***
## MySQL 작업
### 테이블 생성 및 실행
  + 테이블 생성 순서
    ```
    1) 테이블명 
    2) 필드명 
    3) 각 필드의 데이터 타입 설정 
    4) 프라이머리 키 설정
    ```
  + 두 가지 방법
    ```
    1. schema창
      : 작업 db → tables → 우클릭 → create tables → Table-name, column Name, datatype 등 → appy
    2. 명령어
      :  create table 테이블명 (
            필드명1 데이터타입 속성(auto_increment),
            필드명2 데이터타입(varchar(200))  속성(not null),
            필드명3 데이터타입 (varchar(2000)) 속성(not null),
            ...
            primary key (필드명)테이블명
         );
    ``` 
  * 대문자 입력: 키워드로 틀리면 안되는 것을 강조해서 적어줌
  * 프라이머리 키 필수 속성: Not Null, 유일한 값  ex) 주민번호 등

### 데이터 입력
  ```
  1. 명령어
    : insert into 테이블명(필드명) values('data', 'data', ...)   
      // 전체 필드에 데이터를 넣는 경우 (필드명)을 생략할 수 있다. 필드를 여러개를 한 번에 입력가능! 필드명을 적으면 순서대로 데이터 입력! 
    
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
  
## 파일 주고받기
  ```
  1. Export
	1) Administration > Export
	2) Schema 선택
	3) 저장 폴더 선택
	4) Start Export
	
  2. Import
	1) Import 해 올 workbench에 
	   - create database bd명;
	2) Import 시켜놓은 폴더 선택
	3) Start Import
	4) Schema 새로고침
  ```
  
## 기타 내용 정리
  * DB에서 field명은 column명과 유사한 개념으로 보면 된다.
  * sql 종류 
    ```
    1. DDL : Define (DB설계자용)
    2. DML: Manipulation (일반사용자용)
    3. DCL: Control (DBA용)
    ```
 
