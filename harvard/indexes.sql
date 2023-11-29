-- Create indexes to optimize harvard.db

-- OPTIMIZE THIS QUERY ----------------------------------------
EXPLAIN QUERY PLAN
SELECT "courses"."title", "courses"."semester"
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;

-- Only enrollments table is scanned, maybe we can optimize that
CREATE INDEX "student_id_index" ON "enrollments" ("student_id");
----------------------------------------------------------------

-- OPTIMIZE THIS QUERY -----------------------------------------
EXPLAIN QUERY PLAN
SELECT "id", "name"
FROM "students"
WHERE "id" IN (
    SELECT "student_id"
    FROM "enrollments"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "courses"."department" = 'Computer Science'
        AND "courses"."number" = 50
        AND "courses"."semester" = 'Fall 2023'
    )
);

-- The tables that are scanned are, courses and enrollments table
-- Enrollments table because course_id is not indexed
-- I could select to index by department, number, semester or title on courses table
-- I could make a partial index for courses taught in 2023 or 2024
CREATE INDEX "semester_index" ON "courses" ("semester");
-- And make an index for course_id
CREATE INDEX "course_id_index" ON "enrollments" ("course_id");
--------------------------------------------------------------

-- OPTIMIZE THIS QUERY -----------------------------------------
EXPLAIN QUERY PLAN
SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title", COUNT(*) AS "enrollment"
FROM "courses"
JOIN "enrollments" ON "enrollments"."course_id" = "courses"."id"
WHERE "courses"."semester" = 'Fall 2023'
GROUP BY "courses"."id"
ORDER BY "enrollment" DESC;

-- We have already indexed courses_id, only table that is scanned is the courses one
-- We have created a partial index for semesters
-----------------------------------------------------------------

-- OPTIMIZE THIS QUERY -----------------------------------------
EXPLAIN QUERY PLAN
SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title"
FROM "courses"
WHERE "courses"."department" = 'Computer Science'
AND "courses"."semester" = 'Spring 2024';
-- Only semester index is used so no scans----------------------

-- OPTIMIZE THIS QUERY -----------------------------------------
EXPLAIN QUERY PLAN
SELECT "requirements"."name"
FROM "requirements"
WHERE "requirements"."id" = (
    SELECT "requirement_id"
    FROM "satisfies"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "title" = 'Advanced Databases'
        AND "semester" = 'Fall 2023'
    )
);
-- Only table that is scanned is satisfies table, and we could index course_id
CREATE INDEX "satisfies_course_id_index" ON "satisfies" ("course_id");
-- We don't notice a significant difference in time because the search is already fast
-- So later i may delete this index
----------------------------------------------------------------

-- OPTIMIZE THIS QUERY -----------------------------------------
EXPLAIN QUERY PLAN
SELECT "requirements"."name", COUNT(*) AS "courses"
FROM "requirements"
JOIN "satisfies" ON "requirements"."id" = "satisfies"."requirement_id"
WHERE "satisfies"."course_id" IN (
    SELECT "course_id"
    FROM "enrollments"
    WHERE "enrollments"."student_id" = 8
)
GROUP BY "requirements"."name";
-- No table was scanned, so we move on -------------------------

-- OPTIMIZE THIS QUERY -----------------------------------------
EXPLAIN QUERY PLAN
SELECT "department", "number", "title"
FROM "courses"
WHERE "title" LIKE "History%"
AND "semester" = 'Fall 2023';
-- No table was scanned, so we move on --------------------------








