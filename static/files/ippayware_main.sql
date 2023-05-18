-- Adminer 4.8.1 MySQL 5.5.5-10.3.38-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `api_error_logs`;
CREATE TABLE `api_error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `get_param` varchar(1024) NOT NULL,
  `post_param` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `bbi_incoming`;
CREATE TABLE `bbi_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `account_number` varchar(16) NOT NULL,
  `account_name` varchar(128) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `post_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `bbi_transactions`;
CREATE TABLE `bbi_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_time` datetime NOT NULL,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `account_name` varchar(128) NOT NULL,
  `account_number` varchar(16) NOT NULL,
  `card_type` varchar(16) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `trans_all_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ebtf_customer`;
CREATE TABLE `ebtf_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` varchar(32) NOT NULL,
  `contact_name` varchar(64) NOT NULL,
  `company_name` varchar(64) NOT NULL,
  `contact_type` varchar(16) NOT NULL,
  `status` varchar(16) NOT NULL,
  `payment_terms` int(11) NOT NULL,
  `payment_terms_label` varchar(32) NOT NULL,
  `currency_id` varchar(32) NOT NULL,
  `currency_code` varchar(8) NOT NULL,
  `outstanding_receivable_amount` decimal(8,2) NOT NULL,
  `unused_credits_receivable_amount` decimal(8,2) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `mobile` varchar(64) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `emv_machines`;
CREATE TABLE `emv_machines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(64) NOT NULL,
  `gateway` varchar(10) NOT NULL,
  `key1` varchar(128) NOT NULL,
  `key2` varchar(128) NOT NULL,
  `key3` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `emv_portals`;
