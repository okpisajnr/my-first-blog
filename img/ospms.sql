-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2019 at 02:54 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ospms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin.Fcsit@buk.edu.ng', 'e10adc3949ba59abbe56e057f20f883e', '25-09-2019 12:34:14 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`) VALUES
(1, 'software develpoment', 'DESIGN AND IMPLEMENTATION OF WEB APPLICATION, ANDROID TECHNOLOGIES AND ALOT MORE', '2019-11-19'),
(2, 'Research ', 'Research related to computer science  ', '2019-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `notify`
--

CREATE TABLE `notify` (
  `id` int(11) NOT NULL,
  `category` varchar(19) NOT NULL,
  `Message` text NOT NULL,
  `PostDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notify`
--

INSERT INTO `notify` (`id`, `category`, `Message`, `PostDate`) VALUES
(1, 'allSupervisors', 'All students are expected to have their topics approved on or before this month ending', '2019-11-22 10:14:28'),
(2, 'allStudents', 'today is day two of UG Final year Project Defense', '2019-11-26 08:49:03'),
(3, 'allStudents', 'hello', '2019-11-26 16:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `RegNo` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Cgpa` varchar(4) NOT NULL,
  `SupervisorName` varchar(255) DEFAULT NULL,
  `projectTopic` varchar(140) DEFAULT NULL,
  `StudentImage` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `Accept` varchar(20) DEFAULT NULL,
  `SupervisorMail` varchar(30) DEFAULT NULL,
  `gradeA` double DEFAULT NULL,
  `gradeB` double DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `yearProject` varchar(4) DEFAULT NULL,
  `projectFile` text,
  `NewStatus` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fullName`, `RegNo`, `password`, `Cgpa`, `SupervisorName`, `projectTopic`, `StudentImage`, `status`, `Accept`, `SupervisorMail`, `gradeA`, `gradeB`, `grade`, `yearProject`, `projectFile`, `NewStatus`) VALUES
(1, 'MICHAEL  FELIX OKPISA', 'CST/15/COM/00202', 'e10adc3949ba59abbe56e057f20f883e', '4.49', 'Ahmad Abba Datti', 'design and implementation of an online Student project Management System', 'ppic/1574155829.png', 'Approved', '1', 'aadatti.cs@buk.edu.ng', 30, 40, 'A', '2019', 'Pick the date.docx', 'UPLOADED'),
(2, 'Anthonia Doofan Nnogu', 'CST/15/COM/00159', NULL, '4.53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'FATIMA MUSA', 'CST/15/COM/00149', '93279e3308bdbbeed946fc965017f67a', '4.00', 'Dr Ibrahim Yusuf Fagge', NULL, NULL, '0', '1', 'iyusuf.mth@buk.edu.ng', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subfield`
--

CREATE TABLE `subfield` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `area` varchar(200) NOT NULL,
  `Cdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subfield`
--

