/*
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
*/

SELECT DISTINCT c.company_code, founder, total_leads, total_senior, total_manager, total_employee
FROM Company c
JOIN (
    SELECT COUNT(DISTINCT lead_manager_code) AS total_leads, company_code
    FROM Lead_Manager
    GROUP BY company_code
) l
ON c.company_code = l.company_code
JOIN (
    SELECT COUNT(DISTINCT senior_manager_code) AS total_senior, company_code
    FROM Senior_Manager
    GROUP BY company_code
) s
ON c.company_code = s.company_code
JOIN (
    SELECT COUNT(DISTINCT manager_code) AS total_manager, company_code
    FROM Manager
    GROUP BY company_code
) m
ON c.company_code = m.company_code
JOIN (
    SELECT COUNT(DISTINCT employee_code) AS total_employee, company_code
    FROM Employee
    GROUP BY company_code
) e
ON c.company_code = e.company_code
ORDER BY company_code;