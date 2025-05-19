WITH latest_savings AS (
    SELECT id AS plan_id, owner_id, 'Savings' AS type,
           MAX(transaction_date) AS last_transaction_date
    FROM savings_savingsaccount
    WHERE is_regular_savings = 1
    GROUP BY id, owner_id),
  
latest_investments AS (
    SELECT id AS plan_id, owner_id, 'Investment' AS type,
           MAX(transaction_date) AS last_transaction_date
    FROM plans_plan
    WHERE is_a_fund = 1
    GROUP BY id, owner_id),
  
combined AS (
    SELECT * FROM latest_savings
    UNION ALL
    SELECT * FROM latest_investments)
  
SELECT
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATEDIFF(DAY, last_transaction_date, GETDATE()) AS inactivity_days
FROM combined
WHERE DATEDIFF(DAY, last_transaction_date, GETDATE()) > 365;
