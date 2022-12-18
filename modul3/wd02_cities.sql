-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 14, 2021 lúc 01:54 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `wd02_cities`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `district` varchar(150) NOT NULL,
  `population` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_code`, `district`, `population`) VALUES
(1, 'Jining', 'CN', 'Jining', 800000),
(2, 'Kaiyuan', 'CN', 'Kaiyuan', 5000000),
(3, 'New York', 'USA', 'New York', 10000000),
(4, 'Vĩnh Long', 'VN', 'Vĩnh Long', 1000000),
(5, 'Springfield', 'USA', 'Springfield', 4500000),
(6, 'Kansas City', 'USA', 'Kansas City', 9675000),
(7, 'Richmond     ', 'USA', 'Richmond', 4700000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `code` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `continent` varchar(50) NOT NULL,
  `independence_year` int(10) NOT NULL,
  `population` int(10) NOT NULL,
  `gnp` float NOT NULL,
  `head_of_state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`code`, `name`, `continent`, `independence_year`, `population`, `gnp`, `head_of_state`) VALUES
('CN', 'China', 'Asia', 1900, 1500000000, 29987.6, 'Tập Cận Bình'),
('USA', 'United Stated', 'Americas', 1810, 700000000, 48978.3, 'Donal Trump'),
('VN', 'Việt Nam', 'Asia', 1975, 90000000, 4700, 'Nguyễn Xuân Phúc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

CREATE TABLE `languages` (
  `country_code` varchar(20) NOT NULL,
  `language` varchar(150) NOT NULL,
  `official` varchar(50) NOT NULL,
  `percentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `languages`
--

INSERT INTO `languages` (`country_code`, `language`, `official`, `percentage`) VALUES
('CN', 'Phồn thể', 'T', 80.6),
('USA', 'English', 'T', 97.2),
('VN', 'Tiếng việt', 'T', 71.3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Country` (`country_code`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`country_code`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `FK_Country` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `FK_Countries` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
