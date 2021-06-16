#날짜 : 2021/05/20
#이름 : 이진유
#내용 : 5. SQL 연습문제

#문제1
CREATE TABLE Book(
	 `bookid` INT AUTO_INCREMENT PRIMARY key
	,`bookname` VARCHAR(30)
	,`publisher` VARCHAR(30)
	,`price` INT
);

#문제2
CREATE TABLE Customer(
	 `custid` INT AUTO_INCREMENT PRIMARY key
	,`name` VARCHAR(30)
	,`address` VARCHAR(30)
	,`phone` CHAR(13)
);

#문제3
CREATE TABLE Orders (
	`orderid` INT AUTO_INCREMENT PRIMARY KEY,
	`custid`  INT,
	`bookid` INT,
	`saleprice` INT,
	`orderdate` DATE
);

#문제4
INSERT INTO `Book` VALUES (1, '축구의역사', '굿스포츠', 7000);
INSERT INTO `Book` VALUES (2, '축구아는여자', '굿스포츠', 13000);
INSERT INTO `Book` VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프바이블', '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO `Book` VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO `Customer` VALUES(1, '박지성', '영국 맨체스타', '010-5000-0001');
INSERT INTO `Customer` VALUES(2, '김연아', '대한민국 서울', '010-6000-0001');
INSERT INTO `Customer` VALUES(3, '장미란', '대한민국 강원도', '010-7000-0001');
INSERT INTO `Customer` VALUES(4, '추신수', '미국 클리블랜드', '010-8000-0001');
INSERT INTO `Customer` (`name`, `address`) VALUES ('박세리', '대한민국 대전');

INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 1, 6000, '2014-07-01');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 3, 21000, '2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2, 5, 8000, '2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 6, 6000, '2014-07-04');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4, 7, 20000, '2014-07-05');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 2, 12000, '2014-07-07');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4, 8, 13000, '2014-07-07');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 10, 12000, '2014-07-08');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2, 10, 7000, '2014-07-09');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 8, 13000, '2014-07-10');

#문제5
SELECT * FROM `Book`;

#문제6
SELECT DISTINCT `publisher` FROM `Book`;

#문제7
SELECT * FROM `Book` WHERE `price` < 20000;

#문제8
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000;
SELECT * FROM `Book` WHERE `price` BETWEEN 10000 AND 20000;

#문제9
SELECT * FROM `Book` WHERE `publisher` = '굿스포츠' || `publisher` = '대한미디어';

#문제10
SELECT `publisher` FROM `Book` WHERE `bookname` = '축구의역사';

#문제11
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE '%축구%';

#문제12
SELECT * FROM `Book` WHERE `bookname` LIKE '_구%';

#문제13
SELECT * FROM `Book` WHERE `bookname` LIKE '%축구%' AND `price` >= 20000;

#문제14
SELECT * FROM `Book` ORDER BY `bookname` ASC;

#문제15
SELECT * FROM `Book` ORDER BY `price` ASC, `bookname` ASC;

#문제16
SELECT * FROM `Book` ORDER BY `price` DESC, `bookname` ASC;

#문제17
SELECT SUM(`saleprice`) AS '총매출' FROM `Orders`;

#문제18
SELECT SUM(`saleprice`) AS '총매출' FROM `Orders` WHERE `custid` = 2;

#문제19
SELECT SUM(`saleprice`) AS '총매출', AVG(`saleprice`) AS '평균값', MIN(`saleprice`) AS '최저가',
MAX(`saleprice`) AS '최고가' FROM `Orders`;

#문제20
SELECT COUNT(*) AS 판매건수 FROM `Orders`;

#문제21
SELECT `custid`, COUNT(*) AS 수량 FROM `Orders`
 WHERE `saleprice` >= 8000
 GROUP BY `custid`
 HAVING `수량` >= 2;

#문제22
SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid;

SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
USING(custid);

SELECT * FROM `Customer` AS a, `Orders` AS b 
WHERE a.custid = b.custid;

#문제23
SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid
ORDER BY a.custid;

#문제24
SELECT `name`, `saleprice` FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid

#문제25
SELECT `name`, SUM(`saleprice`) FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid
GROUP BY `name`
ORDER BY `name`;

#문제26
SELECT `name`, `bookname` FROM `Customer` AS a
JOIN `Orders` AS b ON a.custid = b.custid
JOIN `Book` AS c ON b.bookid = c.bookid;

#문제27
SELECT `name`, `bookname` FROM `Customer` AS a
JOIN `Orders` AS b ON a.custid = b.custid
JOIN `Book` AS c ON b.bookid = c.bookid
WHERE c.price = 20000;

#문제28
SELECT `bookname` FROM `Book`
WHERE `price` = (SELECT MAX(`price`) FROM `Book`);

#문제29
INSERT INTO `Book` (`bookname`,`publisher`, `price`) VALUES ('스포츠의학','한솔의학서적' ,90000);

#문제30
INSERT INTO `Book` (`bookname`,`publisher`) VALUES ('스포츠의학','한솔의학서적');

#문제31
UPDATE `Customer` SET `address` = '대한민국 부산' WHERE `custid` = 2;

#문제32
DELETE FROM `Customer` WHERE `custid` = 5;