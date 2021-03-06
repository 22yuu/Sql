#날짜 : 2021/05/21
#이름 : 이진유
#내용 : 수행평가

DROP TABLE `tbl_user`;
DROP TABLE `tbl_buy`;

CREATE TABLE `tbl_user`(
	`userId` VARCHAR(10) PRIMARY KEY,
	`userName` VARCHAR(10) NOT NULL,
	`userHp` CHAR(13) NOT NULL,
	`userAddr` VARCHAR(100)
);

CREATE TABLE `tbl_buy`(
	`userId` VARCHAR(10) NOT NULL,
	`prodName` VARCHAR(10) NOT NULL,
	`price` INT NOT NULL,
	`amount` INT NOT NULL
);

INSERT INTO `tbl_user` (`userId`, `userName`, `userHp`) VALUES ('choi', '최영', '010-1234-0004');
INSERT INTO `tbl_user` VALUES ('jang', '장보고', '010-1234-0002', '완도군');
INSERT INTO `tbl_user` VALUES ('kang', '강감찬', '010-1234-0003', '서울시');
INSERT INTO `tbl_user` VALUES ('kim', '김유신', '010-1234-0001', '김해시');
INSERT INTO `tbl_user` (`userId`, `userName`, `userHp`) VALUES ('lee', '이순신', '010-1234-0005');

INSERT INTO `tbl_buy` VALUES ('kim', '햄버거', 2500, 1);
INSERT INTO `tbl_buy` VALUES ('jang', '컵라면', 1500, 3);
INSERT INTO `tbl_buy` VALUES ('kang', '샌드위치', 3000, 1);
INSERT INTO `tbl_buy` VALUES ('choi', '삼각김밥', 1200, 2);
INSERT INTO `tbl_buy` VALUES ('lee', '콜라', 900, 2);
INSERT INTO `tbl_buy` VALUES ('lee', '햄버거', 2500, 2);
INSERT INTO `tbl_buy` VALUES ('choi', '컵라면', 1500, 1);
INSERT INTO `tbl_buy` VALUES ('jang', '샌드위치', 3000, 1);
INSERT INTO `tbl_buy` VALUES ('kim', '삼각김밥', 1200, 3);
INSERT INTO `tbl_buy` VALUES ('kim', '콜라', 2500, 1);


SELECT a.userId, a.userName, a.userHp, b.prodName, b.price, b.amount
FROM `tbl_user` AS a
JOIN `tbl_buy` AS b
USING(`userId`)
WHERE a.userName = '이순신';
