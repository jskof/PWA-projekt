-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2023 at 12:18 PM
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
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `league_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `played` int(11) NOT NULL,
  `won` int(11) NOT NULL,
  `drawn` int(11) NOT NULL,
  `lost` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`, `logo_url`, `league_id`, `rank`, `played`, `won`, `drawn`, `lost`, `points`) VALUES
(82, 'Manchester City', 'https://media-1.api-sports.io/football/teams/50.png', 39, 1, 4, 4, 0, 0, 12),
(83, 'Tottenham', 'https://media-2.api-sports.io/football/teams/47.png', 39, 2, 4, 3, 1, 0, 10),
(84, 'West Ham', 'https://media-1.api-sports.io/football/teams/48.png', 39, 3, 4, 3, 1, 0, 10),
(85, 'Brighton', 'https://media-1.api-sports.io/football/teams/51.png', 39, 4, 4, 3, 0, 1, 9),
(86, 'Liverpool', 'https://media-1.api-sports.io/football/teams/40.png', 39, 5, 3, 2, 1, 0, 7),
(87, 'Arsenal', 'https://media-2.api-sports.io/football/teams/42.png', 39, 6, 3, 2, 1, 0, 7),
(88, 'Brentford', 'https://media-3.api-sports.io/football/teams/55.png', 39, 7, 4, 1, 3, 0, 6),
(89, 'Aston Villa', 'https://media-1.api-sports.io/football/teams/66.png', 39, 8, 3, 2, 0, 1, 6),
(90, 'Nottingham Forest', 'https://media-2.api-sports.io/football/teams/65.png', 39, 9, 4, 2, 0, 2, 6),
(91, 'Manchester United', 'https://media-3.api-sports.io/football/teams/33.png', 39, 10, 3, 2, 0, 1, 6),
(92, 'Chelsea', 'https://media-1.api-sports.io/football/teams/49.png', 39, 11, 4, 1, 1, 2, 4),
(93, 'Crystal Palace', 'https://media-3.api-sports.io/football/teams/52.png', 39, 12, 3, 1, 1, 1, 4),
(94, 'Fulham', 'https://media-3.api-sports.io/football/teams/36.png', 39, 13, 4, 1, 1, 2, 4),
(95, 'Newcastle', 'https://media-2.api-sports.io/football/teams/34.png', 39, 14, 4, 1, 0, 3, 3),
(96, 'Wolves', 'https://media-2.api-sports.io/football/teams/39.png', 39, 15, 3, 1, 0, 2, 3),
(97, 'Bournemouth', 'https://media-3.api-sports.io/football/teams/35.png', 39, 16, 4, 0, 2, 2, 2),
(98, 'Sheffield Utd', 'https://media-2.api-sports.io/football/teams/62.png', 39, 17, 4, 0, 1, 3, 1),
(99, 'Everton', 'https://media-2.api-sports.io/football/teams/45.png', 39, 18, 4, 0, 1, 3, 1),
(100, 'Luton', 'https://media-3.api-sports.io/football/teams/1359.png', 39, 19, 3, 0, 0, 3, 0),
(101, 'Burnley', 'https://media-3.api-sports.io/football/teams/44.png', 39, 20, 3, 0, 0, 3, 0),
(44, 'Monaco', 'https://media-3.api-sports.io/football/teams/91.png', 61, 1, 3, 2, 1, 0, 7),
(45, 'Marseille', 'https://media-3.api-sports.io/football/teams/81.png', 61, 2, 3, 2, 1, 0, 7),
(46, 'Reims', 'https://media-3.api-sports.io/football/teams/93.png', 61, 3, 3, 2, 0, 1, 6),
(47, 'Stade Brestois 29', 'https://media-2.api-sports.io/football/teams/106.png', 61, 4, 3, 2, 0, 1, 6),
(48, 'Strasbourg', 'https://media-1.api-sports.io/football/teams/95.png', 61, 5, 3, 2, 0, 1, 6),
(49, 'Rennes', 'https://media-1.api-sports.io/football/teams/94.png', 61, 6, 3, 1, 2, 0, 5),
(50, 'Lorient', 'https://media-2.api-sports.io/football/teams/97.png', 61, 7, 3, 1, 2, 0, 5),
(51, 'Paris Saint Germain', 'https://media-2.api-sports.io/football/teams/85.png', 61, 8, 3, 1, 2, 0, 5),
(52, 'Montpellier', 'https://media-2.api-sports.io/football/teams/82.png', 61, 9, 3, 1, 1, 1, 4),
(53, 'Lille', 'https://media-3.api-sports.io/football/teams/79.png', 61, 10, 3, 1, 1, 1, 4),
(54, 'Toulouse', 'https://media-3.api-sports.io/football/teams/96.png', 61, 11, 3, 1, 1, 1, 4),
(55, 'Metz', 'https://media-2.api-sports.io/football/teams/112.png', 61, 12, 3, 1, 1, 1, 4),
(56, 'Nice', 'https://media-1.api-sports.io/football/teams/84.png', 61, 13, 3, 0, 3, 0, 3),
(57, 'LE Havre', 'https://media-3.api-sports.io/football/teams/111.png', 61, 14, 3, 0, 2, 1, 2),
(58, 'Nantes', 'https://media-1.api-sports.io/football/teams/83.png', 61, 15, 3, 0, 1, 2, 1),
(59, 'Lens', 'https://media-1.api-sports.io/football/teams/116.png', 61, 16, 3, 0, 1, 2, 1),
(60, 'Lyon', 'https://media-2.api-sports.io/football/teams/80.png', 61, 17, 3, 0, 1, 2, 1),
(61, 'Clermont Foot', 'https://media-1.api-sports.io/football/teams/99.png', 61, 18, 3, 0, 0, 3, 0),
(24, 'AC Milan', 'https://media-2.api-sports.io/football/teams/489.png', 135, 1, 2, 2, 0, 0, 6),
(25, 'Napoli', 'https://media-2.api-sports.io/football/teams/492.png', 135, 2, 2, 2, 0, 0, 6),
(26, 'Inter', 'https://media-3.api-sports.io/football/teams/505.png', 135, 3, 2, 2, 0, 0, 6),
(27, 'Verona', 'https://media-1.api-sports.io/football/teams/504.png', 135, 4, 2, 2, 0, 0, 6),
(28, 'Fiorentina', 'https://media-2.api-sports.io/football/teams/502.png', 135, 5, 2, 1, 1, 0, 4),
(29, 'Juventus', 'https://media-2.api-sports.io/football/teams/496.png', 135, 6, 2, 1, 1, 0, 4),
(30, 'Lecce', 'https://media-2.api-sports.io/football/teams/867.png', 135, 7, 2, 1, 1, 0, 4),
(31, 'Atalanta', 'https://media-3.api-sports.io/football/teams/499.png', 135, 8, 2, 1, 0, 1, 3),
(32, 'Monza', 'https://media-1.api-sports.io/football/teams/1579.png', 135, 9, 2, 1, 0, 1, 3),
(33, 'Frosinone', 'https://media-3.api-sports.io/football/teams/512.png', 135, 10, 2, 1, 0, 1, 3),
(34, 'Genoa', 'https://media-1.api-sports.io/football/teams/495.png', 135, 11, 2, 1, 0, 1, 3),
(35, 'Salernitana', 'https://media-1.api-sports.io/football/teams/514.png', 135, 12, 2, 0, 2, 0, 2),
(36, 'AS Roma', 'https://media-1.api-sports.io/football/teams/497.png', 135, 13, 2, 0, 1, 1, 1),
(37, 'Bologna', 'https://media-2.api-sports.io/football/teams/500.png', 135, 14, 2, 0, 1, 1, 1),
(38, 'Cagliari', 'https://media-3.api-sports.io/football/teams/490.png', 135, 15, 2, 0, 1, 1, 1),
(39, 'Udinese', 'https://media-1.api-sports.io/football/teams/494.png', 135, 16, 2, 0, 1, 1, 1),
(40, 'Torino', 'https://media-2.api-sports.io/football/teams/503.png', 135, 17, 2, 0, 1, 1, 1),
(41, 'Lazio', 'https://media-2.api-sports.io/football/teams/487.png', 135, 18, 2, 0, 0, 2, 0),
(42, 'Empoli', 'https://media-3.api-sports.io/football/teams/511.png', 135, 19, 2, 0, 0, 2, 0),
(43, 'Sassuolo', 'https://media-1.api-sports.io/football/teams/488.png', 135, 20, 2, 0, 0, 2, 0),
(62, 'Real Madrid', 'https://media-2.api-sports.io/football/teams/541.png', 140, 1, 3, 3, 0, 0, 9),
(63, 'Atletico Madrid', 'https://media-1.api-sports.io/football/teams/530.png', 140, 2, 3, 2, 1, 0, 7),
(64, 'Girona', 'https://media-2.api-sports.io/football/teams/547.png', 140, 3, 3, 2, 1, 0, 7),
(65, 'Barcelona', 'https://media-1.api-sports.io/football/teams/529.png', 140, 4, 3, 2, 1, 0, 7),
(66, 'Athletic Club', 'https://media-3.api-sports.io/football/teams/531.png', 140, 5, 3, 2, 0, 1, 6),
(67, 'Valencia', 'https://media-1.api-sports.io/football/teams/532.png', 140, 6, 3, 2, 0, 1, 6),
(68, 'Osasuna', 'https://media-1.api-sports.io/football/teams/727.png', 140, 7, 3, 2, 0, 1, 6),
(69, 'Rayo Vallecano', 'https://media-1.api-sports.io/football/teams/728.png', 140, 8, 3, 2, 0, 1, 6),
(70, 'Real Betis', 'https://media-3.api-sports.io/football/teams/543.png', 140, 9, 3, 1, 1, 1, 4),
(71, 'Cadiz', 'https://media-2.api-sports.io/football/teams/724.png', 140, 10, 3, 1, 1, 1, 4),
(72, 'Getafe', 'https://media-2.api-sports.io/football/teams/546.png', 140, 11, 3, 1, 1, 1, 4),
(73, 'Real Sociedad', 'https://media-1.api-sports.io/football/teams/548.png', 140, 12, 3, 0, 3, 0, 3),
(74, 'Villarreal', 'https://media-3.api-sports.io/football/teams/533.png', 140, 13, 3, 1, 0, 2, 3),
(75, 'Alaves', 'https://media-1.api-sports.io/football/teams/542.png', 140, 14, 3, 1, 0, 2, 3),
(76, 'Granada CF', 'https://media-1.api-sports.io/football/teams/715.png', 140, 15, 3, 1, 0, 2, 3),
(77, 'Las Palmas', 'https://media-3.api-sports.io/football/teams/534.png', 140, 16, 3, 0, 2, 1, 2),
(78, 'Mallorca', 'https://media-3.api-sports.io/football/teams/798.png', 140, 17, 3, 0, 1, 2, 1),
(79, 'Celta Vigo', 'https://media-3.api-sports.io/football/teams/538.png', 140, 18, 3, 0, 1, 2, 1),
(80, 'Almeria', 'https://media-3.api-sports.io/football/teams/723.png', 140, 19, 3, 0, 1, 2, 1),
(81, 'Sevilla', 'https://media-3.api-sports.io/football/teams/536.png', 140, 20, 3, 0, 0, 3, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `league_id` (`league_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
