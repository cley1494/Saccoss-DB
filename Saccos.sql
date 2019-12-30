CREATE TABLE `personal_info` (
  `personnel_id` int PRIMARY KEY,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255),
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date,
  `gender` int,
  `pob` int,
  `nationality` int,
  `phone_number` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `employee` (
  `employee_id` int PRIMARY KEY,
  `personnel_id` int,
  `pf_number` varchar(255) NOT NULL,
  `employment_date` date NOT NULL,
  `confirmation_date` date NOT NULL,
  `retiring_date` date NOT NULL,
  `center` int,
  `designation` int
);

CREATE TABLE `education` (
  `education_id` int PRIMARY KEY,
  `personnel_id` int,
  `education_level` int,
  `education_descriprion` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL
);

CREATE TABLE `salary` (
  `salary_id` int PRIMARY KEY,
  `personnel_id` int,
  `check_number` varchar(255) UNIQUE NOT NULL,
  `vote` int NOT NULL,
  `subvote` int NOT NULL,
  `salary_amount` varchar(255) NOT NULL,
  `bank` varchar(255),
  `account_number` varchar(255) NOT NULL
);

CREATE TABLE `next_kin` (
  `kin_id` int PRIMARY KEY,
  `personnel_id` int,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255),
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255),
  `relationship` int
);

CREATE TABLE `membership` (
  `membership_id` int PRIMARY KEY,
  `personnel_id` int,
  `application_date` date NOT NULL,
  `confirmation_date` date NOT NULL,
  `status` int,
  `approved_by` int,
  `designation` int
);

CREATE TABLE `users` (
  `user_id` int PRIMARY KEY,
  `personnel_id` int,
  `username` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `gender` (
  `gender_id` int PRIMARY KEY,
  `gender_name` varchar(255) NOT NULL,
  `gender_abbreviation` varchar(255) NOT NULL
);

CREATE TABLE `places` (
  `place_id` int PRIMARY KEY,
  `place_name` varchar(255) NOT NULL
);

CREATE TABLE `nationality` (
  `nationality_id` int PRIMARY KEY,
  `nationality_name` varchar(255) NOT NULL
);

CREATE TABLE `center` (
  `center_id` int PRIMARY KEY,
  `center_name` varchar(255) NOT NULL
);

CREATE TABLE `employee_designation` (
  `designation_id` int PRIMARY KEY,
  `designation_name` varchar(255) NOT NULL
);

CREATE TABLE `education_level` (
  `education_id` int PRIMARY KEY,
  `education_name` varchar(255) NOT NULL
);

CREATE TABLE `bank` (
  `bank_id` int PRIMARY KEY,
  `bank_name` varchar(255) NOT NULL
);

CREATE TABLE `relationship` (
  `relationship_id` int PRIMARY KEY,
  `relationship_name` varchar(255) NOT NULL
);

CREATE TABLE `membership_status` (
  `status_id` int PRIMARY KEY,
  `status_name` varchar(255) NOT NULL
);

CREATE TABLE `membership_designation` (
  `designation_id` int PRIMARY KEY,
  `designation_name` varchar(255) NOT NULL
);

CREATE TABLE `contribution` (
  `contribution_id` int PRIMARY KEY,
  `personnel_id` int,
  `amount` int NOT NULL,
  `contribution_date` date NOT NULL
);

CREATE TABLE `loan` (
  `loan_id` int PRIMARY KEY,
  `personnel_id` int,
  `application_date` date NOT NULL,
  `amount` int NOT NULL,
  `payment_period` int NOT NULL,
  `rate` int NOT NULL,
  `amount_per_month` int NOT NULL,
  `status` int
);

CREATE TABLE `surety` (
  `surety_id` int PRIMARY KEY,
  `surety` int,
  `loan_id` int,
  `decision` int,
  `decision_date` date NOT NULL
);

CREATE TABLE `loan_approval` (
  `approval_id` int PRIMARY KEY,
  `loan_id` int,
  `approved_by` int,
  `approval_date` date NOT NULL
);

CREATE TABLE `loan_payment_log` (
  `payment_log_id` int PRIMARY KEY,
  `loan_id` int,
  `payment_date` date NOT NULL
);

CREATE TABLE `loan_status` (
  `status_id` int PRIMARY KEY,
  `status_name` varchar(255) NOT NULL
);

CREATE TABLE `surety_decision` (
  `decision_id` int PRIMARY KEY,
  `decision_name` varchar(255) NOT NULL
);

ALTER TABLE `personal_info` ADD FOREIGN KEY (`gender`) REFERENCES `gender` (`gender_id`);

ALTER TABLE `personal_info` ADD FOREIGN KEY (`pob`) REFERENCES `places` (`place_id`);

ALTER TABLE `personal_info` ADD FOREIGN KEY (`nationality`) REFERENCES `nationality` (`nationality_id`);

ALTER TABLE `employee` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `employee` ADD FOREIGN KEY (`center`) REFERENCES `center` (`center_id`);

ALTER TABLE `employee` ADD FOREIGN KEY (`designation`) REFERENCES `employee_designation` (`designation_id`);

ALTER TABLE `education` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `education` ADD FOREIGN KEY (`education_level`) REFERENCES `education_level` (`education_id`);

ALTER TABLE `salary` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `salary` ADD FOREIGN KEY (`bank`) REFERENCES `bank` (`bank_id`);

ALTER TABLE `next_kin` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `next_kin` ADD FOREIGN KEY (`relationship`) REFERENCES `relationship` (`relationship_id`);

ALTER TABLE `membership` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `membership` ADD FOREIGN KEY (`status`) REFERENCES `membership_status` (`status_id`);

ALTER TABLE `membership` ADD FOREIGN KEY (`approved_by`) REFERENCES `membership` (`membership_id`);

ALTER TABLE `membership` ADD FOREIGN KEY (`designation`) REFERENCES `membership_designation` (`designation_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `contribution` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `loan` ADD FOREIGN KEY (`personnel_id`) REFERENCES `personal_info` (`personnel_id`);

ALTER TABLE `loan` ADD FOREIGN KEY (`status`) REFERENCES `loan_status` (`status_id`);

ALTER TABLE `surety` ADD FOREIGN KEY (`surety`) REFERENCES `membership` (`membership_id`);

ALTER TABLE `surety` ADD FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`);

ALTER TABLE `surety` ADD FOREIGN KEY (`decision`) REFERENCES `surety_decision` (`decision_id`);

ALTER TABLE `loan_approval` ADD FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`);

ALTER TABLE `loan_approval` ADD FOREIGN KEY (`approved_by`) REFERENCES `membership` (`membership_id`);

ALTER TABLE `loan_payment_log` ADD FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`);
