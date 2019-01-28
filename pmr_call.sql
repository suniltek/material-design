-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2019 at 05:36 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmr_call`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `respondent_id` int(11) NOT NULL,
  `answer` longtext NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `status`, `created_at`) VALUES
(1, 'Life Sciences', 'If your Apache server has mod_rewrite enabled, you can easily remove this file by using a .htaccess file with some simple rules. Here is an example of such a file, using the “negative” method in which everything is redirected except the specified items:', 'Active', '2019-01-28 14:16:29'),
(2, 'Consumer Goods', 'If your Apache server has mod_rewrite enabled, you can easily remove this file by using a .htaccess file with some simple rules. Here is an example of such a file, using the “negative” method in which everything is redirected except the specified items:', 'Active', '2019-01-28 14:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `country` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `report_id`, `question`, `created_at`, `updated_at`) VALUES
(1, 7, 'how much fuel import?', '2019-01-27 12:11:09', '2019-01-27 17:41:09'),
(2, 7, 'how much fuel export?', '2019-01-27 12:11:09', '2019-01-27 17:41:09'),
(3, 8, 'lorem', '2019-01-27 12:33:17', '2019-01-27 18:03:17'),
(4, 9, 'lorem', '2019-01-27 12:33:57', '2019-01-27 18:03:57'),
(5, 10, 'lorem', '2019-01-27 12:35:05', '2019-01-27 18:05:05'),
(6, 11, 'lorem', '2019-01-27 12:44:54', '2019-01-27 18:14:54'),
(7, 12, 'lorem', '2019-01-27 12:49:17', '2019-01-27 18:19:17'),
(8, 13, 'name', '2019-01-28 00:03:01', '2019-01-28 05:33:01'),
(9, 13, 'surname', '2019-01-28 00:03:01', '2019-01-28 05:33:01'),
(10, 13, 'job', '2019-01-28 00:03:01', '2019-01-28 05:33:01'),
(11, 14, 'name', '2019-01-28 00:08:04', '2019-01-28 05:38:04'),
(12, 14, 'surname', '2019-01-28 00:08:04', '2019-01-28 05:38:04'),
(13, 14, 'job', '2019-01-28 00:08:04', '2019-01-28 05:38:04'),
(14, 15, 'how much sale in europe?', '2019-01-28 05:44:55', '2019-01-28 10:14:55'),
(15, 15, 'how much sale in austalia?', '2019-01-28 05:44:55', '2019-01-28 10:14:55'),
(16, 16, 'your name', '2019-01-28 10:48:52', '2019-01-28 15:18:52'),
(17, 16, 'your city', '2019-01-28 10:48:52', '2019-01-28 15:18:52'),
(18, 17, 'your name', '2019-01-28 10:49:26', '2019-01-28 15:19:26'),
(19, 17, 'your city', '2019-01-28 10:49:26', '2019-01-28 15:19:26'),
(20, 18, 'name', '2019-01-28 10:52:19', '2019-01-28 15:22:19'),
(21, 18, 'job role', '2019-01-28 10:52:19', '2019-01-28 15:22:19'),
(22, 19, 'name', '2019-01-28 11:26:49', '2019-01-28 15:56:49'),
(23, 19, 'job role', '2019-01-28 11:26:49', '2019-01-28 15:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `no_of_questions` int(11) NOT NULL,
  `no_of_respondent` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `category_id`, `subcategory_id`, `manager_id`, `owner_id`, `no_of_questions`, `no_of_respondent`, `status`, `created_at`, `updated_at`) VALUES
(1, 'shailesh', 1, 1, 2, 1, 2, 5, 'Active', NULL, '2019-01-27 15:30:35'),
(2, 'shailesh', 1, 1, 2, 1, 2, 5, 'Active', NULL, '2019-01-27 15:31:50'),
(3, 'shailesh', 2, 4, 1, 1, 0, 3, 'Active', NULL, '2019-01-27 15:32:15'),
(4, 'shailesh', 2, 3, 2, 1, 1, 12, 'Active', NULL, '2019-01-27 15:33:48'),
(5, 'shailesh', 1, 2, 2, 1, 2, 5, 'Active', NULL, '2019-01-27 17:19:59'),
(6, 'Fuel market', 1, 2, 1, 1, 2, 10, 'Active', '2019-01-27 12:10:22', '2019-01-27 17:40:22'),
(7, 'Fuel market', 1, 2, 1, 1, 2, 10, 'Active', '2019-01-27 12:11:09', '2019-01-27 17:41:09'),
(8, 'shailesh', 2, 3, 1, 1, 1, 2, 'Active', '2019-01-27 12:33:17', '2019-01-27 18:03:17'),
(9, 'shailesh', 2, 3, 1, 1, 1, 2, 'Active', '2019-01-27 12:33:57', '2019-01-27 18:03:57'),
(10, 'shailesh', 2, 3, 1, 1, 1, 2, 'Active', '2019-01-27 12:35:05', '2019-01-27 18:05:05'),
(11, 'shailesh', 2, 3, 1, 1, 1, 2, 'Active', '2019-01-27 12:44:54', '2019-01-27 18:14:54'),
(12, 'shailesh', 2, 3, 1, 1, 1, 2, 'Active', '2019-01-27 12:49:17', '2019-01-27 18:19:17'),
(13, 'shailesh', 1, 1, 1, 1, 3, 5, 'Active', '2019-01-28 00:03:01', '2019-01-28 05:33:01'),
(14, 'shailesh', 1, 1, 1, 1, 3, 5, 'Active', '2019-01-28 00:08:04', '2019-01-28 05:38:04'),
(15, '2018-2023 Global Calcium Tablets Consumption Market Report', 2, 3, 2, 1, 2, 10, 'Active', '2019-01-28 05:44:55', '2019-01-28 10:14:55'),
(16, '2018-2023 Global Depth of Anesthesia Monitor Consumption Market Report', 1, 2, 1, 1, 2, 5, 'Active', '2019-01-28 10:48:51', '2019-01-28 15:36:27'),
(17, '2018-2023 Global Depth of Anesthesia Monitor Consumption Market Report', 1, 2, 1, 1, 2, 5, 'Active', '2019-01-28 10:49:26', '2019-01-28 15:36:30'),
(18, '2018-2023 Global Depth of Anesthesia Monitor Consumption Market Report', 1, 1, 2, 1, 2, 5, 'Active', '2019-01-28 10:52:19', '2019-01-28 15:22:19'),
(19, '2018-2023 Global Depth of Anesthesia Monitor Consumption Market Report', 1, 1, 2, 1, 2, 5, 'Active', '2019-01-28 11:26:49', '2019-01-28 15:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `respondent`
--

CREATE TABLE `respondent` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `job_role` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `title`, `description`, `status`, `created_at`) VALUES
(1, 1, 'Pharmaceuticals', 'If your Apache server has mod_rewrite enabled, you can easily remove this file by using a .htaccess file with some simple rules. Here is an example of such a file, using the “negative” method in which everything is redirected except the specified items:', 'Active', '2019-01-28 15:06:28'),
(2, 1, 'Healthcare', 'If your Apache server has mod_rewrite enabled, you can easily remove this file by using a .htaccess file with some simple rules. Here is an example of such a file, using the “negative” method in which everything is redirected except the specified items:', 'Active', '2019-01-28 15:06:28'),
(3, 2, 'Consumer Electronics', 'If your Apache server has mod_rewrite enabled, you can easily remove this file by using a .htaccess file with some simple rules. Here is an example of such a file, using the “negative” method in which everything is redirected except the specified items:', 'Active', '2019-01-28 15:06:28'),
(4, 2, 'Home Products', 'If your Apache server has mod_rewrite enabled, you can easily remove this file by using a .htaccess file with some simple rules. Here is an example of such a file, using the “negative” method in which everything is redirected except the specified items:', 'Active', '2019-01-28 15:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `job_role` enum('Manager','Owner') NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `job_role`, `email`, `contact_no`, `created_at`) VALUES
(1, 'Shailesh Dhokare', 'Manager', 'sd@test.com', NULL, '2019-01-28 14:58:43'),
(2, 'Ravi Mane', 'Manager', 'rm@test.com', NULL, '2019-01-28 14:58:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `respondent_id` (`respondent_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `respondent`
--
ALTER TABLE `respondent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `respondent`
--
ALTER TABLE `respondent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`respondent_id`) REFERENCES `respondent` (`id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`),
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reports_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `respondent`
--
ALTER TABLE `respondent`
  ADD CONSTRAINT `respondent_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
