-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 03:29 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_siswa` ()  NO SQL
BEGIN
	SELECT `tbl_siswa`.*, `tbl_kelas`.`nama_kelas`, `tbl_spp`.`tahun`
                FROM `tbl_siswa` JOIN `tbl_kelas`
                ON `tbl_siswa`.`id_kelas` = `tbl_kelas`.`id_kelas`
                JOIN `tbl_spp` ON `tbl_siswa` .`id_spp` = `tbl_spp`.`id_spp` ORDER BY `tbl_siswa`.`NISN`, `tbl_siswa`.`id_kelas` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kelas_get` ()  NO SQL
BEGIN
	SELECT `tbl_kelas`.*, `tbl_jurusan`.`jurusan` FROM `tbl_kelas` JOIN `tbl_jurusan` ON `tbl_kelas`.`id_jurusan` = `tbl_jurusan`.`id_jurusan` ORDER BY `tbl_kelas`.`id_jurusan` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `level_get` (IN `level` INT)  NO SQL
BEGIN
	SELECT * FROM tbl_level WHERE level = id_level;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_check` (IN `user` VARCHAR(100), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_petugas WHERE user = username AND pass = password_petugas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `siswa_check` (IN `user` VARCHAR(10), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_siswa WHERE user = nisn AND pass = nis;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `ID_JURUSAN` int(11) NOT NULL,
  `JURUSAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`ID_JURUSAN`, `JURUSAN`) VALUES
