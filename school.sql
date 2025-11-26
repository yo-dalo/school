-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2025 at 03:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `Id` int(11) NOT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`Id`, `Image`, `Name`, `Title`, `Description`, `Index_No`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'fed6d5e1bdeeedfb3d554f9dead3a3c9.jpg', 'Cultural & Co-curricular Success', 'First prize winners in inter-school debate, science exhibition, and cultural competitions.”  Modern Infrastructure', '', 1, 'inactive', '2025-08-10 10:32:59', '2025-09-21 21:30:42');
INSERT INTO `achievements` (`Id`, `Image`, `Name`, `Title`, `Description`, `Index_No`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(2, '066114d7861ebf8d404544460bb21d1f.jpg', 'Modern Infrastructure', 'Smart classrooms, computer labs, and digital learning tools to provide 21st-century education', '<h2>Principal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School&nbsp;</p><h2>Principal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary SchoolPrincipal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s Message</p><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><', 0, 'active', '2025-08-10 10:33:37', '2025-09-21 21:32:01');
INSERT INTO `achievements` (`Id`, `Image`, `Name`, `Title`, `Description`, `Index_No`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(3, '089725ad0496b2cc1b1bee6d2b03e75a.jpg', 'Sports Excellence', 'Winners at District & State level in Football, Kabaddi, and Athletics. Students represented our school in National tournaments.', '', NULL, 'active', '2025-09-21 21:29:19', '2025-09-21 21:29:19');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` text NOT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `Create_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Id`, `Name`, `Email`, `Password`, `Username`, `Create_at`) VALUES
(1, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$hzM7dGz8eLJMoacR6k0UX.WXkP5eWFXs2I.kzqFOHZfaoGWGNX.56', 'adarsh123', '2025-09-08 00:33:22.142295'),
(2, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$9eQFfaMqBzBUxEsPWWASzeG4eFOmYpoSAaYC3yQO3dsb6i8LDa55S', 'adarsh123', '2025-09-08 00:33:24.080721'),
(3, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$4nNXjYeyT0MfDn9CIaRVQu7Fe.wIx8T0CleBwuYm4rrMgbO7HaJb2', 'adarsh123', '2025-09-09 13:19:20.591926'),
(4, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$aaDRV7EvmLlLvRYfUcv/oeN30.TjRxRAbwb4c/g9eQkfLtj6mmNZe', 'adarsh123', '2025-09-09 13:19:25.227309'),
(5, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$Tp9mB.KqucUvCfCX0jTCTOzPucU2PDzoe4gH4VMtJFXOk8ObvPbju', 'adarsh123', '2025-09-09 13:19:26.437046'),
(6, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$O0LMFCO.xhBUgJRdqUHR7.jaDc9A0WQL3Huh4l0ygKR32CUTINE/O', 'adarsh123', '2025-09-09 13:20:01.866518'),
(7, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$iBDQScJVZ4PiVersmFpCIug4DLrgnaelPkDP3u46wkXPnFobIE94i', 'adarsh123', '2025-09-09 13:20:03.324211'),
(8, 'Adarsh Kumar', 'adarsh@example.com', '$2y$10$y4cfx32ZtDgj0P9pzHSB3.EAdP1JRxHLhI3hofX9oQ8YAh3s433qe', 'adarsh123', '2025-09-09 13:51:20.980478'),
(9, NULL, NULL, '$2y$10$EGvELiGVvinpi70AjtfaM.tlo2FzTePf.MMlJ1wkTB/Outvrk8luS', NULL, '2025-09-13 22:29:58.600770'),
(10, NULL, NULL, '$2y$10$XJ/Hy2vMhRaPY12J/1W6dOuLZqcupz.eNrMk.3jbd9drLzD3FnVFe', NULL, '2025-09-13 22:37:14.211267'),
(11, 'helli', 'kumaradarsh', '$2y$10$nWljuyokb20Hc3VW43KuTey7SdRLJr/FHWJ7i0iCdODiRt6ItAo2C', 'j', '2025-09-13 22:37:50.415293'),
(12, 'fss', 'kumaradarsh@gmail.com', '$2y$10$Pg0qMat0tRKhbiTee2YmYe9J0amhS82ftZnDmymSBaGbQNdOI7BXS', 'amit@gmail.com', '2025-09-13 23:01:20.023405'),
(13, 'www', 'www@gmail.com', '$2y$10$JoXBtXqXMpiFH8OnCg/eAed84W5Nk4D/CKbkE9AP0l1lcTJ0PPBe6', 'wwwe', '2025-09-13 23:34:09.982215'),
(14, 'adarsh', 'kumaradarsh00572@gmail.com', '$2y$10$V615U6YgYjbIzivin/m18.7UnwMsxJt3nltxpGvz9Vui9LgktmEk6', 'kumaradarsh00572@gmail.com', '2025-09-22 22:08:44.297362');

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`Id`, `Name`, `Father_Name`, `Mother_Name`, `Email`, `Phone`, `Class`, `DOB`, `City`, `State`, `Gender`, `Admission_Date`, `More_Info`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'mfsl', '', '', '', '', '', '0000-00-00', '', '', '', '0000-00-00', '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', 'active', '2025-09-15 08:39:57', '2025-09-17 11:35:13'),
(2, '', '', '', '', '', '', '0000-00-00', '', '', '', '0000-00-00', '', 'active', '2025-09-22 22:06:21', '2025-09-22 22:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `admission_open_message`
--

CREATE TABLE `admission_open_message` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Read_More_Url` varchar(500) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admission_open_message`
--

INSERT INTO `admission_open_message` (`Id`, `Title`, `Index_No`, `Message`, `Image`, `Read_More_Url`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'Hdhhd', 6566, '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', '3', 'Dyd', 'active', '2025-08-08 17:29:22', '2025-08-08 18:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`Id`, `Name`, `Title`, `Description`, `Date`, `Content`, `Author`, `Image`, `Created_At`) VALUES
(9, 'Importance of Discipline in School Life', 'Importance of Discipline in School Life', '<p>Discipline is the foundation of every student’s success. It is not just about following rules but about building self-control, respect, and responsibility. In school, discipline helps create a positive learning environment where every student gets equal opportunity to learn and grow.</p><p>A disciplined student manages time wisely, completes homework on time, respects teachers, and behaves responsibly with classmates. These habits develop confidence and leadership qualities. Discipline also reduces stress because a well-organized routine makes life easier.</p><p>Teachers and parents play a major role in shaping discipline among children. Simple practices like punctuality, honesty, and regular study hours become lifelong skills that help students achieve success in academics and future careers.</p><p>In short, discipline is the bridge between goals and achievements. A student who values discipline will always be ahead in life.</p>', '0000-00-00', '<p>Discipline is the foundation of every student’s success. It is not just about following rules but about building self-control, respect, and responsibility. In school, discipline helps create a positive learning environment where every student gets equal opportunity to learn and grow.</p><p>A disciplined student manages time wisely, completes homework on time, respects teachers, and behaves responsibly with classmates. These habits develop confidence and leadership qualities. Discipline also reduces stress because a well-organized routine makes life easier.</p><p>Teachers and parents play a major role in shaping discipline among children. Simple practices like punctuality, honesty, and regular study hours become lifelong skills that help students achieve success in academics and future careers.</p><p>In short, discipline is the bridge between goals and achievements. A student who values discipline will always be ahead in life.</p>', '', NULL, '2025-09-22 13:04:11'),
(10, 'How Sports Build Character in Students', 'How Sports Build Character in Students', '<p>Sports are not just games; they are powerful tools for developing character in students. When students participate in sports, they learn teamwork, leadership, and the value of hard work. Winning teaches confidence, while losing teaches resilience.</p><p>Physical fitness is another major benefit of sports. Regular participation keeps students active, improves focus, and reduces stress. More importantly, sports instill values like honesty, patience, and respect for opponents.</p><p>Many successful personalities often credit their sports background for shaping their discipline and determination. Schools that encourage sports provide students with an all-round personality development.</p><p>Thus, sports are not only about physical strength but also about mental growth and life lessons. Every student should participate in at least one sport activity for balanced growth.</p>', '0000-00-00', '<p>Sports are not just games; they are powerful tools for developing character in students. When students participate in sports, they learn teamwork, leadership, and the value of hard work. Winning teaches confidence, while losing teaches resilience.</p><p>Physical fitness is another major benefit of sports. Regular participation keeps students active, improves focus, and reduces stress. More importantly, sports instill values like honesty, patience, and respect for opponents.</p><p>Many successful personalities often credit their sports background for shaping their discipline and determination. Schools that encourage sports provide students with an all-round personality development.</p><p>Thus, sports are not only about physical strength but also about mental growth and life lessons. Every student should participate in at least one sport activity for balanced growth.</p>', '', NULL, '2025-09-22 13:05:32'),
(11, 'The Role of Technology in Modern Education', 'The Role of Technology in Modern Education', '<p>Education has changed drastically with the rise of technology. From smart classrooms to online learning platforms, technology has made education more accessible and engaging.</p><p>Students today can attend virtual classes, access e-books, and use educational apps that make learning fun. Teachers also use technology to explain concepts more effectively with videos, presentations, and interactive tools.</p><p>Technology also helps in developing digital skills, which are essential for future careers. However, excessive use of gadgets must be avoided. A balance between traditional learning and modern technology ensures the best results.</p><p>In conclusion, technology is not a replacement for teachers but a supportive tool that makes education smarter and more effective.</p>', '0000-00-00', '', '', NULL, '2025-09-22 13:06:52'),
(12, 'Why Reading Habits Are Important for Students', 'Why Reading Habits Are Important for Students', '<p><i><strong>Reading </strong></i>is one of the most powerful habits a student can develop. It improves vocabulary, boosts imagination, and enhances knowledge. A student who reads regularly performs better in studies and develops strong communication skills.</p><p>Reading also builds concentration and patience. Unlike social media, where attention span is short, reading requires focus. This habit also introduces students to different cultures, ideas, and perspectives.</p><p>Parents and teachers should encourage reading by providing storybooks, newspapers, and magazines. Even 30 minutes of daily reading can bring a huge difference in a child’s learning journey.</p><p>In the long run, reading not only helps in exams but also shapes personality and creativity.</p>', '0000-00-00', '', '', NULL, '2025-09-22 13:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`Id`, `Index_No`, `Name`, `Title`, `Description`, `Image`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 1, 'Library', 'Modern School Digital Zones, and Lifelong Learning Opportunities', '<p>A library is often called the heart of a school because it connects students with knowledge, imagination, and inspiration. Our school library is a modern learning hub designed to support academic growth, personal development, and lifelong learning habits among students. It is more than just a collection of books; it is a vibrant space where curiosity is nurtured, creativity is encouraged, and knowledge is shared.</p><p>The library offers a wide range of resources including textbooks, reference materials, storybooks, magazines, newspapers, and digital content. Students can access computers, e-books, and online databases to support their research and projects. This balance of print and digital media ensures that learners are prepared for the challenges of the modern world.</p><p>To create a productive environment, the library is divided into sections such as the reading area, silent study zones, and digital learning corners. Comfortable seating and proper lighting make it an inviting space for students to spend quality time reading and studying. Special corners are dedicated to young readers, ensuring that every student finds material suited to their age and interests.</p><p>Our school librarian plays a key role in guiding students toward the right resources and developing their reading habits. Regular book fairs, reading competitions, and literary events are organized to inspire a culture of reading.</p><p>&nbsp;</p>', '4df93cc5845b22a75a439746cc3a710f.jpg', 'active', '2025-08-09 21:54:46', '2025-09-06 14:51:09'),
(2, 2, 'Laboratory', 'Modern Science Laboratory for Experiments and Innovation', '<p>A science laboratory is one of the most important facilities in any modern school. It is a place where students not only learn concepts from books but also experience them in real life through experiments and hands-on practice. Our school’s science laboratory is well-equipped with modern instruments, safety tools, and resources that help students in exploring the world of physics, chemistry, and biology in a safe and structured environment.</p><p>The laboratory is designed to encourage curiosity and critical thinking. Students get the opportunity to conduct experiments, analyze results, and understand the practical applications of the theories they learn in classrooms. This process makes learning more engaging, enjoyable, and long-lasting. For example, instead of just reading about chemical reactions, students can actually observe them taking place, which helps in better understanding and retention of knowledge.</p><p>Safety is given the highest priority in the laboratory. All students are trained to follow proper guidelines, use protective equipment, and handle chemicals and instruments responsibly. Fire extinguishers, first aid kits, and emergency procedures are in place to ensure complete safety during practical sessions.</p><p>The science laboratory also plays a vital role in preparing students for future careers in medical, engineering, and research fields. By performing experiments and recording observations, students develop analytical skills, problem-solving abilities, and scientific temper, which are crucial for success in higher studies and professional life.</p><p>In addition to regular curriculum-based activities, the lab is also used for science exhibitions, projects, and innovation challenges. This encourages students to think creatively, develop new ideas, and showcase their talent.</p><p>&nbsp;</p>', '14072202cee47e46a159b891f9dd8463.jpg', 'active', '2025-08-09 21:54:46', '2025-09-06 16:26:00'),
(3, 3, 'Playground', 'Modern School Playground for Active Student Growth', '<p>A modern school playground is more than just an open area where children play; it is a vital part of the overall educational environment. Playgrounds provide students with opportunities to develop physically, mentally, and socially while encouraging creativity and teamwork. A well-designed playground is equipped with safe and durable structures such as swings, slides, climbing frames, running tracks, and open fields for sports activities. These facilities not only promote physical fitness but also help students release energy, reduce stress, and improve concentration in their classroom studies.</p><p>Playgrounds play an important role in fostering teamwork and cooperation among students. When children participate in group activities such as football, basketball, or relay races, they learn essential life skills like communication, leadership, problem-solving, and respect for rules. These experiences contribute to building self-confidence and resilience, which are crucial qualities for their overall growth.</p><p>In addition to physical benefits, playgrounds stimulate creativity and imagination. Open spaces encourage children to invent new games, explore movement, and engage in role-play activities. Such experiences help improve cognitive development and social bonding. Moreover, outdoor play allows students to connect with nature, which is essential for maintaining a healthy and balanced lifestyle in today’s technology-driven world.</p><p>Safety is always a priority in a school playground. Modern designs focus on child-friendly surfaces, secure installations, and proper supervision to minimize risks while maximizing fun and learning. Schools that invest in quality playgrounds create an environment where children feel happy, active, and engaged.</p><p>In conclusion, a school playground is not just a recreational space but a learning hub that shapes well-rounded individuals. By balancing fun with physical activity, creativity, and teamwork, playgrounds ensure students grow into healthier, smarter, and more socially responsible individuals.</p>', 'ef8aa4fb07f7e1bc4a2985769d6af4db.webp', 'active', '2025-08-09 21:54:46', '2025-09-06 16:27:42'),
(4, 4, 'Computer Lab', 'Advanced Computer Lab for Digital Learning Excellence', '<p>The computer lab in our school is a modern facility designed to provide students with practical knowledge, technical skills, and confidence in using technology. In today’s digital age, computer education has become essential, and our lab ensures that every student is equipped with the right tools and resources to succeed.</p><p>The lab is spacious, well-ventilated, and equipped with the latest computers, high-speed internet, and updated software applications. Each system is installed with educational programs, programming tools, and creative applications that help students in learning coding, web development, graphic designing, and other essential digital skills. From basic computer literacy to advanced problem-solving, the lab supports students of all grades.</p><p>To ensure effective learning, our computer lab is guided by trained instructors who provide step-by-step assistance to students. They encourage project-based learning, teamwork, and innovation. The lab follows a structured schedule, so every class gets equal access to the facility, ensuring that all students benefit from hands-on computer practice.</p><p>Apart from academics, the lab is also used for activities like online quizzes, digital presentations, and competitions that build confidence and creativity among learners. With regular workshops and training sessions, students are introduced to the latest technological trends, preparing them for future careers in technology and beyond.</p><p>The environment of the lab is quiet, disciplined, and organized to maintain focus and productivity. Proper safety measures, backup systems, and secure browsing practices are also in place to ensure that students learn in a safe digital environment.</p><p>Our school’s computer lab plays a vital role in bridging the gap between theoretical knowledge and practical application. It inspires innovation, nurtures technical skills, and prepares students to thrive in a world driven by technology and digital advancements.</p>', 'd6937c2b48f3718e2d5463e7a6feeeef.jpg', 'inactive', '2025-08-09 21:54:46', '2025-09-06 15:48:31');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `Id` int(11) NOT NULL,
  `Gallery_Category_Id` int(11) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_category`
--

CREATE TABLE `gallery_category` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gallery_category`
--

INSERT INTO `gallery_category` (`Id`, `Name`, `Title`, `Index_No`, `Date`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, '', '', NULL, '0000-00-00', 'active', '2025-09-15 08:47:24', '2025-09-15 08:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`Id`, `Image`, `Name`, `Roll`, `Description`, `Read_More_Url`, `Index_No`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, '4d48842846f9c5cf8a4f00b66b89e728.jpg', 'komal davi', 'ceo', '<p>At ......... Sr. Sec. School, we believe education shapes not only intellect but also character. Our mission is to nurture responsible citizens with critical thinking, empathy, and resilience. We follow a holistic approach, balancing academics with co-curricular and extracurricular activities that encourage creativity, innovation, and leadership. With modern infrastructure, dedicated teachers, and strong parent-school partnerships, we provide students the best environment to grow. Our alumni’s achievements reflect the values instilled here.</p><p>Thank you for entrusting us with the responsibility of shaping your child’s future. Together, let us inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>......... Sr. Sec. School</p>', 'T', 2, 'active', '2025-08-06 22:27:33', '2025-09-22 22:01:17'),
(2, 'd2991170b21a329b569b233928033a0c.jpg', 'ankit', 'princepal', '<p>At ......... Sr. Sec. School, we believe education shapes not only intellect but also character. Our mission is to nurture responsible citizens with critical thinking, empathy, and resilience. We follow a holistic approach, balancing academics with co-curricular and extracurricular activities that encourage creativity, innovation, and leadership. With modern infrastructure, dedicated teachers, and strong parent-school partnerships, we provide students the best environment to grow. Our alumni’s achievements reflect the values instilled here.</p><p>Thank you for entrusting us with the responsibility of shaping your child’s future. Together, let us inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>......... Sr. Sec. School</p>', 'uu', -1, 'active', '2025-09-06 16:57:49', '2025-09-22 22:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Id`, `Index_No`, `Is_Important`, `Title`, `Description`, `Date`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(17, 2, 0, 'Celebration of Annual Sports Day', '<p>This is to inform all students, teachers, and parents that our school is organizing the <strong>Annual Sports Day</strong> on <strong>Saturday, 5th October 2025</strong>, at the school playground. The event will begin at <strong>9:00 AM sharp</strong> and will continue till <strong>4:00 PM</strong>.</p><p>The Annual Sports Day is one of the most awaited events of our school, where students from different classes participate in various games and athletic competitions. The aim of this event is to encourage students to showcase their physical abilities, teamwork, discipline, and sportsmanship. Activities will include running races, relay races, long jump, high jump, kho-kho, kabaddi, cricket, badminton, and many other fun sports events.</p><p>All students are encouraged to participate actively and give their names to their respective class teachers before <strong>28th September 2025</strong>. Parents are cordially invited to attend the program and cheer for the participants.</p><p>Prizes, medals, and certificates will be awarded to winners and outstanding performers. The honorable Chief Guest of the program will be the <strong>District Education Officer</strong>, who will address the students and distribute prizes.</p><p>We request everyone to join and make this event a grand success.</p><p><strong>By Order,</strong><br><strong>Principal</strong></p>', '0000-00-00', 'Celebration of Annual Sports Day', 'active', '2025-09-22 18:25:09', '2025-09-22 18:25:09'),
(18, NULL, 0, 'Admission Open for New Session 2025-26', '<p><br>This is to inform all students, teachers, and parents that our school is organizing the <strong>Annual Science Exhibition</strong> on <strong>15th November 2025</strong> in the school auditorium. The exhibition will start at <strong>10:00 AM</strong> and continue till <strong>3:00 PM</strong>.</p><p>The purpose of the exhibition is to encourage creativity, innovation, and scientific thinking among students. Different models, charts, experiments, and projects prepared by students will be displayed. The themes for this year’s exhibition are <strong>Renewable Energy, Artificial Intelligence, Space Science, and Environmental Protection</strong>.</p><p>Students from classes 6th to 12th are eligible to participate. Interested students should submit their names and project topics to the Science Department before <strong>1st November 2025</strong>. The best projects will be awarded certificates and prizes.</p><p>Parents and guardians are warmly invited to visit the exhibition and support the efforts of our young scientists. We believe this event will inspire students to explore the wonders of science and technology.</p><p>We look forward to active participation from all.</p><p><strong>By Order,</strong><br><strong>Principal</strong></p>', '0000-00-00', 'Admission Open for New Session 2025-26', 'active', '2025-09-22 18:27:15', '2025-09-22 18:27:15'),
(19, NULL, 0, 'Parent-Teacher Meeting (PTM)', '<p>All parents and guardians are informed that the <strong>Parent-Teacher Meeting (PTM)</strong> will be held on <strong>Saturday, 28th September 2025</strong> from <strong>9:00 AM to 1:00 PM</strong> in the respective classrooms.</p><p>The purpose of this meeting is to discuss the academic progress, behavior, and overall performance of the students. Teachers will share feedback regarding students’ strengths and areas of improvement. Parents are requested to attend the meeting on time to ensure effective communication.</p><p>Report cards of the <strong>First Term Examination</strong> will also be distributed during the PTM. Parents are advised to collect the report cards and clarify their queries, if any, with the subject teachers.</p><p>Regular classes will remain suspended on the PTM day, and students must accompany their parents in proper school uniform.</p><p>We expect every parent’s participation as their involvement plays a vital role in shaping their child’s academic journey.</p><p><strong>By Order,</strong><br><strong>Principal</strong></p><h3><strong>Notice 5</strong></h3><p><strong>Name:</strong> National Public School<br><strong>Title:</strong> School Picnic Announcement</p><p><strong>Description (200 words):</strong><br>We are pleased to inform all students and parents that the school is organizing a <strong>Picnic Trip</strong> for classes 6th to 10th on <strong>20th October 2025</strong>. The destination for this year’s picnic is the <strong>City Adventure Park</strong>.</p><p>The trip aims to provide students with relaxation, enjoyment, and an opportunity to bond with friends outside the classroom environment. Exciting activities such as boating, fun rides, team games, and cultural programs will be arranged.</p><p>The charges for the picnic are <strong>?500 per student</strong>, which includes transport, entry ticket, food, and refreshments. Parents are requested to submit consent forms and fees to the class teachers by <strong>15th October 2025</strong>.</p><p>Students must carry a water bottle, cap, and personal medicines (if required). The school will take all necessary safety measures, and teachers will accompany students throughout the trip.</p><p>We look forward to enthusiastic participation from all.</p><p><strong>By Order,</strong><br><strong>Principal</strong></p><h3><strong>Notice 6</strong></h3><p><strong>Name:</strong> St. Mary’s Convent School<br><strong>Title:</strong> Independence Day Celebration</p><p><strong>Description (200 words):</strong><br>This is to notify all students, teachers, and parents that our school will celebrate <strong>Independence Day</strong> on <strong>15th August 2025</strong> in the school premises. The program will begin at <strong>8:00 AM sharp</strong> with the flag hoisting ceremony, followed by the national anthem.</p><p>The celebration will include cultural programs such as patriotic songs, speeches, skits, and dance performances prepared by students. A special parade will also be conducted by the Scouts and Guides.</p><p>All students are instructed to come in neat and clean school uniform. Participants of cultural events should come in their respective costumes. Attendance on this day is <strong>compulsory</strong> for all students.</p><p>Parents are also cordially invited to attend the program and encourage the participants. Refreshments will be served after the function.</p><p>Let us all come together and celebrate the spirit of patriotism with pride and joy.</p><p><strong>By Order,</strong><br><strong>Principal</strong></p>', '0000-00-00', 'Parent-Teacher Meeting (PTM)', 'active', '2025-09-22 18:28:23', '2025-09-22 18:28:23'),
(20, NULL, 0, 'Mid-Term Examination Schedule', '<p>All students are hereby informed that the <strong>Mid-Term Examinations</strong> will commence from <strong>3rd November 2025</strong> and continue till <strong>15th November 2025</strong>. The detailed timetable has been displayed on the school notice board and uploaded on the school website.</p><p>Students must come in proper school uniform and carry their admit cards. Late entry will not be allowed inside the examination hall. Any student found using unfair means will be strictly dealt with.</p><p>Parents are requested to ensure that their children prepare thoroughly for the examinations and maintain regular study hours at home. Teachers will complete the syllabus by the last week of October and provide revision classes for better preparation.</p><p>We wish all students the very best of luck for their exams.</p><p><strong>By Order,</strong><br><strong>Principal</strong></p>', '0000-00-00', 'Mid-Term Examination Schedule', 'active', '2025-09-22 18:29:10', '2025-09-22 18:29:10'),
(21, NULL, 0, 'Library Rules and Regulations', '<p>This is to notify all students that the <strong>School Library</strong> is open from <strong>8:30 AM to 2:30 PM</strong> on all working days. Students must follow the given rules while using the library:</p><p>Maintain silence inside the library.</p><p>Each student can borrow only 2 books at a time.</p><p>Books must be returned within <strong>15 days</strong> from the date of issue.</p><p>Any damage or loss of books will be charged to the borrower.</p><p>Bags and personal belongings should be kept outside the library.</p><p>The library has been updated with new books, journals, and magazines. Students are encouraged to use these resources for academic projects, general knowledge, and leisure reading.</p><p>We expect all students to follow the rules and maintain discipline in the library.</p><p><strong>By Order,</strong><br><strong>Librarian</strong></p>', '0000-00-00', 'Library Rules and Regulations', 'active', '2025-09-22 18:29:54', '2025-09-22 18:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Pages_Category_Id` int(11) DEFAULT NULL,
  `Page_Data` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Index_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`Id`, `Name`, `Pages_Category_Id`, `Page_Data`, `Is_Active`, `Created_At`, `Updated_At`, `Index_No`) VALUES
(31, 'iw', 6, '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', 'active', '2025-09-15 15:10:08', '2025-09-15 15:10:08', 0),
(32, 'hello', 6, '<h2>Principal\\\'s Message</h2><p>At M Hindu Senior Secondary School, we believe that education is the foundation for personal and societal growth. It is my privilege and honor to serve as the Principal of this esteemed institution, where tradition and modernity blend harmoniously to nurture the minds of future generations. Our mission is to create not just academically accomplished students but responsible citizens equipped with critical thinking, empathy, and resilience.</p><p>In today’s dynamic world, education has transcended the traditional boundaries of textbooks and classrooms. We emphasize a holistic approach that balances academic rigor with co-curricular and extracurricular opportunities. Our school fosters creativity, innovation, and leadership by encouraging participation in debates, cultural programs, science fairs, sports, and community outreach initiatives.</p><p>Our teachers are our backbone — dedicated, highly qualified, and passionate about teaching. They act as mentors, guiding students not only in academics but in character development and life skills. Their constant support and personalized attention ensure that every student receives the nurturing they need to thrive in a competitive world.</p><p>We also recognize the invaluable role of parents in the educational journey. We strive to maintain an open and honest relationship with our parent community. Together, we can build a nurturing and safe environment where children feel valued and supported.</p><p>At M Hindu Senior Secondary School, our infrastructure reflects our commitment to quality education — smart classrooms, fully equipped laboratories, a rich library, modern sports facilities, and a lush green campus. We are constantly upgrading our resources to match global standards and give our students the best possible learning environment.</p><p>I am proud to say that our alumni today are making their mark across various sectors — medicine, engineering, civil services, education, business, and arts — carrying with them the core values imbibed at our school. Their success is a testimony to the solid foundation we provide at M Hindu Senior Secondary School.</p><p>We aspire to continue our legacy of excellence and innovation. As Principal, my vision is to make our school a center for excellence not just academically but as a hub of ethics, culture, and leadership. We welcome you to be part of this transformative journey where dreams are realized, and futures are shaped.</p><p>Thank you for entrusting us with the responsibility of your child’s education. Let’s work together to inspire, empower, and lead.</p><p>Warm regards,<br><strong>Dr. Suresh Sharma</strong><br>Principal<br>M Hindu Senior Secondary School</p>', 'active', '2025-09-17 09:49:35', '2025-09-17 09:49:35', -1);

-- --------------------------------------------------------

--
-- Table structure for table `pages_category`
--

CREATE TABLE `pages_category` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages_category`
--

INSERT INTO `pages_category` (`Id`, `Index_No`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(4, 41, 'heloo', 'active', '2025-09-15 13:16:21', '2025-09-15 13:16:21'),
(6, 4, 'lkj', 'active', '2025-09-15 13:20:36', '2025-09-15 14:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `poster`
--

CREATE TABLE `poster` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `poster`
--

INSERT INTO `poster` (`Id`, `Index_No`, `Url`, `Image`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(2, 1, './chairman-message.php', '191880e02c51573d143c8f4a08f1b225.jpg', 'Yt', 'active', '2025-08-08 00:51:47', '2025-09-22 21:55:52'),
(4, 2, './admission.php', 'd23cc945a08c45e829f77d7e24532bd0.jpg', 'h', 'active', '2025-09-06 16:46:47', '2025-09-22 21:56:47'),
(5, 3, './downloads-admission-form.php', 'c36a0416ef85a99d67d05a497de2f7ae.jpg', 'g', 'active', '2025-09-06 21:26:12', '2025-09-22 21:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `quick_link`
--

CREATE TABLE `quick_link` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quick_link`
--

INSERT INTO `quick_link` (`Id`, `Index_No`, `Url`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 1, './news_list.php', 'Notice', 'active', '2025-09-22 18:41:15', '2025-09-22 21:54:23'),
(2, 2, './blog_list.php', 'Blog', 'active', '2025-09-22 18:42:40', '2025-09-22 21:54:58'),
(3, 1, './about.php', 'About', 'active', '2025-09-22 18:45:27', '2025-09-22 21:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `result_10th`
--

CREATE TABLE `result_10th` (
  `Id` int(11) NOT NULL,
  `Student_Name` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Marks_Percentage` varchar(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `result_10th`
--

INSERT INTO `result_10th` (`Id`, `Student_Name`, `Index_No`, `Image`, `Marks_Percentage`, `Description`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'sakshi', 11, '4236100503c73b0980ddbf4236679c70.jpg', '98', '<h2>helll</h2>', 'active', '2025-08-08 15:58:44', '2025-09-22 18:19:08'),
(3, 'Divya', 331, 'ce9bb850b304c6b2aec05d07e4c906aa.jpg', '50', '', 'active', '2025-08-08 16:05:37', '2025-08-08 17:12:34'),
(4, 'rahul', 84, '70af7379c1856217583b1f24f04b8fec.jpg', '91', '', 'active', '2025-08-08 16:06:08', '2025-09-22 18:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `result_12th`
--

CREATE TABLE `result_12th` (
  `Id` int(11) NOT NULL,
  `Student_Name` varchar(255) DEFAULT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Marks_Percentage` varchar(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `result_12th`
--

INSERT INTO `result_12th` (`Id`, `Student_Name`, `Index_No`, `Image`, `Marks_Percentage`, `Description`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, 'avni mittal', 0, '57b6b16bb78848012d81b4c42e8d8d66.jpg', '97', '', 'active', '2025-07-29 21:40:15', '2025-09-22 18:16:59'),
(2, 'himanshu', 0, '162c81613482ac9808c2c74dd0e77303.jpg', '97', '', 'active', '2025-09-06 11:52:23', '2025-09-22 18:17:41'),
(3, 'Rakesh', 4, 'cdfc99a1500d526b6a45a59571cedec3.jpg', '88', '', 'active', '2025-09-06 11:54:57', '2025-09-22 18:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `school_info`
--

CREATE TABLE `school_info` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `school_info`
--

INSERT INTO `school_info` (`Id`, `Experience`, `Students`, `Teachers`, `Awards`, `School_Name`, `Short_Name`, `Logo_Url`, `Favicon_Url`, `Motto`, `Established_Year`, `Address`, `City`, `State`, `Pin_Code`, `Alternate_Phone`, `Email`, `Website`, `Academic_Year_Start`, `Academic_Year_End`, `Youtube_Url`, `Linkedin_Url`, `Instagram_Url`, `Twitter_Url`, `Board_Affiliation`, `Board_Affiliation_Number`, `Latitude`, `Longitude`, `Contact_Person_Name`, `Contact_Person_Position`, `Contact_Person_Phone`, `Medium_Of_Instruction`, `Display_Order`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(1, '250', 268, 257, '472', 'Adarsh', 'Adarsh', 'Logo.png', 'Favicon', 'Moto leleo ', '2005', 'Jhook mahender Ghar pe hai na ki hov ga ma ', 'Haryana mahender ', 'Haryana ', '123029', '2363838836', 'Kumar adarsh ', 'Website ', '2000', '2004', 'YouTube.com', 'Link.in.com', 'Install.com', 'Tweeter.com', 'Board afact ', '26374', '25388363', '528376383', 'Namery', 'Principal ', '132648', 'Miduma ', 1, 'active', '2025-08-09 09:26:26', '2025-08-09 09:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `school_welcome_message`
--

CREATE TABLE `school_welcome_message` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Read_More_Url` varchar(500) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `useful_link`
--

CREATE TABLE `useful_link` (
  `Id` int(11) NOT NULL,
  `Index_No` int(11) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Is_Active` enum('active','inactive') DEFAULT 'active',
  `Created_At` datetime DEFAULT current_timestamp(),
  `Updated_At` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `useful_link`
--

INSERT INTO `useful_link` (`Id`, `Index_No`, `Url`, `Name`, `Is_Active`, `Created_At`, `Updated_At`) VALUES
(2, 4, './photos.php', 'Photo', 'active', '2025-09-15 07:19:26', '2025-09-22 21:54:00'),
(3, 2, './videos.php', 'Videos', 'active', '2025-09-22 18:47:34', '2025-09-22 21:53:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `admission_open_message`
--
ALTER TABLE `admission_open_message`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Gallery_Category_Id` (`Gallery_Category_Id`);

--
-- Indexes for table `gallery_category`
--
ALTER TABLE `gallery_category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Pages_Category_Id` (`Pages_Category_Id`);

--
-- Indexes for table `pages_category`
--
ALTER TABLE `pages_category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `poster`
--
ALTER TABLE `poster`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `quick_link`
--
ALTER TABLE `quick_link`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `result_10th`
--
ALTER TABLE `result_10th`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `result_12th`
--
ALTER TABLE `result_12th`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `school_info`
--
ALTER TABLE `school_info`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `school_welcome_message`
--
ALTER TABLE `school_welcome_message`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `useful_link`
--
ALTER TABLE `useful_link`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `admission`
--
ALTER TABLE `admission`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admission_open_message`
--
ALTER TABLE `admission_open_message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_category`
--
ALTER TABLE `gallery_category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pages_category`
--
ALTER TABLE `pages_category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `poster`
--
ALTER TABLE `poster`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `quick_link`
--
ALTER TABLE `quick_link`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `result_10th`
--
ALTER TABLE `result_10th`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `result_12th`
--
ALTER TABLE `result_12th`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_info`
--
ALTER TABLE `school_info`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `school_welcome_message`
--
ALTER TABLE `school_welcome_message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `useful_link`
--
ALTER TABLE `useful_link`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `Gallery_ibfk_1` FOREIGN KEY (`Gallery_Category_Id`) REFERENCES `gallery_category` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `Pages_ibfk_1` FOREIGN KEY (`Pages_Category_Id`) REFERENCES `pages_category` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
