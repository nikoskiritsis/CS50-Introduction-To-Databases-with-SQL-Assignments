SELECT "name", "needs_improvement"
FROM "districts"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
ORDER BY "needs_improvement" DESC;
