## 개체

**1. Index**
  ```
   - 검색성능을 높이기 위해서 사용. primery key는 내부적으로 자동 index설정
   - 확인
    table → 인덱스붙일 필드 → indexes
   - 만들기
    create index idx_필드명 on 테이블명(필드명);	// 보통 index를 idx라고 축약	
  ```
---  
**2. View**
  ```
     - 가상테이블을 만들어서 보고싶은것만 보여줌
     - 명령어
       •  create view <view명> as 
          select <필드명> 
          from <테이블명>      
          where <조건>; 
  ```
 
---
**3. stored procedures**
  ```
     - 몇 개의 일을 묶어서 처리할 때 사용
     - 기본 명령어(작업창에서)                                  //create창 사용하면 delimiter 필요 없다.
       •  drop procedure if exists <stored procedure명>;  // 기존에 해당 procedure가 존재한다면 DROP 시킨다.(업데이트시)
          DELIMITER $$ (//)
          CREATE PROCEDURE <stored procedure명> (         //procedure 생성
                in <파라미터1> <데이터타입1>,                 // in: 입력 할 파라미터
                out <파라미터2> <데이터타입2>,                // out: 출력 될 파라미터
                inout <파라미터3> <데이터타입3>
          )
          Begin                                          // procedure 로직 시작.
            → select <기존필드명> into <새로운필드명>          // <기존필드명>의 값이 <새로운필드> 그릇으로 들어간다. 
            → from <테이블명> 
            → where <조건>
          End$$ (//)                                     // procedure 로직 끝.
          DELIMITER ;                                    // delimiter_; : delimiter과 ;사이에 공백 한 칸 있다.
       •  (호출) call <stored procedure명>(<in파라미터값>, @<out파라미터미름>);               
                                                      // 저장한 procedure 호출하기.(= schema → stored_procedures → 번개모양버튼)
 ```  
  <새수강신청 procedure 로직>
<p align = "center"> <img width="800" alt="새수강신청 procedure 로직" src="https://user-images.githubusercontent.com/51871037/202511675-1c67d9ed-0e89-4456-93e2-788097471ae8.png"> </p>

 + 3-1) procedure의 제어문 (Begin ~ End 사이)
     ```
       1) if문
          BEGIN
            → declare <변수명> <변수데이터타입(길이)> default '<default값>';   // declare: 자바의 변수처럼 프로시저 안에서 사용할 변수 선언
            → set <declare에서 선언한 변수명> = <변수값>;                     // set: 대입할 값(원하는 값으로 세팅)   
            → if <조건1>                                                 // if then: if 조건문
              then <조건1이 참일 경우 실행 될 로직>;
            → elseif <조건2>                                             // elseif: else if 조건문
              then <조건2가 참일 경우 실행 될 로직>;
            → else <조건1,2가 모두 아닐경우 실행 될 로직>                      // else: else구문
            → end if;                                                  // end if: if조건문 종료
          END
     ```
     ```
       2) case문
          (1) case-변수
              BEGIN
                → case <입력 변수명>
                      when <비교 변수값1> then 
                           set <출력(out) 파라미터명1> = <출력 파라미터값1>;
                      when <비교 변수값2> then
                           set <출력(out) 파라미터명2> = <출력 파라미터값2>;
                      else
                           set <출력(out) 파라미터명3> = <출력 파라미터값3>;
              END
          
          (2) case-조건식
              BEGIN
                → declare <변수명> <변수타입>;
                → select <필드명> into <변수명>
                  from <테이블명>
                  where <조건>
                → case 
                      when (<조건식1>) then 
                           set <출력(out) 파라미터명1> = <출력 파라미터값1>;
                      when (<조건식2>) then
                           set <출력(out) 파라미터명2> = <출력 파라미터값2>;
                      else
                           set <출력(out) 파라미터명3> = <출력 파라미터값3>;
              END
     ```
       3) while문
          BEGIN
            → declare <변수1> <변수1 타입>;
              declare <변수2> <변수2 타입>;
            →   set <변수1> = <변수1 초기값>;
                set <변수2> = <변수2 초기값>;
            → while (<조건식>) do
            →   set <변수1> = <원하는 값 or 식>;
                set <변수2> = <원하는 값 or 식>; 
            → end while;
            → select <변수>;
          END
     ```
       4) repeat문
          BEGIN
            → declare <변수1> <변수1 타입>;
              declare <변수2> <변수2 타입>;
            →   set <변수1> = <변수1 초기값>;
                set <변수2> = <변수2 초기값>;
            → repeat
            →   set <변수1> = <원하는 값 or 식>;
                set <변수2> = <원하는 값 or 식>; 
            → until <조건식>
            → end repeat;
            → select <변수>;
          END
      ```              
    + 변수
     ```
      • declare <변수명> <변수타입> default ...;
        ex) declare i int default 0;

      • set <변수명> = <값>;
        ex) set i = 0; 
      • select <필드명> into <변수명> from <테이블명>;
        ex) select addr into _addr from Student where id =1;
        -- set이나 select into 선택해서 사용가능. 
    ``` 

---
**4. trigger**
  ```
     - 자동적으로 동작하게 만들 때 사용 
     	ex) 회원탈퇴 시 회원정보를 바로 삭제하는 것이 아니라, 기존 테이블에서만 삭제하고 다른 테이블에 옮겨 저장해 놓을 때.
