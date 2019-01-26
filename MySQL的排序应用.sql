SELECT t2.*,users.email
FROM
(
SELECT	t1.*,
IF (
	@last_user_id = user_id ,@num :=@num + 1 ,@num := 1
) AS seq,
 (@last_user_id := user_id) AS tmp
FROM
(SELECT	user_id,	date
	FROM orders
	GROUP BY user_id, date
  ORDER BY user_id, date
	) t1
) t2
LEFT JOIN users ON t2.user_id = users.`﻿id`
where t2.seq = 5
