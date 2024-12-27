-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 27 2024 г., 14:38
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `TrifonovaM`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bilet`
--

CREATE TABLE `bilet` (
  `id` int(11) NOT NULL,
  `number` int(255) NOT NULL,
  `forma_id` int(11) NOT NULL,
  `prikaz_date` date NOT NULL,
  `number_prikaza` varchar(255) NOT NULL,
  `get_bilet_date` date NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `bilet`
--

INSERT INTO `bilet` (`id`, `number`, `forma_id`, `prikaz_date`, `number_prikaza`, `get_bilet_date`, `user_id`, `student_id`) VALUES
(1, 3477, 1, '2017-08-22', '77-у', '2001-09-22', 1, 2),
(2, 3477, 1, '2017-08-22', '77-у', '2001-09-22', 1, 2),
(3, 3477, 1, '2017-08-22', '77-у', '2001-09-22', 1, 2),
(4, 3477, 1, '2017-08-22', '77-у', '2001-09-22', 1, 2),
(5, 7770, 1, '2024-12-27', '234', '2024-12-27', 1, 4),
(6, 7770, 1, '2024-12-27', '234', '2024-12-27', 1, 4),
(7, 7771, 1, '2024-12-27', '222', '2024-12-27', 1, 4),
(8, 7770, 1, '2024-12-27', '222', '2024-12-27', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `forma`
--

CREATE TABLE `forma` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `forma`
--

INSERT INTO `forma` (`id`, `name`) VALUES
(5, 'группа выходного дня'),
(4, 'дистанционная'),
(3, 'заочная'),
(1, 'очная'),
(2, 'очно-заочная'),
(6, 'экстернат');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'студент'),
(2, 'преподаватель');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fio`, `role_id`) VALUES
(1, 'teacher', '5f4dcc3b5aa765d61d8327deb882cf99', 'Сергеев Сергей Сергеевич', 2),
(2, 'nik', '827ccb0eea8a706c4c34a16891f84e7b', 'Трифонова Марина Павловна', 1),
(3, '1', 'e10adc3949ba59abbe56e057f20f883e', 'й', 1),
(4, 'log12', '827ccb0eea8a706c4c34a16891f84e7b', 'Петров Петр Петрович', 1),
(5, 'log11', '827ccb0eea8a706c4c34a16891f84e7b', 'Трифонова Марина Павловна', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `forma` (`forma_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Индексы таблицы `forma`
--
ALTER TABLE `forma`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bilet`
--
ALTER TABLE `bilet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `forma`
--
ALTER TABLE `forma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`forma_id`) REFERENCES `forma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
