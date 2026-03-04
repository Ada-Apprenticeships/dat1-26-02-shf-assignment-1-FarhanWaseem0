.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql


-- 2.1 
INSERT INTO
  payments (
    payment_id,
    member_id,
    amount,
    payment_date,
    payment_method,
    payment_type
  )
VALUES
  (
    '8',
    '11',
    '50.00',
    datetime('now'),
    'Credit Card',
    'Monthly membership fee'
  );


-- 2.2 
SELECT
  strftime('%Y-%m', payment_date) AS month,
  SUM(amount) AS total_revenue
FROM
  payments
WHERE
  payment_type = 'Monthly membership fee'
  AND payment_date >= '2024-11-01'
  AND payment_date < '2025-03-01'
GROUP BY
  strftime('%Y-%m', payment_date)
ORDER BY
  month;


-- 2.3 
SELECT
  payment_id,
  amount,
  payment_date,
  payment_method
FROM
  payments
WHERE
  payment_type = 'Day pass';