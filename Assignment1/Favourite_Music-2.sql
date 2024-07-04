-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 04-07-2024 a las 03:48:55
-- Versión del servidor: 5.7.39
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Favourite Music`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Albums`
--

CREATE TABLE `Albums` (
  `Album_ID` int(20) NOT NULL,
  `Album_Name` varchar(50) DEFAULT NULL,
  `Album_Year` int(4) DEFAULT NULL,
  `Album_Artist` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Albums`
--

INSERT INTO `Albums` (`Album_ID`, `Album_Name`, `Album_Year`, `Album_Artist`) VALUES
(1, 'Born Pink', 2022, 'Blackpink'),
(2, 'CONTINUUM', 2023, 'VIXX'),
(3, 'Dear Insanity..', 2023, 'DPR IAN'),
(4, 'Diamonds and Dancefloors', 2023, 'Ava Max'),
(5, 'Eau de VIXX', 2018, 'VIXX'),
(6, 'Heaven & Hell', 2020, 'Ava Max'),
(7, 'Moodswings In To Order', 2022, 'DPR IAN'),
(8, 'The Album', 2020, 'Blackpink');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `songs`
--

CREATE TABLE `songs` (
  `Album_ID` int(1) DEFAULT NULL,
  `Song_ID` int(2) NOT NULL,
  `Song_Name` varchar(29) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `songs`
--

INSERT INTO `songs` (`Album_ID`, `Song_ID`, `Song_Name`) VALUES
(1, 1, 'Pink Venom'),
(1, 2, 'Shut Down'),
(1, 3, 'Typa Girl'),
(1, 4, 'Yeah Yeah Yeah'),
(1, 5, 'Hard to Love'),
(1, 6, 'The Happiest Girl'),
(1, 7, 'Tally'),
(1, 8, 'Ready For Love'),
(2, 9, 'Amnesia'),
(2, 10, 'Chemical'),
(2, 11, 'LILAC'),
(2, 12, 'SAVAGE'),
(2, 13, 'If You Come Tonight'),
(3, 14, 'Famous Last Words'),
(3, 15, 'Welcome To The Other Side'),
(3, 16, 'Don\'t Go Insane'),
(3, 17, 'Bad Cold'),
(3, 18, 'So I Danced'),
(3, 19, 'Peanut Butter & Tears'),
(3, 20, 'Violet Crazy'),
(4, 21, 'Million Dollar Baby'),
(4, 22, 'Sleepwalker'),
(4, 23, 'Maybe You\'re The Problem'),
(4, 24, 'Ghost'),
(4, 25, 'Hold Up (Wait A Minute)'),
(4, 26, 'Weapons'),
(4, 27, 'Diamonds & Dancefloors'),
(4, 28, 'In The Dark'),
(4, 29, 'Turn Off The Lights'),
(4, 30, 'One Of Us'),
(4, 31, 'Get Outta My Heart'),
(4, 32, 'Cold As Ice'),
(4, 33, 'Last Night On Earth'),
(4, 34, 'Dancing\'s Done'),
(5, 35, 'Scentist'),
(5, 36, 'Odd Sense'),
(5, 37, 'Silence'),
(5, 38, 'My Valentine'),
(5, 39, 'Circle'),
(5, 40, 'Good Day'),
(5, 41, 'Escape'),
(5, 42, 'Trigger'),
(5, 43, 'Resemble'),
(5, 44, 'Navi & Shining Gold'),
(5, 45, 'Shangri-La'),
(5, 46, 'Scentist (Instrumental)'),
(6, 47, 'My Head & My Heart'),
(6, 48, 'H.E.A.V.E.N'),
(6, 49, 'Kings & Queens'),
(6, 50, 'Naked'),
(6, 51, 'Tatto'),
(6, 52, 'OMG What\'s Hapenning'),
(6, 53, 'Call Me Tonight'),
(6, 54, 'Born To The Night'),
(6, 55, 'Torn'),
(6, 56, 'Take You To Hell'),
(6, 57, 'Who\'s Laughing Now'),
(6, 58, 'Belladonna'),
(6, 59, 'Rummors'),
(6, 60, 'So Am I'),
(6, 61, 'Salt'),
(6, 62, 'Sweet but Psycho'),
(7, 63, 'Seraph'),
(7, 64, '1 Shot'),
(7, 65, 'Mood'),
(7, 66, 'Miss Understood'),
(7, 67, 'Avalon'),
(7, 68, 'Merry Go'),
(7, 69, 'Ribbon'),
(7, 70, 'Winterfall'),
(7, 71, 'Calico'),
(7, 72, 'Mr. Insanity'),
(7, 73, 'Ballroom Extravaganza'),
(7, 74, 'Sometimes I\'m'),
(8, 75, 'How You Like That'),
(8, 76, 'Ice Cream'),
(8, 77, 'Pretty Savage'),
(8, 78, 'Bet You Wanna (feat. Cardi B)'),
(8, 79, 'Lovesick Girls'),
(8, 80, 'Crazy Over You'),
(8, 81, 'Love To Hate Me'),
(8, 82, 'You Never Know');

--
-- Disparadores `songs`
--
DELIMITER $$
CREATE TRIGGER `after_song_insert` AFTER INSERT ON `songs` FOR EACH ROW BEGIN
    INSERT INTO song_additions_log (song_id, album_id, song_name)
    VALUES (NEW.Song_ID, NEW.Album_ID, NEW.Song_Name);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song_additions_log`
--

CREATE TABLE `song_additions_log` (
  `log_id` int(11) NOT NULL,
  `song_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `song_name` varchar(29) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`Album_ID`);

--
-- Indices de la tabla `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`Song_ID`),
  ADD KEY `albums_1` (`Album_ID`);

--
-- Indices de la tabla `song_additions_log`
--
ALTER TABLE `song_additions_log`
  ADD PRIMARY KEY (`log_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `song_additions_log`
--
ALTER TABLE `song_additions_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `albums_1` FOREIGN KEY (`Album_ID`) REFERENCES `Albums` (`Album_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
