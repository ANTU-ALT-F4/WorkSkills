-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 14, 2021 lúc 01:53 PM
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
-- Cơ sở dữ liệu: `wd04_products`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id_account`, `email`, `pass`, `create_date`) VALUES
(1, 'nvana@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 19:34:58'),
(2, 'vanm@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(3, 'vann@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(4, 'vanv@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(5, 'vanr@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(6, 'vanj@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(7, 'vanb@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(8, 'vaga@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(9, 'vanf@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00'),
(10, 'vand@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-06-29 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_product_category` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id_product`, `id_product_category`, `id_account`, `name`, `image`, `price`) VALUES
(1, 1, 1, 'dien thoai 1', 'ip.jpg', '1000'),
(2, 2, 2, 'dien thoai 2', '', '5000'),
(3, 3, 3, 'dien thoai 3', '', '3000'),
(4, 4, 4, 'dien thoai 4', '', '4000'),
(5, 5, 5, 'dien thoai 5', '', '5000'),
(6, 6, 6, 'dien thoai 6', '', '6000'),
(7, 7, 7, 'dien thoai 7', '', '7000'),
(8, 8, 8, 'dien thoai 8', '', '8000'),
(9, 9, 9, 'dien thoai 9', '', '9000'),
(10, 10, 10, 'dien thoai 10', '', '10000'),
(14, 1, 1, 'huy ', '1500', '1500'),
(15, 4, 1, 'điện thoại giá rẻ', '15000', '15000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `id_product_category` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_category`
--

INSERT INTO `product_category` (`id_product_category`, `name`, `description`) VALUES
(1, 'Smartphone', 'mo ta 1'),
(2, 'Bphone', 'mo ta 2'),
(3, 'Iphone', 'mo ta 2'),
(4, 'Dphone', 'mo ta 2'),
(5, 'Jphone', 'mo ta 2'),
(6, 'Gphone', 'mo ta 2'),
(7, 'Fphone', 'mo ta 2'),
(8, 'Vphone', 'mo ta 2'),
(9, 'Zphone', 'mo ta 2'),
(10, 'Aphone', 'mo ta 2');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `FK_account` (`id_account`),
  ADD KEY `FK_product_category` (`id_product_category`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id_product_category`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id_product_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_account` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`id_product_category`) REFERENCES `product_category` (`id_product_category`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
