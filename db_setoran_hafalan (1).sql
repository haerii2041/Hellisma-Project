-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2025 at 04:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_setoran_hafalan`
--

-- --------------------------------------------------------

--
-- Table structure for table `santri`
--

CREATE TABLE `santri` (
  `id_santri` int(11) NOT NULL,
  `nama_santri` varchar(100) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `santri`
--

INSERT INTO `santri` (`id_santri`, `nama_santri`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `username`, `password`) VALUES
(13, 'Listanto', '2003-02-02', 'L', 'Joglo raya	', 'Listanto', '$2a$10$0XFQYl/9j22HlTrvplQZQurB7VKKeGotiFJ6OBD9LJT6zIHnpcYNq'),
(14, 'Heri Purnomo', '2004-06-22', 'L', 'Bintaro raya', 'heri', '$2a$10$oPEzQTqs21qzr6n43BW8LuPr9IAW5zLB7L4eX1wEgGRMyppRtgYha'),
(15, 'Reni Slamet', '2003-02-02', 'P', 'Pamulang Raya', 'reni', '$2a$10$f84tEtuWoRSAO7OVojS8V.G.4yvDyTS7see4GPaNX17JT.V67SyL6');

-- --------------------------------------------------------

--
-- Table structure for table `setoran`
--

CREATE TABLE `setoran` (
  `id_setoran` int(11) NOT NULL,
  `id_santri` int(11) DEFAULT NULL,
  `id_ustadz` int(11) DEFAULT NULL,
  `tanggal_setoran` date DEFAULT NULL,
  `dari_surah` varchar(50) DEFAULT NULL,
  `dari_ayat` int(11) DEFAULT NULL,
  `sampai_surah` varchar(50) DEFAULT NULL,
  `sampai_ayat` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setoran`
--

INSERT INTO `setoran` (`id_setoran`, `id_santri`, `id_ustadz`, `tanggal_setoran`, `dari_surah`, `dari_ayat`, `sampai_surah`, `sampai_ayat`, `keterangan`) VALUES
(2, 14, 2, '2025-06-29', 'al-fatihah', 1, 'albaqarah', 16, 'lanacar'),
(3, 13, 2, '2025-06-29', 'al-fatihah', 1, 'albaqarah', 15, 'cukup lancar'),
(4, 13, 2, '2025-06-30', 'albaqarah', 16, 'albaqarah', 20, 'lancar'),
(5, 15, 3, '2025-06-29', 'al-fatihah', 1, 'al-baqarah', 11, 'lancar'),
(6, 13, 3, '2025-06-29', 'al-fatihah', 1, 'al-baqarah', 11, 'lancar'),
(7, 14, 3, '2025-06-29', 'al-fatihah', 1, 'al-baqarah', 11, 'lancar');

-- --------------------------------------------------------

--
-- Table structure for table `ustadz`
--

CREATE TABLE `ustadz` (
  `id_ustadz` int(11) NOT NULL,
  `nama_ustadz` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ustadz`
--

INSERT INTO `ustadz` (`id_ustadz`, `nama_ustadz`, `username`, `password`) VALUES
(2, 'Lutfi Ali', 'ali', '$2a$10$wPYNKtHgFdZREC5sH8W2D.Xq0cf3goJrwEEe6kNouJv1/VzGsTV8W'),
(3, 'Devin Slamet', 'devin', '$2a$10$1Kqt0HevEH02n7mxME8NM.U86oNgREXuvSEkUMGVOxRisNm3vYXxi'),
(4, 'Rifqi Slamet', 'rifqi', '$2a$10$aWNEI1cdcDRAIR6e8OEmbuSaS7oBieUPSvK8fE6VtUO2m7zfDWwbu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `santri`
--
ALTER TABLE `santri`
  ADD PRIMARY KEY (`id_santri`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_santri` (`id_santri`),
  ADD KEY `id_ustadz` (`id_ustadz`);

--
-- Indexes for table `ustadz`
--
ALTER TABLE `ustadz`
  ADD PRIMARY KEY (`id_ustadz`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `santri`
--
ALTER TABLE `santri`
  MODIFY `id_santri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `setoran`
--
ALTER TABLE `setoran`
  MODIFY `id_setoran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ustadz`
--
ALTER TABLE `ustadz`
  MODIFY `id_ustadz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `setoran`
--
ALTER TABLE `setoran`
  ADD CONSTRAINT `setoran_ibfk_1` FOREIGN KEY (`id_santri`) REFERENCES `santri` (`id_santri`),
  ADD CONSTRAINT `setoran_ibfk_2` FOREIGN KEY (`id_ustadz`) REFERENCES `ustadz` (`id_ustadz`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
