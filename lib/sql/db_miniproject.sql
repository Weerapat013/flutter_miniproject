-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2023 at 01:12 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_mobile`
--
CREATE DATABASE IF NOT EXISTS `project_mobile` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project_mobile`;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `caption`, `description`, `userId`) VALUES
(1, 'My Tree', 'Good Start', 'This is the first tree I planted', 1),
(2, 'More Tree', 'We Need More Tree', 'Lets go plant more tree', 1),
(3, 'Green World', 'My Tree My World', 'I want this world to be full of green.', 2),
(4, 'Tree World', 'My World My Tree', 'I want this world to be full of green.', 1),
(5, 'Test Delete', 'This post for the test', 'test test test test test test', 1),
(7, 'Test Insert 1', 'This is for Test Insert', 'Test insert Test in sert', 1),
(8, 'Test Insert 2', 'This is for Test Insert 2', 'Test round 2', 1),
(9, 'Test Pop 1', 'This is for test 1', 'Test Pop this page 1', 1),
(10, 'Go Back', 'Test go Back', 'This is for test go back', 1),
(14, 'Go Back 2', 'Test go Back 2', 'This is for test go back round 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `picture` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `birthday`, `address`, `email`, `phone`, `picture`) VALUES
(1, 'Tae', '123', 'Weerapat', '2001-03-24', '91/118 Surat Thani, Thailand 84000', '6340011013@email.psu.ac.th', '0640253302', '1.jpg'),
(2, 'Boo', '123', 'Boorapa', '2002-08-07', '91/71', '6340011007@psu.ac.th', '0877777777', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
