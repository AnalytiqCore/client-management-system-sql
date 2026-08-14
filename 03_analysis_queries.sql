-- =========================================================
-- Mercy Immigration SQL Analysis Project
-- 03_analysis_queries.sql
-- =========================================================

USE mercy_immigration;

-- 1. View all clients
SELECT * FROM clients;

-- 2. Germany clients
SELECT first_name, last_name, target_country
FROM clients
WHERE target_country = 'Germany';

-- 3. Clients targeting selected countries
SELECT first_name, target_country
FROM clients
WHERE target_country IN ('Germany', 'Canada');

-- 4. Consultation fee range
SELECT first_name, consultation_fee
FROM clients
WHERE consultation_fee BETWEEN 5500 AND 7000;

-- 5. Search clients whose first name starts with A
SELECT first_name
FROM clients
WHERE first_name LIKE 'A%';

-- 6. Highest consultation fees
SELECT first_name, consultation_fee
FROM clients
ORDER BY consultation_fee DESC
LIMIT 5;

-- 7. Aggregate summary
SELECT
    COUNT(*) AS total_clients,
    SUM(consultation_fee) AS total_consultation_fee,
    AVG(consultation_fee) AS avg_consultation_fee,
    MIN(consultation_fee) AS min_consultation_fee,
    MAX(consultation_fee) AS max_consultation_fee
FROM clients;

-- 8. Clients per consultant
SELECT consultant_id, COUNT(*) AS total_clients
FROM clients
GROUP BY consultant_id;

-- 9. Consultants handling more than 2 clients
SELECT consultant_id, COUNT(*) AS total_clients
FROM clients
GROUP BY consultant_id
HAVING COUNT(*) > 2;

-- 10. INNER JOIN: client + consultant
SELECT
    c.first_name AS client_name,
    con.first_name AS consultant_name,
    con.specialization
FROM clients AS c
INNER JOIN consultants AS con
ON c.consultant_id = con.consultant_id;

-- 11. LEFT JOIN: show all clients and any visa application
SELECT
    c.client_id,
    c.first_name,
    v.application_status
FROM clients AS c
LEFT JOIN visa_applications AS v
ON c.client_id = v.client_id;

-- 12. RIGHT JOIN example
SELECT
    c.first_name AS client_name,
    con.first_name AS consultant_name
FROM clients AS c
RIGHT JOIN consultants AS con
ON c.consultant_id = con.consultant_id;

-- 13. UNION: unique names from clients and consultants
SELECT first_name FROM clients
UNION
SELECT first_name FROM consultants;

-- 14. UNION ALL: keep duplicates
SELECT first_name FROM clients
UNION ALL
SELECT first_name FROM consultants;

-- 15. String function: full name
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM clients;

-- 16. String cleaning
SELECT
    email,
    LOWER(TRIM(email)) AS clean_email
FROM clients;

-- 17. Extract email domain
SELECT
    email,
    SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM clients;

-- 18. Date parts
SELECT
    first_name,
    date_of_birth,
    YEAR(date_of_birth) AS birth_year,
    MONTHNAME(date_of_birth) AS birth_month
FROM clients;

-- 19. Age
SELECT
    first_name,
    date_of_birth,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM clients;

-- 20. Application processing time
SELECT
    application_id,
    application_date,
    decision_date,
    DATEDIFF(decision_date, application_date) AS processing_days
FROM visa_applications
WHERE decision_date IS NOT NULL;

-- 21. Applications by quarter
SELECT
    QUARTER(application_date) AS quarter_no,
    COUNT(*) AS total_applications
FROM visa_applications
GROUP BY QUARTER(application_date)
ORDER BY quarter_no;

-- 22. CASE: fee category
SELECT
    first_name,
    consultation_fee,
    CASE
        WHEN consultation_fee >= 6500 THEN 'High'
        WHEN consultation_fee >= 5500 THEN 'Medium'
        ELSE 'Low'
    END AS fee_category
FROM clients;

-- 23. Conditional aggregation
SELECT
    SUM(CASE WHEN target_country = 'Canada' THEN 1 ELSE 0 END) AS canada_clients,
    SUM(CASE WHEN target_country = 'Germany' THEN 1 ELSE 0 END) AS germany_clients,
    SUM(CASE WHEN target_country = 'UK' THEN 1 ELSE 0 END) AS uk_clients
FROM clients;

-- 24. Subquery: above-average consultation fee
SELECT first_name, consultation_fee
FROM clients
WHERE consultation_fee >
(
    SELECT AVG(consultation_fee)
    FROM clients
);

-- 25. Subquery: clients handled by Germany/Canada specialists
SELECT first_name, target_country
FROM clients
WHERE consultant_id IN
(
    SELECT consultant_id
    FROM consultants
    WHERE specialization IN ('Germany', 'Canada')
);

-- 26. EXISTS: consultants who have at least one client
SELECT con.first_name, con.specialization
FROM consultants AS con
WHERE EXISTS
(
    SELECT 1
    FROM clients AS c
    WHERE c.consultant_id = con.consultant_id
);

-- 27. NOT EXISTS: clients without applications
SELECT c.first_name
FROM clients AS c
WHERE NOT EXISTS
(
    SELECT 1
    FROM visa_applications AS v
    WHERE v.client_id = c.client_id
);

-- 28. CTE: consultant-wise average fee
WITH consultant_average AS
(
    SELECT
        consultant_id,
        AVG(consultation_fee) AS avg_fee
    FROM clients
    GROUP BY consultant_id
)
SELECT *
FROM consultant_average
WHERE avg_fee > 5500;

-- 29. Multiple CTEs
WITH consultant_average AS
(
    SELECT
        consultant_id,
        AVG(consultation_fee) AS avg_fee
    FROM clients
    GROUP BY consultant_id
),
consultant_details AS
(
    SELECT consultant_id, first_name, specialization
    FROM consultants
)
SELECT
    consultant_details.first_name,
    consultant_details.specialization,
    consultant_average.avg_fee
FROM consultant_details
INNER JOIN consultant_average
ON consultant_details.consultant_id = consultant_average.consultant_id;

-- 30. Introductory Window Function:
-- Keep each client row while showing consultant-group average
SELECT
    first_name,
    consultation_fee,
    AVG(consultation_fee) OVER() AS overall_avg_fee
FROM clients;
-- 31. Window Function with PARTITION BY:
-- Show each client and number of clients targeting the same country
SELECT
    first_name,
    target_country,
    COUNT(*) OVER(
        PARTITION BY target_country
    ) AS clients_in_same_country
FROM clients;
