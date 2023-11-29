-- Find AVG player salary per year
-- Sort by year
-- Return year, salary
SELECT "year", ROUND(AVG("salary"), 2) AS "average salary" FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;
