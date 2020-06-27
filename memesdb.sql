-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 27 2020 г., 09:45
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `memesdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `memes`
--

CREATE TABLE `memes` (
  `id` int(11) NOT NULL,
  `name` varchar(37) NOT NULL,
  `elo` int(11) NOT NULL,
  `addDate` date NOT NULL,
  `click` int(11) NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `memes`
--

INSERT INTO `memes` (`id`, `name`, `elo`, `addDate`, `click`, `author`) VALUES
(17, '24d8340cc70e7bc39a4b645b7c9e187b.jpg', 474, '2020-06-26', 7, 1),
(18, 'c1040cf1ab04afcc9b3dcee0315dcb1e.jpg', 519, '2020-06-26', 4, 1),
(19, 'a83ca87c2ca49ffd036c8ebc4636c8bb.jpg', 538, '2020-06-26', 4, 1),
(20, 'd812339461466243863980a7d04f0b07.jpg', 472, '2020-06-26', 5, 1),
(21, '0edf95128be60e0bf506d3d9a7490bae.jpg', 546, '2020-06-26', 5, 1),
(22, '798179a4095a9048048762cf54b2b73d.jpg', 517, '2020-06-26', 4, 1),
(23, 'b67f5b0224de419da630544212a371bf.jpg', 481, '2020-06-26', 6, 1),
(24, 'c45acd511380f15529ed4f044548f629.jpg', 519, '2020-06-26', 2, 1),
(25, '99e8ec263e51d2d413eb7c0809c14fd6.jpg', 479, '2020-06-26', 2, 1),
(26, '2aaef1eaeec56d923910505f91cd511a.jpg', 471, '2020-06-26', 5, 1),
(27, 'da25ebf3d1071bb6f4bebc550341f84d.jpg', 481, '2020-06-26', 2, 1),
(28, 'a13c61774daa1430316425046c9affe5.jpg', 500, '2020-06-26', 2, 1),
(29, '05344031d0a73174b0e4031672327901.jpg', 528, '2020-06-26', 3, 1),
(30, 'e9ac772486f467bf12dbff3ec9a35258.jpg', 481, '2020-06-26', 2, 1),
(31, '6b85f175a168fd433692023cd68eb336.jpg', 501, '2020-06-26', 2, 1),
(32, 'ec925325602a167bc1cb4daf7ff90144.jpg', 508, '2020-06-26', 5, 1),
(33, '0782f8a129b23ce0fd50305886c459bc.jpg', 482, '2020-06-26', 4, 1),
(34, '88cdf5f47beaf270ccce067b5c3beb82.jpg', 482, '2020-06-26', 4, 1),
(35, '636b09f0a73f6ffcca8c61a395b8b768.jpg', 491, '2020-06-26', 1, 1),
(36, '89e62c4058a814777b81e9157820ac05.jpg', 491, '2020-06-26', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(15) NOT NULL,
  `regDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `regDate`) VALUES
(1, 'admin', 'admin', '2020-06-26');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `memes`
--
ALTER TABLE `memes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `memes`
--
ALTER TABLE `memes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `memes`
--
ALTER TABLE `memes`
  ADD CONSTRAINT `memes_ibfk_1` FOREIGN KEY (`author`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
