WITH deduplicatedData AS(
  SELECT
  *,
  CONCAT(user_id, send_amount, transaction_date, recipient_id, status) as txn_id --  creating a primary key,
  FROM `axiomatic-fiber-403615.002.RandomuserdataforAnalystcasestudy`
  WHERE user_id IS NOT NULL AND status IS NOT NULL
  GROUP BY user_id, signup_date, year_of_birth, mobile_country, app_os, transaction_date, recipient_id, send_currency, send_amount, receive_currency, receive_country, status, tx_type, txn_id
), -- assuming that the line with exact the same information is the same transaction


statusFlag AS(
SELECT
*,
COUNT(*)OVER() AS total_tx,
FORMAT_DATE('%F' ,DATE_TRUNC(transaction_date, month)) AS tx_month,
CASE WHEN (status = "SUCCESS" OR status = "PAID") THEN 1
  ELSE 0
  END AS sucess_flag,


CASE WHEN mobile_country IN ("ca", "gb", "us")  THEN mobile_country
  ELSE "other"
  END AS sending_country,


CASE WHEN send_amount < 9 THEN "1. [0-9)"
  WHEN send_amount >=9 AND send_amount < 20 THEN "2. [9-20)"
  WHEN send_amount >=20 AND send_amount < 100 THEN "3. [20-100)"
  WHEN send_amount >=100 AND send_amount < 290 THEN "4. [100-290)"
  WHEN send_amount >=290 THEN "5. [290-2999]"
  ELSE NULL
  END send_amount_buckets
FROM deduplicatedData)




SELECT
send_amount_buckets,
COUNT(*) AS total_tx_per_group,
SUM(sucess_flag) AS total_sucessed_tx,
SUM(sucess_flag)/COUNT(*) AS conversion_rate,
COUNT(*)/total_tx AS percent_of_total_tx,
SUM(send_amount) AS total_amount,
--AVG(send_amount) AS avg_amount
FROM statusFlag
GROUP BY total_tx, send_amount_buckets
