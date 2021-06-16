#날짜:2021/05/17
#이름:이진유
#내용:1.SQL 기본

# 실습하기 1-1 `: Backtick - 개체이름을 선언할 때 사용 없어도 되지만 붙여주는게 좋다
CREATE DATABASE `TestDB`;
DROP DATABASE `TestDB`;

# 실습하기 1-2 관계형 데이터베이스 테이블 생성
CREATE TABLE `USER1` (
	`uid` VARCHAR(10),
	`name` VARCHAR(10),
	`hp` CHAR(13),
	`age` INT
); # 문자형은 길이를 명시해줘야함 VARCHAR은 가변형, CHAR은 고정 -> 휴대폰 번호인 hp 13자리 고정길이므로 CHAR형으로 13을 줌

# 테이블 제거
DROP TABLE `USER1`;

# 실습하기 1-3
INSERT INTO `USER1` VALUES ('A101', '김유신', '010-1234-1111',25);
INSERT INTO `USER1` VALUES ('A102', '김춘추', '010-1234-2222',23);
INSERT INTO `USER1` VALUES ('A103', '장보고', '010-1234-3333',32);
INSERT INTO `USER1` (`age`, `name`, `uid`, `hp`) VALUES (45, '강감찬', 'A104', '010-1234-4444');
INSERT INTO `USER1` SET
	`name` = '이순신',
	`age` = 51,
	`hp` = '010-1234-5555',
	`uid` = 'A105';


# 실습하기 1-4
SELECT `uid`, `name`, `age`, `hp` FROM `USER1`;
SELECT `name`,`uid`,`hp` FROM `USER1`;
SELECT * FROM `USER1`;
SELECT * FROM `USER1` WHERE `uid`='A101';
SELECT * FROM `USER1` WHERE `name`='김춘추';
SELECT * FROM `USER1` WHERE `age` > 30;


# 실습하기 1-5
UPDATE `USER1` SET `hp` = '010-1234-1234';
UPDATE `USER1` SET
						 `uid` = 'B101',
						 `name` = '홍길동';
						 
UPDATE `USER1` SET
						 `uid` = 'A101',
						 `name` = '김유신'
					WHERE
						`age` = 25;
						
UPDATE `USER1` SET `hp` = '010-1234-1111' WHERE `name` = '김유신';
UPDATE `USER1` SET 
						 `uid` = 'A102',
						 `name` = '김춘추',
						 `hp` = '010-1234-1234' WHERE `age` = 23;
						 

# 실습하기 1-6
DELETE FROM `USER1` WHERE `uid` = 'A101';
DELETE FROM `USER1` WHERE `uid` = 'A102' AND age=25;
DELETE FROM `USER1` WHERE `age` = 30;


CREATE TABLE `Employee` LIKE `MEMBER`;