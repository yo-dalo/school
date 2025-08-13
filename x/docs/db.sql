-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2025 at 11:19 AM
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

--
-- Dumping data for table `Achievements`
--

INSERT INTO `Achievements` (`Id`, `Image`, `Name`, `Title`, `Description`, `Index_No`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'e590422454c5b519e370630eab80ddd3.jpg', 'Name', 'Ytt', '<h2>helll</h2>', 0, 'active', '2025-08-10 10:32:59', '2025-08-10 10:33:27'),
(2, 'a897d65ada0fcb47a617f9da99418fd4.jpg', '', 'Twgdg', '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', 0, 'active', '2025-08-10 10:33:37', '2025-08-10 10:34:10');

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

--
-- Dumping data for table `Admission_Open_Message`
--

INSERT INTO `Admission_Open_Message` (`Id`, `Title`, `Index_No`, `Message`, `Image`, `Read_More_Url`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'Hdhhd', 6566, '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', '3', 'Dyd', 'active', '2025-08-08 17:29:22', '2025-08-08 18:07:12');

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

--
-- Dumping data for table `Blog`
--

INSERT INTO `Blog` (`Id`, `Name`, `Title`, `Description`, `Date`, `Content`, `Author`, `Image`, `Created_At`) VALUES
(1, 'School Annual Function', 'Annual Function 2025', 'A grand celebration with cultural events.', '2025-02-15', 'Our annual function was filled with music, dance, and awards for students.', 'Admin', 'annual_function.jpg', '2025-08-09 16:31:21'),
(2, 'Science Exhibition', 'Innovative Projects by Students', 'Students showcased science and tech projects.', '2025-03-20', 'The exhibition included robotics, AI demos, and renewable energy models.', 'Science Dept.', 'science_exhibition.jpg', '2025-08-09 16:31:21'),
(3, 'Sports Day', 'Annual Sports Meet 2025', 'A day full of athletic activities and competitions.', '2025-01-10', 'Various track and field events were held, and winners were awarded.', 'Sports Coach', 'sports_day.jpg', '2025-08-09 16:31:21');

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

--
-- Dumping data for table `Facility`
--

INSERT INTO `Facility` (`Id`, `Index_No`, `Name`, `Title`, `Description`, `Image`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 1, 'Library', 'School Library', '<p>A well-equipped library with over 5000 books.</p>', '019c399f2e7880d59fde202e12ca1cfe.jpeg', 'active', '2025-08-09 21:54:46', '2025-08-10 10:35:03'),
(2, 2, 'Laboratory', 'Science Lab', 'Modern laboratory with all necessary equipment.', 'lab.jpg', 'active', '2025-08-09 21:54:46', '2025-08-09 21:54:46'),
(3, 3, 'Playground', 'Sports Ground', '<p>Large playground for multiple outdoor sports.</p>', '3e27fb702eca7fedbf174330121219cc.jpeg', 'active', '2025-08-09 21:54:46', '2025-08-10 10:35:21'),
(4, 4, 'Computer Lab', 'IT Facility', 'Computer lab with 50 high-speed systems.', 'computer_lab.jpg', 'inactive', '2025-08-09 21:54:46', '2025-08-09 21:54:46');

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

--
-- Dumping data for table `Messages`
--

INSERT INTO `Messages` (`Id`, `Image`, `Name`, `Roll`, `Description`, `Read_More_Url`, `Index_No`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'fd30337d9f8a3e6d8681cbb5bb7b7caa.jpeg', 'Tttt', 'Ttt', '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', 'T', 2, 'active', '2025-08-06 22:27:33', '2025-08-10 10:36:18');

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

--
-- Dumping data for table `Notification`
--

