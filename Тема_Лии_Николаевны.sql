-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 30 2024 г., 08:20
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
-- База данных: `biblioteka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `frequency`
--

CREATE TABLE `frequency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `frequency`
--

INSERT INTO `frequency` (`id`, `name`) VALUES
(1, 'еженедельно'),
(2, 'ежемесячно'),
(3, 'ежегодно');

-- --------------------------------------------------------

--
-- Структура таблицы `numbersReceived`
--

CREATE TABLE `numbersReceived` (
  `id` int(11) NOT NULL,
  `id_subscription` int(11) DEFAULT NULL,
  `date_receipt` date DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `numbersReceived`
--

INSERT INTO `numbersReceived` (`id`, `id_subscription`, `date_receipt`, `id_employee`) VALUES
(1, 1, '2024-10-02', 1),
(2, 2, '2024-10-03', 2),
(3, 3, '2024-10-02', 3),
(4, 4, '2024-10-02', 4),
(5, 5, '2024-10-03', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `name`) VALUES
(1, 'администратор'),
(2, 'библиотекарь'),
(3, 'доставщик'),
(4, 'пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `frequency_id` int(11) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`id`, `name`, `code`, `type_id`, `frequency_id`, `cost`) VALUES
(1, 'Мир технологий', 123456, 1, 2, 500),
(2, 'Новости дня', 654321, 2, 1, 150),
(3, 'Здоровье и жизнь', 789012, 1, 2, 450),
(4, 'Спортивные события', 345678, 2, 1, 200),
(5, 'Кулинарные рецепты', 901234, 1, 2, 300),
(6, 'Учебник биологии', 534243, 3, 3, 1000),
(7, 'Учебник Истории', 623521, 3, 3, 1100),
(8, 'Учебник Информатики', 979243, 3, 3, 3000),
(9, 'Учебник Литературы', 534272, 3, 3, 1500);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'активна'),
(2, 'завершена');

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptionHistory`
--

CREATE TABLE `subscriptionHistory` (
  `id` int(11) NOT NULL,
  `id_subscription` int(11) NOT NULL,
  `change_date` date DEFAULT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `subscriptionHistory`
--

INSERT INTO `subscriptionHistory` (`id`, `id_subscription`, `change_date`, `status_id`) VALUES
(1, 1, '2024-10-02', 2),
(2, 2, '2024-10-02', 1),
(3, 3, '2024-10-02', 2),
(4, 4, '2024-10-02', 2),
(5, 5, '2024-10-02', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `id_ publication` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `type_delivery_id` int(11) NOT NULL,
  `expected_delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `id_ publication`, `date_start`, `date_end`, `type_delivery_id`, `expected_delivery_date`) VALUES
(1, 1, '2024-10-02', '2024-10-02', 1, '2024-10-02'),
(2, 2, '2024-10-02', '2024-10-02', 2, '2024-10-03'),
(3, 3, '2024-10-02', '2024-10-02', 3, '2024-10-02'),
(4, 4, '2024-10-02', '2024-10-02', 1, '2024-10-02'),
(5, 5, '2024-10-02', '2024-10-02', 2, '2024-10-03');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Журнал'),
(2, 'Газета'),
(3, 'Учебник');

-- --------------------------------------------------------

--
-- Структура таблицы `typeDelivery`
--

CREATE TABLE `typeDelivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `typeDelivery`
--

INSERT INTO `typeDelivery` (`id`, `name`) VALUES
(1, 'курьер'),
(2, 'почта'),
(3, 'яндекс доставка');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `fio`, `post_id`, `username`, `password`) VALUES
(1, 'Иван Иванов Иванович', 1, 'copp', '5f4dcc3b5aa765d61d8327deb882cf99'),
(2, 'Алексеев Алексей Алексеевич', 2, 'log1', '1a1dc91c907325c69271ddf0c944bc72'),
(3, 'Артемов Артем Артемович', 3, 'log2', '1a1dc91c907325c69271ddf0c944bc72'),
(4, 'Артуров Артур Артурович', 2, 'log3', '1a1dc91c907325c69271ddf0c944bc72'),
(5, 'Денисов Денис Денисович', 3, 'log4', '1a1dc91c907325c69271ddf0c944bc72'),
(6, 'Сергей Сергеев Сергеевич', 2, 'nik', 'e10adc3949ba59abbe56e057f20f883e'),
(7, 'никто', 4, 'nikto', 'e10adc3949ba59abbe56e057f20f883e'),
(8, 'никто', 4, 'log', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `frequency`
--
ALTER TABLE `frequency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `numbersReceived`
--
ALTER TABLE `numbersReceived`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subscription` (`id_subscription`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `type` (`type_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `frequency` (`frequency_id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptionHistory`
--
ALTER TABLE `subscriptionHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subscription` (`id_subscription`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ publication` (`id_ publication`),
  ADD KEY `type_delivery_id` (`type_delivery_id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `typeDelivery`
--
ALTER TABLE `typeDelivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `post_id` (`post_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `frequency`
--
ALTER TABLE `frequency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `numbersReceived`
--
ALTER TABLE `numbersReceived`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `subscriptionHistory`
--
ALTER TABLE `subscriptionHistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `typeDelivery`
--
ALTER TABLE `typeDelivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `numbersReceived`
--
ALTER TABLE `numbersReceived`
  ADD CONSTRAINT `numbersReceived_ibfk_1` FOREIGN KEY (`id_subscription`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `numbersReceived_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publications_ibfk_2` FOREIGN KEY (`frequency_id`) REFERENCES `frequency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subscriptionHistory`
--
ALTER TABLE `subscriptionHistory`
  ADD CONSTRAINT `subscriptionHistory_ibfk_1` FOREIGN KEY (`id_subscription`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscriptionHistory_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`id_ publication`) REFERENCES `publications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`type_delivery_id`) REFERENCES `typeDelivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
