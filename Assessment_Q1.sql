-- Q1: High-Value Customers with Multiple Products  -----
SELECT uc.id AS owner_id,uc.name,COUNT(DISTINCT s.id) AS savings_count,COUNT(DISTINCT p.id) AS investment_count,ROUND(SUM(s.confirmed_amount) / 100.0, 2) AS total_deposits
FROM users_customuser uc
JOIN savings_savingsaccount s ON s.owner_id = uc.id AND s.confirmed_amount > 0
JOIN plans_plan p ON p.owner_id = uc.id AND p.is_a_fund = 1 AND p.confirmed_amount > 0
WHERE s.is_regular_savings = 1
GROUP BY u.id, u.name
ORDER BY total_deposits DESC;
