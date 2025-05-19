WITH user_transactions AS (
    SELECT
        owner_id AS customer_id,
        COUNT(*) AS total_transactions,
        SUM(confirmed_amount) / 100.0 AS total_transaction_value,
        MIN(transaction_date) AS first_transaction
    FROM savings_savingsaccount
    GROUP BY owner_id),

user_tenure AS (
    SELECT
        u.id AS customer_id,
        u.name,
        DATEDIFF(MONTH, MIN(t.first_transaction), GETDATE()) AS tenure_months,
        t.total_transactions,
        t.total_transaction_value
    FROM users_customuser u
    JOIN user_transactions t ON t.customer_id = u.id
    GROUP BY u.id, u.name, t.total_transactions, t.total_transaction_value, t.first_transaction)

SELECT
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions * 0.001 / tenure_months) * 12, 2) AS estimated_clv
FROM user_tenure
WHERE tenure_months > 0
ORDER BY estimated_clv DESC;
