DROP TABLE `Employee`;

CREATE TABLE `Employee` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name`  VARCHAR(10),
	`gender` INT,
	`hp` CHAR(13),
	`email` VARCHAR(30),
	`pos` VARCHAR(10),
	`dep` INT,
	`rdate` datetime
);