INSERT INTO `Notification` (`Id`, `Index_No`, `Is_Important`, `Title`, `Description`, `Date`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 12, 1, 'Rttyyy', 'Bhnnbn', '2025-08-12', 'Bb', 'active', '2025-08-02 22:55:23', '2025-08-02 22:55:23'),
(2, 12, 1, 'Rttyyy', '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', '2025-08-12', 'Bb', 'active', '2025-08-08 19:15:46', '2025-08-08 19:15:46'),
(3, 12, 1, 'Rttyyy', '<h2>helll</h2>', '2025-08-12', 'Bb', 'active', '2025-08-08 19:19:12', '2025-08-08 19:19:12'),
(4, 12, 1, 'Kal ki chuti h', '<p>Bhnnbn</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:18:06', '2025-08-11 10:18:06'),
(5, 12, 1, 'Ki ki holi h', '<p>Bhnnbn</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:18:31', '2025-08-11 10:18:31'),
(6, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:18:44', '2025-08-11 10:18:44'),
(7, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:19:28', '2025-08-11 10:19:28'),
(8, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:19:33', '2025-08-11 10:19:33'),
(9, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:20:31', '2025-08-11 10:20:31'),
(10, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:20:37', '2025-08-11 10:20:37'),
(11, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:20:43', '2025-08-11 10:20:43'),
(12, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:20:47', '2025-08-11 10:20:47'),
(13, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:20:52', '2025-08-11 10:20:52'),
(14, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:20:56', '2025-08-11 10:20:56'),
(15, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:21:12', '2025-08-11 10:21:12'),
(16, 12, 1, 'Ki ki holi h', '<p>Bhnnbn ok</p>', '2025-08-12', 'Bb', 'active', '2025-08-11 10:21:17', '2025-08-11 10:21:17');

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

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`Id`, `Name`, `Pages_Category_Id`, `Page_Data`, `Is_Active`, `Created_At`, `Updated_At`, `Index_No`) VALUES
(6, '', 1, '', 'active', '2025-08-06 18:40:11', '2025-08-08 23:29:02', 0),
(7, 'Free ', 1, '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', 'active', '2025-08-08 23:03:00', '2025-08-08 23:29:17', 20);

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

--
-- Dumping data for table `Pages_Category`
--

INSERT INTO `Pages_Category` (`Id`, `Index_No`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 2, 'Name', 'active', '2025-08-06 18:39:42', '2025-08-06 18:39:42');

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

--
-- Dumping data for table `Poster`
--

INSERT INTO `Poster` (`Id`, `Index_No`, `Url`, `Image`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(2, 1, 'Y', '5cff09fdb340470763379a7bbe70950f.jpg', 'Yt', 'active', '2025-08-08 00:51:47', '2025-08-08 00:51:47');

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

--
-- Dumping data for table `Result_10th`
--

INSERT INTO `Result_10th` (`Id`, `Student_Name`, `Index_No`, `Image`, `Marks_Percentage`, `Description`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'Rohit', 11, '95bfa4efdaa7f1b3fc5125e3112fa1ca.jpg', '78', '<h2>helll</h2>', 'active', '2025-08-08 15:58:44', '2025-08-08 17:12:07'),
(3, 'Divya', 331, 'ce9bb850b304c6b2aec05d07e4c906aa.jpg', '50', '', 'active', '2025-08-08 16:05:37', '2025-08-08 17:12:34'),
(4, 'Yu', 84, '9c77c0916d1bccde8a813d7cfadad97b.jpg', '59', '', 'active', '2025-08-08 16:06:08', '2025-08-08 17:12:19');

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

--
-- Dumping data for table `Result_12th`
--

INSERT INTO `Result_12th` (`Id`, `Student_Name`, `Index_No`, `Image`, `Marks_Percentage`, `Description`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'Y', 10, '8d536842fe20340a439b6d6652a39632.jpg', '555', '<h2>helll</h2>', 'active', '2025-07-29 21:40:15', '2025-08-08 17:18:46');

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

--
-- Dumping data for table `School_Info`
--

INSERT INTO `School_Info` (`Id`, `Experience`, `Students`, `Teachers`, `Awards`, `School_Name`, `Short_Name`, `Logo_Url`, `Favicon_Url`, `Motto`, `Established_Year`, `Address`, `City`, `State`, `Pin_Code`, `Alternate_Phone`, `Email`, `Website`, `Academic_Year_Start`, `Academic_Year_End`, `Youtube_Url`, `Linkedin_Url`, `Instagram_Url`, `Twitter_Url`, `Board_Affiliation`, `Board_Affiliation_Number`, `Latitude`, `Longitude`, `Contact_Person_Name`, `Contact_Person_Position`, `Contact_Person_Phone`, `Medium_Of_Instruction`, `Display_Order`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, '250', 268, 257, '472', 'Adarsh', 'Adarsh', 'Logo.png', 'Favicon', 'Moto leleo ', '2005', 'Jhook mahender Ghar pe hai na ki hov ga ma ', 'Haryana mahender ', 'Haryana ', '123029', '2363838836', 'Kumar adarsh ', 'Website ', '2000', '2004', 'YouTube.com', 'Link.in.com', 'Install.com', 'Tweeter.com', 'Board afact ', '26374', '25388363', '528376383', 'Namery', 'Principal ', '132648', 'Miduma ', 1, 'active', '2025-08-09 09:26:26', '2025-08-09 09:26:26');

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
-- Dumping data for table `Useful_Link`
--

INSERT INTO `Useful_Link` (`Id`, `Index_No`, `Url`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 1, 'F', 'Bddhdfhv', 'active', '2025-08-08 23:21:43', '2025-08-08 23:21:43');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Admission`
--
ALTER TABLE `Admission`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Admission_Open_Message`
--
ALTER TABLE `Admission_Open_Message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Blog`
--
ALTER TABLE `Blog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Facility`
--
ALTER TABLE `Facility`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Notification`
--
ALTER TABLE `Notification`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Pages`
--
ALTER TABLE `Pages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Pages_Category`
--
ALTER TABLE `Pages_Category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Poster`
--
ALTER TABLE `Poster`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Quick_Link`
--
ALTER TABLE `Quick_Link`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Result_10th`
--
ALTER TABLE `Result_10th`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Result_12th`
--
ALTER TABLE `Result_12th`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `School_Info`
--
ALTER TABLE `School_Info`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `School_Welcome_Message`
--
ALTER TABLE `School_Welcome_Message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Useful_Link`
--
ALTER TABLE `Useful_Link`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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