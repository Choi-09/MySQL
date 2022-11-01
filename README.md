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
  + 작업 db > tables > 우클릭 > create tables > Table-name, column Name, datatype 등 > appy

### 데이터 가공
  + use 데이터베이스 이름;  // 해당 데이터베이스 선택, 사용
  + select * from 테이블명; // 테이블에 있는 모든 데이터 출력
  + select * from 테이블명 where 컬럼명 like '% ... %';  // 컬럼에서 ...라는 내용을 포함한 모든 데이터 출력

## MySQL 개념
