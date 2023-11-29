
-- *** The Lost Letter ***
-- From Anneke, 900 Somerville Avenue (Residential)
-- To Varsha, 2 Finnegan Street (Residential)
-- Step 1: Find the ID and type of Anneke's address
SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue';
-- Ok, the id is 432
-- Step 2: Find the ID of the package delivered by 900 Somerville Avenue and has a Congratulatory Letter / package_id = 384
SELECT "id" FROM "addresses" WHERE "address" = '2 Finnigan Street';
-- Also Find the id of 2 Finnegan Street address / id = 854
-- So we read that the package id is 384 and the to_address_id is 854,which is the id of the address it was sent
-- Step 3: Scan the package delivery and find out if it was delivered and when, in the right address
-- Step 4: Confirm that the delivery is dropped in the right location
SELECT "address", "type" FROM "addresses"
WHERE "id" = (SELECT "address_id" FROM "scans"
WHERE "package_id" = (SELECT "id" FROM "packages"
WHERE "from_address_id" = (SELECT "id" FROM "addresses"
WHERE "address" = '900 Somerville Avenue')) AND "action" = 'Drop');

-- *** The Devious Delivery ***
-- Step 1: Search in the packages table for a package in which the from_address_id IS NULL
SELECT "id", "contents" "to_address_id" FROM "packages" WHERE "from_address_id" IS NULL;
-- OK, we found only one package with id = 5098, contents = 'Duck Debugger', to_address_id = 50 so that must be it
-- Step 2: Search the scans table to find out where the package was dropped
SELECT "address_id", "action", "timestamp" FROM "scans" WHERE "package_id" = 5098;
-- Ok, it was dropped on the address_id = 348
-- Step 3: Find out via the addresses table the type of the address it was dropped
SELECT "type" FROM "addresses"
WHERE "id" = (SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL) AND "action" = 'Drop');
-- Ok, it was dropped on a police station


-- *** The Forgotten Gift ***
-- A grandpa sends a gift to 728 Maple Place.It was not delivered to her. His address is 109 Tileston Street
-- Step 1: Find the id from 728 Maple Place
SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place';
-- It's 4983
-- Step 2: Find the id from 109 Tileston Street
SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street';
-- It's 9873
-- Step 3: Find the package_id and the contents of the package the grandpa sent to his granddaughter
SELECT "id", "contents" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street') AND "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place');
-- The package id is 9523 and the contents are Flowers
-- Step 4: Find via the scans table where the package was dropped
SELECT "driver_id", "address_id", "action", "timestamp" FROM "scans" WHERE "package_id" = 9523;
-- Ok, the package was dropped on a wrong address and a driver with the id of 17 picked it up again
-- Step 5: We have to find which driver has our package
SELECT "name" FROM "drivers" WHERE "id" = 17;
-- Ok, a driver named Mikel has the package

