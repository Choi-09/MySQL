# MySQL
## MySQL 작업

### MySQL 설치
  + 주소: https://dev.mysql.com/downloads/windows/installer/8.0.html
  
### 작업 설정
  + 주소, db명, 계정 알면 작업가능!
  + db명, table명, field명은 반드시 영어로
  + preference > appearance > font: Korean > Table Figure Title : 맑은고딕(실습때 table명을 부득이하게 한글로 써야하는 경우가 있어서) 
  + show databases;  //관리자의 권한에 따라 보이는 데이터베이스가 다르다.
  
### 테이블 생성 및 실행(2가지 방법)
  + 1. schema창에서: 작업 db > tables > 우클릭 > create tables > Table-name, column Name, datatype 등 > appy
  + 2. 명령어 : create table 테이블명 (
                필드명1 데이터타입 속성(auto_increment),
                필드명2 데이터타입(varchar(200))  속성(not null),
                필드명3 데이터타입 (varchar(2000)) 속성(not null),
                ...
                primary key (필드명)테이블명
             );
  + 테이블 생성 순서
    '''
    1) 테이블명 
    2) 필드명 
    3) 각 필드의 데이터 타입 설정 
    4) 프라이머리 키 설정
    '''
  + 대문자 입력: 키워드로 틀리면 안되는 것을 강조해서 적어줌

### 데이터 가공
  + use 데이터베이스 이름;  // 해당 데이터베이스 선택, 사용
  + select * from 테이블명; // 테이블에 있는 모든 데이터 출력
  + select * from 테이블명 where 컬럼명 like '% ... %';  // 컬럼에서 ...라는 내용을 포함한 모든 데이터 출력

## MySQL 개념
  + DB에서 field명은 column명과 유사한 개념으로 보면 된다.
  
