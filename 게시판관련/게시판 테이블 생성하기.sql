#날 짜 : 2021/06/07
#이 름 : 이진유
#내 용 : 게시판 테이블 생성하기

CREATE DATABASE `mydb`;

# 약관 테이블mydb
CREATE TABLE `JBOARD_TERMS` (
	`terms`		TEXT,
	`privacy`   TEXT
);

# 회원 테이블
CREATE TABLE `JBOARD_MEMBER` (
	`uid`	 VARCHAR(20) PRIMARY KEY,
	`pass` VARCHAR(255),
	`name` VARCHAR(20),
	`nick` VARCHAR(20) UNIQUE,
	`email`VARCHAR(20) UNIQUE,
	`hp`	 CHAR(13) UNIQUE,
	`grade`TINYINT DEFAULT 2,
	`zip`	 CHAR(5) DEFAULT NULL,
	`addr1`VARCHAR(255) DEFAULT NULL,
	`addr2`VARCHAR(255) DEFAULT NULL,
	`regip`VARCHAR(100),
	`rdate`DATETIME
);

#게시판 테이블
CREATE TABLE `JBOARD_ARTICLE` (
	`seq`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT DEFAULT 0,
	`comment`	INT DEFAULT 0,
	`cate`		VARCHAR(10) DEFAULT 'free',
	`title`		VARCHAR(255),
	`content`	TEXT,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`uid`			VARCHAR(20),
	`regip`		VARCHAR(100),
	`rdate`		DATETIME
);

CREATE TABLE `JBOARD_FILE` (
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT,
	`oriName`		VARCHAR(255),
	`newName`	VARCHAR(255),
	`download`	INT DEFAULT 0,
	`rdate`		DATETIME
);

(SELECT * FROM `JBOARD_ARTICLE` WHERE `cate`='notice' AND `parent`=0 ORDER BY `seq` DESC LIMIT 3)
UNION
(SELECT * FROM `JBOARD_ARTICLE` WHERE `cate`='qna' AND `parent`=0 ORDER BY `seq` DESC LIMIT 3)
UNION
(SELECT * FROM `JBOARD_ARTICLE` WHERE `cate`='faq' AND `parent`=0 ORDER BY `seq` DESC LIMIT 3);