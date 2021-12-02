-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2021 at 08:34 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `khs`
--

CREATE TABLE `khs` (
  `kodeKHS` varchar(5) NOT NULL,
  `nim` varchar(5) NOT NULL,
  `kodeMK` varchar(5) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khs`
--

INSERT INTO `khs` (`kodeKHS`, `nim`, `kodeMK`, `nilai`) VALUES
('KHS01', 'MHS01', 'MK01', '85'),
('KHS02', 'MHS05', 'MK04', '90'),
('KHS03', 'MHS03', 'MK02', '85'),
('KHS04', 'MHS04', 'MK02', '85');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(5) NOT NULL,
  `namaMHS` varchar(50) NOT NULL,
  `jkel` varchar(1) NOT NULL,
  `alamat` text NOT NULL,
  `tgllahir` date NOT NULL,
  `jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `namaMHS`, `jkel`, `alamat`, `tgllahir`, `jurusan`) VALUES
('MHS01', 'Ferry', 'L', 'Yogyakarta', '2020-11-01', 'Teknik Informatika'),
('MHS02', 'Andi', 'L', 'Solo', '2011-12-04', 'Hukum'),
('MHS03', 'Intan', 'P', 'Bantul', '2012-10-07', 'Farmasi'),
('MHS04', 'Dewi', 'P', 'Sleman', '2015-06-08', 'Kedokteran'),
('MHS05', 'Udin', 'L', 'Yogyakarta', '2018-10-09', 'Ilmu Komunikasi');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kodeMK` varchar(5) NOT NULL,
  `namaMK` varchar(50) NOT NULL,
  `sks` int(5) NOT NULL,
  `sem` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kodeMK`, `namaMK`, `sks`, `sem`) VALUES
('MK01', 'Pemrograman Web Dinamis', 3, 5),
('MK02', 'Formulasi dan Teknologi Sediaan Steril', 2, 5),
('MK03', 'Etika dan tanggungjawab Profesi Hukum', 3, 7),
('MK04', 'Komunikasi International', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `konfirmasi_pass` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `password`, `konfirmasi_pass`, `nama`, `email`, `level`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', '', 'admin', 'admin@gmail.com', 'user'),
('agung', '21232f297a57a5a743894a0e4a801fc3', '', 'agung', 'agung@gmail.com', 'user'),
('ferry', '21232f297a57a5a743894a0e4a801fc3', '', 'Ferry Agung Prabowo', 'ferry@gmail.com', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`kodeKHS`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kodeMK` (`kodeMK`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kodeMK`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`kodeMK`) REFERENCES `matakuliah` (`kodeMK`),
  ADD CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