(1, 'Rekayasa Perangkat Lunak'),
(2, 'Teknik Jaringan Dan Komputer'),
(3, 'teknik kendaraan ringan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `ID_KELAS` int(11) NOT NULL,
  `ID_JURUSAN` int(11) DEFAULT NULL,
  `NAMA_KELAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`ID_KELAS`, `ID_JURUSAN`, `NAMA_KELAS`) VALUES
(1, 1, 'XII RPL 2'),
(2, 2, 'XII TKJ 2'),
(3, 3, 'XII TKR 1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level`
--

CREATE TABLE `tbl_level` (
  `ID_LEVEL` int(11) NOT NULL,
  `LEVEL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_level`
--

INSERT INTO `tbl_level` (`ID_LEVEL`, `LEVEL`) VALUES
(1, 'Admin'),
(2, 'Petugas'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_user` varchar(50) NOT NULL,
  `log_tipe` varchar(50) NOT NULL,
  `log_aksi` varchar(50) NOT NULL,
  `log_assign_to` varchar(50) NOT NULL,
  `log_assign_type` enum('petugas','siswa','spp','kelas','jurusan','transaksi','cetak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_user`, `log_tipe`, `log_aksi`, `log_assign_to`, `log_assign_type`) VALUES
(9, '2020-02-23 13:07:42', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(10, '2020-02-23 13:08:06', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(11, '2020-02-23 13:15:11', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(12, '2020-02-23 13:15:16', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(13, '2020-02-23 13:15:19', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(14, '2020-02-23 13:15:27', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(15, '2020-02-23 14:06:44', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(16, '2020-02-23 14:07:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(17, '2020-02-23 14:07:36', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(18, '2020-02-23 14:08:13', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(19, '2020-02-24 12:38:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(20, '2020-02-24 12:44:24', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(21, '2020-02-25 12:00:19', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(22, '2020-02-26 10:52:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(23, '2020-02-26 10:54:51', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(24, '2020-02-26 10:55:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(25, '2020-02-26 10:56:25', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(26, '2020-02-26 10:58:30', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(27, '2020-02-26 11:01:44', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(28, '2020-02-26 11:02:05', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(29, '2020-02-26 11:41:33', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(30, '2020-02-26 11:41:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(31, '2020-02-26 11:41:41', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(32, '2020-02-26 11:43:40', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(33, '2020-02-26 12:03:14', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(34, '2020-02-26 12:07:03', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(35, '2020-02-26 12:07:53', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(36, '2020-02-26 15:22:58', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(37, '2020-02-26 15:23:43', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(38, '2020-02-26 15:33:49', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(39, '2020-02-26 15:35:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(40, '2020-02-26 16:26:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(41, '2020-02-26 16:30:38', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(42, '2020-02-26 16:36:52', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(43, '2020-02-26 16:37:34', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(44, '2020-02-26 16:39:35', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(45, '2020-02-26 17:21:22', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(46, '2020-02-27 12:05:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(47, '2020-02-27 12:05:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(48, '2020-02-27 12:56:21', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(49, '2020-02-28 06:53:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(50, '2020-02-28 07:16:29', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(51, '2020-02-28 07:29:44', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(52, '2020-02-28 07:30:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(53, '2020-02-28 07:31:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(54, '2020-02-28 07:50:13', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(55, '2020-02-28 08:29:01', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(56, '2020-02-28 08:30:11', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(57, '2020-02-28 08:31:13', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(58, '2020-02-28 08:31:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(59, '2020-02-28 08:32:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(60, '2020-02-28 08:35:07', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(61, '2020-02-28 08:35:20', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(62, '2020-02-28 08:35:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(63, '2020-02-28 08:36:10', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(64, '2020-02-28 08:36:21', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(65, '2020-02-28 08:36:37', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(66, '2020-02-28 08:37:18', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(67, '2020-02-28 08:37:33', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(68, '2020-02-28 08:38:12', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(69, '2020-02-28 08:38:18', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(70, '2020-02-28 09:21:03', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(71, '2020-02-28 09:21:34', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(72, '2023-02-01 01:04:32', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(73, '2023-02-01 01:04:53', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(74, '2023-02-01 03:19:35', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(75, '2023-02-01 03:19:44', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(76, '2023-02-01 03:19:49', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(77, '2023-02-01 03:20:56', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(78, '2023-02-01 03:22:09', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(79, '2023-02-01 06:10:43', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(80, '2023-02-01 06:15:17', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(81, '2023-02-01 06:30:06', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(82, '2023-02-01 06:30:42', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(83, '2023-02-01 06:30:47', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(84, '2023-02-01 06:33:00', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(85, '2023-02-01 07:24:35', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(86, '2023-02-01 07:41:08', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(87, '2023-02-08 00:16:46', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(88, '2023-02-08 00:17:13', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(89, '2023-02-08 00:19:47', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(90, '2023-02-08 00:20:29', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(91, '2023-02-08 00:20:39', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(92, '2023-02-08 00:20:57', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(93, '2023-02-08 00:21:24', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(94, '2023-02-08 00:29:17', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(95, '2023-02-08 00:40:02', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(96, '2023-02-08 00:40:12', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(97, '2023-02-08 00:43:21', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(98, '2023-02-08 00:43:46', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(99, '2023-02-08 00:43:55', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(100, '2023-02-08 00:44:04', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(101, '2023-02-08 01:00:02', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(102, '2023-02-08 01:00:39', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(103, '2023-02-08 01:00:56', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(104, '2023-02-08 01:01:45', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(105, '2023-02-08 01:01:59', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(106, '2023-02-08 01:02:17', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(107, '2023-02-08 01:03:11', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(108, '2023-02-08 01:04:08', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(109, '2023-02-08 01:06:18', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(110, '2023-02-08 01:06:49', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(111, '2023-02-08 01:09:03', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(112, '2023-02-08 01:09:13', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(113, '2023-02-08 01:13:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(114, '2023-02-08 01:14:19', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(115, '2023-02-08 01:14:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(116, '2023-02-08 01:14:55', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(117, '2023-02-08 01:15:13', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(118, '2023-02-08 01:15:16', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(119, '2023-02-08 01:15:41', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(120, '2023-02-08 01:15:44', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(121, '2023-02-08 01:24:43', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(122, '2023-02-08 01:24:51', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(123, '2023-02-10 01:55:11', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(124, '2023-02-20 05:12:24', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(125, '2023-02-20 05:23:44', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(126, '2023-02-20 05:25:34', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(127, '2023-02-20 05:46:25', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(128, '2023-02-20 05:49:31', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(129, '2023-02-20 05:49:35', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(130, '2023-02-21 01:59:50', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(131, '2023-02-21 02:00:48', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(132, '2023-02-21 04:22:47', 'Rika Nur Agustin', 'siswa', 'Menambah data siswa', '', ''),
(133, '2023-02-21 04:22:57', 'Rika Nur Agustin', 'siswa', 'Menghapus data siswa', '', ''),
(134, '2023-02-22 00:14:19', 'Rika Nur Agustin', 'cetak', 'Mencetak laporan data petugas', '', ''),
(135, '2023-02-22 01:34:44', 'Rika Nur Agustin', 'cetak', 'Mencetak Struk pembayaran', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `NISN` char(10) DEFAULT NULL,
  `TGL_BAYAR` date DEFAULT NULL,
  `JATUH_TEMPO` date NOT NULL,
  `BULAN_DIBAYAR` varchar(9) DEFAULT NULL,
  `TAHUN_DIBAYAR` varchar(4) DEFAULT NULL,
  `ID_SPP` int(11) NOT NULL,
  `JUMLAH_BAYAR` int(11) NOT NULL,
  `KET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`ID_PEMBAYARAN`, `ID_PETUGAS`, `NISN`, `TGL_BAYAR`, `JATUH_TEMPO`, `BULAN_DIBAYAR`, `TAHUN_DIBAYAR`, `ID_SPP`, `JUMLAH_BAYAR`, `KET`) VALUES
(116, 1, '0026345690', '2023-02-08', '2023-01-30', 'Januari', '2023', 3, 12000, 'LUNAS'),
(117, 1, '0026345690', '2023-02-08', '2023-03-02', 'Maret', '2023', 3, 12000, 'LUNAS'),
(118, 1, '0026345690', '2023-02-08', '2023-03-30', 'Maret', '2023', 3, 12000, 'LUNAS'),
(119, 1, '0026345690', NULL, '2023-04-30', 'April', '2023', 3, 12000, ''),
(120, 1, '0026345690', NULL, '2023-05-30', 'Mei', '2023', 3, 12000, ''),
(121, 1, '0026345690', NULL, '2023-06-30', 'Juni', '2023', 3, 12000, ''),
(122, 1, '0026345690', NULL, '2023-07-30', 'Juli', '2023', 3, 12000, ''),
(123, 1, '0026345690', NULL, '2023-08-30', 'Agustus', '2023', 3, 12000, ''),
(124, 1, '0026345690', NULL, '2023-09-30', 'September', '2023', 3, 12000, ''),
(125, 1, '0026345690', NULL, '2023-10-30', 'Oktober', '2023', 3, 12000, ''),
(126, 1, '0026345690', NULL, '2023-11-30', 'November', '2023', 3, 12000, ''),
(127, 1, '0026345690', NULL, '2023-12-30', 'Desember', '2023', 3, 12000, ''),
(128, 1, '0016912567', '2023-02-08', '2017-07-20', 'Juli', '2017', 4, 30000, 'LUNAS'),
(129, 1, '0016912567', '2023-02-08', '2017-08-20', 'Agustus', '2017', 4, 30000, 'LUNAS'),
(130, 1, '0016912567', '2023-02-08', '2017-09-20', 'September', '2017', 4, 30000, 'LUNAS'),
(131, 1, '0016912567', NULL, '2017-10-20', 'Oktober', '2017', 4, 30000, ''),
(132, 1, '0016912567', NULL, '2017-11-20', 'November', '2017', 4, 30000, ''),
(133, 1, '0016912567', NULL, '2017-12-20', 'Desember', '2017', 4, 30000, ''),
(134, 1, '0016912567', NULL, '2018-01-20', 'Januari', '2018', 4, 30000, ''),
(135, 1, '0016912567', NULL, '2018-02-20', 'Februari', '2018', 4, 30000, ''),
(136, 1, '0016912567', NULL, '2018-03-20', 'Maret', '2018', 4, 30000, ''),
(137, 1, '0016912567', NULL, '2018-04-20', 'April', '2018', 4, 30000, ''),
(138, 1, '0016912567', NULL, '2018-05-20', 'Mei', '2018', 4, 30000, ''),
(139, 1, '0016912567', NULL, '2018-06-20', 'Juni', '2018', 4, 30000, ''),
(140, 1, '0223456781', '2023-02-08', '2017-07-20', 'Juli', '2017', 5, 40000, 'LUNAS'),
(141, 1, '0223456781', '2023-02-08', '2017-08-20', 'Agustus', '2017', 5, 40000, 'LUNAS'),
(142, 1, '0223456781', '2023-02-08', '2017-09-20', 'September', '2017', 5, 40000, 'LUNAS'),
(143, 1, '0223456781', NULL, '2017-10-20', 'Oktober', '2017', 5, 40000, ''),
(144, 1, '0223456781', NULL, '2017-11-20', 'November', '2017', 5, 40000, ''),
(145, 1, '0223456781', NULL, '2017-12-20', 'Desember', '2017', 5, 40000, ''),
(146, 1, '0223456781', NULL, '2018-01-20', 'Januari', '2018', 5, 40000, ''),
(147, 1, '0223456781', NULL, '2018-02-20', 'Februari', '2018', 5, 40000, ''),
(148, 1, '0223456781', NULL, '2018-03-20', 'Maret', '2018', 5, 40000, ''),
(149, 1, '0223456781', NULL, '2018-04-20', 'April', '2018', 5, 40000, ''),
(150, 1, '0223456781', NULL, '2018-05-20', 'Mei', '2018', 5, 40000, ''),
(151, 1, '0223456781', NULL, '2018-06-20', 'Juni', '2018', 5, 40000, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `ID_PETUGAS` int(11) NOT NULL,
  `ID_LEVEL` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD_PETUGAS` varchar(225) DEFAULT NULL,
  `NAMA_PETUGAS` varchar(50) DEFAULT NULL,
  `DESKRIPSI` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`ID_PETUGAS`, `ID_LEVEL`, `USERNAME`, `PASSWORD_PETUGAS`, `NAMA_PETUGAS`, `DESKRIPSI`) VALUES
(1, 1, 'rikaagustin', '02558a70324e7c4f269c69825450cec8', 'Rika Nur Agustin', 'admin'),
(3, 2, 'admin', 'b53fe7751b37e40ff34d012c7774d65f', 'Afifah Fitri Anjani', 'petugas1'),
(18, 2, 'petugas', '827ccb0eea8a706c4c34a16891f84e7b', 'Rika Nur Agustin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `NISN` char(10) NOT NULL,
  `ID_KELAS` int(11) DEFAULT NULL,
  `ID_SPP` int(11) DEFAULT NULL,
  `NIS` char(8) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` text DEFAULT NULL,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`NISN`, `ID_KELAS`, `ID_SPP`, `NIS`, `NAMA`, `ALAMAT`, `NO_TELP`, `TIMESTAMP`) VALUES
('0016912567', 2, 4, '00124560', 'Afifah Fitri Anjani', 'jl.Pare No.86', '082143688980', '2023-02-08 01:02:17'),
('0026345690', 1, 3, '00124565', 'Rika Nur Agustin', 'jl.Teratai No.22', '081332004269', '2023-02-10 01:55:11'),
('0223456781', 3, 5, '22567800', 'Muhammad Rava', 'jl.Kartika No.20', '082345887900', '2023-02-08 01:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `ID_SPP` int(11) NOT NULL,
  `TAHUN` varchar(16) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_spp`
--

INSERT INTO `tbl_spp` (`ID_SPP`, `TAHUN`, `NOMINAL`) VALUES
(3, '2019/2020', 20000),
(4, '2021/2022', 20000),
(5, '2023/2024', 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`ID_JURUSAN`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`ID_KELAS`),
  ADD KEY `FK_JURUSAN` (`ID_JURUSAN`);

--
-- Indexes for table `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`ID_LEVEL`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `FK_PETUGAS` (`ID_PETUGAS`),
  ADD KEY `FK_SISWA` (`NISN`);

--
-- Indexes for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`),
  ADD KEY `FK_LEVEL` (`ID_LEVEL`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD KEY `FK_KELAS` (`ID_KELAS`),
  ADD KEY `FK_SPP` (`ID_SPP`);

--
-- Indexes for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`ID_SPP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `ID_JURUSAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `ID_LEVEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `ID_PETUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  MODIFY `ID_SPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `FK_JURUSAN` FOREIGN KEY (`ID_JURUSAN`) REFERENCES `tbl_jurusan` (`ID_JURUSAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `FK_PETUGAS` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `tbl_petugas` (`ID_PETUGAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SISWA` FOREIGN KEY (`NISN`) REFERENCES `tbl_siswa` (`NISN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD CONSTRAINT `FK_LEVEL` FOREIGN KEY (`ID_LEVEL`) REFERENCES `tbl_level` (`ID_LEVEL`);

--
-- Constraints for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `FK_KELAS` FOREIGN KEY (`ID_KELAS`) REFERENCES `tbl_kelas` (`ID_KELAS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SPP` FOREIGN KEY (`ID_SPP`) REFERENCES `tbl_spp` (`ID_SPP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
