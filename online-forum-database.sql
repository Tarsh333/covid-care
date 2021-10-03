-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2021 at 02:53 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online-forum-database`
--

-- --------------------------------------------------------

--
-- Table structure for table `approve_vaccination`
--

CREATE TABLE `approve_vaccination` (
  `user_id` int(8) DEFAULT NULL,
  `certificate_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `approve_vaccination`
--

INSERT INTO `approve_vaccination` (`user_id`, `certificate_link`) VALUES
(16, 'https://docs.google.com/document/d/1ggQubb2tPYcuzM8N0UeVHitljKdoFeOT/edit');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(8) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_description`) VALUES
(8, 'Resources', 'Sharing of resources is done here. Please delete post after resource being shared to avoid confusion');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(8) NOT NULL,
  `post_content` text NOT NULL,
  `post_date` datetime NOT NULL,
  `post_topic` int(8) NOT NULL,
  `post_by` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_content`, `post_date`, `post_topic`, `post_by`) VALUES
(26, 'Please share blood plasma here.Specify your blood group too.', '2021-10-02 16:17:11', 9, 14),
(27, 'Please share availability of hospital bed below with location.', '2021-10-02 16:17:29', 10, 14),
(28, 'Please share location of vaccination camps below.\r\n', '2021-10-02 16:17:45', 11, 14),
(29, 'Please share availability of oxygen cylinders with you or near you.', '2021-10-02 16:18:03', 12, 14),
(30, 'Please share other resources which are not defined yet in resources tab. Please specify.', '2021-10-02 16:18:14', 13, 14),
(34, 'I have a-ve plasma', '2021-10-03 13:25:05', 9, 15),
(35, 'I have a+ve blood plasma', '2021-10-03 15:48:34', 9, 12);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(8) NOT NULL,
  `topic_subject` varchar(255) NOT NULL,
  `topic_cat` int(8) NOT NULL,
  `topic_by` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_subject`, `topic_cat`, `topic_by`) VALUES
(9, 'Blood Plasma', 8, 12),
(10, 'Hospital Bed', 8, 12),
(11, 'Vaccine', 8, 12),
(12, 'Oxygen', 8, 12),
(13, 'Others (please specify)', 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(8) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_blood_group` varchar(255) DEFAULT NULL,
  `user_level` int(8) NOT NULL DEFAULT 0,
  `user_vaccination` int(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `user_email`, `user_phone`, `user_blood_group`, `user_level`, `user_vaccination`) VALUES
(12, 'Tarsh', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'tarsh@tarsh', '123456', 'A+', 0, 2),
(13, 'Sample', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'sample@sample', '123456', 'B+', 0, 2),
(14, 'Admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin@iiitdmj.ac.in', '9463905440', 'A+', 1, 2),
(15, 'Tarsh123', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'tarsh123@tarsh123', '123456', 'AB+', 0, 1),
(16, 'Another', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'another@another', '9463905440', 'AB+', 0, 0),
(17, 'tarsh1234', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'tarsh1234@tarsh1234', '123456', 'A+', 0, 0),
(18, 'uhyugre', '7c4a8d09ca3762af61e59520943dc26494f8941b', '20bcs228@iiitdmj.ac.in', '1234567890', 'A+', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approve_vaccination`
--
ALTER TABLE `approve_vaccination`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_name_unique` (`cat_name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_topic` (`post_topic`),
  ADD KEY `post_by` (`post_by`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `topic_cat` (`topic_cat`),
  ADD KEY `topic_by` (`topic_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approve_vaccination`
--
ALTER TABLE `approve_vaccination`
  ADD CONSTRAINT `approve_vaccination_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_topic`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`topic_cat`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`topic_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