INSERT INTO `subfield` (`id`, `categoryId`, `area`, `Cdate`) VALUES
(1, 1, 'WEB TECHNOLOGY', '2019-11-19'),
(2, 1, 'ANDROID TECHNOLOGY', '2019-11-19'),
(3, 1, 'STANDALONE JAVA TECHNOLOGY', '2019-11-19'),
(4, 1, 'STANDALONE VISUAL BASIC TECHNOLOGY', '2019-11-19'),
(5, 1, 'STANDALONE C# TECHNOLOGY', '2019-11-19'),
(6, 2, 'NETWORKING ', '2019-11-19'),
(7, 2, 'OPERATING SYSTEMS', '2019-11-19'),
(8, 2, 'INFORMATION TECHNOLOGY', '2019-11-19'),
(9, 2, 'ROBOTICS', '2019-11-19'),
(10, 2, 'CLOUD COMPUTING', '2019-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE `tblfeedback` (
  `id` int(11) NOT NULL,
  `Sender` varchar(70) NOT NULL,
  `reciever` varchar(29) NOT NULL,
  `topic` varchar(200) NOT NULL,
  `Nfile` varchar(240) DEFAULT NULL,
  `msg` text NOT NULL,
  `Ntime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reply` varchar(16) DEFAULT NULL,
  `Replymsg` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfeedback`
--

INSERT INTO `tblfeedback` (`id`, `Sender`, `reciever`, `topic`, `Nfile`, `msg`, `Ntime`, `reply`, `Replymsg`) VALUES
(1, 'CST/15/COM/00202', 'aadatti.cs@buk.edu.ng', 'project proposal', '', 'Good Day, sir i  just sent you my proposal', '2019-11-19 09:47:37', NULL, NULL),
(2, 'aadatti.cs@buk.edu.ng', 'CST/15/COM/00202', 'proposal ', '', 'Hello, Michael your Document had been received you will have to  wait for my approval ', '2019-11-19 09:37:12', NULL, NULL),
(4, 'aadatti.cs@buk.edu.ng', 'CST/15/COM/00202', 'Alertness', '', 'Hello, Michael be informed of the departmental final year orientation program @ CIT by 4pm friday (22/11/2019) ', '2019-11-19 10:13:25', NULL, NULL),
(5, 'CST/15/COM/00202', 'aadatti.cs@buk.edu.ng', 'hol', 'Calculating System Usability Scale.docx', 'thank ', '2019-11-21 15:47:28', NULL, NULL),
(6, 'CST/16/COM/00880', 'ushanga.cit@buk.edu.ng', 'Corrected version', 'Pick the date.docx', 'this is my corrected chapter one', '2019-11-26 09:11:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblproject`
--

CREATE TABLE `tblproject` (
  `ProjectNumber` int(10) NOT NULL,
  `StudentId` varchar(16) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `subField` varchar(255) DEFAULT NULL,
  `supervisor` varchar(255) NOT NULL,
  `projectType` varchar(20) NOT NULL,
  `SupervisorMail` varchar(30) NOT NULL,
  `ProjectDetails` longtext NOT NULL,
  `projecttFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Mstatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproject`
--

INSERT INTO `tblproject` (`ProjectNumber`, `StudentId`, `category`, `subField`, `supervisor`, `projectType`, `SupervisorMail`, `ProjectDetails`, `projecttFile`, `regDate`, `Mstatus`) VALUES
(1, 'CST/15/COM/00202', '1', 'WEB TECHNOLOGY', 'Ahmad Abba Datti', 'Proposal', 'aadatti.cs@buk.edu.ng', 'design and implementation of an online Student project Management System', 'MiniProject.docx', '2019-11-20 10:09:48', 'Approved'),
(7, 'CST/15/COM/00202', '1', 'WEB TECHNOLOGY', 'Ahmad Abba Datti', 'Chapter1', 'aadatti.cs@buk.edu.ng', 'design and implementation of an online Student project Management System', 'DESIGN AND IMPLEMENTATION OF ONLINE STUDENT MIN PROJECT MANAGEMENT SYSTEM.docx', '2019-11-26 15:46:35', 'waiting'),
(8, 'CST/15/COM/00202', '1', 'WEB TECHNOLOGY', 'Ahmad Abba Datti', 'Chapter2', 'aadatti.cs@buk.edu.ng', 'design and implementation of an online Student project Management System', 'DESIGN AND IMPLEMENTATION OF ONLINE STUDENT MIN PROJECT MANAGEMENT SYSTEM.docx', '2019-11-26 15:47:15', 'waiting'),
(9, 'CST/15/COM/00202', '1', 'WEB TECHNOLOGY', 'Ahmad Abba Datti', 'Chapter4', 'aadatti.cs@buk.edu.ng', 'design and implementation of an online Student project Management System', 'DESIGN AND IMPLEMENTATION OF ONLINE STUDENT MIN PROJECT MANAGEMENT SYSTEM.docx', '2019-11-26 15:49:26', 'waiting'),
(10, 'CST/15/COM/00202', '1', 'WEB TECHNOLOGY', 'Ahmad Abba Datti', 'Chapter5', 'aadatti.cs@buk.edu.ng', 'design and implementation of an online Student project Management System', 'DESIGN AND IMPLEMENTATION OF ONLINE STUDENT MIN PROJECT MANAGEMENT SYSTEM.docx', '2019-11-26 15:50:34', 'waiting'),
(11, 'CST/15/COM/00202', '1', 'WEB TECHNOLOGY', 'Ahmad Abba Datti', 'Chapter3', 'aadatti.cs@buk.edu.ng', 'design and implementation of an online Student project Management System', 'DESIGN AND IMPLEMENTATION OF ONLINE STUDENT MIN PROJECT MANAGEMENT SYSTEM.docx', '2019-11-26 15:52:47', 'waiting'),
(12, 'CST/15/COM/00149', '1', 'WEB TECHNOLOGY', 'Dr Ibrahim Yusuf Fagge', 'Proposal', 'iyusuf.mth@buk.edu.ng', 'ONLINE ', 'DESIGN AND IMPLEMENTATION OF ONLINE STUDENT MIN PROJECT MANAGEMENT SYSTEM.docx', '2019-11-26 16:54:52', 'waiting');

-- --------------------------------------------------------

--
-- Table structure for table `tblsuggest`
--

CREATE TABLE `tblsuggest` (
  `id` int(10) NOT NULL,
  `poster` varchar(30) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `caseStudy` varchar(50) DEFAULT NULL,
  `radio` varchar(30) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsuggest`
--

INSERT INTO `tblsuggest` (`id`, `poster`, `topic`, `caseStudy`, `radio`, `regDate`, `publish`) VALUES
(3, 'aadatti.cs@buk.edu.ng', 'Online Inheritance Distribution System', 'A case Study of Pan African Tradition', 'Software Development', '2019-11-19 12:25:41', 'Approved'),
(4, 'ushanga.cit@buk.edu.ng', 'Online Mobile Tracker', 'Nigeria Cyber Unit', 'Software Development', '2019-11-26 15:57:54', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupervisor`
--

CREATE TABLE `tblsupervisor` (
  `id` int(10) NOT NULL,
  `username` varchar(25) NOT NULL,
  `fullName` varchar(30) NOT NULL,
  `phoneNo` varchar(11) NOT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `auth` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsupervisor`
--

INSERT INTO `tblsupervisor` (`id`, `username`, `fullName`, `phoneNo`, `Password`, `auth`) VALUES
(1, 'bsani.cs@buk.edu.ng', 'Baffa Sani', '08034034887', NULL, ''),
(2, 'iyusuf.mth@buk.edu.ng', 'Dr Ibrahim Yusuf Fagge', '08065281616', 'b59c67bf196a4758191e42f76670ceba', '1'),
(3, 'asali.cs@buk.edu.ng', 'Auwual Shehu Ali ', '08182532655', NULL, ''),
(4, 'smtanimu.cs@buk.edu.ng', 'Sagir Tanimu', '09079383738', NULL, ''),
(5, 'mhassan.se@buk.edu.ng', 'Dr Muhammad Hassan', '08037807927', NULL, ''),
(6, 'kumar.cs@buk.edu.ng', 'Dr Kabiru Umar', '07039759138', NULL, ''),
(7, 'fuambursa.it@buk.edu.ng', 'Dr Faruku Umar Ambursa', '08163907411', NULL, ''),
(8, 'aatata.cit@buk.edu.ng', 'Auwal Alassan Tata', '08034532760', NULL, ''),
(9, 'mbabagana.cs@buk.edu.ng', 'Dr Mansur Babagana', '08030735791', NULL, ''),
(10, 'abd_wahhd@yahoo.com', 'Dr Abdulwahab Lawan', '08148468986', NULL, ''),
(11, 'saadam.it@buk.edu.ng', 'Saud Adam', '08034989011', NULL, ''),
(12, 'smaliyu.cs@buk.edu.ng', 'Saminu Mohammad Aliyu', '08068985434', NULL, ''),
(13, 'aadatti.cs@buk.edu.ng', 'Ahmad Abba Datti', '08030794716', '93279e3308bdbbeed946fc965017f67a', '1'),
(14, 'msgadanya.cs@buk.edu.ng', 'Murja Sani Gadanya', '08064245556', NULL, ''),
(15, 'syilu.cs@buk.edu.ng', 'Saratu Yusuf Ilu', '08033333229', NULL, ''),
(16, 'samaaz.cs@buk.edu.ng', 'Sana Abdullahi Muaz', '08034143099', NULL, ''),
(17, 'mimukhtar.se@buk.edu.ng', 'Maryam Ibrahim Mukhtar', '08034574409', NULL, ''),
(18, 'maahmed.it@buk.edu.ng', 'Mustapha Ahmad Abubakar', '08032807071', NULL, ''),
(19, 'ushanga.cit@buk.edu.ng', 'Umar Sani Hanga', '08060307316', NULL, ''),
(20, 'ayimam.it@buk.edu.ng', 'Abdullahi Yahya Iman', '08036025708', NULL, ''),
(21, 'hkakudi.cs@buk.edu.ng', 'Dr. Habeebah Kakudi', '09020000000', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RegNo` (`RegNo`);

--
-- Indexes for table `subfield`
--
ALTER TABLE `subfield`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproject`
--
ALTER TABLE `tblproject`
  ADD PRIMARY KEY (`ProjectNumber`);

--
-- Indexes for table `tblsuggest`
--
ALTER TABLE `tblsuggest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsupervisor`
--
ALTER TABLE `tblsupervisor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notify`
--
ALTER TABLE `notify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subfield`
--
ALTER TABLE `subfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblproject`
--
ALTER TABLE `tblproject`
  MODIFY `ProjectNumber` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblsuggest`
--
ALTER TABLE `tblsuggest`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblsupervisor`
--
ALTER TABLE `tblsupervisor`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
