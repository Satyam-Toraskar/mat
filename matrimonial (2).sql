-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 07:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrimonial`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email_id` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pincode`
--

CREATE TABLE `pincode` (
  `pincode` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_email_id` varchar(30) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `dateofbirth` date NOT NULL,
  `brief_intro` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `userlogin_emailid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `premium` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userrequest`
--

CREATE TABLE `userrequest` (
  `userrequest_id` int(11) NOT NULL,
  `sender_emailid` varchar(30) NOT NULL,
  `receiver_emailid` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_id` (`email_id`,`password`,`active`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `pincode`
--
ALTER TABLE `pincode`
  ADD PRIMARY KEY (`pincode`),
  ADD UNIQUE KEY `pincode` (`pincode`,`city`,`state`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_email_id`),
  ADD UNIQUE KEY `user_email_id` (`user_email_id`,`full_name`,`phone_no`,`pincode`,`address`,`dateofbirth`),
  ADD KEY `full_name` (`full_name`),
  ADD KEY `pincode` (`pincode`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`userlogin_emailid`),
  ADD UNIQUE KEY `userlogin_emailid` (`userlogin_emailid`,`password`,`active`,`premium`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `userrequest`
--
ALTER TABLE `userrequest`
  ADD PRIMARY KEY (`userrequest_id`),
  ADD UNIQUE KEY `userrequest_id` (`userrequest_id`,`sender_emailid`,`receiver_emailid`,`active`),
  ADD KEY `receiver_emailid` (`receiver_emailid`),
  ADD KEY `sender_emailid` (`sender_emailid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `userlogin` (`password`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`pincode`) REFERENCES `pincode` (`pincode`);

--
-- Constraints for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`password`) REFERENCES `admin` (`email_id`);

--
-- Constraints for table `userrequest`
--
ALTER TABLE `userrequest`
  ADD CONSTRAINT `userrequest_ibfk_1` FOREIGN KEY (`sender_emailid`) REFERENCES `user` (`user_email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
