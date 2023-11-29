-- Frame emily33 by inserting a record to the database which shows that the new password is same to hers
INSERT INTO "user_logs"("type", "old_username", "new_username", "old_password", "new_password")
VALUES(
'update',
'admin',
'admin',
(SELECT "password"
FROM "users"
WHERE "username" = 'admin'),
(SELECT "password"
FROM "users"
WHERE "username" = 'emily33')
);


-- ALTER password of admin to "oops!" hashed by MD5
UPDATE "users"
SET "password" = ('982c0381c279d139fd221fce974916e7')
WHERE "username" = 'admin';

-- Erase any logs of the above password change from the database
DELETE FROM "user_logs"
WHERE "type" = 'update'
AND "old_username" = 'admin'
AND "new_username" = 'admin'
AND "new_password" = '982c0381c279d139fd221fce974916e7';


