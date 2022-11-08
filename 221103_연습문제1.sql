-- -- 실습 1번 -- --
create table customer (
	cust_id VARCHAR(20) NOT NULL,
    cust_name VARCHAR(10) NOT NULL,
    cust_age INT,
    cust_grade VARCHAR(10) NOT NULL,
	cust_job VARCHAR(20),
    cust_point INT DEFAULT 0,
    PRIMARY KEY(cust_id)
);

create table product(
	pro_no CHAR(3) NOT NULL,
    pro_name VARCHAR(20),
    stockqtt INT CHECK(stockqtt >=0 AND stockqtt <=10000),
    unitprice INT,
    manufac VARCHAR(20),
    PRIMARY KEY(pro_no)
);

create table `order`(
	order_no CHAR(3) NOT NULL,
    order_cust VARCHAR(20),
    order_pro CHAR(3),
    order_qtt INT,
    order_addr VARCHAR(30),
    order_date DATE,
    PRIMARY KEY(order_no)
);

INSERT INTO customer VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
INSERT INTO customer VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
INSERT INTO customer VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
INSERT INTO customer VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);
INSERT INTO customer VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
INSERT INTO customer VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);
INSERT INTO customer VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);

INSERT INTO product VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO product VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO product VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
INSERT INTO product VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
INSERT INTO product VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO product VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO product VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

INSERT INTO `order` VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '22/01/01');
INSERT INTO `order` VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '22/01/10');
INSERT INTO `order` VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '22/01/11');
INSERT INTO `order` VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '22/02/01');
INSERT INTO `order` VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '22/02/20');
INSERT INTO `order` VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '22/03/02');
INSERT INTO `order` VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '22/03/15');
INSERT INTO `order` VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '22/04/10');
INSERT INTO `order` VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '22/04/11');
INSERT INTO `order` VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '22/05/22');

select * from `order`;
select * from customer;

alter table `order`
add constraint order_cust_fk foreign key (order_cust)
references customer(cust_id);

alter table `order`
add constraint order_pro_fk foreign key (order_pro)
references product(pro_no);
  
  
-- -- 실습 2번 -- --
  CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);
select * from employees;


-- -- 실습 3번 -- --
create table memberTBL(
	memberID CHAR(8) NOT NULL,
    memberName CHAR(20) NOT NULL,
    memberAddress CHAR(20),
    PRIMARY KEY(memberID)
);
select * from memberTBL;

create table productTBL(
	productName CHAR(15) NOT NULL,
    cost INT NOT NULL,
    makeDate DATE,
    company CHAR(20),
    amount INT NOT NULL,
    PRIMARY KEY(productName)
);
select * from productTBL;


-- -- 실습 4번 -- --
insert into memberTBL values('Dang','당탕이','경기 부천시 중동'),('Jee','지운이','서울 은평구 증산동'),('Han','한주연','인천 남구 주안동'),('Sang','상길이','경기 성남시 분당구');
insert into productTBL values('컴퓨터', 10,'2021-01-01', '삼성', 17),('세탁기', 20,'2022-09-01', 'LG', 3),('냉장고', 5,'2023-02-01', '대우', 22);


-- -- 실습 5번 -- --
CREATE TABLE indexTBL (first_name varchar(14), last_name varchar(16) , hire_date date);
INSERT INTO indexTBL 
SELECT first_name, last_name, hire_date 
FROM employees
LIMIT 500;
SELECT * FROM indexTBL WHERE first_name = 'Mary';
CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);
SELECT * FROM indexTBL WHERE first_name = 'Mary';

show index from indexTBL;


-- -- 실습 6번 -- --
select * from memberTBL_view;

-- -- 실습 7번 -- --
call TBL_procedure;

-- -- 실습 8-1번 -- --
create table deletedMemberTBL (
	memberId CHAR(8),
    memberName CHAR(5),
    memberAddress CHAR(20),
    deletedDate DATE
    );
select * from deletedMemberTBL;

-- -- 실습 8-2번 -- --
-- memberTBL > trigger >   member TBL ↓
-- CREATE DEFINER=`pnusw07`@`%` TRIGGER `memberTBL_AFTER_DELETE` AFTER DELETE ON `memberTBL` FOR EACH ROW 
-- BEGIN
-- insert INTO deletedMemberTBL values(old.memberID, old.memberName, old.memberAddress, deletedDate());
-- END 

-- -- 실습 9-1번 export-- --
-- 1. admini > export > schema 선택 > 저장폴더 선택 > start export

-- -- 실습 9-2번 export-- --
-- 1. import 해 올 워크벤치에 create database db명 
-- 2. admini > import > export시켜놓은 폴더 선택 > import 할 schema 선택 > start import > schema새로고침
