-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 26 2020 г., 21:38
-- Версия сервера: 10.2.22-MariaDB
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
(5, '614ed7897d4cca4a56482fab086c7dae.png', 443, '2020-06-26', 9, 1),
(6, '18b802a355d1990be68c1810d1577010.jpg', 499, '2020-06-26', 2, 1),
(7, 'e51710ba1b89d470ae6af0db42fdf207.png', 511, '2020-06-26', 8, 1),
(8, '979728088ee3fa262d5b6c137cb704f1.png', 463, '2020-06-26', 6, 1),
(9, '8f8aea9420dfe57857503ad4cfeb0ced.jpg', 485, '2020-06-26', 6, 1),
(10, '04822b4b1e900f7844e7476cc2216750.jpg', 527, '2020-06-26', 10, 1),
(11, 'aae900d36ea250f8397ced5c8228fd57.webp', 546, '2020-06-26', 7, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
