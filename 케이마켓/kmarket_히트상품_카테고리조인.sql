# 카테고리 조인
SELECT c2.code1, c2.code2, c1.title AS tit1, c2.title AS tit2  
FROM `km_cate1` AS c1
JOIN `km_cate2` AS c2
ON c1.code1 = c2.code1
ORDER BY c2.code1, c2.code2;


# 히트상품
SELECT * FROM `km_product`
ORDER BY `hit` DESC
LIMIT 8;