-- Create a Linkedin database

-- Users table
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `password` VARCHAR(128) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

-- Schools and universities table
CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`)
);

-- Companies table
CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

-- Connections table
CREATE TABLE `connections` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `person_id` INT,
    `school_id` INT,
    `start_date_s` DATE,
    `end_date_s` DATE,
    `degree_type` ENUM('BA', 'MA', 'PhD'),
    `company_id` INT,
    `start_date_c` DATE,
    `end_date_c` DATE,
    `company_title` VARCHAR(64),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`person_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);


