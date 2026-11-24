-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20261024.6eba7ba9ad
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2026 at 04:28 PM
-- Server version: 8.4.3
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pendaftaran_jsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `berkas_pendaftarans`
--
CREATE TABLE `berkas_pendaftarans` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `jenis_berkas` varchar(100) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `status_verifikasi` enum('Menunggu','Valid','Ditolak') NOT NULL DEFAULT 'Menunggu',
  `catatan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `berkas_pendaftarans`
--

INSERT INTO `berkas_pendaftarans` (`id`, `mahasiswa_id`, `jenis_berkas`, `file_path`, `status_verifikasi`, `catatan`, `created_at`, `updated_at`) VALUES
(4, 3, 'Kartu Keluarga', 'uploads/berkas/kk_5025251078.pdf', 'Valid', 'Dokumen jelas dan sesuai', '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(5, 4, 'Ijazah / SKL', 'uploads/berkas/skl_5025251079.pdf', 'Menunggu', 'Sedang dicek panitia', '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(6, 5, 'Pas Foto Formal', 'uploads/berkas/foto_5025251080.jpg', 'Ditolak', 'Latar belakang foto belum merah', '2026-11-23 16:28:24', '2026-11-23 16:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--
CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_seleksis`
--
CREATE TABLE `jadwal_seleksis` (
  `id` bigint UNSIGNED NOT NULL,
  `jalur_masuk_id` bigint UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(150) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `lokasi` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal_seleksis`
--

INSERT INTO `jadwal_seleksis` (`id`, `jalur_masuk_id`, `nama_kegiatan`, `tanggal_mulai`, `tanggal_selesai`, `lokasi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Verifikasi Rapor dan Portofolio Prestasi', '2026-03-01', '2026-03-10', 'Online (Portal Penerimaan)', '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(2, 2, 'Ujian Tulis Berbasis Komputer (UTBK) Gelombang 1', '2026-05-10', '2026-05-17', 'Gedung Riset Center', '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(3, 3, 'Tes Wawancara dan Uji Keterampilan Mandiri', '2026-06-15', '2026-06-18', 'Departemen Teknik Informatika', '2026-11-23 16:28:24', '2026-11-23 16:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `jalur_masuk`
--
CREATE TABLE `jalur_masuk` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_jalur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jalur_masuk`
--

INSERT INTO `jalur_masuk` (`id`, `nama_jalur`) VALUES
(1, 'snbp'),
(2, 'SNBT'),
(3, 'SMITS FLAT'),
(7, 'Dida ganteng banget bos');

-- --------------------------------------------------------

--
-- Table structure for table `jalur_masuks`
--
CREATE TABLE `jalur_masuks` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_jalur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jalur_masuks`
--

INSERT INTO `jalur_masuks` (`id`, `nama_jalur`, `created_at`, `updated_at`) VALUES
(1, 'SNBP', NULL, NULL),
(2, 'SNBP', '2026-10-28 15:23:45', '2026-10-28 15:23:45'),
(3, 'Mandiri Prestasi', '2026-10-28 15:23:51', '2026-10-28 15:23:51'),
(4, 'Mandiri Normal', '2026-10-28 15:23:58', '2026-10-28 15:23:58'),
(5, 'Mandiri Kemitraan', '2026-10-28 15:24:05', '2026-10-28 15:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--
CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--
CREATE TABLE `mahasiswa` (
  `NRP` varchar(20) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `angkatan` year NOT NULL,
  `id_jalur` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--
CREATE TABLE `mahasiswas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jalur_masuk_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nama`, `nrp`, `angkatan`, `jalur_masuk_id`, `created_at`, `updated_at`) VALUES
(3, 'Mas kamil kahima', '5025241089', '2024', 2, '2026-10-28 15:32:25', '2026-10-28 15:32:25'),
(4, 'Raka Pratama', '5025251079', '2025', 2, NULL, NULL),
(5, 'mas ndut', '50123456', '2000', 4, '2026-10-28 15:34:48', '2026-10-28 15:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--
CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_27_150008_create_mahasiswas_table', 1),
(5, '2026_10_27_150020_create_jalur_masuks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayarans`
--
CREATE TABLE `pembayarans` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `kode_pembayaran` varchar(50) NOT NULL,
  `nominal` decimal(12,2) NOT NULL,
  `metode_bayar` varchar(50) NOT NULL,
  `status_bayar` enum('Belum Lunas','Lunas') NOT NULL DEFAULT 'Belum Lunas',
  `tanggal_bayar` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayarans`
--

INSERT INTO `pembayarans` (`id`, `mahasiswa_id`, `kode_pembayaran`, `nominal`, `metode_bayar`, `status_bayar`, `tanggal_bayar`, `created_at`, `updated_at`) VALUES
(1, 3, 'INV-2026-001', 250000.00, 'Transfer Virtual Account BNI', 'Lunas', '2026-04-12', '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(2, 4, 'INV-2026-002', 350000.00, 'QRIS', 'Lunas', '2026-04-15', '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(3, 5, 'INV-2026-003', 350000.00, 'Transfer Virtual Account Mandiri', 'Belum Lunas', NULL, '2026-11-23 16:28:24', '2026-11-23 16:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `pengumumans`
--
CREATE TABLE `pengumumans` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `tanggal_publish` date NOT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengumumans`
--

INSERT INTO `pengumumans` (`id`, `judul`, `isi`, `tanggal_publish`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, 'Jadwal Daftar Ulang Mahasiswa Baru Jalur SNBP 2026', 'Seluruh peserta yang dinyatakan lulus jalur SNBP wajib mengunggah berkas daftar ulang paling lambat 30 April 2026.', '2026-04-01', 1, '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(2, 'Pembukaan Pendaftaran Jalur Mandiri Prestasi', 'Pendaftaran seleksi Mandiri Prestasi resmi dibuka mulai tanggal 1 Mei 2026 melalui laman resmi penerimaan.', '2026-04-25', 1, '2026-11-23 16:28:24', '2026-11-23 16:28:24'),
(3, 'Perpanjangan Batas Pembayaran Biaya Seleksi', 'Batas akhir pelunasan biaya pendaftaran diperpanjang hingga pukul 23.59 WIB.', '2026-05-05', 0, '2026-11-23 16:28:24', '2026-11-23 16:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `prodis`
--
CREATE TABLE `prodis` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_prodi` varchar(20) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `jenjang` enum('D3','D4','S1','S2') NOT NULL DEFAULT 'S1',
  `kuota` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prodis`
--

INSERT INTO `prodis` (`id`, `kode_prodi`, `nama_prodi`, `jenjang`, `kuota`, `created_at`, `updated_at`) VALUES
(1, '5025', 'Teknik Informatika', 'S1', 180, '2026-11-23 16:27:33', '2026-11-23 16:27:33'),
(2, '5026', 'Sistem Informasi', 'S1', 150, '2026-11-23 16:27:33', '2026-11-23 16:27:33'),
(3, '5027', 'Teknologi Informasi', 'S1', 120, '2026-11-23 16:27:33', '2026-11-23 16:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('75m9izxj3G8LA1ssS0w43zb0x3QbXtzrvVMQyJmr', NULL, '89.47.161.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiIyVzI3YUdPaFdVVU9pNzY0dnRGeDlRSWNVTWJiRDQzd2NjWld2RjBkIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1793313765),
('7LDI4TbEW1UF0z7tIlsBJq0LUDomVuP3WnbOBA6q', NULL, '192.178.7.167', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'eyJfdG9rZW4iOiJXSERFSjRVYkN6RlFjRnN6TjlsSFBPbVFoZFdzNHJrbzN0Vkg4RjlOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1793376087),
('ai0UKLD2szCsH9seIUfk7yVs61b1zxjtlnrhBXMm', NULL, '176.223.132.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiJLV3h4SENUeU5SaUJCYkdWQ1VidkYwRlB1Z29TeExjR0ZVbjdLU0phIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795324224),
('BbbCVt5fzu14nRRXtgSLQYSegGQzR30orTWFjJUE', 3, '182.8.97.222', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/156.0.8078.54 Mobile/15E148 Safari/604.1', 'eyJfdG9rZW4iOiJLZFltVzhMTGxOYW9ZdThUb1ZRQnhWaDkxalJzOUx4SUpHRTJWVjBxIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cHM6XC9cL3NhaGFiYXQuZ3QudGNcL2Rhc2hib2FyZCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjozLCJwYXNzd29yZF9oYXNoX3dlYiI6ImMxMWNjMDQ5OWNmNTIyYjdlYzJiMzczZGZiOWRhZjg4NWE5NmNlYTlkZmQ3MzFhYTlmODRhMTAwNDM1YThkOWMifQ==', 1793176475),
('caDjewtQNYaq1AXCiC8ikOPTP6JN239cjDLJmA3T', NULL, '216.237.232.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ3R0VpS3Y0SlJJRXRvV2hzWkNuMnJWVWw5QUJKZ0ZGSm1UcTB2S0lGIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9sb2dpbj9pPTEiLCJyb3V0ZSI6ImxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1793762614),
('en77OoPdYDzoo0ksaQesplywXKyIJkuiJuOplWhN', NULL, '176.223.141.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiJsNzlnYVJ4S1hsWXJsc3I4NzZLZ2dhbFg5RWlkRzc1ajhOdnNtSUxLIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1794706126),
('jD7G5WFeLQRVv07Dd78owasuLUj1bXzHjIXBQhUi', NULL, '182.8.97.222', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0', 'eyJfdG9rZW4iOiJjOFVwM2pqd3dDc1U4OHp4VzNCN3N6STFWWERPa2xDWUJaM1B0Q3RKIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cHM6XC9cL3NhaGFiYXQuZ3QudGNcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9LCJ1cmwiOnsiaW50ZW5kZWQiOiJodHRwczpcL1wvc2FoYWJhdC5ndC50Y1wvZGFzaGJvYXJkIn19', 1793195320),
('jOb0WbO4cgqgXPbxsFbRWCNynbEZPMZFGDLMQSsm', NULL, '104.28.247.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ3SENEeHRhVXlvOThzTUExWjQ5RWhBczQ2ME5qS3BteVRSVDFEYUpuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9sb2dpbj9pPTEiLCJyb3V0ZSI6ImxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1793762611),
('JS6ESv9pIaOmf4fi3et2lFN5PempwF52HHZLWcjK', NULL, '74.125.184.191', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJhREk4UlhrR0UwZUxjemtQOXhxSlJmWnRyM1VSUkkzTERDYUgyVjYwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1793762618),
('MZyDm24viaijY7z709DesQMFZZSLJpZGXHIAlTw8', NULL, '176.223.132.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiJoVEZFWEJtbG5Wbld3WHV1enNDc1Z0a2lqbjM0cjk3eW1DekczQnpoIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1793770162),
('p5lNEgZoJC2WE3wLpXTVXkoav8YMKEedOHspiyXX', NULL, '195.181.242.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiJKUVhLcUpXejdDQUxqTFdnOGdPazRhRU5HUmF5UUxzRnlkajFxeWc3IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1793437466),
('PFEDF5isu8tLRjbowk8R4hXwRw71ISLRorHiRn9X', 2, '182.8.100.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', 'eyJfdG9rZW4iOiI5M1RBV0pVMW03eFZ3aTAzdnY3d1p6UVJuMVlITkVSNmJrbk5VdzBHIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cHM6XC9cL3NhaGFiYXQuZ3QudGNcL2Rhc2hib2FyZCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyLCJwYXNzd29yZF9oYXNoX3dlYiI6ImI3YzYyMGRlYWFiNmVhZTZhMzNmNjcyMDgzMDdlM2M4YzlmNzMzZTczNjQwNWQ4OTJjZTZkNjNjZTQ3MGVmNjAifQ==', 1793176510),
('qaHhFVfsgqdVuIMoh3uuvYTlw3cpA4Ab1kFd0e17', NULL, '182.8.98.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36 Edg/158.0.0.0', 'eyJfdG9rZW4iOiJHQjhqdHZMRU1vTDJKZVd1R3J6TGoySkI0c1VHdlNLTkFPYm15UWt0IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795439173),
('qq0DEC3jEoWOwBWznJHFDTFAfm1Up4fPClqk0W3A', NULL, '89.47.161.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiI5dlJiTUlTbHhxTHpQT0szVkFTbzhFZ3V5NklDU1dGd0dONVQ2MDR1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795003591),
('qyPGhRRbUVPeXuMUpzLNSaCS5F1um5ywBy5EjXFk', NULL, '66.249.68.131', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'eyJfdG9rZW4iOiJXZ0ZVSUtHelREQ3JlNkVEbHFtdW12bHZBbGNQcXpqSHdPZlg2aE4xIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1793194534),
('SG6r4TbMgsiiC3uotfRBOdZVr9xPRAzRJnism0J5', 3, '182.8.100.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJDUnZYN1hPU0dhUDZmVktiNm9xeVdYYVlIZjdtdG5PSWhtOE0xT3ZvIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9kYXNoYm9hcmQiLCJyb3V0ZSI6ImRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjozLCJwYXNzd29yZF9oYXNoX3dlYiI6ImMxMWNjMDQ5OWNmNTIyYjdlYzJiMzczZGZiOWRhZjg4NWE5NmNlYTlkZmQ3MzFhYTlmODRhMTAwNDM1YThkOWMifQ==', 1793173530),
('v1WNnyQFokQUQszrS6DtjTFKCo4T8VyOyzN81ne1', NULL, '195.181.243.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiJqNWdGenU1VWtVa25leWRkbndCUVRWYzd6VHRDbjk2NUdCVGtmeUpVIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1794371205),
('Ye2F3C64nhSHboeTYj4jWym2tOiZ8cq87aULzpOX', NULL, '212.24.110.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'eyJfdG9rZW4iOiJPd2ZnQm5iNWRSWHVvcmhEMVJXV2lSTUF5bVVseXU1ODhkaUE2OWF2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3NhaGFiYXQuZ3QudGNcLz93YlRva2VuVmVyaWZ5RGlhZz0xIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1794057553),
('yrDPKyJEA14bccCKfczvG7bVZDZKsHTdPR1liTRZ', NULL, '192.178.7.167', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'eyJfdG9rZW4iOiJmcEFPWDlzcmVqd0V5RjcwSE0yTlBOdjdKak9qZ1M0SGtFb21NazFXIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1793376103),
('zDrOeMnsK22qyUOSCxqi6YSorUr6caUT9GwhMzAx', NULL, '192.178.7.167', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'eyJfdG9rZW4iOiJyUzNRa09ZMUVobFRyaVoxNWZkaHU0V0hzbFR5Q2RwWFJIQmxtUkdMIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYWhhYmF0Lmd0LnRjXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1793376104);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dida', 'didapandawaa29@gmail.com', NULL, '$2y$12$85.Ud.3mOVSs4p/SoTMVzuz7Ky7DFyAZ/ojKp3a201Wp9R0ze6QXa', NULL, '2026-10-27 09:06:08', '2026-10-27 09:06:08'),
(2, 'mbah', 'rayyanaurarahman@gmail.com', NULL, '$2y$12$wPiKEisjlQsV/9tclXZfDe1RD7ADiuGfLH45JPGF9ypqQu4zJhUci', NULL, '2026-10-28 14:31:56', '2026-10-28 14:31:56'),
(3, 'fano', 'dewafitrah06@gmail.com', NULL, '$2y$12$xmqfwPOQ9dObk/tMBiOzw.3Q6aZIIaj6e7go8/QPv6KYNs2c2gt1m', 'BxhUCnuGCVFDaKXSmr4oncZ9ujtBuIdHrVWcs64gbd3ZXSvQKBN1uE2MlhQN', '2026-10-28 14:45:28', '2026-10-28 14:45:28'),
(4, 'Dewa Fitrah', 'enisrihayati@gmail.com', NULL, '$2y$12$Hj7c3GZgiPkb.IhhTx3J9.as6WGA06NoDejy1jl1ErPg0QqflQdsa', 'b5le2rvCsTPxeZ3frEhQ8ChtPYspUR1rT4QEFV1IJXxC6Tk0aq3HiFpJ4WdD', '2026-10-28 15:22:46', '2026-10-28 15:22:46'),
(5, 'Demo Account', 'gonzoldyck2006@gmail.com', NULL, '$2y$12$T8Sl2xECZ2R8LMZKn53.X.Fs1ef0KSLK5sQl/cezU1XG93uEpNXlC', NULL, '2026-10-28 20:04:50', '2026-10-28 20:04:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berkas_pendaftarans`
--
ALTER TABLE `berkas_pendaftarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_berkas_mahasiswa` (`mahasiswa_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jadwal_seleksis`
--
ALTER TABLE `jadwal_seleksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_jalur` (`jalur_masuk_id`);

--
-- Indexes for table `jalur_masuk`
--
ALTER TABLE `jalur_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jalur_masuks`
--
ALTER TABLE `jalur_masuks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NRP`),
  ADD KEY `id_jalur` (`id_jalur`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_pembayaran` (`kode_pembayaran`),
  ADD KEY `fk_pembayaran_mahasiswa` (`mahasiswa_id`);

--
-- Indexes for table `pengumumans`
--
ALTER TABLE `pengumumans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_prodi` (`kode_prodi`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berkas_pendaftarans`
--
ALTER TABLE `berkas_pendaftarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_seleksis`
--
ALTER TABLE `jadwal_seleksis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jalur_masuk`
--
ALTER TABLE `jalur_masuk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jalur_masuks`
--
ALTER TABLE `jalur_masuks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengumumans`
--
ALTER TABLE `pengumumans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berkas_pendaftarans`
--
ALTER TABLE `berkas_pendaftarans`
  ADD CONSTRAINT `fk_berkas_mahasiswa` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jadwal_seleksis`
--
ALTER TABLE `jadwal_seleksis`
  ADD CONSTRAINT `fk_jadwal_jalur` FOREIGN KEY (`jalur_masuk_id`) REFERENCES `jalur_masuks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jalur`) REFERENCES `jalur_masuk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `fk_pembayaran_mahasiswa` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
