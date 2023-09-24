-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2023 at 09:22 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itc311`
--

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `music_id` int NOT NULL,
  `title` text,
  `artist` text,
  `album` text,
  `genre` text,
  `file_path` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`music_id`, `title`, `artist`, `album`, `genre`, `file_path`) VALUES
(2, 'Love Letter', 'Yoasobi', 'Single', 'Japanese', '650fa11b50c04.mp3'),
(3, 'Panorama', 'IZ*ONE', 'One Reeler', 'Kpop', '650fa139b90cd.mp3'),
(4, 'Express Moon', 'Jo Yuri', 'Glassy', 'Kpop', '650fa18249c72.mp3'),
(5, 'Fiesta', 'IZ*ONE', 'Bloom*IZ', 'Kpop', '650fa6646f7d0.mp3'),
(6, 'Lilac', 'IU', 'Unknown', 'Kpop', '650faa24d1f51.mp3'),
(7, 'Style', 'Taylor Swift', '1989', 'Western', '650fb4bc8a9a9.mp3'),
(8, 'Yummy Summer', 'IZ*ONE', 'Twelve', 'Kpop - Japanese', '650fb7f8d5ce4.mp3'),
(9, 'Future', 'Red Velvet', 'Start Up', 'Kpop', '650fd16eeb5c2.mp3'),
(10, 'Back to December', 'Taylor Swift', '', 'Western', '650fe3edf043a.mp3'),
(11, 'Wildest Dreams', 'Taylor Swift', '', '', '650fe778a9d1a.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`playlist_id`, `name`) VALUES
(1, 'Favorites'),
(2, 'Kpop'),
(3, 'Japanese'),
(4, 'Kenneth');

-- --------------------------------------------------------

--
-- Table structure for table `playlistmusic`
--

CREATE TABLE `playlistmusic` (
  `playlist_music_id` int NOT NULL,
  `playlist_id` int DEFAULT NULL,
  `music_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `playlistmusic`
--

INSERT INTO `playlistmusic` (`playlist_music_id`, `playlist_id`, `music_id`) VALUES
(2, 1, 2),
(3, 1, 3),
(5, 3, 2),
(6, 4, 6),
(7, 3, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`music_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`playlist_id`);

--
-- Indexes for table `playlistmusic`
--
ALTER TABLE `playlistmusic`
  ADD PRIMARY KEY (`playlist_music_id`),
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `music_id` (`music_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `music`
--
ALTER TABLE `music`
  MODIFY `music_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `playlist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `playlistmusic`
--
ALTER TABLE `playlistmusic`
  MODIFY `playlist_music_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlistmusic`
--
ALTER TABLE `playlistmusic`
  ADD CONSTRAINT `playlistmusic_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`),
  ADD CONSTRAINT `playlistmusic_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
