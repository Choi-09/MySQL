use 221117_mysql10;
DELIMITER $$
CREATE PROCEDURE test_mysql_while_loop()
BEGIN
    DECLARE x INT;
    DECLARE str VARCHAR(255); 
        SET x = 1;
        SET str = ''; 
    WHILE x <= 5 DO
        SET str = CONCAT(str,x,',');
        SET x = x + 1; 
    END WHILE;
    SELECT str;
END $$
DELIMITER ;
call test_mysql_while_loop;


DELIMITER $$
CREATE PROCEDURE test_mysql_repeat_loop()
BEGIN
    DECLARE x INT;
    DECLARE str VARCHAR(255);
        SET x = 1;
        SET str = '';
    REPEAT
        SET str = CONCAT(str,x,',');
        SET x = x + 1; 
    UNTIL x > 5
    END REPEAT;
    SELECT str;
END$$
DELIMITER ;

-- test_mysql_repeat_loop sp 
call test_mysql_repeat_loop;


drop procedure if exists dorepeat;
delimiter //
CREATE PROCEDURE dorepeat(IN p1 INT, OUT y INT)
BEGIN
    declare x int;
        SET x = 1;
    REPEAT
        SET x = x+1; 
        SET y = x; 
    UNTIL x>= p1
    END REPEAT;
END //
delimiter ;

-- dorepeat sp 호출
CALL dorepeat(10,@a);
select @a;


drop procedure if exists 새수강신청;					-- 수강신청 프로시저가 이미 있으면 삭제시킨다.(업데이트시 활용)
DELIMITER //
CREATE PROCEDURE 새수강신청(IN 학번 CHAR(7), OUT 수강신청_번호 INT)	    -- "새수강신청"이라는 프로시저 만드는데 학번(char) 입력하면 수강신청_번호(int) 출력
BEGIN
    declare exit handler for 1452				  -- 1452 오류코드가 뜨면 'a foreign key constraint fails' 이라는 문구 read
    select 'a foreign key constraint fails';
    select MAX(수강신청번호) INTO 수강신청_번호 FROM 수강신청;		   -- 수강신청 테이블에서 가장 큰 수강신청번호를 (새수강신청의) 수강신청_번호 그릇에 담는다.
        SET 수강신청_번호 = 수강신청_번호 +1;			     -- 수강신청_번호+1 값을 수강신청_번호에 넣음
    INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기)		  -- 수강신청 테이블의 수강신청번호, 학번, 날짜, 연도, 학기 필드에
    VALUES(수강신청_번호, 학번, CURDATE(), '2020', '2');	      -- (새수강신청의) 수강신청_번호, 학번, 현재날짜, 2020, 2 를 넣는다.
END//
delimiter ;

-- 새수강신청sp 호출
call 새수강신청('1804004', @수강신청_번호);			     -- "새수강신청" 프로시저호출. 1804004학번을 입력하면 @수강신청_번호 출력.
select @수강신청_번호;

     
-- SP 실습(1) update row. 없는 내용을 집어넣는 것이므로 out이 없다.
drop procedure if exists 새학과;

delimiter //
create procedure 새학과 (
    in 학과_번호 CHAR(2),
    in 학과_명 CHAR(20),
    in 전화_번호 CHAR(20)
    )
BEGIN
    insert into 학과(학과번호, 학과명, 전화번호)
    values (학과_번호, 학과_명, 전화_번호);
    -- select * from 학과 where 학과번호 = 학과_번호;		// 이거 왜들어가는지 확인! : 삭제해도 됨.
END//
delimiter ;

-- 새학과sp 호출
call 새학과('08', '컴퓨터보안학과', '022-200-7000');
-- 쿼리문 실행
select * from 학과;


-- SP 실습(2) 통계. 이미 들어가 있는 값들을 불러내서 통계 프로시저에 담는것이므로 in이 없다.
drop procedure if exists 통계;
delimiter //
create procedure 통계(
    out 학생수 int,
    out 교수수 int,
    out 과목수 int)
BEGIN 
    select count(학번) into 학생수 from 수강신청;
    select count(사번) into 교수수 from 교수;
    select count(distinct 과목번호) into 과목수 from 수강신청내역;
END//
delimiter ;

-- 통계sp 호출
call 통계(@a, @b, @c);
-- 쿼리문에서 실행
select @a as '학생수', @b as '교수수', @c as '과목수';


-- STORED FUNCTION 
-- 1. sf test
delimiter $$
create function userFunc(value1 INT, value2 INT)
	RETURNS INTEGER
BEGIN
	return value1 + value2;
END$$
delimiter ;

--userFunc f 실행
select userfunc(100, 200);
-- 호출오류발생시 실행
-- set global log_bin_trust_function_creators=1;


-- 1104실습 40번 (stored function 사용)
drop function if exists pass;
delimiter //
create function pass(val int)	-- 들어갈 매개변수val과 데이터타입 int
	returns char(10) charset utf8mb4
BEGIN
    declare re char(10);
    if val = 0 then set re = '미취득';
    else set re = '취득';
    end if;
    return re;
END//
delimiter ;

-- pass f실행
select 수강신청번호, 과목번호, 평점, pass(평점) from 수강신청내역 where 평점 <>-1;

-- VIEW 실습 (1) 교수정보
drop view if exists 교수정보;
select * from 교수;
select * from 학과;

create view 교수정보 as 
select 교수.사번, 교수.이름, 교수.학과, 학과.학과명
from 교수, 학과
where 교수.학과 = 학과.학과번호;

select * from 교수정보 where 학과 = '01';


-- VIEW 실습 (2) 담당교과
select * from 수강신청내역;
select * from 과목;
select * from 교수;
select * from 학과;

create view 담당교과 as
select 교수.사번, 교수.이름, 학과.학과명, 과목.과목명, 과목.학점
from 교수, 과목, 학과
where 과목.담당교수 = 교수.사번 and 학과.학과번호 = 교수.학과;

select * from 담당교과 where 사번 = '1000001';


-- VIEW 실습 (3) 교수별담당과목
drop view if exists 교수별담당과목;
create view 교수별담당과목 as
select 교수.사번, 교수.이름, 학과.학과명, count(과목.담당교수) as 담당과목수, sum(과목.학점) as '총 학점'
from 교수, 과목, 학과
where 교수.사번 = 과목.담당교수 and 학과.학과번호 = 교수.학과
group by 사번;

select * from 교수별담당과목 where 사번 = '1000001';
