CREATE TABLE `users` (
	`user_id` int NOT NULL AUTO_INCREMENT,
	`ucid` varchar(35) NOT NULL UNIQUE,
	`pass` varchar(25) NOT NULL,
	`email` varchar(70) NOT NULL UNIQUE,
	`f_name` varchar(35) NOT NULL,
	`l_name` varchar(35) NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT NOW(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY (`id`)
);

CREATE TABLE `locations` (
	`loc_id` int NOT NULL AUTO_INCREMENT,
	`building` varchar(75) NOT NULL UNIQUE,
	`room` varchar(25) NOT NULL UNIQUE,
	PRIMARY KEY (`loc_id`)
);

CREATE TABLE `report` (
	`report_id` int NOT NULL AUTO_INCREMENT,
	`client_ucid` varchar(25) NOT NULL,
	`loc_building` varchar(75) NOT NULL,
	`reporter_ucid` int NOT NULL,
	`loc_room` varchar(25) NOT NULL,
	`description` varchar(255) NOT NULL,
	`issue_type` varchar(50) NOT NULL,
	`init_time` TIMESTAMP NOT NULL DEFAULT NOW(),
	`tech_ucid` varchar(35),
	`tech_comment` varchar(255),
	`dispatch_time` DATETIME,
	`status` varchar(25),
	`resolve_time` DATETIME ,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	`updated_by` varchar(35) NOT NULL,
	PRIMARY KEY (`report_id`)
);

CREATE TABLE `clients` (
	`client_id` int NOT NULL AUTO_INCREMENT,
	`ucid` varchar(25) UNIQUE,
	`email` varchar(70) NOT NULL UNIQUE,
	`f_name` varchar(25),
	`l_name` varchar(25),
	`phone` varchar(10), 
	`dept` varchar(25) NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT NOW(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY (`client_id`)
);


ALTER TABLE `report` ADD CONSTRAINT `report_fk0` FOREIGN KEY (`client_ucid`) REFERENCES `clients`(`ucid`);

ALTER TABLE `report` ADD CONSTRAINT `report_fk1` FOREIGN KEY (`reporter_ucid`) REFERENCES `users`(`ucid`);

ALTER TABLE `report` ADD CONSTRAINT `report_fk2` FOREIGN KEY (`tech_ucid`) REFERENCES `users`(`ucid`);

ALTER TABLE `report` ADD CONSTRAINT `report_fk3` FOREIGN KEY (`updated_by`) REFERENCES `users`(`ucid`);

