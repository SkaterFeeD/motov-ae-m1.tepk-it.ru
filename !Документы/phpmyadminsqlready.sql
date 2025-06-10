-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 10 2025 г., 09:19
-- Версия сервера: 8.0.42-0ubuntu0.24.04.1
-- Версия PHP: 8.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `motov-ae_m1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `material_type_id` int NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` int NOT NULL,
  `minQuantity` int NOT NULL,
  `packageQuantity` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `name`, `material_type_id`, `price`, `quantity`, `minQuantity`, `packageQuantity`, `unit_id`) VALUES
(1, 'Бумага-основа с покрытием для флизелиновых обоев', 1, 1700.00, 2500, 1000, 100, 1),
(2, 'Бумага-основа для флизелиновых обоев', 1, 1500.00, 3000, 1000, 100, 1),
(3, 'Бумага обойная для вспененных виниловых обоев', 1, 1200.00, 1500, 1000, 100, 1),
(4, 'Концентрат водоразбавляемой печатной краски', 2, 1500.00, 550, 500, 200, 2),
(5, 'Перламутровый пигмент', 2, 3100.00, 200, 100, 10, 2),
(6, 'Сухой клей на основе ПВС', 3, 360.00, 700, 500, 50, 2),
(7, 'Флизелин', 1, 1600.00, 2000, 1000, 140, 1),
(8, 'Стирол-акриловая дисперсия для производства обоев', 4, 14.90, 2000, 880, 220, 3),
(9, 'Стирол-акриловая дисперсия для гидрофобных покрытий', 4, 14.90, 1200, 880, 220, 3),
(10, 'Акрилат-винилацетатная дисперсия для производства бумаги', 4, 15.50, 1000, 660, 220, 3),
(11, 'Цветная пластизоль', 2, 650.00, 200, 100, 5, 2),
(12, 'Дисперсия анионно-стабилизированного стирол-акрилового сополимера', 3, 170.00, 800, 660, 220, 3),
(13, 'Водорастворимая краска водная', 2, 500.00, 400, 300, 25, 2),
(14, 'Диспергатор минеральных пигментов и наполнителей', 4, 16.00, 400, 360, 120, 3),
(15, 'Ассоциативный акриловый загуститель', 4, 16.50, 400, 360, 120, 3),
(16, 'Водорастворимая краска спецводная ', 2, 700.00, 350, 300, 25, 2),
(17, 'Металлический пигмент', 2, 4100.00, 250, 100, 15, 2),
(18, 'Акриловая дисперсия', 4, 14.90, 1000, 880, 220, 3),
(19, 'Бумага-основа для обоев марки АФ', 1, 1200.00, 2000, 1000, 100, 1),
(20, 'Бумага с подложкой устойчивая к атмосферным воздействиям', 1, 3500.00, 2000, 800, 50, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `material_types`
--

CREATE TABLE `material_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `defect` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `material_types`
--

INSERT INTO `material_types` (`id`, `name`, `defect`) VALUES
(1, 'Бумага', 0.70),
(2, 'Краска', 0.50),
(3, 'Клей', 0.15),
(4, 'Дисперсия', 0.20);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_type_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `article` varchar(255) NOT NULL,
  `minPrice` decimal(18,2) NOT NULL,
  `width` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `product_type_id`, `name`, `article`, `minPrice`, `width`) VALUES
(1, 1, 'Обои из природного материала Традиционный принт светло-коричневые', '1549922', 16950.00, 0.91),
(2, 2, 'Фотообои флизелиновые Горы 500x270 см', '2018556', 15880.00, 0.50),
(3, 3, 'Обои под покраску флизелиновые Рельеф', '3028272', 11080.00, 0.75),
(4, 4, 'Стеклообои Рогожка белые', '4029272', 5898.00, 1.00),
(5, 1, 'Обои флизелиновые Эвелин светло-серые', '1028248', 15200.00, 1.06),
(6, 2, 'Фотообои флизелиновые 3D Лес и горы 300x280 см', '2118827', 12500.96, 0.30),
(7, 3, 'Обои под покраску флизелиновые цвет белый', '3130981', 4320.56, 1.06),
(8, 4, 'Стеклохолст', '4029784', 2998.99, 1.00),
(9, 1, 'Флизелиновые обои Принт Вензель серые', '1658953', 16200.96, 0.68),
(10, 2, 'Фотообои флизелиновые Узор 300x270 см', '2026662', 8780.69, 0.30),
(11, 3, 'Обои под покраску флизелиновые Кирпичная стена', '3159043', 15750.00, 1.06),
(12, 4, 'Стеклообои Средняя елка белые', '4588376', 5500.00, 1.00),
(13, 1, 'Обои бумажные Полосы цвет бежевый', '1758375', 13500.96, 0.68),
(14, 2, 'Фотообои Тропики 290x260 см', '2759324', 6980.00, 0.29),
(15, 3, 'Обои под покраску Рисунок Штукатурка белые', '3118827', 5890.00, 1.06),
(16, 4, 'Стеклообои Геометрические фигуры белые ', '4559898', 5369.00, 1.00),
(17, 1, 'Обои флизелиновые Лилия бежевые', '1259474', 9750.79, 1.06),
(18, 2, 'Фотообои флизелиновые 3D Пейзаж 300x280 см', '2115947', 16850.00, 0.30),
(19, 3, 'Обои под покраску флизелиновые однотонные цвет белый ', '3033136', 3390.00, 1.06),
(20, 4, 'Стеклохолст малярный Паутинка', '4028048', 1750.00, 1.00);

-- --------------------------------------------------------

--
-- Структура таблицы `product_materials`
--

CREATE TABLE `product_materials` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `material_id` int NOT NULL,
  `quantity` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product_materials`
--

INSERT INTO `product_materials` (`id`, `product_id`, `material_id`, `quantity`) VALUES
(1, 5, 10, 1.95),
(2, 12, 10, 0.21),
(3, 14, 18, 1.50),
(4, 18, 18, 1.00),
(5, 10, 18, 1.00),
(6, 1, 15, 0.50),
(7, 16, 15, 0.50),
(8, 11, 3, 2.55),
(9, 16, 3, 3.60),
(10, 12, 3, 2.50),
(11, 1, 20, 2.90),
(12, 11, 20, 2.55),
(13, 6, 20, 1.80),
(14, 18, 20, 2.20),
(15, 2, 20, 3.40),
(16, 13, 19, 3.60),
(17, 15, 19, 3.70),
(18, 14, 19, 1.60),
(19, 10, 19, 3.56),
(20, 5, 2, 4.60),
(21, 3, 1, 2.50),
(22, 9, 1, 3.50),
(23, 5, 16, 3.50),
(24, 9, 16, 5.25),
(25, 18, 16, 5.00),
(26, 10, 16, 3.50),
(27, 13, 13, 4.75),
(28, 1, 13, 3.00),
(29, 15, 14, 1.30),
(30, 19, 14, 1.30),
(31, 7, 14, 1.80),
(32, 4, 14, 0.20),
(33, 8, 14, 0.20),
(34, 9, 14, 0.25),
(35, 1, 12, 0.20),
(36, 19, 12, 0.20),
(37, 5, 12, 0.50),
(38, 16, 12, 0.20),
(39, 20, 12, 0.25),
(40, 14, 12, 0.50),
(41, 6, 12, 0.50),
(42, 18, 12, 0.70),
(43, 2, 12, 1.00),
(44, 10, 12, 0.50),
(45, 17, 4, 2.55),
(46, 14, 4, 2.00),
(47, 6, 4, 2.00),
(48, 2, 4, 1.00),
(49, 5, 17, 0.45),
(50, 4, 17, 0.30),
(51, 9, 17, 1.00),
(52, 13, 5, 1.00),
(53, 1, 5, 0.50),
(54, 12, 5, 0.35),
(55, 18, 5, 1.25),
(56, 15, 9, 1.00),
(57, 11, 9, 1.00),
(58, 13, 8, 0.15),
(59, 19, 8, 1.00),
(60, 3, 8, 1.20),
(61, 7, 8, 1.20),
(62, 17, 8, 1.00),
(63, 6, 8, 1.20),
(64, 2, 8, 0.33),
(65, 13, 6, 0.50),
(66, 11, 6, 2.90),
(67, 7, 6, 1.40),
(68, 17, 6, 1.70),
(69, 8, 6, 0.30),
(70, 9, 6, 1.00),
(71, 19, 7, 1.50),
(72, 3, 7, 2.50),
(73, 7, 7, 1.75),
(74, 17, 7, 1.85),
(75, 4, 7, 2.20),
(76, 8, 7, 1.30),
(77, 20, 7, 0.80),
(78, 3, 11, 1.65),
(79, 14, 11, 1.25),
(80, 6, 11, 1.00);

-- --------------------------------------------------------

--
-- Структура таблицы `product_types`
--

CREATE TABLE `product_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `coefficient` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `coefficient`) VALUES
(1, 'Декоративные обои', 5.50),
(2, 'Фотообои', 7.54),
(3, 'Обои под покраску', 3.25),
(4, 'Стеклообои', 2.50);

-- --------------------------------------------------------

--
-- Структура таблицы `units`
--

CREATE TABLE `units` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'рул'),
(2, 'кг'),
(3, 'л');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `materials_index_0` (`material_type_id`),
  ADD KEY `materials_index_1` (`unit_id`);

--
-- Индексы таблицы `material_types`
--
ALTER TABLE `material_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `products_index_0` (`product_type_id`);

--
-- Индексы таблицы `product_materials`
--
ALTER TABLE `product_materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `product_materials_index_0` (`product_id`),
  ADD KEY `product_materials_index_1` (`material_id`);

--
-- Индексы таблицы `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `material_types`
--
ALTER TABLE `material_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `product_materials`
--
ALTER TABLE `product_materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `units`
--
ALTER TABLE `units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`material_type_id`) REFERENCES `material_types` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `materials_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_materials`
--
ALTER TABLE `product_materials`
  ADD CONSTRAINT `product_materials_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_materials_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
