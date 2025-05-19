# DataAnalytics-Assessment

## Overview
This assessment analyzes customer behavior using SQL queries across savings, plans, and user data. The queries identify high-value users, segment by transaction frequency, flag inactive accounts, and estimate customer lifetime value.

---

## Question Breakdown

### Q1: High-Value Customers with Multiple Products
**Approach:** 
- Used joins to identify users with both savings and investment plans.
- Filtered for only funded accounts.
- Aggregated deposit values and sorted by total.

### Q2: Transaction Frequency Analysis
**Approach:**
- Counted total transactions and divided by months active.
- Used `CASE` logic to categorize frequency.
- Grouped and averaged for summary metrics.

### Q3: Account Inactivity Alert
**Approach:**
- Got last transaction date for savings and investment plans.
- Used `DATEDIFF` to identify >365 days of inactivity.
- Combined both account types using `UNION ALL`.

### Q4: CLV Estimation
**Approach:**
- Calculated tenure from first transaction to today.
- CLV formula simplified based on transaction volume and time.
- Ordered customers by their estimated CLV.

---

## Challenges
- Assumed availability of transaction dates for all records.
- Normalized all currency fields from kobo to naira.
- Handled NULLs and division carefully to avoid errors (e.g., divide-by-zero on tenure).

---

## Final Note
All queries are optimized for readability and performance using Common Table Expressions (CTEs) and proper filtering logic.
