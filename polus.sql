-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 11 2024 г., 12:23
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
-- База данных: `polus`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `master_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `message`, `master_id`, `request_id`) VALUES
(1, 'Интересно...', 2, 1),
(2, 'Будем разбираться!', 3, 2),
(3, 'Сделаем всё на высшем уровне!', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `orgTechTypes`
--

CREATE TABLE `orgTechTypes` (
  `id` int(11) NOT NULL,
  `org_tech_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orgTechTypes`
--

INSERT INTO `orgTechTypes` (`id`, `org_tech_type`) VALUES
(1, 'Компьютер'),
(2, 'Ноутбук'),
(3, 'Принтер');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `org_tech_type_id` int(11) NOT NULL,
  `org_tech_model` varchar(255) NOT NULL,
  `problem_descryption` text NOT NULL,
  `request_status_id` int(11) NOT NULL,
  `completion_date` date NOT NULL,
  `repair_parts` text NOT NULL,
  `master_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`id`, `start_date`, `org_tech_type_id`, `org_tech_model`, `problem_descryption`, `request_status_id`, `completion_date`, `repair_parts`, `master_id`, `client_id`) VALUES
(1, '2023-06-06', 1, 'DEXP Aquilon O286', 'Перестал работать', 1, '2023-06-06', '', 2, 7),
(2, '2023-05-05', 1, 'DEXP Atlas H388', 'Перестал работать', 1, '2023-05-05', '', 3, 8),
(3, '2022-07-07', 2, 'MSI GF76 Katana 11UC-879XRU черный', 'Выключается', 2, '2023-01-01', '', 3, 9),
(4, '2023-08-02', 2, 'MSI Modern 15 B12M-211RU черный', 'Выключается', 3, '2023-08-02', '', 0, 8),
(5, '2023-08-02', 3, 'HP LaserJet Pro M404dn', 'Перестала включаться', 3, '2023-08-02', '', 0, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `requestStatuses`
--

CREATE TABLE `requestStatuses` (
  `id` int(11) NOT NULL,
  `request_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requestStatuses`
--

INSERT INTO `requestStatuses` (`id`, `request_status`) VALUES
(1, 'В процессе ремонта'),
(2, 'Готова к выдаче'),
(3, 'Новая заявка');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `type`) VALUES
(1, 'Менеджер'),
(2, 'Мастер'),
(3, 'Оператор'),
(4, 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fio`, `phone`, `login`, `password`, `type_id`) VALUES
(1, 'Носов Иван Михайлович', '89210563128', 'login1', 'a722c63db8ec8625af6cf71cb8c2d939', 1),
(2, 'Ильин Александр Андреевич', '89535078985', 'login2', 'c1572d05424d0ecb2a65ec6a82aeacbf', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', '3afc79b597f88a72528e864cf81856d2', 2),
(4, 'Елисеев Артём Леонидович', '89990563748', 'login4', 'fc2921d9057ac44e549efaf0048b2512', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'd35f6fa9a79434bcd17f8049714ebfcb', 3),
(6, 'Григорьев Семён Викторович', '89219567849', 'login11', '0102812fbd5f73aa18aa0bae2cd8f79f', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567841', 'login12', '0bd0fe6372c64e09c4ae81e056a9dbda', 4),
(8, 'Белоусов Егор Ярославович', '89219567842', 'login13', 'c868bff94e54b8eddbdbce22159c0299', 4),
(9, 'Суслов Михаил Александрович', '89219567843', 'login14', 'd1f38b569c772ebb8fa464e1a90c5a00', 4),
(10, 'Васильев Вячеслав Александрович', '89219567844', 'login15', 'b279786ec5a7ed00dbe4d3fe1516c121', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `org_tech_type` (`org_tech_type`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `org_tech_type_id` (`org_tech_type_id`),
  ADD KEY `request_status_id` (`request_status_id`);

--
-- Индексы таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_status` (`request_status`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `type_id` (`type_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`);

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`request_status_id`) REFERENCES `requestStatuses` (`id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`org_tech_type_id`) REFERENCES `orgTechTypes` (`id`),
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
