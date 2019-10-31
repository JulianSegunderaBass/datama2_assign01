-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 01:53 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitnessbase`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `eq_type` varchar(30) NOT NULL,
  `eq_name` varchar(30) NOT NULL,
  `eq_cost` float NOT NULL,
  `eq_weight` float NOT NULL,
  `member_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `eq_type`, `eq_name`, `eq_cost`, `eq_weight`, `member_id`, `manager_id`) VALUES
(1, 'Leg', 'Seated Leg press', 12500, 800, 1, 1),
(2, 'Chest', 'Chest Press', 9650, 470, 2, 2),
(3, 'Back', 'Back Press', 14000, 980, 3, 3),
(4, 'Leg', 'Leg Extension', 5500, 275, 4, 4),
(5, 'Core', 'Pull-Up Assist', 17640, 1470, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `man_Fname` varchar(30) NOT NULL,
  `man_Lname` varchar(30) NOT NULL,
  `man_MI` varchar(2) NOT NULL,
  `man_address` varchar(45) NOT NULL,
  `man_sex` varchar(15) NOT NULL,
  `month_salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `man_Fname`, `man_Lname`, `man_MI`, `man_address`, `man_sex`, `month_salary`) VALUES
(1, 'Mylene', 'Sal', 'S.', 'Los Angeles, US', 'Female', 60000),
(2, 'Angel', 'Bruce', 'O.', 'California, US', 'Male', 48500),
(3, 'Isaac', 'Clarke', 'K.', 'Texas, US', 'Male', 53650),
(4, 'Aster', 'Martin', 'I.', 'New Jersey, US', 'Male', 72000),
(5, 'Mina', 'Reynolds', 'D.', 'Ohio, US', 'Female', 64300);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `mem_fname` varchar(15) DEFAULT NULL,
  `mem_lname` varchar(15) DEFAULT NULL,
  `mem_mi` varchar(15) DEFAULT NULL,
  `mem_address` varchar(45) DEFAULT NULL,
  `mem_sex` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `mem_fname`, `mem_lname`, `mem_mi`, `mem_address`, `mem_sex`) VALUES
(1, 'John', 'Harrison', 'K.', 'Quezon, PH', 'Male'),
(2, 'Mark', 'Smith', 'M.', 'Manila, PH', 'Male'),
(3, 'Silva', 'Miles', 'H.', 'Paranaque, PH', 'Female'),
(4, 'Maya', 'Linggard', 'S.', 'Pasay, PH', 'Female'),
(5, 'Ria', 'Trivago', 'A.', 'Rizal, PH', 'Female');

-- --------------------------------------------------------

--
-- Stand-in structure for view `member-equipment-manager`
--
CREATE TABLE `member-equipment-manager` (
`id` int(11)
,`eq_type` varchar(30)
,`eq_name` varchar(30)
,`eq_cost` float
,`man_Fname` varchar(30)
,`man_Lname` varchar(30)
,`mem_fname` varchar(15)
,`mem_lname` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `member-equipment-manager`
--
DROP TABLE IF EXISTS `member-equipment-manager`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member-equipment-manager`  AS  select `equipment`.`id` AS `id`,`equipment`.`eq_type` AS `eq_type`,`equipment`.`eq_name` AS `eq_name`,`equipment`.`eq_cost` AS `eq_cost`,`manager`.`man_Fname` AS `man_Fname`,`manager`.`man_Lname` AS `man_Lname`,`member`.`mem_fname` AS `mem_fname`,`member`.`mem_lname` AS `mem_lname` from ((`equipment` join `manager` on((`equipment`.`manager_id` = `manager`.`id`))) join `member` on((`equipment`.`member_id` = `member`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_equipment_member1_idx` (`member_id`),
  ADD KEY `fk_equipment_manager1_idx` (`manager_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `fk_equipment_manager1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipment_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
