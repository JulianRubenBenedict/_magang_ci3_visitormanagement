-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2021 at 03:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magang_ci3_visitormanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `status` enum('visitor_telah_masuk_event','visitor_telah_keluar_event','adalah_staff') DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `user_id`, `status`, `ip_address`, `timestamp`, `data`) VALUES
('n969k6jdf0uoemtnoo4qe598qcpj2914', NULL, NULL, '::1', 1613398892, 0x736564616e675f62657274756761737c733a313a2230223b69645f74756761737c4e3b73756b7365737c733a32383a22416e646120737564616820626572686173696c206b656c7561722021223b5f5f63695f766172737c613a313a7b733a363a2273756b736573223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_area`
--

CREATE TABLE `tabel_area` (
  `id_area` varchar(255) NOT NULL,
  `id_event` varchar(255) DEFAULT NULL,
  `nama_area` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_area`
--

INSERT INTO `tabel_area` (`id_area`, `id_event`, `nama_area`) VALUES
('AR21021468164400000010', 'EVNT2102146814270000001', 'areaA'),
('AR21021468164400000011', 'EVNT2102146814270000001', 'areaB'),
('AR21021468164400000012', 'EVNT2102146814270000001', 'areaC');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_event`
--

CREATE TABLE `tabel_event` (
  `id_event` varchar(255) NOT NULL,
  `nama_event` varchar(255) NOT NULL,
  `custom_url` varchar(255) NOT NULL,
  `gambar_qrcode` varchar(255) NOT NULL,
  `tanggal_dibuka` date NOT NULL,
  `tanggal_ditutup` date NOT NULL,
  `jam_dibuka` time NOT NULL,
  `jam_ditutup` time NOT NULL,
  `status` enum('active','not_active') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_event`
--

INSERT INTO `tabel_event` (`id_event`, `nama_event`, `custom_url`, `gambar_qrcode`, `tanggal_dibuka`, `tanggal_ditutup`, `jam_dibuka`, `jam_ditutup`, `status`) VALUES
('EVNT2102146814270000001', 'Gelar Jepang Universitas Indonesia', 'gjui', 'EVNT2102146814270000001.png', '2021-02-16', '2021-02-21', '08:00:00', '16:00:00', 'not_active');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_role`
--

CREATE TABLE `tabel_role` (
  `role_id` int(10) NOT NULL,
  `nama_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_role`
--

INSERT INTO `tabel_role` (`role_id`, `nama_role`) VALUES
(1, 'admin'),
(2, 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_staff`
--

CREATE TABLE `tabel_staff` (
  `staff_id` varchar(255) NOT NULL,
  `role_id` int(10) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `sedang_bertugas` tinyint(1) NOT NULL,
  `id_tugas` varchar(255) DEFAULT NULL,
  `verified` varchar(1) NOT NULL,
  `is_active` enum('online','offline') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_staff`
--

INSERT INTO `tabel_staff` (`staff_id`, `role_id`, `username`, `password`, `nama`, `sedang_bertugas`, `id_tugas`, `verified`, `is_active`) VALUES
('STF202101300925250000001', 1, 'admin', '$2y$10$giRYQKKvjOVEuGiozcCwVeVWOD2GGvwjLZzeVlPSl9Xv.ICsQ0FUu', 'bayu kartiko', 0, NULL, '1', 'offline'),
('STF202102011946130000002', 2, 'petugas1', '$2y$10$iW628pKXrvgtpjChzkPAmeFmKuEyyv0o8dqnt3Z.aeSLikqywK32e', 'petugas1', 1, 'TGS21021468178000000010', '1', 'offline'),
('STF202102031313020000003', 2, 'petugas2', '$2y$10$Bx4GsO4luPGFu0A0I2JLouaMdYmxeVq.HVp0ayvmDMkYLLGPZ/9qW', 'petugas2', 1, 'TGS21021468178000000011', '1', 'offline'),
('STF202102031313240000004', 2, 'petugas3', '$2y$10$jTti8PnyZp8hNJkYqA3Rgut3eaU5WMv6Yw32xbmy55orhZztllbsq', 'petugas3', 1, 'TGS21021468178000000012', '1', 'offline'),
('STF202102031314180000005', 2, 'petugas4', '$2y$10$KZxAVnfystO.zMGHjrd6CuvzSZM5Owga4K8EZsJlQmHENteprH2Zu', 'petugas4', 0, NULL, '1', 'offline'),
('STF202102031314360000006', 2, 'petugas5', '$2y$10$wuKg4zQ9OdRuprtJ43jalOpGzNjyKQVBbZLRbFX6tA2A6Y5qLUb9m', 'petugas5', 0, NULL, '1', 'offline'),
('STF202102040906150000007', 2, 'petugas6', '$2y$10$5WPE96/MAFuD3Ch5cvxRSeGeqQF6ZAaIp8eQotxyDBBx0ISCQ6Cf6', 'petugas6', 0, NULL, '1', 'offline'),
('STF202102040907200000008', 2, 'petugas7', '$2y$10$j4gky274DsmymOh9/YHYZucn1G2nnWEGTrH4yNtXTPs1Jh1elJ0KG', 'petugas7', 0, NULL, '1', 'offline'),
('STF202102041818440000009', 2, 'petugaspintukeluar1', '$2y$10$HgIAM1vjizSPnfJRBoFLD.tsk0WDPrz321b8klxqkVCUYa9oPbxHy', 'petugaspintukeluar1', 1, 'TGS2102146817800000001', '1', 'offline'),
('STF202102041819060000010', 2, 'petugaspintukeluar2', '$2y$10$qAdsLyZKUlE1eoG1ZjKOfu99QzSesWEe1Yay3ITZVYdQnuYl6jBtq', 'petugaspintukeluar2', 0, NULL, '1', 'offline'),
('STF202102051000500000011', 2, 'petugaspintukeluar3', '$2y$10$IIgYNdVXHYlW5AnO7Ar/YO4hyD66ldzv6c/QaKePPKTvbHiBt/G/.', 'petugaspintukeluar3', 0, NULL, '1', 'offline'),
('STF202102051001110000012', 2, 'petugaspintukeluar4', '$2y$10$Azr4GXo8n2Xqij4wIXhceO2GsyKLBbZ87l2AbhibX7tO3cx7eCJRu', 'petugaspintukeluar4', 0, NULL, '1', 'offline'),
('STF202102051001230000013', 2, 'petugaspintukeluar5', '$2y$10$28jfQMcn9SraZwzaYFjcpu.JQi9AecqeTyRtzzkdB8XGdskq8AVw2', 'petugaspintukeluar5', 0, NULL, '1', 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_tracking`
--

CREATE TABLE `tabel_tracking` (
  `nomor` int(255) NOT NULL,
  `id_visitor` varchar(255) DEFAULT NULL,
  `id_event` varchar(255) DEFAULT NULL,
  `id_petugas_pintu_area` varchar(255) DEFAULT NULL,
  `id_area` varchar(255) DEFAULT NULL,
  `time_in_area` datetime NOT NULL,
  `time_out_area` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_tugas_staff_petugas`
--

CREATE TABLE `tabel_tugas_staff_petugas` (
  `id_tugas` varchar(255) NOT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `petugas_pintu_keluar` tinyint(1) NOT NULL,
  `petugas_pintu_area` tinyint(1) NOT NULL,
  `id_event` varchar(255) DEFAULT NULL,
  `id_area` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_tugas_staff_petugas`
--

INSERT INTO `tabel_tugas_staff_petugas` (`id_tugas`, `staff_id`, `petugas_pintu_keluar`, `petugas_pintu_area`, `id_event`, `id_area`) VALUES
('TGS2102146817800000001', 'STF202102041818440000009', 1, 0, 'EVNT2102146814270000001', NULL),
('TGS21021468178000000010', 'STF202102011946130000002', 0, 1, 'EVNT2102146814270000001', 'AR21021468164400000010'),
('TGS21021468178000000011', 'STF202102031313020000003', 0, 1, 'EVNT2102146814270000001', 'AR21021468164400000011'),
('TGS21021468178000000012', 'STF202102031313240000004', 0, 1, 'EVNT2102146814270000001', 'AR21021468164400000012');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_visitor`
--

CREATE TABLE `tabel_visitor` (
  `id_visitor` varchar(255) NOT NULL,
  `id_event` varchar(255) DEFAULT NULL,
  `nama_visitor` varchar(255) NOT NULL,
  `perusahaan_visitor` varchar(255) DEFAULT NULL,
  `jabatan_visitor` varchar(255) DEFAULT NULL,
  `email_visitor` varchar(255) NOT NULL,
  `email_perusahaan` varchar(255) DEFAULT NULL,
  `tlp_visitor` varchar(15) NOT NULL,
  `tlp_perusahaan` varchar(15) DEFAULT NULL,
  `alasan_ikut` text DEFAULT NULL,
  `gambar_qrcode` varchar(255) NOT NULL,
  `registered_at` datetime NOT NULL,
  `id_petugas_pintu_area` varchar(255) DEFAULT NULL,
  `id_petugas_pintu_keluar` varchar(255) DEFAULT NULL,
  `time_in_event` datetime NOT NULL,
  `time_out_event` datetime NOT NULL,
  `status` enum('dalam_antrian_masuk_event','telah_masuk_event','didalam_area','telah_keluar_event') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tabel_area`
--
ALTER TABLE `tabel_area`
  ADD PRIMARY KEY (`id_area`),
  ADD KEY `id_event` (`id_event`);

--
-- Indexes for table `tabel_event`
--
ALTER TABLE `tabel_event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `tabel_role`
--
ALTER TABLE `tabel_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tabel_staff`
--
ALTER TABLE `tabel_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `id_tugas` (`id_tugas`);

--
-- Indexes for table `tabel_tracking`
--
ALTER TABLE `tabel_tracking`
  ADD PRIMARY KEY (`nomor`),
  ADD KEY `id_visitor` (`id_visitor`),
  ADD KEY `id_area` (`id_area`),
  ADD KEY `id_event` (`id_petugas_pintu_area`);

--
-- Indexes for table `tabel_tugas_staff_petugas`
--
ALTER TABLE `tabel_tugas_staff_petugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_area` (`id_area`);

--
-- Indexes for table `tabel_visitor`
--
ALTER TABLE `tabel_visitor`
  ADD PRIMARY KEY (`id_visitor`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_petugas_pintu_area` (`id_petugas_pintu_area`),
  ADD KEY `id_petugas_pintu_keluar` (`id_petugas_pintu_keluar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_role`
--
ALTER TABLE `tabel_role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tabel_tracking`
--
ALTER TABLE `tabel_tracking`
  MODIFY `nomor` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_area`
--
ALTER TABLE `tabel_area`
  ADD CONSTRAINT `tabel_area_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tabel_event` (`id_event`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tabel_staff`
--
ALTER TABLE `tabel_staff`
  ADD CONSTRAINT `tabel_staff_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `tabel_role` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_staff_ibfk_4` FOREIGN KEY (`id_tugas`) REFERENCES `tabel_tugas_staff_petugas` (`id_tugas`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tabel_tracking`
--
ALTER TABLE `tabel_tracking`
  ADD CONSTRAINT `tabel_tracking_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `tabel_area` (`id_area`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_tracking_ibfk_2` FOREIGN KEY (`id_visitor`) REFERENCES `tabel_visitor` (`id_visitor`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_tracking_ibfk_3` FOREIGN KEY (`id_petugas_pintu_area`) REFERENCES `tabel_staff` (`staff_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tabel_tugas_staff_petugas`
--
ALTER TABLE `tabel_tugas_staff_petugas`
  ADD CONSTRAINT `tabel_tugas_staff_petugas_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tabel_event` (`id_event`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_tugas_staff_petugas_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `tabel_area` (`id_area`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_tugas_staff_petugas_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `tabel_staff` (`staff_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tabel_visitor`
--
ALTER TABLE `tabel_visitor`
  ADD CONSTRAINT `tabel_visitor_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tabel_event` (`id_event`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_visitor_ibfk_2` FOREIGN KEY (`id_petugas_pintu_area`) REFERENCES `tabel_staff` (`staff_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tabel_visitor_ibfk_3` FOREIGN KEY (`id_petugas_pintu_keluar`) REFERENCES `tabel_staff` (`staff_id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
