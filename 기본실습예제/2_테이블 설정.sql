#날짜:2021/05/17
#이름:이진유
#내용:2.테이블 설정

# 실습하기 2-1
CREATE TABLE `USER2` (
	`uid` VARCHAR(10) PRIMARY KEY, # 기본키 제약조건
	`name` VARCHAR(10),
	`hp`	CHAR(13),
	`age`	TINYINT #-127~ 128 / 사람의 수명이 오래 살아봐야..... 
);



INSERT INTO `USER2` VALUES ('A101', '김유신', '010-1234-1111',25);
INSERT INTO `USER2` VALUES ('A102', '김춘추', '010-1234-2222',23);
INSERT INTO `USER2` VALUES ('A103', '장보고', '010-1234-3333',32);

#실습하기 2-2
CREATE TABLE `USER3` (
	`uid` VARCHAR(10) PRIMARY KEY, # 기본키 제약조건
	`name` VARCHAR(10),
	`hp`	CHAR(13) UNIQUE,
	`age`	TINYINT #-127~ 128 / 사람의 수명이 오래 살아봐야..... 
);

INSERT INTO `USER3` VALUES ('A101', '김유신', '010-1234-1111',25);
INSERT INTO `USER3` VALUES ('A102', '김춘추', '010-1234-2222',23);
INSERT INTO `USER3` VALUES ('A103', '장보고', '010-1234-3333',32);
INSERT INTO `USER3` VALUES ('A104', '김유신', '010-1234-4444',25);
INSERT INTO `USER3` VALUES ('A105', '김춘추', '010-1234-5555',23);
INSERT INTO `USER3` VALUES ('A106', '장보고', '010-1234-6666',32);
INSERT INTO `USER3` (`uid`, `age`) VALUES ('A107', 21);
INSERT INTO `USER3` (`uid`, `age`) VALUES ('A108', 31);

# 실습하기 2-3
CREATE TABLE `USER4` (
	`uid` VARCHAR(10) PRIMARY KEY, # 기본키 제약조건
	`name` VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE,
	`age`	TINYINT DEFAULT 10 #-127~ 128 / 사람의 수명이 오래 살아봐야..... 
);

INSERT INTO `USER4` VALUES ('A101', '김유신', '010-1234-1111',25);
INSERT INTO `USER4` VALUES ('A102', '김춘추', '010-1234-2222',23);
INSERT INTO `USER4` VALUES ('A103', '장보고', '010-1234-3333',32);
INSERT INTO `USER4` (`uid`, `age`) VALUES ('A104', 21);
INSERT INTO `USER4` (`uid`, `age`) VALUES ('A105', 31);
INSERT INTO `USER4` (`uid`, `name`, `hp`) VALUES ('A106', '홍길동', '010-1010-1111');

# 실습하기 2-4
CREATE TABLE `USER5` (
	`seq` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10),
	`gender` TINYINT,
	`age`	INT,
	`addr` VARCHAR(255)
);

INSERT INTO `USER5` (`name`, `gender`, `age`, `addr`) VALUES ('김유신', 1, 25, '김해시');
INSERT INTO `USER5` (`name`, `gender`, `age`, `addr`) VALUES ('김춘추', 1, 21, '경주시');
INSERT INTO `USER5` (`name`, `gender`, `age`, `addr`) VALUES ('장보고', 1, 35, '완도군');
INSERT INTO `USER5` (`name`, `gender`, `age`, `addr`) VALUES ('신사임당', 1, 27, '강릉시');
INSERT INTO `USER5` (`name`, `gender`, `age`, `addr`) VALUES ('이순신', 1, 51, '서울시');

# 실습하기 2-5 - 테이블 전체 복사
CREATE TABLE `USER6` SELECT * FROM `USER5`;
SELECT * FROM `USER6`; # 테이블만 전체복사하다 보니 테이블의 칼럼구조까지는 복사하지 않음 USER5에서 seq는 기본키지만, USER6은 아님

#실습하기 2-6 - 테이블 칼럼 구조만 복사
CREATE TABLE `USER7` LIKE `USER5`;

#실습하기 2-7 - 테이블의 데이터만 복사
INSERT INTO `USER7` SELECT * FROM `USER5`;
INSERT INTO `USER7` (`name`, `gender`, `age`, `addr`) SELECT `name`, `gender`, `age`, `addr` FROM `USER5`;

SELECT * FROM `USER7`;