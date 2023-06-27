-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2023 at 04:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothes_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `date`) VALUES
(1, 'Lorem Ipsum1', 'Lorem Ipsum', '2023-06-24'),
(2, 'Lorem Ipsum Update', 'Lorem Ipsum Update', '2023-06-24'),
(5, 'gajah', 'h', '2023-06-24'),
(6, 'p', 'Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak.Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak. Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak. Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak. Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak. Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak. Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak.', '2023-06-24'),
(28, '66', 'Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak.Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak.Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak.Oke, jadi berdasarkan cerita dari salah satu rekaman di rak buku, celah emas yang ada di dada Nanook itu sebenarnya bekas luka dari pertarungannya melawan \"Orang Bodoh.\" (The Fool)\nDiceritakan Nanook (dengan sebutannya di Xianzhou: Ruin Author) bertarung melawan Orang Bodoh yang menjaga satu-satunya portal ketika Nanook hendak pergi untuk membalas dendam. Nanook dan \"Orang Bodoh\" bertarung selama tujuh hari dan tujuh malam berturut-turut. Orang Bodoh ini menggunakan pedang tipis dan menghindar dengan sangat terampil. Di akhir Nanook yang kalah memilih pergi dengan luka yang masih terbuka sampai sekarang. \nSiapa sebenarnya si \"Orang Bodoh\" ini?\nDari kalimat \"Ichor emas merembes dari tubuh Ilahi mereka\" maka bisa dipastikan bahwa mereka berdua adalah Aeon. \nSeperti yang kita tau, desain dari Path dan Aeon di HSR banyak terinspirasi dari kartu Tarot. Kartu The Tower yang mirip dengan lambang Path Destruction melambangkan bencana, kekacauan, perubahan dan kebangkitan, dan kartu The Fool (Orang Bodoh yang memulai perjalanan di ujung tebing) yang melambangkan perjalanan, petualangan baru, jiwa yang bebas dan spontanitas. \nDari sini bisa kita tarik kesimpulan bahwa si Orang Bodoh, Aeon yang bertarung dengan Nanook, mungkin adalah seseorang berjiwa bebas yang hobi berpetualang dan berjalan keluar dari zona nyaman mereka, dari deskripsi ini bisa saja menggambarkan Akivili Aeon of The Trailblazer. Tetapi di bagian deskripsi yang melambangkan spontanitas mungkin saja menggambarkan Aha Aeon of Elation, dimana mereka pernah berpetualang sampai di puncak Imaginary Tree, juga di akhir cerita ini juga diceritakan bahwa si Orang Bodoh pergi dengan tertawa terbahak-bahak.', '2023-06-25'),
(42, 'Title Baru', 'Content Baru', '2023-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(3, 'Izuchii', 'Izuchii@gmail.com', '6c4ed6b254d0ab8e8ac9dc932c5f86a3'),
(18, 'admin', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500'),
(20, 'Luthfi Nur Ramadhan', 'luthfiramadhan.lr55@gmail.com', 'a279a8ca91bdeeda91b3ce548cc0d6d9'),
(21, 'test@gmail.com', 'test@gmail.com', '1aedb8d9dc4751e229a335e371db8058'),
(22, 'Ajojing', 'ajojing@gmail.com', 'ceb41bb33768fb397181de39b312c724'),
(23, 'Luthfi', 'Luthfi@gmail.com', 'e0872147b53f98828fd8734150208b80'),
(24, 'Luthfi Nur Ramadhan', 'luthfiramadhan.lr55@gmail.com', 'a279a8ca91bdeeda91b3ce548cc0d6d9');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
