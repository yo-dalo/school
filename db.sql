-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2025 at 02:42 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `Achievements`
--

CREATE TABLE `Achievements` (
  `Id` int(11) NOT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Admission`
--

CREATE TABLE `Admission` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Father_Name` varchar(255) DEFAULT NULL,
  `Mother_Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Class` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Admission_Date` date DEFAULT NULL,
  `More_Info` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Admission_Open_Message`
--

CREATE TABLE `Admission_Open_Message` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Read_More_Url` varchar(500) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Blog`
--

CREATE TABLE `Blog` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Facility`
--

CREATE TABLE `Facility` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Gallery`
--

CREATE TABLE `Gallery` (
  `Id` int(11) NOT NULL,
  `Gallery_Category_Id` int(11) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Gallery_Category`
--

CREATE TABLE `Gallery_Category` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE `Messages` (
  `Id` int(11) NOT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Roll` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Read_More_Url` varchar(500) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Is_Important` tinyint(1) DEFAULT 0,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE `Pages` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Pages_Category_Id` int(11) DEFAULT NULL,
  `Page_Data` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Index_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Pages_Category`
--

CREATE TABLE `Pages_Category` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Poster`
--

CREATE TABLE `Poster` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Quick_Link`
--

CREATE TABLE `Quick_Link` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Result_10th`
--

CREATE TABLE `Result_10th` (
  `Id` int(11) NOT NULL,
  `Student_Name` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Marks_Percentage` varchar(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Result_12th`
--

CREATE TABLE `Result_12th` (
  `Id` int(11) NOT NULL,
  `Student_Name` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Marks_Percentage` varchar(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `School_Info`
--

CREATE TABLE `School_Info` (
  `Id` int(11) NOT NULL,
  `Experience` varchar(255) DEFAULT NULL,
  `Students` int(11) DEFAULT NULL,
  `Teachers` int(11) DEFAULT NULL,
  `Awards` varchar(255) DEFAULT NULL,
  `School_Name` varchar(255) DEFAULT NULL,
  `Short_Name` varchar(255) DEFAULT NULL,
  `Logo_Url` varchar(500) DEFAULT NULL,
  `Favicon_Url` varchar(500) DEFAULT NULL,
  `Motto` text DEFAULT NULL,
  `Established_Year` year(4) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Pin_Code` varchar(20) DEFAULT NULL,
  `Alternate_Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Academic_Year_Start` year(4) DEFAULT NULL,
  `Academic_Year_End` year(4) DEFAULT NULL,
  `Youtube_Url` varchar(500) DEFAULT NULL,
  `Linkedin_Url` varchar(500) DEFAULT NULL,
  `Instagram_Url` varchar(500) DEFAULT NULL,
  `Twitter_Url` varchar(500) DEFAULT NULL,
  `Board_Affiliation` varchar(255) DEFAULT NULL,
  `Board_Affiliation_Number` varchar(255) DEFAULT NULL,
  `Latitude` varchar(50) DEFAULT NULL,
  `Longitude` varchar(50) DEFAULT NULL,
  `Contact_Person_Name` varchar(255) DEFAULT NULL,
  `Contact_Person_Position` varchar(255) DEFAULT NULL,
  `Contact_Person_Phone` varchar(20) DEFAULT NULL,
  `Medium_Of_Instruction` varchar(255) DEFAULT NULL,
  `Display_Order` int(11) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `School_Welcome_Message`
--

CREATE TABLE `School_Welcome_Message` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Read_More_Url` varchar(500) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Useful_Link`
--

CREATE TABLE `Useful_Link` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Achievements`
--
ALTER TABLE `Achievements`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Admission`
--
ALTER TABLE `Admission`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Admission_Open_Message`
--
ALTER TABLE `Admission_Open_Message`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Blog`
--
ALTER TABLE `Blog`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Facility`
--
ALTER TABLE `Facility`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Gallery`
--
ALTER TABLE `Gallery`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Gallery_Category_Id` (`Gallery_Category_Id`);

--
-- Indexes for table `Gallery_Category`
--
ALTER TABLE `Gallery_Category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Pages_Category_Id` (`Pages_Category_Id`);

--
-- Indexes for table `Pages_Category`
--
ALTER TABLE `Pages_Category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Poster`
--
ALTER TABLE `Poster`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Quick_Link`
--
ALTER TABLE `Quick_Link`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Result_10th`
--
ALTER TABLE `Result_10th`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Result_12th`
--
ALTER TABLE `Result_12th`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `School_Info`
--
ALTER TABLE `School_Info`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `School_Welcome_Message`
--
ALTER TABLE `School_Welcome_Message`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Useful_Link`
--
ALTER TABLE `Useful_Link`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Achievements`
--
ALTER TABLE `Achievements`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Admission`
--
ALTER TABLE `Admission`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Admission_Open_Message`
--
ALTER TABLE `Admission_Open_Message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Blog`
--
ALTER TABLE `Blog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Facility`
--
ALTER TABLE `Facility`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Gallery`
--
ALTER TABLE `Gallery`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Gallery_Category`
--
ALTER TABLE `Gallery_Category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Messages`
--
ALTER TABLE `Messages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Notification`
--
ALTER TABLE `Notification`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Pages`
--
ALTER TABLE `Pages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Pages_Category`
--
ALTER TABLE `Pages_Category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Poster`
--
ALTER TABLE `Poster`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Quick_Link`
--
ALTER TABLE `Quick_Link`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Result_10th`
--
ALTER TABLE `Result_10th`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Result_12th`
--
ALTER TABLE `Result_12th`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `School_Info`
--
ALTER TABLE `School_Info`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `School_Welcome_Message`
--
ALTER TABLE `School_Welcome_Message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Useful_Link`
--
ALTER TABLE `Useful_Link`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Gallery`
--
ALTER TABLE `Gallery`
  ADD CONSTRAINT `Gallery_ibfk_1` FOREIGN KEY (`Gallery_Category_Id`) REFERENCES `Gallery_Category` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `Pages`
--
ALTER TABLE `Pages`
  ADD CONSTRAINT `Pages_ibfk_1` FOREIGN KEY (`Pages_Category_Id`) REFERENCES `Pages_Category` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;