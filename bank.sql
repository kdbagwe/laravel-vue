-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 07:04 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` tinyint(1) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `uuid`, `user_id`, `action`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'a8901b1f-1bfb-41cc-bc69-0a2a3e987488', 1, 1, '10.00', '2022-11-16 18:07:01', '2022-11-16 18:07:01', NULL),
(2, '98e08b57-2530-452f-9b58-10424c8dc729', 1, 1, '1.00', '2022-11-16 18:19:50', '2022-11-16 18:19:50', NULL),
(3, '7ec8d22d-4581-42a3-8fd3-30f56fb4c474', 1, 0, '5.00', '2022-11-16 18:27:47', '2022-11-16 18:27:47', NULL),
(4, '830a5183-2d56-496f-bcf9-99316af4c311', 1, 0, '1.00', '2022-11-16 18:36:59', '2022-11-16 18:36:59', NULL),
(5, '521ef23a-72f2-4698-b774-d5e1adcc09a5', 1, 1, '10.00', '2022-11-16 18:37:04', '2022-11-16 18:37:04', NULL),
(6, 'd5561e1a-e4bb-4bf5-8676-7440d9f5a50e', 1, 0, '14.90', '2022-11-16 18:37:33', '2022-11-16 18:37:33', NULL),
(7, 'e46d85ba-45a9-4a2f-a927-7e02c8fba270', 1, 1, '9.90', '2022-11-16 18:38:32', '2022-11-16 18:38:32', NULL),
(8, '70c474d0-ae1e-4a72-9c33-c80ae33c3349', 1, 0, '1.00', '2022-11-16 18:38:42', '2022-11-16 18:38:42', NULL),
(9, '760cc2de-adb7-47e2-8981-ae13ee29040a', 3, 1, '1000.00', '2022-11-17 05:35:01', '2022-11-17 05:35:01', NULL),
(10, '2b4813ca-4703-431a-9fa8-31e183d5e619', 3, 0, '880.00', '2022-11-17 05:35:09', '2022-11-17 05:35:09', NULL),
(11, 'c817c2f3-a165-4847-baf1-4856f79d6d2e', 3, 1, '10.00', '2022-11-17 05:35:17', '2022-11-17 05:35:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_06_30_060659_add_columns_to_users_table', 2),
(7, '2022_11_15_230525_create_accounts_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'user-auth-token', 'c2c561ca45bb315c082ab70d183efb17c3eea682a97e82b7970b7924960ad535', '[\"*\"]', NULL, '2022-11-16 05:34:53', '2022-11-16 05:34:53'),
(2, 'App\\Models\\User', 1, 'user-auth-token', 'a6298406f0b337e4cbc9d0f6d501a7300f8a2014c5d488a96f642bf49d659414', '[\"*\"]', NULL, '2022-11-16 15:58:58', '2022-11-16 15:58:58'),
(3, 'App\\Models\\User', 1, 'user-auth-token', '4c764faadfe536ae757faad618978ff116b54fd595d310a7d9620ba0e5c24254', '[\"*\"]', NULL, '2022-11-16 16:04:58', '2022-11-16 16:04:58'),
(4, 'App\\Models\\User', 1, 'user-auth-token', '199d6fedfe6b1f15146d5ce937b484e2d36cad4e7be04ce511506e8ef812548f', '[\"*\"]', NULL, '2022-11-16 16:41:41', '2022-11-16 16:41:41'),
(5, 'App\\Models\\User', 1, 'user-auth-token', '95ad66bd931afbcceb6acf464d89aaf1591fe21a10f3d1b8e086447beb420c3c', '[\"*\"]', NULL, '2022-11-16 18:34:17', '2022-11-16 18:34:17'),
(6, 'App\\Models\\User', 1, 'user-auth-token', '6801fc31cd51a76dabda3ea3242ea992d0c527333bce8af45d6141bb146b9d48', '[\"*\"]', NULL, '2022-11-17 04:28:15', '2022-11-17 04:28:15'),
(7, 'App\\Models\\User', 1, 'user-auth-token', '7af866628307e85e6d3af55c0120dc4521eb66f015e20a988e132b2dfd075e86', '[\"*\"]', NULL, '2022-11-17 04:54:55', '2022-11-17 04:54:55'),
(8, 'App\\Models\\User', 1, 'user-auth-token', 'c93cff7c66c580c6202f7949d580d4fb9a74cec226aaf4b438baa613b3e142c1', '[\"*\"]', NULL, '2022-11-17 04:55:15', '2022-11-17 04:55:15'),
(9, 'App\\Models\\User', 1, 'user-auth-token', '7c684640fe7858a9377233734acb1d9335812f6ffb181d2bddce4ae47cf6dfea', '[\"*\"]', NULL, '2022-11-17 04:55:38', '2022-11-17 04:55:38'),
(10, 'App\\Models\\User', 1, 'user-auth-token', '52c6f5da1ac03cb636f7ad53285e579b595009ba07fecf8e0d51114843e1ce2f', '[\"*\"]', NULL, '2022-11-17 04:59:23', '2022-11-17 04:59:23'),
(11, 'App\\Models\\User', 1, 'user-auth-token', '95701fe330cace2844c9bc362b1d69b6fa2f0c0a93c4ae7e96a4342cde1f7de8', '[\"*\"]', NULL, '2022-11-17 05:02:41', '2022-11-17 05:02:41'),
(12, 'App\\Models\\User', 1, 'user-auth-token', '5f60c881998d029096f380b18cff39395a8472609384c247fd043844092db5ef', '[\"*\"]', NULL, '2022-11-17 05:03:36', '2022-11-17 05:03:36'),
(13, 'App\\Models\\User', 1, 'user-auth-token', 'b9c595cf45ec860592d1f723b803bd4e38bda2cf857dbed40f91b80e79ccdc61', '[\"*\"]', NULL, '2022-11-17 05:05:21', '2022-11-17 05:05:21'),
(14, 'App\\Models\\User', 1, 'user-auth-token', '2f8cd3dcf4d8cabe88c3ff54632152aae9a9c79b3619e3acd3f40c9b7b7a6c49', '[\"*\"]', NULL, '2022-11-17 05:05:32', '2022-11-17 05:05:32'),
(15, 'App\\Models\\User', 1, 'user-auth-token', 'db9c1af267429e473b9924b1abef57988c84b2c1d320bb65fe6257c1073f9865', '[\"*\"]', NULL, '2022-11-17 05:05:45', '2022-11-17 05:05:45'),
(16, 'App\\Models\\User', 1, 'user-auth-token', '403324f6b5922a7c87a119a03559d35456d322cb63aa1ef1226287810722b1d4', '[\"*\"]', NULL, '2022-11-17 05:06:35', '2022-11-17 05:06:35'),
(17, 'App\\Models\\User', 2, 'user-auth-token', 'd8282309609ef35bf9ba5f2091e6afaa236b2151d35f7f092c0173b4aa1fed85', '[\"*\"]', NULL, '2022-11-17 05:07:15', '2022-11-17 05:07:15'),
(18, 'App\\Models\\User', 2, 'user-auth-token', '2893c78ea9677265865b0693f0248e602a1fa1a07cfec59261517c411b6b277b', '[\"*\"]', NULL, '2022-11-17 05:10:36', '2022-11-17 05:10:36'),
(19, 'App\\Models\\User', 3, 'user-auth-token', 'aaea6c4c6b2a80512f37bf45a4e2b862eff12fa01b58dbd0d9de4070baa2baf5', '[\"*\"]', NULL, '2022-11-17 05:34:19', '2022-11-17 05:34:19'),
(20, 'App\\Models\\User', 2, 'user-auth-token', '4a60e941a55242b08efbb709d9d0fec2e01ce3af294b0a6efd4c52e9767f29e4', '[\"*\"]', NULL, '2022-11-17 05:35:25', '2022-11-17 05:35:25'),
(21, 'App\\Models\\User', 2, 'user-auth-token', 'dfdaf3327b0c64dd3fcab943ca3c5b56e10ffd2f838f0f58071027a097dd187e', '[\"*\"]', NULL, '2022-11-17 05:41:41', '2022-11-17 05:41:41'),
(22, 'App\\Models\\User', 2, 'user-auth-token', '0098a5e6e20b0c868dcdbc9f490242db2c31864999dfafeb13f1a43c7e68e552', '[\"*\"]', NULL, '2022-11-17 05:50:47', '2022-11-17 05:50:47'),
(23, 'App\\Models\\User', 1, 'user-auth-token', 'c2833b783b3669708a9fc80419294170a46938a2b88554806156aa7012dda49a', '[\"*\"]', '2022-11-17 05:57:16', '2022-11-17 05:56:20', '2022-11-17 05:57:16'),
(24, 'App\\Models\\User', 2, 'user-auth-token', '40965aea3a4481fb635943f5946db6fbd54def26f30c1fe9827ade4e99e35763', '[\"*\"]', '2022-11-17 05:58:09', '2022-11-17 05:57:36', '2022-11-17 05:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_banker` tinyint(1) NOT NULL DEFAULT 0,
  `balance` decimal(10,2) DEFAULT 0.00,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `uuid`, `is_banker`, `balance`, `deleted_at`) VALUES
(1, 'Kaustubh', 'kdbagwe@gmail.com', NULL, '$2y$10$KkKC1V8iXdsDBh3Rhrv8UuSGQzX5G8gHhszq38uJuSPybuvJTcAd2', NULL, '2022-11-16 05:28:00', '2022-11-16 18:38:42', '9365923d-cc94-43ab-83c2-b9cf547ca39b', 0, '9.00', NULL),
(2, 'Banker', 'banker@gmail.com', NULL, '$2y$10$KkKC1V8iXdsDBh3Rhrv8UuSGQzX5G8gHhszq38uJuSPybuvJTcAd2', NULL, '2022-11-16 05:29:22', '2022-11-16 05:29:22', '3ca1aa54-4f5f-478e-98f0-5ce5c34b00e9', 1, '0.00', NULL),
(3, 'Raj', 'raj@gmail.com', NULL, '$2y$10$/AXbLLJDB/emN6rP4odGae8lV3aShIqVNb9ogpA7k31XzhqsLRDCa', NULL, '2022-11-17 05:34:19', '2022-11-17 05:35:17', 'fe66c172-c196-4a80-8015-c9f885a1ed6e', 0, '130.00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
