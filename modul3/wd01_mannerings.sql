-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 01, 2021 lúc 04:14 AM
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
-- Cơ sở dữ liệu: `wd01_mannerings`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `houses`
--

CREATE TABLE `houses` (
  `Refno` int(11) NOT NULL,
  `Town` text NOT NULL,
  `Type` text NOT NULL,
  `Bedrooms` int(10) NOT NULL,
  `Price` float NOT NULL,
  `Heating` varchar(5) NOT NULL,
  `Garage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `houses`
--

INSERT INTO `houses` (`Refno`, `Town`, `Type`, `Bedrooms`, `Price`, `Heating`, `Garage`) VALUES
(13678, 'Croydon', 'Detached', 4, 250000, 'Yes', 'Double'),
(13679, 'Croydon', 'Semi-Detached', 3, 165000, 'No', 'Single'),
(13700, 'Redhill', 'Flat', 2, 110000, 'Yes', 'None'),
(13702, 'Crawley', 'Detached', 4, 220000, 'Yes', 'Double'),
(13703, 'Crawley', 'Semi-Detached', 4, 145000, 'Yes', 'Single'),
(13705, 'Croydon', 'Terrace', 3, 95000, 'No', 'None'),
(13708, 'Brighton', 'Terrace', 3, 150000, 'Yes', 'None'),
(13709, 'Redhill', 'Detached', 3, 165000, 'Yes', 'Single'),
(13711, 'Crawley', 'Detached', 3, 175000, 'Yes', 'Double'),
(13712, 'Brighton', 'Flat', 2, 75000, 'Yes', 'None');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`Refno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
