use pnusw07db;
select * from s;

select sum(status) from s where city = 'London';

call getStatus('Athens', @total);
select @total;

-- stored Procedures에 번개모양 버튼 누르고 변수값 설정해주면 바로 결과값 볼 수 있다. 

use 221110db;
create table 계좌 (
	 학생이름 CHAR(13) PRIMARY KEY,
     계좌번호 CHAR(15) NOT NULL,
     잔액 INT NOT NULL DEFAULT 0
	);
    
insert into 계좌 values ('정용민', '123435-3333333', 450000), ('안중근', '123434-6666666', 1000000);

delete from 계좌;
select * from 계좌;

-- 정용민 계좌에서 안중근 계좌로 5만원 송금
update 계좌 set 잔액 = 잔액 -50000 where 학생이름 = '정용민';
update 계좌 set 잔액 = 잔액 + 50000 where 학생이름 = '안중근';
select * from 계좌;

-- 정용민 계좌에서 안중근 계좌로 50만원 송금
-- sql문에서 수동으로 transaction 만들기
start transaction;
update 계좌 set 잔액 = 잔액 -500000 where 학생이름 = '정용민';
update 계좌 set 잔액 = 잔액 + 500000 where 학생이름 = '안중근';
rollback; 
select * from 계좌;

-- stored procedures 불러오기
call WIRE_TRANSFER ('정용민', '안중근', 500000);
select * from 계좌;
