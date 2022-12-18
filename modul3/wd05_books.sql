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
-- Cơ sở dữ liệu: `wd05_books`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `id_book_category` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `view` int(11) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id_book`, `id_book_category`, `name`, `image`, `description`, `view`, `create_date`) VALUES
(1, 1, 'Lập trình Web', 'ltw.jpg', 'Web cơ bản', 2, '2021-07-10 09:20:00'),
(2, 1, 'Lập trình Web nâng cao', 'ltwnc.jpg', 'Web nâng cao', 0, '2021-07-10 09:20:00'),
(3, 3, 'Lập trình C#', 'ltcs.jpg', 'C# cơ bản', 1, '2021-07-10 09:20:00'),
(4, 4, 'Lập trình C++', 'c.jpg', 'C++ cơ bản', 1, '2021-07-10 09:20:00'),
(5, 5, 'Lập trình Java', 'java.jpg', 'Web cơ bản', 0, '2021-07-10 09:20:00'),
(6, 6, 'Phân tích hệ thống', 'ptht.jpg', 'Phân tích hệ thống cơ bản', 0, '2021-07-10 09:20:00'),
(7, 7, 'Phân tích hướng đối tượng', 'hdt.jpg', 'Phân tích OOP', 0, '2021-07-10 09:20:00'),
(8, 9, 'Cơ sở dữ liệu', 'csdl.jpg', 'Sql cơ bản', 0, '2021-07-10 09:20:00'),
(9, 9, 'Hệ quản trị cơ sở dữ liệu', 'hcsdl.jpg', 'SQL nâng cao', 0, '2021-07-10 09:20:00'),
(10, 10, 'Lập trình mạng', 'ltm.jpg', 'Lập trình mạng', 0, '2021-07-10 09:20:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_category`
--

CREATE TABLE `book_category` (
  `id_books_category` int(11) NOT NULL,
  `books_category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `book_category`
--

INSERT INTO `book_category` (`id_books_category`, `books_category`, `description`, `create_date`) VALUES
(1, 'Sách 1', 'Mô tả 1', '2021-07-10 09:17:06'),
(2, 'Sách 2', 'Mô tả 12', '2021-07-10 09:17:06'),
(3, 'Sách 3', 'Mô tả 13', '2021-07-10 09:17:06'),
(4, 'Sách 4', 'Mô tả 14', '2021-07-10 09:17:06'),
(5, 'Sách 5', 'Mô tả 15', '2021-07-10 09:17:06'),
(6, 'Sách 6', 'Mô tả 16', '2021-07-10 09:17:06'),
(7, 'Sách 7', 'Mô tả 17', '2021-07-10 09:17:06'),
(8, 'Sách 8', 'Mô tả 19', '2021-07-10 09:17:06'),
(9, 'Sách 9', 'Mô tả 18', '2021-07-10 09:17:06'),
(10, 'Sách 10', 'Mô tả 31', '2021-07-10 09:17:06');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `FK_book_category` (`id_book_category`);

--
-- Chỉ mục cho bảng `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id_books_category`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id_books_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_book_category` FOREIGN KEY (`id_book_category`) REFERENCES `book_category` (`id_books_category`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
