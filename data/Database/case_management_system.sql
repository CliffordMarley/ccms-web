-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 02:10 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `case_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `CaseNumber` varchar(20) NOT NULL,
  `CaseTitle` varchar(255) NOT NULL,
  `PresidingJudge` varchar(100) NOT NULL,
  `NameOfCourt` varchar(255) NOT NULL,
  `BriefDescription` text NOT NULL,
  `Status` enum('OPEN','CLOSED','DISMISSED','DELETED') NOT NULL DEFAULT 'OPEN',
  `Stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `case_clients`
--

CREATE TABLE `case_clients` (
  `client_id` int(11) NOT NULL,
  `case_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `case_documents`
--

CREATE TABLE `case_documents` (
  `id` int(11) NOT NULL,
  `CaseNumber` varchar(20) NOT NULL,
  `DocumentTitle` varchar(200) NOT NULL,
  `FileURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `Title` enum('Mr.','Ms.','Mrs.','Dr.','Prof.','Hon.','HE.','Rev.','','','') NOT NULL,
  `Firstname` varchar(100) NOT NULL,
  `Middlename` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Gender` enum('MALE','FEMALE') NOT NULL,
  `DOB` date NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `District` int(11) NOT NULL,
  `Village` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` enum('Returned','Cancelled','Deleted') NOT NULL DEFAULT 'Returned',
  `Stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ClientImage` varchar(255) DEFAULT NULL,
  `IDType` enum('PASSPORT','NATIONAL_ID','WORK_PERMIT','OTHER') DEFAULT NULL,
  `IDImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `contact_type` enum('EMAIL_ADDRESS','PHONE_NUMBER','PHYSICAL_ADDRESS') NOT NULL,
  `contact` varchar(200) NOT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `court_proceedings`
--

CREATE TABLE `court_proceedings` (
  `id` int(11) NOT NULL,
  `CaseNumber` varchar(20) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Date` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `RegisterBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int(2) NOT NULL,
  `district_name` varchar(20) NOT NULL,
  `district_code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `district_name`, `district_code`) VALUES
(1, 'BALAKA', 'BLK'),
(2, 'BLANTYRE', 'BT'),
(3, 'CHITIPA', 'CP'),
(4, 'CHIKWAWA', 'CW'),
(5, 'CHILADZULU', 'CZ'),
(6, 'DEDZA', 'DZ'),
(7, 'DOWA', 'DA'),
(8, 'KASUNGU', 'KU'),
(9, 'KARONGA', 'KA'),
(10, 'LILONGWE', 'LL'),
(11, 'LIWONDE', 'LD'),
(12, 'MACHINGA', 'MH'),
(13, 'MANGOCHI', 'MC'),
(14, 'MULANJE', 'MJ'),
(15, 'MCHINJI', 'MCJ'),
(16, 'NSANJE', 'NJ'),
(17, 'NTCHEU', 'NU'),
(18, 'NTCHISI', 'NS'),
(19, 'NKHOTAKOTA', 'KK'),
(20, 'NKHATABAY', 'NK'),
(21, 'NENO', 'NN'),
(22, 'RUMPHI', 'RP'),
(23, 'SALIMA', 'SA'),
(24, 'THYOLO', 'TY'),
(25, 'ZOMBA', 'ZA'),
(26, 'MZUZU', 'MZ'),
(27, 'MZIMBA', 'MZB'),
(28, 'NGABU', 'NGB'),
(29, 'MWANZA', 'MWZ');

-- --------------------------------------------------------

--
-- Table structure for table `lawyers_assigned`
--

CREATE TABLE `lawyers_assigned` (
  `user_id` int(11) NOT NULL,
  `case_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matters`
--

CREATE TABLE `matters` (
  `id` int(11) NOT NULL,
  `MatterTitle` varchar(200) NOT NULL,
  `Brief` text NOT NULL,
  `CaseReference` varchar(20) NOT NULL,
  `Resolution` text NOT NULL,
  `Status` enum('Open','Discarded','Resolved') NOT NULL DEFAULT 'Open',
  `Stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proceeding_documents`
--

CREATE TABLE `proceeding_documents` (
  `id` int(11) NOT NULL,
  `Proceeding_id` int(11) NOT NULL,
  `DocumentTitle` varchar(200) NOT NULL,
  `FileURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Firstname` varchar(100) NOT NULL,
  `Middlename` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Gender` enum('MALE','FEMALE') NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` enum('ADMINISTRATOR','LAWYER','CLERK') NOT NULL,
  `Status` enum('Active','Suspended','Closed','Deleted') NOT NULL DEFAULT 'Active',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CaseNumber` (`CaseNumber`);

--
-- Indexes for table `case_clients`
--
ALTER TABLE `case_clients`
  ADD KEY `case_number` (`case_number`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `case_documents`
--
ALTER TABLE `case_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CaseNumber` (`CaseNumber`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD KEY `client` (`client`);

--
-- Indexes for table `court_proceedings`
--
ALTER TABLE `court_proceedings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CaseNumber` (`CaseNumber`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`),
  ADD UNIQUE KEY `district_key` (`district_code`);

--
-- Indexes for table `lawyers_assigned`
--
ALTER TABLE `lawyers_assigned`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `case_number` (`case_number`);

--
-- Indexes for table `matters`
--
ALTER TABLE `matters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proceeding_documents`
--
ALTER TABLE `proceeding_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Proceeding_id` (`Proceeding_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email Address` (`EmailAddress`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court_proceedings`
--
ALTER TABLE `court_proceedings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `matters`
--
ALTER TABLE `matters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proceeding_documents`
--
ALTER TABLE `proceeding_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `case_clients`
--
ALTER TABLE `case_clients`
  ADD CONSTRAINT `case_clients_ibfk_1` FOREIGN KEY (`case_number`) REFERENCES `cases` (`CaseNumber`),
  ADD CONSTRAINT `case_clients_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `case_documents`
--
ALTER TABLE `case_documents`
  ADD CONSTRAINT `case_documents_ibfk_1` FOREIGN KEY (`CaseNumber`) REFERENCES `cases` (`CaseNumber`);

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `client_contacts_ibfk_1` FOREIGN KEY (`client`) REFERENCES `clients` (`id`);

--
-- Constraints for table `court_proceedings`
--
ALTER TABLE `court_proceedings`
  ADD CONSTRAINT `court_proceedings_ibfk_1` FOREIGN KEY (`CaseNumber`) REFERENCES `cases` (`CaseNumber`);

--
-- Constraints for table `lawyers_assigned`
--
ALTER TABLE `lawyers_assigned`
  ADD CONSTRAINT `lawyers_assigned_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lawyers_assigned_ibfk_2` FOREIGN KEY (`case_number`) REFERENCES `cases` (`CaseNumber`);

--
-- Constraints for table `proceeding_documents`
--
ALTER TABLE `proceeding_documents`
  ADD CONSTRAINT `proceeding_documents_ibfk_1` FOREIGN KEY (`Proceeding_id`) REFERENCES `court_proceedings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
