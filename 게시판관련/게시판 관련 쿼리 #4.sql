SELECT MAX(`seq`) FROM `JBOARD_ARTICLE`;

SELECT a.*, b.`nick` FROM `JBOARD_ARTICLE` AS a
JOIN `JBOARD_MEMBER` AS b
ON a.uid = b.uid ORDER BY seq DESC;

DELETE FROM `JBOARD_ARTICLE` WHERE `uid` ='test1';

UPDATE `JBOARD_ARTICLE`
SET `hit` = `hit` + 1
WHERE `seq`='254'

INSERT INTO `JBOARD_ARTICLE` (`title`, `content`, `uid`, `regip`, `rdate`)
SELECT `title`, `content`, `uid`, `regip`, `rdate` FROM `JBOARD_ARTICLE`;

SELECT COUNT(*) FROM `JBOARD_ARTICLE`;


# 파일이 없을 경우도 있으므로 LEFT 조인을 사용해서 파일이 없는 경우에도 붙여줘야함.
SELECT * FROM `JBOARD_ARTICLE` AS a
LEFT JOIN `JBOARD_FILE` AS b
ON a.seq = b.parent
WHERE a.`seq`= '255';