CREATE TABLE `emv_portals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `uniq` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq` (`uniq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `emv_terminals`;
CREATE TABLE `emv_terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway` varchar(16) NOT NULL,
  `key1` varchar(128) NOT NULL,
  `key2` varchar(128) NOT NULL,
  `key3` varchar(128) NOT NULL,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `emv_users`;
CREATE TABLE `emv_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ep_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `portal_id` varchar(32) NOT NULL,
  `uniq` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq` (`uniq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `esign_gp_templates`;
CREATE TABLE `esign_gp_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(32) NOT NULL,
  `label` varchar(32) NOT NULL,
  `file_name` varchar(32) NOT NULL,
  `ratio` decimal(8,2) NOT NULL DEFAULT 1.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `esign_gp_variables`;
CREATE TABLE `esign_gp_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` varchar(32) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `font_size` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `location_x` decimal(8,2) NOT NULL,
  `location_y` decimal(8,2) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `check_type` varchar(2) DEFAULT NULL,
  `check_group` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `etanew_integrations`;
CREATE TABLE `etanew_integrations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BALAMT` varchar(8) NOT NULL COMMENT 'Balance Amount',
  `AAPP` enum('C','U','B') NOT NULL COMMENT 'Application Code - Mu Court, Utility Billing, Business License',
  `ACETA` varchar(3) NOT NULL COMMENT 'ETA Customer Code',
  `AORI` varchar(10) NOT NULL COMMENT 'Court ORI Number',
  `ACIF` varchar(7) NOT NULL COMMENT 'CIF Number',
  `ACASE` varchar(10) NOT NULL COMMENT 'Case Number',
  `AUTC` varchar(8) NOT NULL COMMENT 'Ticket Number',
  `ALNAME` varchar(18) NOT NULL COMMENT 'Last Name',
  `AFNAME` varchar(15) NOT NULL COMMENT 'First Name',
  `AMNAME` varchar(15) NOT NULL COMMENT 'Middle Name',
  `ABDATE` varchar(8) NOT NULL COMMENT 'Date of Birth',
  `AODATE` varchar(8) NOT NULL COMMENT 'Offense Date',
  `ACDATE` varchar(8) NOT NULL COMMENT 'Court Date',
  `ADESC` varchar(25) NOT NULL COMMENT 'Offense Description',
  `ARAMT` varchar(8) NOT NULL COMMENT 'Restitution Amount',
  `AFAMT` varchar(8) NOT NULL COMMENT 'Fine Amount',
  `ACAMT` varchar(8) NOT NULL COMMENT 'Court Cost Amount',
  `ALAMT` varchar(8) NOT NULL COMMENT 'Total Amount',
  `AADDR1` varchar(35) NOT NULL COMMENT 'Address-1',
  `AADDR2` varchar(35) NOT NULL COMMENT 'Address-2',
  `AADDR3` varchar(35) NOT NULL COMMENT 'Address-3',
  `ADRLIC` varchar(20) NOT NULL COMMENT 'Drivers License Number',
  `ADLST` varchar(2) NOT NULL COMMENT 'Drivers License State',
  `APART` varchar(1) NOT NULL COMMENT 'Allow Partial Payment',
  `AWEB` varchar(1) NOT NULL COMMENT 'Publish To WEB',
  `AEMAIL` varchar(1) NOT NULL COMMENT 'Email Address',
  `ASMS` varchar(1) NOT NULL COMMENT 'Cell Number',
  `AUETA` varchar(3) NOT NULL COMMENT 'ETA Customer Code',
  `AUACC` varchar(9) NOT NULL COMMENT 'Utility Account Number',
  `AUAMT` varchar(8) NOT NULL COMMENT 'Utility Amount',
  `AUNAME` varchar(18) NOT NULL COMMENT 'Last Name',
  `AUADD1` varchar(35) NOT NULL COMMENT 'Address-1',
  `AUADD2` varchar(35) NOT NULL COMMENT 'Address-2',
  `AUADD3` varchar(35) NOT NULL COMMENT 'Address-3',
  `ABETA` varchar(3) NOT NULL COMMENT 'ETA Customer Code',
  `ABACC` varchar(9) NOT NULL COMMENT 'License Account Number',
  `ABAMT` varchar(8) NOT NULL COMMENT 'License Amount',
  `ABNAME` varchar(35) NOT NULL COMMENT 'Business Name',
  `ABADD1` varchar(35) NOT NULL COMMENT 'Address-1',
  `ABADD2` varchar(35) NOT NULL COMMENT 'Address-2',
  `ABADD3` varchar(35) NOT NULL COMMENT 'Address-3',
  `ASCHE1` varchar(6) NOT NULL COMMENT 'Schedule 01',
  `ADESC1` varchar(35) NOT NULL COMMENT 'Description 01',
  `ASCHE2` varchar(6) NOT NULL COMMENT 'Schedule 02',
  `ADESC2` varchar(35) NOT NULL COMMENT 'Description 02',
  `ASCHE3` varchar(6) NOT NULL COMMENT 'Schedule 03',
  `ADESC3` varchar(35) NOT NULL COMMENT 'Description 03',
  `ASCHE4` varchar(6) NOT NULL COMMENT 'Schedule 04',
  `ADESC4` varchar(35) NOT NULL COMMENT 'Description 04',
  `ASCHE5` varchar(6) NOT NULL COMMENT 'Schedule 05',
  `ADESC5` varchar(35) NOT NULL COMMENT 'Description 05',
  `ASCHE6` varchar(6) NOT NULL COMMENT 'Schedule 06',
  `ADESC6` varchar(35) NOT NULL COMMENT 'Description 06',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `etanew_post_log`;
CREATE TABLE `etanew_post_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `url` varchar(512) NOT NULL,
  `request` varchar(1024) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `response` varchar(2048) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `gp_apis`;
CREATE TABLE `gp_apis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(128) NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `api_secret` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `allow_manual` tinyint(1) NOT NULL DEFAULT 0,
  `allow_swipe` tinyint(1) NOT NULL DEFAULT 0,
  `allow_emv` tinyint(1) NOT NULL DEFAULT 0,
  `emv_id` int(11) NOT NULL DEFAULT 0,
  `user_emvs` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_api_logs`;
CREATE TABLE `gp_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` varchar(128) NOT NULL,
  `post_time` datetime NOT NULL,
  `get_param` text NOT NULL,
  `post_param` text NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_auto_pay_customers`;
CREATE TABLE `gp_auto_pay_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_data` varchar(1024) NOT NULL,
  `interval_type` enum('Weekly','Monthly','Yearly','Daily','Bi-Annually') NOT NULL,
  `week_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `day_number` int(2) NOT NULL,
  `month` int(2) NOT NULL,
  `day_type` enum('Day','First','Second','Third','Fourth','Last') NOT NULL,
  `day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Day','Weekday','Weekend') NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `num_left` int(3) NOT NULL,
  `register_date` datetime NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `next_date` date NOT NULL,
  `active` tinyint(1) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `card_token` varchar(1024) NOT NULL,
  `card_type` varchar(16) NOT NULL,
  `card_last4` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_auto_pay_logs`;
CREATE TABLE `gp_auto_pay_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `portal_id` varchar(32) NOT NULL,
  `paid_date` datetime NOT NULL,
  `status` varchar(32) NOT NULL,
  `details` varchar(128) DEFAULT NULL,
  `card` varchar(32) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_auto_pay_wrs_cards`;
CREATE TABLE `gp_auto_pay_wrs_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `city_card_id` int(11) NOT NULL,
  `fee_card_id` int(11) NOT NULL,
  `inserted_dt` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_primary` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_auto_pay_wrs_customers`;
CREATE TABLE `gp_auto_pay_wrs_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `enable_autopay` tinyint(1) NOT NULL DEFAULT 1,
  `enable_email_notify` tinyint(1) NOT NULL DEFAULT 1,
  `enable_text_notify` tinyint(1) NOT NULL DEFAULT 1,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wp_user_id` (`wp_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_chip_logs`;
CREATE TABLE `gp_chip_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `expiration` datetime NOT NULL,
  `post_time` datetime NOT NULL,
  `request_key` varchar(64) NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `api_pin` varchar(4) NOT NULL,
  `api_hash` varchar(256) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `response` text NOT NULL,
  `status` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_chip_logs_dump`;
CREATE TABLE `gp_chip_logs_dump` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chip_id` int(11) NOT NULL,
  `log_dt` datetime NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_customers`;
CREATE TABLE `gp_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(32) NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `api_secret` varchar(32) NOT NULL,
  `customer_id` varchar(32) NOT NULL,
  `customer_key` varchar(32) NOT NULL,
  `gateway` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_customer_methods`;
CREATE TABLE `gp_customer_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `card_key` varchar(32) NOT NULL,
  `method_key` varchar(32) NOT NULL,
  `card_type` varchar(16) NOT NULL,
  `card_last4` varchar(4) NOT NULL,
  `pay_type` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_documents`;
CREATE TABLE `gp_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(120) NOT NULL,
  `scope` text DEFAULT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


DROP TABLE IF EXISTS `gp_documents_all`;
CREATE TABLE `gp_documents_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(8) NOT NULL,
  `portal_name` varchar(64) NOT NULL,
  `form_id` int(11) NOT NULL,
  `form_name` varchar(64) NOT NULL,
  `pay_amount` decimal(8,2) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `document_data` text NOT NULL,
  `user` varchar(64) NOT NULL,
  `file_path` varchar(512) NOT NULL,
  `file_url` varchar(512) NOT NULL,
  `created_dt` datetime NOT NULL,
  `result` varchar(16) NOT NULL,
  `response` text NOT NULL,
  `acknowledged` tinyint(4) NOT NULL,
  `acknowledged_dt` datetime NOT NULL,
  `acknowledged_by` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_document_insta`;
CREATE TABLE `gp_document_insta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `form_name` varchar(64) NOT NULL,
  `form_data` tinytext NOT NULL,
  `code` varchar(10) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_emails`;
CREATE TABLE `gp_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL DEFAULT current_timestamp(),
  `source` varchar(32) NOT NULL,
  `source_id` varchar(32) NOT NULL,
  `source_data` varchar(2048) NOT NULL,
  `email` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_emvs`;
CREATE TABLE `gp_emvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_ids` varchar(128) NOT NULL,
  `device_key` varchar(64) NOT NULL,
  `device_serial` varchar(32) NOT NULL,
  `device_label` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_emv_logs`;
CREATE TABLE `gp_emv_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `emv_id` int(11) NOT NULL,
  `post_time` datetime NOT NULL,
  `request_key` varchar(64) NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_eswear_all`;
CREATE TABLE `gp_eswear_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `officer_name` varchar(64) NOT NULL,
  `officer_id` varchar(16) NOT NULL,
  `entry_dt` date NOT NULL,
  `defendant_name` varchar(64) NOT NULL,
  `case_number` varchar(16) NOT NULL,
  `ticket_number` varchar(16) NOT NULL,
  `court_date` date NOT NULL,
  `description` varchar(128) NOT NULL,
  `submit_dt` datetime NOT NULL,
  `submit_ip` varchar(32) NOT NULL,
  `file_path` varchar(128) NOT NULL,
  `status` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_gateway_autopay_accounts`;
CREATE TABLE `gp_gateway_autopay_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway` varchar(16) NOT NULL,
  `merchant_key` varchar(64) NOT NULL,
  `customer_id` varchar(64) NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_gateway_autopay_card_tokens`;
CREATE TABLE `gp_gateway_autopay_card_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(64) NOT NULL,
  `card_id` varchar(64) NOT NULL,
  `card_last4` varchar(4) NOT NULL,
  `card_type` varchar(32) NOT NULL,
  `card_token` varchar(32) NOT NULL,
  `created_dt` datetime NOT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_gateway_autopay_logs`;
CREATE TABLE `gp_gateway_autopay_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_dt` datetime NOT NULL,
  `action` varchar(255) NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_instabill`;
CREATE TABLE `gp_instabill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `create_time` datetime NOT NULL,
  `code` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_autos_incoming`;
CREATE TABLE `gp_int_autos_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `database_id` varchar(8) NOT NULL,
  `dealer_no` varchar(16) NOT NULL,
  `sale_no` varchar(8) NOT NULL,
  `account_token` varchar(64) NOT NULL,
  `cust_account_no` varchar(16) NOT NULL,
  `sale_date` date DEFAULT NULL,
  `last_name` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `cell_phone` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `autos_year` int(4) NOT NULL,
  `autos_make` varchar(64) NOT NULL,
  `autos_model` varchar(64) NOT NULL,
  `autos_trim` varchar(64) NOT NULL,
  `autos_vin` varchar(64) NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `charge_back` decimal(10,2) NOT NULL,
  `pickup_due` decimal(10,2) NOT NULL,
  `sidenote_balance` decimal(10,2) NOT NULL,
  `sidenote_next_payment_due_date` date DEFAULT NULL,
  `sidenote_due` decimal(10,2) NOT NULL,
  `fee_amount` decimal(10,2) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `portal_id` varchar(8) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `next_payment_due_date` date DEFAULT NULL,
  `last_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `inserted_time` datetime NOT NULL,
  `uploaded_time` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `reminded` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_autos_post_logs`;
CREATE TABLE `gp_int_autos_post_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `post_data` varchar(1024) NOT NULL,
  `response` varchar(1024) NOT NULL,
  `response_code` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_autos_reminder_all`;
CREATE TABLE `gp_int_autos_reminder_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `account_number` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `reminder_link` varchar(256) NOT NULL,
  `reminder_text` varchar(512) NOT NULL,
  `reminder_date` date NOT NULL,
  `email_result` varchar(128) NOT NULL,
  `phone_result` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_id` (`portal_id`),
  KEY `reminder_date` (`reminder_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_autos_reminder_logs`;
CREATE TABLE `gp_int_autos_reminder_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` datetime NOT NULL,
  `email` varchar(128) NOT NULL,
  `reminder_link` varchar(512) NOT NULL,
  `error` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_uop_incoming`;
CREATE TABLE `gp_int_uop_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(8) NOT NULL,
  `account_name` varchar(64) NOT NULL,
  `account_number` varchar(16) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `due_date` date NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_id_account_number` (`portal_id`,`account_number`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_uop_post_logs`;
CREATE TABLE `gp_int_uop_post_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `post_data` text NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_upload_records`;
CREATE TABLE `gp_int_upload_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `upload_dt` datetime NOT NULL,
  `upload_by` varchar(32) NOT NULL,
  `upload_file` varchar(64) NOT NULL,
  `upload_result` varchar(128) NOT NULL,
  `upload_success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_int_wyq_incoming`;
CREATE TABLE `gp_int_wyq_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `party` varchar(128) NOT NULL,
  `receipt_number` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `case_number` varchar(64) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `inserted_dt` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_lgs_incoming`;
CREATE TABLE `gp_lgs_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_number` varchar(16) NOT NULL,
  `ticket_number` varchar(16) NOT NULL,
  `violator_name` varchar(32) NOT NULL,
  `dob` date NOT NULL,
  `issue_date` date NOT NULL,
  `court_date` date NOT NULL,
  `offense_code` int(11) NOT NULL,
  `offense_description` varchar(128) NOT NULL,
  `appearance_code` tinyint(1) NOT NULL,
  `total_fine` decimal(8,2) NOT NULL,
  `address` varchar(64) NOT NULL,
  `city` varchar(32) NOT NULL,
  `state` varchar(16) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `gcic_code` varchar(8) NOT NULL,
  `partial_payment` tinyint(1) NOT NULL,
  `must_appear` tinyint(1) NOT NULL,
  `portal_id` varchar(8) NOT NULL,
  `inserted_dt` datetime NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_lgs_transactions`;
CREATE TABLE `gp_lgs_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_dt` datetime NOT NULL,
  `portal_id` varchar(8) NOT NULL,
  `violator_name` varchar(32) NOT NULL,
  `case_number` varchar(16) NOT NULL,
  `ticket_number` varchar(16) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `auth_code` varchar(8) NOT NULL,
  `trans_all_id` int(11) NOT NULL,
  `status` varchar(16) NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_lobby_data`;
CREATE TABLE `gp_lobby_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `lobby_form_id` int(11) NOT NULL,
  `custom1` varchar(64) NOT NULL,
  `custom2` varchar(64) NOT NULL,
  `custom3` varchar(64) NOT NULL,
  `custom4` varchar(64) NOT NULL,
  `custom5` varchar(64) NOT NULL,
  `custom6` varchar(64) NOT NULL,
  `custom7` varchar(64) NOT NULL,
  `custom8` varchar(64) NOT NULL,
  `check_time` datetime NOT NULL,
  `attend_time` datetime NOT NULL,
  `close_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_lobby_forms`;
CREATE TABLE `gp_lobby_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `form_name` varchar(64) NOT NULL,
  `custom1` varchar(512) NOT NULL,
  `custom2` varchar(512) NOT NULL,
  `custom3` varchar(512) NOT NULL,
  `custom4` varchar(512) NOT NULL,
  `custom5` varchar(512) NOT NULL,
  `custom6` varchar(512) NOT NULL,
  `custom7` varchar(512) NOT NULL,
  `custom8` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_mx_ach_fee_accounts`;
CREATE TABLE `gp_mx_ach_fee_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_name` varchar(64) NOT NULL,
  `merchant_id` varchar(16) NOT NULL,
  `merchant_key` varchar(32) NOT NULL,
  `merchant_secret` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_options`;
CREATE TABLE `gp_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(64) NOT NULL,
  `option_key` varchar(128) NOT NULL,
  `option_value` text NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_pax_trans`;
CREATE TABLE `gp_pax_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(16) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` varchar(16) NOT NULL,
  `pax_ref` varchar(16) NOT NULL,
  `pax_label` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_phones`;
CREATE TABLE `gp_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL DEFAULT current_timestamp(),
  `source` varchar(32) NOT NULL,
  `source_id` varchar(32) NOT NULL,
  `source_data` varchar(2048) NOT NULL,
  `phone` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_recurring_standalone`;
CREATE TABLE `gp_recurring_standalone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `customer_email` varchar(128) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `custom_data` text NOT NULL,
  `city_card_id` int(11) NOT NULL,
  `fee_card_id` int(11) NOT NULL,
  `next_pay_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_report_users`;
CREATE TABLE `gp_report_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `user` varchar(32) NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_user` (`entity`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_templates`;
CREATE TABLE `gp_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `form_name` varchar(64) NOT NULL,
  `form_type` varchar(32) NOT NULL,
  `form_partner` varchar(32) NOT NULL,
  `form_need_sign` tinyint(1) NOT NULL,
  `form_fields` text NOT NULL,
  `pdf_fields` text NOT NULL,
  `file_path` varchar(1024) NOT NULL,
  `file_url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `gp_trans`;
CREATE TABLE `gp_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_id` int(11) NOT NULL,
  `kind` enum('city','fee','flat_fee') NOT NULL,
  `gateway` varchar(16) NOT NULL,
  `merchant_id` varchar(16) DEFAULT NULL,
  `merchant_key` varchar(32) NOT NULL,
  `merchant_secret` varchar(32) NOT NULL,
  `merchant_tran_key` varchar(32) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `incoming`;
CREATE TABLE `incoming` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CourtDate` varchar(100) DEFAULT NULL,
  `ts_inserted` timestamp NULL DEFAULT current_timestamp(),
  `ORI_number` varchar(100) DEFAULT NULL,
  `CaseNumber` varchar(100) DEFAULT NULL,
  `ProfileID` varchar(100) DEFAULT NULL,
  `VName` varchar(100) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `LicenseState` varchar(100) DEFAULT NULL,
  `License` varchar(100) DEFAULT NULL,
  `CitationNumber` varchar(100) DEFAULT NULL,
  `ViolationDate` varchar(100) DEFAULT NULL,
  `Amount` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IneligibleFlag` varchar(100) DEFAULT NULL,
  `DisposedFlag` varchar(100) DEFAULT NULL,
  `ts_batch` timestamp NULL DEFAULT NULL,
  `mysql_CourtDate` varchar(100) DEFAULT NULL,
  `vplookup` varchar(255) DEFAULT NULL,
  `LastSent` datetime NOT NULL,
  `sent_times` varchar(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `iplow_incoming`;
CREATE TABLE `iplow_incoming` (
  `ID` int(21) NOT NULL AUTO_INCREMENT,
  `IplowID` varchar(128) NOT NULL,
  `PortalID` varchar(32) NOT NULL,
  `SystemID` int(15) NOT NULL,
  `ProvisionDateTime` datetime NOT NULL,
  `Namekey` int(15) NOT NULL,
  `LastName` varchar(128) NOT NULL,
  `FirstName` varchar(128) NOT NULL,
  `Street` varchar(128) NOT NULL,
  `City` varchar(64) NOT NULL,
  `State` varchar(32) NOT NULL,
  `ZIP` varchar(15) NOT NULL,
  `PhoneHome` varchar(15) NOT NULL,
  `PhoneWork` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `DLStateNumber` varchar(32) NOT NULL,
  `IDStateNumber` varchar(32) NOT NULL,
  `CaseNumber` varchar(32) NOT NULL,
  `CourtCode` varchar(32) NOT NULL,
  `CourtCodeDescription` varchar(512) NOT NULL,
  `SentenceDate` date NOT NULL,
  `FilingDate` date NOT NULL,
  `DispositionDate` date NOT NULL,
  `TotalAssessmentAmount` decimal(8,2) NOT NULL,
  `TotalPaymentAmount` decimal(8,2) NOT NULL,
  `TotalBalanceDue` decimal(8,2) NOT NULL,
  `StatusInternal` varchar(32) NOT NULL,
  `StatusExternal` varchar(32) NOT NULL,
  `StatusDate` date NOT NULL,
  `OmniStatus` varchar(32) NOT NULL,
  `ScheduledInstallmentDate` date NOT NULL,
  `ScheduledInstallmentAmount` decimal(8,2) NOT NULL,
  `LastPaymentDateTimeStamp` datetime NOT NULL,
  `LastPaymentAmount` decimal(8,2) NOT NULL,
  `SystemName` varchar(32) NOT NULL,
  `LocallyScofflawed` varchar(32) NOT NULL,
  `AllowPartialPayment` enum('Y','N') NOT NULL DEFAULT 'N',
  `RecordSource` enum('API','FTP','TEST') NOT NULL DEFAULT 'API',
  `InsertedTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `iplow_logs`;
CREATE TABLE `iplow_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `request_method` varchar(32) NOT NULL,
  `post_url` varchar(1024) NOT NULL,
  `get_params` text NOT NULL,
  `post_params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `iplow_transactions`;
CREATE TABLE `iplow_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(32) NOT NULL,
  `iplowid` varchar(128) NOT NULL,
  `pay_type` enum('Sale','Void') NOT NULL,
  `paid_amount` decimal(8,2) NOT NULL,
  `paid_time` datetime NOT NULL,
  `card_number` varchar(32) NOT NULL,
  `card_type` varchar(32) NOT NULL,
  `ref_id` varchar(32) NOT NULL,
  `auth_code` varchar(32) NOT NULL,
  `trans_all_id` bigint(20) NOT NULL,
  `case_number` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_additionals`;
CREATE TABLE `ipp_additionals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isv` varchar(128) NOT NULL,
  `processor` enum('PPS','Defyne','Worldpay','Mainstream') NOT NULL,
  `dba` varchar(128) NOT NULL,
  `type` enum('Income','Expense') NOT NULL,
  `date` varchar(4) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_apis`;
CREATE TABLE `ipp_apis` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(127) NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `api_secret` varchar(32) NOT NULL,
  `portal_id` int(11) NOT NULL,
  `allow_manual` tinyint(1) NOT NULL,
  `allow_swipe` tinyint(1) NOT NULL,
  `allow_emv` tinyint(1) NOT NULL,
  `assigned_emv` int(11) NOT NULL,
  PRIMARY KEY (`api_id`),
  UNIQUE KEY `api_key` (`api_key`),
  UNIQUE KEY `api_secret` (`api_secret`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `ipp_api_error_logs`;
CREATE TABLE `ipp_api_error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `get_param` tinytext NOT NULL,
  `post_param` text NOT NULL,
  `message` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_api_logs`;
CREATE TABLE `ipp_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` varchar(64) NOT NULL,
  `post_time` datetime NOT NULL,
  `get_param` text NOT NULL,
  `post_param` text NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_db_logs`;
CREATE TABLE `ipp_db_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_dt` datetime NOT NULL,
  `main_action` varchar(64) NOT NULL,
  `sub_action` varchar(64) NOT NULL,
  `log_data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_emvs`;
CREATE TABLE `ipp_emvs` (
  `emv_id` int(11) NOT NULL AUTO_INCREMENT,
  `emv_device_key` varchar(63) NOT NULL,
  `emv_device_label` varchar(127) NOT NULL,
  PRIMARY KEY (`emv_id`),
  UNIQUE KEY `emv_device_key` (`emv_device_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_esign_entries`;
CREATE TABLE `ipp_esign_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(32) NOT NULL,
  `template_id` int(11) NOT NULL,
  `asset` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `fill_data` text NOT NULL,
  `fill_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_esign_template`;
CREATE TABLE `ipp_esign_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `file_url` varchar(1024) NOT NULL,
  `file_path` varchar(1024) NOT NULL,
  `fields` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_forms`;
CREATE TABLE `ipp_forms` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(127) NOT NULL,
  `form_fields` text NOT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_name` (`form_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_int_autos_incoming`;
CREATE TABLE `ipp_int_autos_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(64) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `vehicle_info` varchar(512) NOT NULL,
  `next_due_date` date NOT NULL,
  `next_payment_amount` decimal(10,2) NOT NULL,
  `cell_phone` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `sale_date` date NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `text_opt_in` tinyint(1) NOT NULL,
  `email_opt_in` tinyint(1) NOT NULL,
  `entity` varchar(32) NOT NULL,
  `portal_id` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `last_payment_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_int_autos_transactions`;
CREATE TABLE `ipp_int_autos_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) NOT NULL,
  `customer_id` varchar(64) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `fee` decimal(8,2) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `auto_accept` tinyint(1) NOT NULL DEFAULT 0,
  `trans_time` datetime NOT NULL,
  `ref` varchar(32) NOT NULL,
  `method` varchar(32) NOT NULL DEFAULT 'Card',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_mainstream`;
CREATE TABLE `ipp_mainstream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isv` varchar(128) NOT NULL,
  `mids` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_pays`;
CREATE TABLE `ipp_pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(4) NOT NULL,
  `ori` varchar(32) NOT NULL,
  `isv` varchar(128) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_by` varchar(128) NOT NULL,
  `paid_from` varchar(128) NOT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_pay_logs`;
CREATE TABLE `ipp_pay_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proc_time` datetime NOT NULL,
  `get_param` varchar(1024) NOT NULL,
  `post_param` varchar(2048) NOT NULL,
  `message` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_pay_tokens`;
CREATE TABLE `ipp_pay_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_time` datetime NOT NULL,
  `pay_token` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_portals`;
CREATE TABLE `ipp_portals` (
  `portal_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(127) NOT NULL,
  `portal_name` varchar(127) NOT NULL,
  `portal_data` text NOT NULL,
  PRIMARY KEY (`portal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_pps`;
CREATE TABLE `ipp_pps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gpisv` varchar(128) NOT NULL,
  `processor` enum('PPS','Defyne','Worldpay','Mainstream') NOT NULL,
  `ori` varchar(128) NOT NULL,
  `mupt` decimal(5,2) NOT NULL,
  `mubp` decimal(5,2) NOT NULL,
  `mumf` decimal(8,2) NOT NULL,
  `rspt` decimal(5,2) NOT NULL,
  `rsbp` decimal(5,2) NOT NULL,
  `rsmf` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Payment Process Setting';


DROP TABLE IF EXISTS `ipp_recurring_invoices`;
CREATE TABLE `ipp_recurring_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `invoice_name` varchar(128) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `customer_email` varchar(128) NOT NULL,
  `customer_phone` varchar(32) NOT NULL,
  `bill_amount` decimal(8,2) NOT NULL,
  `bill_interval` tinyint(4) NOT NULL,
  `bill_period` varchar(8) NOT NULL,
  `bill_length` int(11) NOT NULL,
  `init_amount` decimal(8,2) NOT NULL,
  `first_length` int(11) NOT NULL,
  `first_period` varchar(8) NOT NULL,
  `status` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_recurring_rules`;
CREATE TABLE `ipp_recurring_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `rule_name` varchar(64) NOT NULL,
  `bill_amount` decimal(8,2) NOT NULL,
  `bill_interval` tinyint(4) NOT NULL,
  `bill_period` varchar(8) NOT NULL,
  `bill_length` int(11) NOT NULL,
  `init_amount` decimal(8,2) NOT NULL,
  `first_length` int(11) NOT NULL,
  `first_period` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_service_logs`;
CREATE TABLE `ipp_service_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proc_time` datetime NOT NULL,
  `get_param` varchar(1024) NOT NULL,
  `post_param` varchar(2048) NOT NULL,
  `message` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_transactions`;
CREATE TABLE `ipp_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) NOT NULL,
  `portal_name` varchar(128) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `user` varchar(128) NOT NULL,
  `tran_time` datetime NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `fee` decimal(8,2) DEFAULT NULL,
  `gateway` varchar(512) NOT NULL,
  `absorb_fee` tinyint(1) NOT NULL,
  `merge_fee` tinyint(1) NOT NULL,
  `percent_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `min_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `result` varchar(16) NOT NULL,
  `message` varchar(256) DEFAULT NULL,
  `tran_ref` varchar(16) NOT NULL,
  `tran_auth` varchar(16) NOT NULL,
  `fee_ref` varchar(16) DEFAULT NULL,
  `fee_auth` varchar(16) DEFAULT NULL,
  `payment_info` varchar(512) DEFAULT NULL,
  `custom_data` text DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_upload_data`;
CREATE TABLE `ipp_upload_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(32) NOT NULL,
  `dba` varchar(256) NOT NULL,
  `isv` varchar(256) NOT NULL,
  `processor` enum('PPS','Defyne','Worldpay','Mainstream') NOT NULL,
  `vol` decimal(16,2) NOT NULL,
  `cnt` int(11) NOT NULL,
  `net` decimal(16,2) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ipp_upload_files`;
CREATE TABLE `ipp_upload_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_time` datetime NOT NULL,
  `filename` varchar(256) NOT NULL,
  `filedate` varchar(4) NOT NULL,
  `filetype` varchar(32) NOT NULL,
  `record_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `lobby_data`;
CREATE TABLE `lobby_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(64) NOT NULL,
  `form_name` varchar(128) NOT NULL,
  `form_data` text NOT NULL,
  `post_time` datetime NOT NULL,
  `status` enum('new','normal','served','closed') NOT NULL DEFAULT 'new',
  `assign_time` datetime NOT NULL,
  `assign_by` varchar(64) NOT NULL,
  `close_time` datetime NOT NULL,
  `from_device` enum('unknown','kiosk','qrcode') NOT NULL DEFAULT 'unknown',
  `da_attend` enum('yes','no') NOT NULL DEFAULT 'no',
  `op_attend` enum('yes','no') NOT NULL DEFAULT 'no',
  `co_attend` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `lobby_dockets`;
CREATE TABLE `lobby_dockets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(64) NOT NULL,
  `portal_id` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `case_number` varchar(16) NOT NULL,
  `docket_date` date NOT NULL,
  `description` varchar(128) NOT NULL,
  `docket_token` varchar(32) NOT NULL,
  `defendant_phone` varchar(16) NOT NULL,
  `defendant_status` enum('attend','checked','closed','none') NOT NULL DEFAULT 'none',
  `defendant_check_time` datetime NOT NULL,
  `defendant_attend_time` datetime NOT NULL,
  `clerk` varchar(32) NOT NULL,
  `close_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docket_token` (`docket_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `lobby_forms`;
CREATE TABLE `lobby_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) NOT NULL,
  `portal_id` varchar(50) NOT NULL,
  `form_name` varchar(64) NOT NULL,
  `default_name` varchar(64) NOT NULL,
  `standard1` varchar(64) NOT NULL,
  `standard2` varchar(64) NOT NULL,
  `custom1` varchar(64) NOT NULL,
  `custom2` varchar(64) NOT NULL,
  `custom3` varchar(64) NOT NULL,
  `custom4` varchar(64) NOT NULL,
  `custom5` varchar(64) NOT NULL,
  `custom6` varchar(64) NOT NULL,
  `custom7` varchar(64) NOT NULL,
  `custom8` varchar(64) NOT NULL,
  `list1` varchar(64) NOT NULL,
  `list1_values` varchar(512) NOT NULL,
  `list2` varchar(64) NOT NULL,
  `list2_values` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `msg_postback_logs`;
CREATE TABLE `msg_postback_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `gateway` varchar(16) NOT NULL,
  `request` varchar(1024) NOT NULL,
  `response` varchar(1024) NOT NULL,
  `success` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


DROP TABLE IF EXISTS `mx_jwt_tokens`;
CREATE TABLE `mx_jwt_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mx_id` varchar(32) NOT NULL,
  `mx_key` varchar(32) NOT NULL,
  `token` text NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `onepos_entities`;
CREATE TABLE `onepos_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `pay_tokens`;
CREATE TABLE `pay_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `post_token` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `pgis_actions`;
CREATE TABLE `pgis_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `action_key` varchar(32) NOT NULL,
  `action_value` text NOT NULL,
  `action_dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_id` (`record_id`),
  KEY `action_dt` (`action_dt`),
  KEY `action_key` (`action_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `pgis_integrations`;
CREATE TABLE `pgis_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(64) NOT NULL,
  `portal_id` varchar(64) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `var_key` varchar(32) NOT NULL,
  `biller_guid` varchar(32) NOT NULL,
  `invoice_id` varchar(32) NOT NULL,
  `pgis_cancel_url` varchar(256) NOT NULL,
  `pgis_approve_url` varchar(256) NOT NULL,
  `line_items` text NOT NULL,
  `inserted_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `pgis_transactions`;
CREATE TABLE `pgis_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `record_id` int(11) NOT NULL,
  `auth_code` varchar(16) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `paid_dt` datetime NOT NULL,
  `trans_all_id` int(11) NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `portal_boolean`;
CREATE TABLE `portal_boolean` (
  `pb_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pb_entity` varchar(191) NOT NULL DEFAULT '',
  `pb_portal_id` varchar(191) NOT NULL DEFAULT '',
  `pb_pre_download` varchar(20) NOT NULL DEFAULT 'no',
  `pb_all_required` varchar(20) NOT NULL DEFAULT 'yes',
  `pb_admin_receipt` varchar(20) NOT NULL DEFAULT 'no',
  `pb_daily_receipt` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_remove_header_from_receipt` enum('yes','no') NOT NULL,
  `pb_customer_receipt` varchar(20) NOT NULL DEFAULT 'no',
  `pb_admin_email1` varchar(200) NOT NULL,
  `pb_admin_email2` varchar(200) NOT NULL,
  `pb_daily_receipt_email` varchar(512) NOT NULL,
  `pb_online_note` varchar(20) NOT NULL DEFAULT 'no',
  `pb_online_note_content` varchar(200) NOT NULL,
  `pb_custom_header` varchar(20) NOT NULL DEFAULT 'no',
  `pb_custom_header_content` varchar(200) NOT NULL,
  `pb_partial_payment` varchar(20) NOT NULL DEFAULT 'no',
  `pb_online_partial_payment` varchar(20) NOT NULL DEFAULT 'no',
  `pb_court_date` varchar(20) NOT NULL DEFAULT 'yes',
  `pb_court_date_value` int(11) NOT NULL DEFAULT -24,
  `pb_court_time_zone` tinyint(4) NOT NULL DEFAULT 0,
  `pb_court_time_content` varchar(200) NOT NULL,
  `pb_online_multi_payment` varchar(20) NOT NULL DEFAULT 'yes',
  `pb_iplow_ftp_path` varchar(99) NOT NULL,
  `pb_eta_court_form` varchar(20) NOT NULL DEFAULT 'no',
  `pb_code` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_fixed` enum('yes','no') NOT NULL,
  `pb_fixed_amount` decimal(8,2) NOT NULL,
  `pb_code_hour` tinyint(4) NOT NULL DEFAULT 2,
  `pb_absorb_fee` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_merge_fee` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_lobby` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_lobby_only` enum('yes','no') NOT NULL,
  `pb_lobby_form_id` int(11) NOT NULL,
  `pb_lobby_text` tinytext NOT NULL,
  `pb_lobby_docket_text` tinytext NOT NULL,
  `pb_lobby_sms` enum('yes','no') NOT NULL,
  `pb_lobby_phone` varchar(127) NOT NULL,
  `pb_lobby_docket` enum('yes','no') NOT NULL,
  `pb_recurring_payment` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_recurring_days` varchar(99) NOT NULL,
  `pb_ach_payment` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_ach_city_username` varchar(99) NOT NULL,
  `pb_ach_city_password` varchar(99) NOT NULL,
  `pb_ach_fee_username` varchar(99) NOT NULL,
  `pb_ach_fee_password` varchar(99) NOT NULL,
  `pb_quicksale` enum('yes','no') NOT NULL DEFAULT 'yes',
  `pb_batch` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_kiosk` enum('yes','no') NOT NULL DEFAULT 'no',
  `pb_kiosk_emv` int(11) NOT NULL,
  `pb_batch_zone` tinyint(1) NOT NULL DEFAULT 0,
  `pb_batch_hour` tinyint(4) NOT NULL DEFAULT 22,
  `pb_batch_minute` tinyint(4) NOT NULL DEFAULT 0,
  `pb_news_director` enum('yes','no') NOT NULL,
  `pb_news_director_content` tinytext NOT NULL,
  `pb_news_clerk` enum('yes','no') NOT NULL,
  `pb_news_clerk_content` tinytext NOT NULL,
  `pb_document` enum('yes','no') NOT NULL,
  `pb_recurring_failure_emails` enum('yes','no') NOT NULL,
  `pb_document_format` varchar(32) NOT NULL,
  PRIMARY KEY (`pb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `rba_incoming`;
CREATE TABLE `rba_incoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `account_number` varchar(16) NOT NULL,
  `account_name` varchar(64) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `location` varchar(64) NOT NULL,
  `route` varchar(16) NOT NULL,
  `district` varchar(16) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `post_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `rba_incoming_general`;
CREATE TABLE `rba_incoming_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `account_number` varchar(16) NOT NULL,
  `account_name` varchar(64) NOT NULL,
  `account_phone` varchar(64) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `post_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `recurring_customers`;
CREATE TABLE `recurring_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(20) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `card_token` varchar(512) NOT NULL,
  `max_amount` decimal(8,2) NOT NULL,
  `last_paid` datetime NOT NULL,
  `custom_data` text NOT NULL,
  `city_card_id` int(11) NOT NULL DEFAULT 0,
  `fee_card_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `rec_logs`;
CREATE TABLE `rec_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `portal_id` varchar(32) NOT NULL,
  `account_id` int(11) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `result` varchar(32) NOT NULL,
  `note` tinytext NOT NULL,
  `email_delivery` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `email_delivery` (`email_delivery`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `redline_integrations`;
CREATE TABLE `redline_integrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `entity` varchar(128) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `account_number` varchar(64) NOT NULL,
  `account_name` varchar(256) NOT NULL,
  `account_address1` varchar(128) NOT NULL,
  `account_address2` varchar(128) NOT NULL,
  `account_city` varchar(128) NOT NULL,
  `account_state` varchar(32) NOT NULL,
  `account_zip` varchar(32) NOT NULL,
  `active` enum('true','false') NOT NULL DEFAULT 'true',
  `comment` varchar(512) NOT NULL,
  `invoice` varchar(128) NOT NULL,
  `invoice_items` varchar(1024) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `late_date` date DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `last_remind` datetime NOT NULL,
  `remind_times` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `redline_transactions`;
CREATE TABLE `redline_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity` varchar(64) NOT NULL,
  `post_date` date NOT NULL,
  `post_time` time NOT NULL,
  `invoice` varchar(64) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` enum('Approved','Declined','Voided','Refunded') NOT NULL DEFAULT 'Approved',
  `cc_type` varchar(32) NOT NULL,
  `ref_id` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `trans_all_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `rvs_integrations`;
CREATE TABLE `rvs_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(64) NOT NULL,
  `portal_id` varchar(64) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `past_due` decimal(8,2) NOT NULL,
  `customer_number` varchar(16) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `customer_phone` varchar(16) NOT NULL,
  `customer_email` varchar(128) NOT NULL,
  `service_address` varchar(128) NOT NULL,
  `zip` varchar(16) NOT NULL,
  `inserted_dt` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `rvs_transactions`;
CREATE TABLE `rvs_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `portal_id` varchar(16) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `customer_number` varchar(16) NOT NULL,
  `auth_code` varchar(16) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `pay_time` datetime NOT NULL,
  `trans_all_id` int(11) NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `sa_codes`;
CREATE TABLE `sa_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `entity` varchar(64) NOT NULL,
  `portal_id` varchar(64) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `default_name` varchar(512) NOT NULL,
  `list1` varchar(512) NOT NULL,
  `list2` varchar(512) NOT NULL,
  `standard1` varchar(512) NOT NULL,
  `standard2` varchar(512) NOT NULL,
  `custom1` varchar(512) NOT NULL,
  `custom2` varchar(512) NOT NULL,
  `custom3` varchar(512) NOT NULL,
  `custom4` varchar(512) NOT NULL,
  `custom5` varchar(512) NOT NULL,
  `custom6` varchar(512) NOT NULL,
  `custom7` varchar(512) NOT NULL,
  `custom8` varchar(512) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `sa_fields`;
CREATE TABLE `sa_fields` (
  `sa_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) DEFAULT NULL,
  `portal_id` varchar(32) DEFAULT NULL,
  `form_name` varchar(99) DEFAULT NULL,
  `default_name` varchar(99) DEFAULT NULL,
  `standard1` varchar(99) DEFAULT NULL,
  `standard1_label` varchar(99) DEFAULT NULL,
  `standard2` varchar(99) DEFAULT NULL,
  `standard2_label` varchar(99) DEFAULT NULL,
  `list1` varchar(99) DEFAULT NULL,
  `list1_label` varchar(99) DEFAULT NULL,
  `custom1` varchar(99) DEFAULT NULL,
  `custom1_label` varchar(99) DEFAULT NULL,
  `custom2` varchar(99) DEFAULT NULL,
  `custom2_label` varchar(99) DEFAULT NULL,
  `custom3` varchar(99) DEFAULT NULL,
  `custom3_label` varchar(99) DEFAULT NULL,
  `custom4` varchar(99) DEFAULT NULL,
  `custom4_label` varchar(99) DEFAULT NULL,
  `custom5` varchar(99) DEFAULT NULL,
  `custom5_label` varchar(99) DEFAULT NULL,
  `custom6` varchar(99) DEFAULT NULL,
  `custom6_label` varchar(99) DEFAULT NULL,
  `custom7` varchar(99) DEFAULT NULL,
  `custom7_label` varchar(99) DEFAULT NULL,
  `custom8` varchar(99) DEFAULT NULL,
  `custom8_label` varchar(99) DEFAULT NULL,
  `list2` varchar(99) DEFAULT NULL,
  `list2_label` varchar(99) DEFAULT NULL,
  `field_1` varchar(512) DEFAULT NULL,
  `field_2` varchar(512) DEFAULT NULL,
  `field_3` varchar(512) DEFAULT NULL,
  `field_4` varchar(512) DEFAULT NULL,
  `field_5` varchar(512) DEFAULT NULL,
  `field_6` varchar(512) DEFAULT NULL,
  `field_7` varchar(512) DEFAULT NULL,
  `field_8` varchar(512) DEFAULT NULL,
  `field_9` varchar(512) DEFAULT NULL,
  `field_10` varchar(512) DEFAULT NULL,
  `field_11` varchar(512) DEFAULT NULL,
  `field_12` varchar(512) DEFAULT NULL,
  `field_13` varchar(512) DEFAULT NULL,
  `field_14` varchar(512) DEFAULT NULL,
  `field_15` varchar(512) DEFAULT NULL,
  `field_16` varchar(512) DEFAULT NULL,
  `field_17` varchar(512) DEFAULT NULL,
  `field_18` varchar(512) DEFAULT NULL,
  `field_19` varchar(512) DEFAULT NULL,
  `field_20` varchar(512) DEFAULT NULL,
  `requires` varchar(100) DEFAULT NULL,
  `app_doc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sa_field_id`),
  UNIQUE KEY `form_name` (`form_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `sienungka_dj`;
CREATE TABLE `sienungka_dj` (
  `dejavoo_id` int(88) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(88) NOT NULL,
  `portal_name` varchar(88) NOT NULL,
  `entity` varchar(88) NOT NULL,
  `tpn` varchar(88) NOT NULL,
  `rid` varchar(88) NOT NULL,
  `auth_key` varchar(88) NOT NULL,
  `wan_ip_secure` varchar(88) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `device_sn` varchar(88) NOT NULL,
  PRIMARY KEY (`dejavoo_id`),
  UNIQUE KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `simple_usaepay_post_logs`;
CREATE TABLE `simple_usaepay_post_logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `post_time` datetime NOT NULL,
  `request` text NOT NULL,
  `result` varchar(10) NOT NULL DEFAULT 'Error',
  `response` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `TransactionID` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(100) DEFAULT NULL,
  `tdate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(100) DEFAULT NULL,
  `ORI_number` varchar(255) DEFAULT NULL,
  `CaseNumber` varchar(255) DEFAULT NULL,
  `CitationNumber` varchar(255) DEFAULT NULL,
  `trans_type` varchar(255) DEFAULT NULL,
  `authcode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `trans_all`;
CREATE TABLE `trans_all` (
  `GP_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `portal_name` varchar(99) DEFAULT NULL,
  `ORI_Number` varchar(99) DEFAULT NULL,
  `Reference_Number` varchar(99) DEFAULT NULL,
  `Portal_Id` varchar(25) DEFAULT NULL,
  `PersonName` varchar(512) DEFAULT NULL,
  `InvoiceNumber` varchar(25) DEFAULT NULL,
  `AccountNumber` varchar(25) DEFAULT NULL,
  `CardHolder` varchar(128) DEFAULT NULL,
  `CaseNumber` varchar(25) DEFAULT NULL,
  `CauseNumber` varchar(25) DEFAULT NULL,
  `CitationNumber` varchar(25) DEFAULT NULL,
  `TransIDCity` varchar(25) DEFAULT NULL,
  `TransIDFee` varchar(25) DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `entity` varchar(25) DEFAULT NULL,
  `cc_type` varchar(25) DEFAULT NULL,
  `amount_city` varchar(25) DEFAULT NULL,
  `amount_fee` varchar(25) DEFAULT NULL,
  `tdate_city` varchar(25) DEFAULT NULL,
  `tdate_fee` varchar(25) DEFAULT NULL,
  `trans_type` varchar(25) DEFAULT NULL,
  `authcode_city` varchar(25) DEFAULT NULL,
  `authcode_fee` varchar(25) DEFAULT NULL,
  `var` varchar(25) DEFAULT NULL,
  `invoice_num` varchar(25) DEFAULT NULL,
  `datastore_id` varchar(25) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `standard1` varchar(512) DEFAULT NULL,
  `standard2` varchar(512) DEFAULT NULL,
  `custom1` varchar(512) DEFAULT NULL,
  `custom2` varchar(512) DEFAULT NULL,
  `custom3` varchar(512) DEFAULT NULL,
  `custom4` varchar(512) DEFAULT NULL,
  `custom5` varchar(512) DEFAULT NULL,
  `custom6` varchar(512) DEFAULT NULL,
  `custom7` varchar(512) DEFAULT NULL,
  `custom8` varchar(512) DEFAULT NULL,
  `list1` varchar(512) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gateway` varchar(32) DEFAULT NULL,
  `void_reason` varchar(99) DEFAULT NULL,
  `var_updated` varchar(99) DEFAULT NULL,
  `source_name` varchar(99) DEFAULT NULL,
  `fromfile` varchar(255) DEFAULT NULL,
  `list2` varchar(512) DEFAULT NULL,
  `absorb_fee` enum('yes','no') NOT NULL DEFAULT 'no',
  `merge_fee` enum('yes','no') NOT NULL DEFAULT 'no',
  `field_1` varchar(128) DEFAULT NULL,
  `field_2` varchar(128) DEFAULT NULL,
  `field_3` varchar(128) DEFAULT NULL,
  `field_4` varchar(128) DEFAULT NULL,
  `field_5` varchar(128) DEFAULT NULL,
  `field_6` varchar(128) DEFAULT NULL,
  `field_7` varchar(128) DEFAULT NULL,
  `field_8` varchar(128) DEFAULT NULL,
  `field_9` varchar(128) DEFAULT NULL,
  `field_10` varchar(128) DEFAULT NULL,
  `Status1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GP_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_api_logs`;
CREATE TABLE `zoho_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(128) NOT NULL,
  `action_dt` datetime NOT NULL,
  `action_body` text NOT NULL,
  `action_response` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_hook_logs`;
CREATE TABLE `zoho_hook_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL,
  `hook_dt` datetime NOT NULL,
  `get_param` text NOT NULL,
  `post_param` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_invoices`;
CREATE TABLE `zoho_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `invoice_id` varchar(32) NOT NULL,
  `customer_id` varchar(32) NOT NULL,
  `recurring_invoice_id` varchar(32) NOT NULL,
  `customer_name` varchar(64) NOT NULL,
  `customer_email` varchar(128) NOT NULL,
  `invoice_number` varchar(64) NOT NULL,
  `due_date` date NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `status` varchar(32) DEFAULT NULL,
  `last_paid` datetime DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_invoice_numbers`;
CREATE TABLE `zoho_invoice_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(32) NOT NULL,
  `invoice_id` varchar(32) NOT NULL,
  `customer_id` varchar(32) NOT NULL,
  `invoice_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_products`;
CREATE TABLE `zoho_products` (
  `Product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Owner` varchar(99) DEFAULT NULL,
  `Product_Owner_Id` varchar(99) DEFAULT NULL,
  `portal_name` varchar(99) DEFAULT NULL,
  `Created_Time` varchar(99) DEFAULT NULL,
  `Modified_Time` varchar(99) DEFAULT NULL,
  `Location_URL` varchar(99) DEFAULT NULL,
  `Var_Partner` varchar(99) DEFAULT NULL,
  `Gateway` varchar(99) DEFAULT NULL,
  `Source_Key` varchar(99) DEFAULT NULL,
  `Source_Pin` varchar(99) DEFAULT NULL,
  `Reporting_Source_Key` varchar(99) DEFAULT NULL,
  `Service_Fee_Source_Key` varchar(99) DEFAULT NULL,
  `Fee_Reporting_Source_Key` varchar(33) DEFAULT NULL,
  `Processor` varchar(99) DEFAULT NULL,
  `Merchant_ID` varchar(99) DEFAULT NULL,
  `Customer_Service_Number` varchar(99) DEFAULT NULL,
  `Voice_Portal` varchar(99) DEFAULT NULL,
  `Accounts_Name` varchar(99) DEFAULT NULL,
  `Portal_Id` varchar(99) DEFAULT NULL,
  `Service_Fee` varchar(99) DEFAULT NULL,
  `Credential_Notes` varchar(99) DEFAULT NULL,
  `Reporting_Email` varchar(99) DEFAULT NULL,
  `GatewayUser_Login` varchar(99) DEFAULT NULL,
  `Gateway_User_Password` varchar(99) DEFAULT NULL,
  `Entity` varchar(79) DEFAULT NULL,
  `ORI_Number_MSG_Only` varchar(49) DEFAULT NULL,
  `Version_Number` varchar(89) DEFAULT NULL,
  `Rules` varchar(69) DEFAULT NULL,
  `Portal_Status` varchar(99) DEFAULT NULL,
  `Customer_Service_Contact` varchar(99) DEFAULT NULL,
  `WP_user_Login` varchar(89) DEFAULT NULL,
  `WP_User_Password` varchar(89) DEFAULT NULL,
  `Address` varchar(89) DEFAULT NULL,
  `City` varchar(59) DEFAULT NULL,
  `State` varchar(69) DEFAULT NULL,
  `ZIP` varchar(49) DEFAULT NULL,
  `Minimum` varchar(89) DEFAULT NULL,
  `Phone_Payments` varchar(99) DEFAULT NULL,
  `Number_of_MSR` varchar(59) DEFAULT NULL,
  `Portal_Notes` varchar(99) DEFAULT NULL,
  `Fee_Model` varchar(99) DEFAULT NULL,
  `Auth_Trans_API` varchar(99) DEFAULT NULL,
  `Auth_Trans_KEY` varchar(99) DEFAULT NULL,
  `source_olp` varchar(99) DEFAULT NULL,
  `voice_source` varchar(99) DEFAULT NULL,
  `department_type` varchar(99) DEFAULT NULL,
  `Account_Number` varchar(99) DEFAULT NULL,
  `Routing_Number` varchar(99) DEFAULT NULL,
  `Bank_Name` varchar(99) DEFAULT NULL,
  `department_url` varchar(33) DEFAULT NULL,
  `GP_VOID_SOURCE` varchar(33) DEFAULT NULL,
  `OnlinePayment` varchar(33) DEFAULT 'true',
  `device_key` varchar(99) DEFAULT NULL,
  `emv_api_key` varchar(99) DEFAULT NULL,
  `fee_emv_api_key` varchar(99) DEFAULT NULL,
  `split` varchar(11) DEFAULT NULL,
  `form_name` varchar(99) DEFAULT NULL,
  `device_key2` varchar(99) DEFAULT NULL,
  `integrated` varchar(99) DEFAULT NULL,
  `mxid` varchar(99) DEFAULT NULL,
  `fee_mxid` varchar(99) DEFAULT NULL,
  `sig_cap` varchar(99) DEFAULT NULL,
  `gateway_change_date` varchar(99) DEFAULT NULL,
  `legacy_cutoff_date` varchar(99) DEFAULT NULL,
  `old_usa_source_name` varchar(99) DEFAULT NULL,
  `rules_active` varchar(99) DEFAULT NULL,
  `mx_gp_fee_user` varchar(99) DEFAULT NULL,
  `mx_gp_fee_pass` varchar(99) DEFAULT NULL,
  `timezone_portal` varchar(99) DEFAULT NULL,
  `rules_name` varchar(99) DEFAULT NULL,
  `partial_allowed` varchar(33) DEFAULT NULL,
  `disposed` varchar(33) DEFAULT NULL,
  `rules_time` varchar(99) DEFAULT NULL,
  `emv` varchar(99) DEFAULT NULL,
  `secureCVV` varchar(99) DEFAULT NULL,
  `Amex_Minimum` varchar(99) DEFAULT NULL,
  `Amex_Service_Fee` varchar(99) DEFAULT NULL,
  `Amex_Accepted` varchar(99) DEFAULT NULL,
  `AbsorbFee` varchar(99) DEFAULT NULL,
  `tpn` varchar(99) DEFAULT NULL,
  `rid` varchar(99) DEFAULT NULL,
  `auth_key` varchar(99) DEFAULT NULL,
  `kiosk_form_name` varchar(99) DEFAULT NULL,
  `token` varchar(99) DEFAULT NULL,
  `cityaddon_usa_key` varchar(32) DEFAULT NULL,
  `cityaddon_mx_id` varchar(32) DEFAULT NULL,
  `cityaddon_mx_key` varchar(32) DEFAULT NULL,
  `cityaddon_mx_secret` varchar(32) DEFAULT NULL,
  `allow_ach` varchar(16) DEFAULT NULL,
  `ach_fee_percent` varchar(16) DEFAULT NULL,
  `ach_flat_fee_amount` varchar(16) DEFAULT NULL,
  `ach_fee_merchant_secret` varchar(32) DEFAULT NULL,
  `ach_fee_merchant_key` varchar(32) DEFAULT NULL,
  `ach_fee_merchant_id` varchar(16) DEFAULT NULL,
  `ach_fee_merchant` varchar(32) DEFAULT NULL,
  `ach_fee_type` varchar(32) DEFAULT NULL,
  `ach_fee_model` varchar(32) DEFAULT NULL,
  `flatfee_usa_key` varchar(32) DEFAULT NULL,
  `flatfee_mx_id` varchar(32) DEFAULT NULL,
  `flatfee_mx_secret` varchar(32) DEFAULT NULL,
  `flatfee_mx_key` varchar(32) DEFAULT NULL,
  `link_only` varchar(8) DEFAULT NULL,
  `link_url` tinytext DEFAULT NULL,
  PRIMARY KEY (`Product_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_push_logs`;
CREATE TABLE `zoho_push_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `push_id` varchar(32) NOT NULL,
  `push_dt` datetime NOT NULL,
  `push_ip` varchar(16) NOT NULL,
  `push_result` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `zoho_recurring_invoice`;
CREATE TABLE `zoho_recurring_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(16) NOT NULL,
  `recurring_invoice_id` varchar(32) NOT NULL,
  `city_card_id` int(11) NOT NULL,
  `fee_card_id` int(11) NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 2023-05-02 18:25:28
