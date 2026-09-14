-- --------------------------------------------------------
-- Host:                         192.168.0.219
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- membuang struktur untuk table db_spmb.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.cache: ~0 rows (lebih kurang)
DELETE FROM `cache`;

-- membuang struktur untuk table db_spmb.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.cache_locks: ~0 rows (lebih kurang)
DELETE FROM `cache_locks`;

-- membuang struktur untuk table db_spmb.data_orang_tua
CREATE TABLE IF NOT EXISTS `data_orang_tua` (
  `id_orang_tua` int NOT NULL AUTO_INCREMENT,
  `id_pendaftar` bigint unsigned NOT NULL,
  `nama_ayah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tahun_lahir_ayah` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ayah_kebutuhan_khusus` enum('Ya','Tidak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pekerjaan_ayah` varchar(50) DEFAULT NULL,
  `pendidikan_terakhir_ayah` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `penghasilan_ayah_bulanan` varchar(30) DEFAULT NULL,
  `nama_ibu` varchar(100) DEFAULT NULL,
  `tahun_lahir_ibu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ibu_kebutuhan_khusus` enum('Ya','Tidak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pekerjaan_ibu` varchar(50) DEFAULT NULL,
  `pendidikan_terakhir_ibu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `penghasilan_ibu_bulanan` varchar(30) DEFAULT NULL,
  `nama_wali` varchar(100) DEFAULT NULL,
  `no_hp_wali` varchar(15) DEFAULT NULL,
  `pekerjaan_wali` varchar(50) DEFAULT NULL,
  `pendidikan_terakhir_wali` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `penghasilan_wali_bulanan` varchar(30) DEFAULT NULL,
  `no_hp_ayah` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_hp_ibu` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_orang_tua`),
  KEY `fk_pendaftar_ortu` (`id_pendaftar`),
  CONSTRAINT `fk_pendaftar_ortu` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_spmb.data_orang_tua: ~2 rows (lebih kurang)
DELETE FROM `data_orang_tua`;
INSERT INTO `data_orang_tua` (`id_orang_tua`, `id_pendaftar`, `nama_ayah`, `tahun_lahir_ayah`, `ayah_kebutuhan_khusus`, `pekerjaan_ayah`, `pendidikan_terakhir_ayah`, `penghasilan_ayah_bulanan`, `nama_ibu`, `tahun_lahir_ibu`, `ibu_kebutuhan_khusus`, `pekerjaan_ibu`, `pendidikan_terakhir_ibu`, `penghasilan_ibu_bulanan`, `nama_wali`, `no_hp_wali`, `pekerjaan_wali`, `pendidikan_terakhir_wali`, `penghasilan_wali_bulanan`, `no_hp_ayah`, `no_hp_ibu`) VALUES
	(25, 51, 'Isro\'i', NULL, 'Tidak', 'Wiraswasta', 'smp', NULL, 'Puji Haryati', NULL, 'Tidak', 'Wiraswasta', 'sma', NULL, 'Agustina Dian Puspita Sari', NULL, 'belum bekerja', 'diploma', NULL, NULL, NULL);

-- membuang struktur untuk table db_spmb.dokumen_pendaftar
CREATE TABLE IF NOT EXISTS `dokumen_pendaftar` (
  `id_dokumen` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pendaftar` bigint unsigned NOT NULL,
  `kk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktp_ayah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktp_ibu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pas_foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bukti_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_penerima_bantuan` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci DEFAULT 'Tidak',
  `jenis_bantuan` text COLLATE utf8mb4_unicode_ci,
  `is_lengkap` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_dokumen`),
  UNIQUE KEY `unique_pendaftar` (`id_pendaftar`),
  CONSTRAINT `fk_dokumen_pendaftar` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.dokumen_pendaftar: ~1 rows (lebih kurang)
DELETE FROM `dokumen_pendaftar`;
INSERT INTO `dokumen_pendaftar` (`id_dokumen`, `id_pendaftar`, `kk`, `akta`, `ktp_ayah`, `ktp_ibu`, `skl`, `pas_foto`, `kps`, `kks`, `kip`, `bukti_pembayaran`, `created_at`, `updated_at`, `is_penerima_bantuan`, `jenis_bantuan`, `is_lengkap`) VALUES
	(25, 51, 'dokumen/kk/MYMLgEsjosEcEGHwuEjSJJrviq9vvNM4430miahF.jpg', 'dokumen/akta/8QBjGpxvRgaA8WLAwlChygDCz54UWGE9OWeteOI0.jpg', 'dokumen/ktp_ayah/zGIoYSPpez6H96waqdA73LL6Q93GpHF0PvaCtaW7.jpg', 'dokumen/ktp_ibu/YJtFQ05OsldLG8DpXh7juIXh0GdOqR3DT2u90ySi.jpg', 'dokumen/skl/HuhjcJBWJFfjgB3rKBrawZ2WVsf62jemtjPbnZHf.jpg', 'dokumen/pas_foto/7wFrFAOjpYMneugFhlchMmmsTuTyS59vViN20yJI.jpg', NULL, NULL, NULL, NULL, NULL, '2026-09-01 23:36:58', 'Tidak', NULL, 0);

-- membuang struktur untuk table db_spmb.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.failed_jobs: ~0 rows (lebih kurang)
DELETE FROM `failed_jobs`;

-- membuang struktur untuk table db_spmb.grafik_pendaftar
CREATE TABLE IF NOT EXISTS `grafik_pendaftar` (
  `id_grafik` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_jurusan` bigint unsigned NOT NULL,
  `jumlah_pendaftar` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_grafik`),
  KEY `grafik_pendaftar_id_jurusan_foreign` (`id_jurusan`),
  CONSTRAINT `grafik_pendaftar_id_jurusan_foreign` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.grafik_pendaftar: ~2 rows (lebih kurang)
DELETE FROM `grafik_pendaftar`;
INSERT INTO `grafik_pendaftar` (`id_grafik`, `id_jurusan`, `jumlah_pendaftar`, `created_at`, `updated_at`) VALUES
	(1, 1, 0, '2026-07-12 20:50:37', '2026-08-12 17:51:17'),
	(2, 2, 0, '2026-07-12 20:50:37', '2026-07-12 20:50:37'),
	(3, 3, 0, '2026-07-12 20:50:38', '2026-08-12 17:51:19');

-- membuang struktur untuk table db_spmb.id_counter
CREATE TABLE IF NOT EXISTS `id_counter` (
  `tahun` int NOT NULL,
  `last_number` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tahun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_spmb.id_counter: ~0 rows (lebih kurang)
DELETE FROM `id_counter`;
INSERT INTO `id_counter` (`tahun`, `last_number`) VALUES
	(2027, 1);

-- membuang struktur untuk table db_spmb.jadwal
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tahap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.jadwal: ~0 rows (lebih kurang)
DELETE FROM `jadwal`;

-- membuang struktur untuk table db_spmb.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.jobs: ~0 rows (lebih kurang)
DELETE FROM `jobs`;

-- membuang struktur untuk table db_spmb.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.job_batches: ~0 rows (lebih kurang)
DELETE FROM `job_batches`;

-- membuang struktur untuk table db_spmb.jurusan
CREATE TABLE IF NOT EXISTS `jurusan` (
  `id_jurusan` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_jurusan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `kuota` int NOT NULL,
  `biaya` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_jurusan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.jurusan: ~3 rows (lebih kurang)
DELETE FROM `jurusan`;
INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `deskripsi`, `kuota`, `biaya`, `created_at`, `updated_at`, `kode_jurusan`) VALUES
	(1, 'Pengembangan Perangkat Lunak dan Gim', NULL, 72, NULL, NULL, NULL, 'PPLG'),
	(2, 'Broadcasting dan Perfilman', NULL, 60, NULL, NULL, NULL, 'BCF'),
	(3, 'Manajemen Perkantoran dan Layanan Bisnis', NULL, 80, NULL, NULL, NULL, 'MPLB');

-- membuang struktur untuk table db_spmb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.migrations: ~12 rows (lebih kurang)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(6, '0001_01_01_000000_create_users_table', 1),
	(7, '0001_01_01_000001_create_cache_table', 1),
	(8, '0001_01_01_000002_create_jobs_table', 1),
	(9, '2026_06_29_010137_create_jurusan_table', 1),
	(10, '2026_06_29_010207_create_users_admin_table', 1),
	(11, '2026_06_29_010240_create_jadwal_table', 1),
	(12, '2026_06_29_010642_create_pengumuman_table', 1),
	(13, '2026_06_29_010850_create_dokumen_pendaftar_table', 2),
	(14, '2026_06_29_010953_create_pembayaran_table', 2),
	(15, '2026_06_29_011022_create_tes_kejuruan_table', 2),
	(16, '2026_06_29_011113_create_grafik_pendaftar_table', 2),
	(17, '2026_06_29_011140_create_verifikasi_table', 2),
	(18, '2026_06_29_075031_add_kolom_tambahan_to_pendaftar_table', 3),
	(19, '2026_06_30_035229_add_pas_foto_to_dokumen_pendaftar_table', 4),
	(20, '2026_06_30_050820_create_personal_access_tokens_table', 5),
	(21, '2026_07_01_042748_add_role_and_username_to_users_table', 6),
	(22, '2026_07_02_061635_rename_jurusan_columns', 7);

-- membuang struktur untuk table db_spmb.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.password_reset_tokens: ~0 rows (lebih kurang)
DELETE FROM `password_reset_tokens`;

-- membuang struktur untuk table db_spmb.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_pembayaran` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pendaftar` bigint unsigned NOT NULL,
  `jumlah_bayar` int NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `status_konfirmasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum',
  `id_admin` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `pembayaran_id_pendaftar_foreign` (`id_pendaftar`),
  KEY `pembayaran_id_admin_foreign` (`id_admin`),
  CONSTRAINT `pembayaran_id_admin_foreign` FOREIGN KEY (`id_admin`) REFERENCES `users_admin` (`id_admin`),
  CONSTRAINT `pembayaran_id_pendaftar_foreign` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.pembayaran: ~0 rows (lebih kurang)
DELETE FROM `pembayaran`;

-- membuang struktur untuk table db_spmb.pendaftar
CREATE TABLE IF NOT EXISTS `pendaftar` (
  `id_pendaftar` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_pendaftaran` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` bigint unsigned NOT NULL,
  `nama_lengkap` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal_sekolah` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tinggi_badan` decimal(20,6) unsigned DEFAULT NULL,
  `berat_badan` decimal(20,6) unsigned DEFAULT NULL,
  `alamat_lengkap` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rt` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '001, 002, dst',
  `rw` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '001, 002, dst',
  `desa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kecamatan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kabupaten` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_tinggal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kebutuhan_khusus` enum('Ya','Tidak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alat_transportasi_ke_sekolah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_saudara_kandung` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan_pilihan_1` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan_pilihan_2` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `jarak_ke_sekolah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelombang` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pendaftaran` enum('Baru','Diproses','Diterima','Ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Baru',
  `nilai_rata_raport` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_verifikasi` enum('menunggu','lengkap','kurang','revisi','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan_revisi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metode_pembayaran` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_seleksi` enum('Lulus','Tidak Lulus','Cadangan','Belum Diproses') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pendaftar`),
  UNIQUE KEY `pendaftar_nisn_unique` (`nisn`),
  KEY `pendaftar_jurusan_utama_foreign` (`jurusan_pilihan_1`),
  KEY `pendaftar_jurusan_cadangan_foreign` (`jurusan_pilihan_2`),
  KEY `fk_pendaftar_user` (`id_user`),
  CONSTRAINT `fk_pendaftar_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.pendaftar: ~2 rows (lebih kurang)
DELETE FROM `pendaftar`;
INSERT INTO `pendaftar` (`id_pendaftar`, `no_pendaftaran`, `id_user`, `nama_lengkap`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `asal_sekolah`, `agama`, `tinggi_badan`, `berat_badan`, `alamat_lengkap`, `rt`, `rw`, `desa`, `kecamatan`, `kabupaten`, `provinsi`, `kode_pos`, `jenis_tinggal`, `kebutuhan_khusus`, `alat_transportasi_ke_sekolah`, `jumlah_saudara_kandung`, `no_hp`, `jurusan_pilihan_1`, `jurusan_pilihan_2`, `jarak_ke_sekolah`, `gelombang`, `status_pendaftaran`, `nilai_rata_raport`, `status_verifikasi`, `catatan_revisi`, `created_at`, `updated_at`, `metode_pembayaran`, `status_seleksi`) VALUES
	(51, 'SPMB-2027-0001', 24, 'Eka Octavia Indriyani', '10000000000000', 'Magelang', '2008-10-14', 'P', 'Mts Salafiyah Penjalinan Kajoran', 'Islam', 150.000000, 43.000000, 'Ngletoh, Payaman, Secang , Magelang', '013', '006', '3308170011', '3308170', NULL, '33', '56163', 'Kos', 'Tidak', 'Motor', '3', '085867953274', 'PPLG', 'MPLB', '7km', 'Gelombang 1', 'Diproses', NULL, 'lengkap', NULL, '2026-08-13 18:48:20', '2026-09-02 18:43:41', 'Gratis', 'Lulus');

-- membuang struktur untuk table db_spmb.pengumuman
CREATE TABLE IF NOT EXISTS `pengumuman` (
  `id_pengumuman` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengumuman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.pengumuman: ~0 rows (lebih kurang)
DELETE FROM `pengumuman`;

-- membuang struktur untuk table db_spmb.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.personal_access_tokens: ~52 rows (lebih kurang)
DELETE FROM `personal_access_tokens`;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(8, 'App\\Models\\User', 6, 'api_token', '8a193aa0ff6c3233533985a8d79fd56ce6137e113f89628797a56e590fe0f7f5', '["*"]', '2026-08-04 19:16:02', NULL, '2026-07-23 20:34:04', '2026-08-04 19:16:02'),
	(11, 'App\\Models\\User', 6, 'api_token', 'a2b409a52c4fbc7b7e5fc1f45e9ed227ba9413edb0af2b75c5a75914e0ae2e0a', '["*"]', NULL, NULL, '2026-08-04 20:32:36', '2026-08-04 20:32:36'),
	(12, 'App\\Models\\User', 6, 'api_token', '6954c7c04411e0359f6990e4631d8cff935d8a573d55db6fba3f063ebbd152bf', '["*"]', NULL, NULL, '2026-08-04 20:33:01', '2026-08-04 20:33:01'),
	(13, 'App\\Models\\User', 6, 'api_token', '6f51ed23ecd878635d240a1a9bec0c7a60a73637b2245557be358ee5f1ebf361', '["*"]', NULL, NULL, '2026-08-04 20:34:53', '2026-08-04 20:34:53'),
	(14, 'App\\Models\\User', 6, 'api_token', 'ef32e1bdbf692ae6bab6d5003547ea7e4df842780d383f596368f037ba1dbf40', '["*"]', NULL, NULL, '2026-08-04 20:37:16', '2026-08-04 20:37:16'),
	(15, 'App\\Models\\User', 6, 'api_token', 'fa1c016277ef8c2ba5a5aedfbfa0c389660512f8b0ad8ba4ea3feddd5ef51468', '["*"]', NULL, NULL, '2026-08-04 20:47:53', '2026-08-04 20:47:53'),
	(16, 'App\\Models\\User', 6, 'api_token', '7f50beef1980afef6179c7c92c30bb2adfcf6e7ffcc35167d438e3246b4ef135', '["*"]', NULL, NULL, '2026-08-04 20:48:22', '2026-08-04 20:48:22'),
	(17, 'App\\Models\\User', 9, 'siswa_token', 'ba58fb7c2ac06c9505446cbd4ca7db4a76d61bf7083c7622a5dc5c04b85435f4', '["*"]', NULL, NULL, '2026-08-05 18:26:39', '2026-08-05 18:26:39'),
	(18, 'App\\Models\\User', 9, 'api_token', '3e3fd5b5cd30fe44ef8a31093c222479f529660fb8a5836fcd0aa2efbec79d2d', '["*"]', NULL, NULL, '2026-08-05 18:27:59', '2026-08-05 18:27:59'),
	(19, 'App\\Models\\User', 9, 'api_token', '28cbd9d8e65c94566339d7e36bd4e6e3fe53da18ca2582c407fcd5ca64ca3150', '["*"]', NULL, NULL, '2026-08-05 18:28:23', '2026-08-05 18:28:23'),
	(20, 'App\\Models\\User', 9, 'api_token', '05d547044b62fd2af3a4f9652cc7905d1242f97fe7dc2e391e62876da746af70', '["*"]', NULL, NULL, '2026-08-05 18:28:55', '2026-08-05 18:28:55'),
	(21, 'App\\Models\\User', 9, 'api_token', 'c2d62d0d57156198684707cb83607ae0d9e48dd8d9ce40c5a9a4ac2b33291bea', '["*"]', NULL, NULL, '2026-08-05 18:29:19', '2026-08-05 18:29:19'),
	(22, 'App\\Models\\User', 9, 'api_token', 'b326ef7a75b5f8e24cd93e0be6e42540fcc4eecd370f2f6ffa3724768b72fd0e', '["*"]', NULL, NULL, '2026-08-05 18:31:03', '2026-08-05 18:31:03'),
	(23, 'App\\Models\\User', 9, 'api_token', 'c22b53cd15b1a9ca59c1915a89b38fe3f49ca57e01f2658a931dc36afb37c363', '["*"]', NULL, NULL, '2026-08-05 18:31:24', '2026-08-05 18:31:24'),
	(24, 'App\\Models\\User', 9, 'api_token', '338366c8dd0a623484e7fcc37cd37d44ce767da261048afa923d899c92c3b47d', '["*"]', NULL, NULL, '2026-08-05 18:32:25', '2026-08-05 18:32:25'),
	(25, 'App\\Models\\User', 9, 'api_token', '5322cc21a865b1423beaf73feee6b5aaee4d827df67ae7c561517d69a2caeda1', '["*"]', NULL, NULL, '2026-08-05 18:34:45', '2026-08-05 18:34:45'),
	(26, 'App\\Models\\User', 9, 'api_token', '873542c4da95c6c5d3d72aac491dbcd55736db4860d78af032ca738158d19781', '["*"]', NULL, NULL, '2026-08-05 18:35:55', '2026-08-05 18:35:55'),
	(27, 'App\\Models\\User', 9, 'api_token', '94848f7646acbf43b6bc4749782d8a134e4103a27bbe8980791a12afd2416ec2', '["*"]', NULL, NULL, '2026-08-05 18:41:27', '2026-08-05 18:41:27'),
	(28, 'App\\Models\\User', 9, 'api_token', '6b7fc170b3fcfb569e5b790e1e07bd72459be4d5b1aada85423e51c163dcee03', '["*"]', NULL, NULL, '2026-08-05 19:00:18', '2026-08-05 19:00:18'),
	(29, 'App\\Models\\User', 9, 'api_token', '563b8b2d531bb86a0e5e743f32a2bf42b8a35726419a3ae2c05901317265776d', '["*"]', NULL, NULL, '2026-08-05 19:05:06', '2026-08-05 19:05:06'),
	(30, 'App\\Models\\User', 9, 'api_token', 'd91a0398eefa5faf8b39251bc1adb39308a4fc5474f10c695b94a4c88905d54d', '["*"]', NULL, NULL, '2026-08-05 19:09:30', '2026-08-05 19:09:30'),
	(31, 'App\\Models\\User', 9, 'api_token', 'c2d4bebd89a3ae6a7fc546e31861799154f94b79907e3cfff643815df3b6141a', '["*"]', NULL, NULL, '2026-08-05 19:12:24', '2026-08-05 19:12:24'),
	(32, 'App\\Models\\User', 9, 'api_token', 'c362346a3d445e165ab67da5b1367675eba97d8a84cc1afbae24114ccc092dbd', '["*"]', NULL, NULL, '2026-08-05 19:12:48', '2026-08-05 19:12:48'),
	(33, 'App\\Models\\User', 9, 'api_token', '940efada01364133ca5bb6f65d248046ecda484d87c82c12e6996f0ca9eb3533', '["*"]', NULL, NULL, '2026-08-05 19:15:29', '2026-08-05 19:15:29'),
	(34, 'App\\Models\\User', 9, 'api_token', '8d57a92be18c21c5f527d9c40eb309bb71edccee6840cc7fedb0ef075d84d313', '["*"]', NULL, NULL, '2026-08-05 19:26:36', '2026-08-05 19:26:36'),
	(35, 'App\\Models\\User', 9, 'api_token', 'f100aa4f4b9c1f6df3ace8faa91b3eb383aeba4f26feda8d301328c816e747d0', '["*"]', NULL, NULL, '2026-08-05 19:28:48', '2026-08-05 19:28:48'),
	(36, 'App\\Models\\User', 9, 'api_token', '086a6ad4509ffbe364a60486c0267187622ce7683fe3fa95ff11eac32044980b', '["*"]', NULL, NULL, '2026-08-05 19:30:43', '2026-08-05 19:30:43'),
	(37, 'App\\Models\\User', 9, 'api_token', 'aaee2c9b0b0481ed03936f6a840ab0e2f04d0a2ac4bd86fab280bfa03426838a', '["*"]', NULL, NULL, '2026-08-05 19:34:20', '2026-08-05 19:34:20'),
	(38, 'App\\Models\\User', 9, 'api_token', 'c4959468e5c17d9c441e920bc5ab86f1639421c74b2af68c33000fd77900f165', '["*"]', NULL, NULL, '2026-08-05 19:34:35', '2026-08-05 19:34:35'),
	(39, 'App\\Models\\User', 9, 'api_token', '39202c78324c6ea9f9f6e5466bab582c301ea9500f3d081498317efbd8cb5c68', '["*"]', NULL, NULL, '2026-08-05 19:34:42', '2026-08-05 19:34:42'),
	(40, 'App\\Models\\User', 9, 'api_token', 'db4e94142a5b5522e128c5ac11c8f0314c6767f737eff496e472baca350d4b0a', '["*"]', NULL, NULL, '2026-08-05 19:34:55', '2026-08-05 19:34:55'),
	(41, 'App\\Models\\User', 9, 'api_token', '7542ef6aa3e5a0409e4610221bede2c42e562de0c42facef19feafbd2467f4f6', '["*"]', NULL, NULL, '2026-08-05 19:35:04', '2026-08-05 19:35:04'),
	(42, 'App\\Models\\User', 9, 'api_token', 'cf5f4ea523f0289c1cfffd49b3ddfad3b3fbd9d971efa9a602c731f7b95d6ef1', '["*"]', NULL, NULL, '2026-08-05 20:03:02', '2026-08-05 20:03:02'),
	(43, 'App\\Models\\User', 20, 'api_token', '498a809067b715f3f722669e83d97c22bc6de6efbf0f1d5456f5c22108142e11', '["*"]', NULL, NULL, '2026-08-10 23:53:34', '2026-08-10 23:53:34'),
	(44, 'App\\Models\\User', 24, 'api_token', 'd8069998b4f9aab4cf24157efe3e0ecf0593939761bf82e73b0511141e8d2bce', '["*"]', NULL, NULL, '2026-08-14 18:36:16', '2026-08-14 18:36:16'),
	(45, 'App\\Models\\User', 24, 'api_token', 'c81042db38746965c6b11253b5326d4821fa6f85ce8b4a1232161d7e5bc0403b', '["*"]', NULL, NULL, '2026-08-14 18:36:18', '2026-08-14 18:36:18'),
	(46, 'App\\Models\\User', 24, 'api_token', '0c9e182c66649f34c181e9139b4d3ed01b40b954c616c87f2a2ac5a4283542b2', '["*"]', NULL, NULL, '2026-08-14 18:40:54', '2026-08-14 18:40:54'),
	(47, 'App\\Models\\User', 24, 'api_token', 'e3475eb27bb0bd434448019632fb46ab39403c01a4f7a97dd1ac5b03157a016b', '["*"]', NULL, NULL, '2026-08-14 18:41:09', '2026-08-14 18:41:09'),
	(48, 'App\\Models\\User', 24, 'api_token', 'd7501aba5e0850753a525a65b8df6d2f194cd877d673cf19768ec8192987d9e0', '["*"]', NULL, NULL, '2026-08-14 18:43:51', '2026-08-14 18:43:51'),
	(49, 'App\\Models\\User', 24, 'api_token', '8530646f7285dfce8e451ae2383facd9cb11f5dae5059fbb3bfca8214da5cb72', '["*"]', NULL, NULL, '2026-08-14 19:06:23', '2026-08-14 19:06:23'),
	(50, 'App\\Models\\User', 24, 'api_token', 'f9dc91cd9ff941dd79ad68777281533b300b5afd1609f77563c95fd9c779a5e4', '["*"]', NULL, NULL, '2026-08-14 19:11:03', '2026-08-14 19:11:03'),
	(51, 'App\\Models\\User', 24, 'api_token', '32fbf7080dffc303758502abcc3e09f93e9098276ea3f96574a8c6cb3ac745ec', '["*"]', NULL, NULL, '2026-08-14 19:12:05', '2026-08-14 19:12:05'),
	(52, 'App\\Models\\User', 24, 'api_token', '8cf149554d44acdccd183df59caa7958e63ef96e8dca33164f5c8598449e0c7c', '["*"]', NULL, NULL, '2026-08-14 19:15:37', '2026-08-14 19:15:37'),
	(53, 'App\\Models\\User', 24, 'api_token', '286a795b9b3270d7aeca122e97347e0be7af446841c345571e5a546fca0f28c8', '["*"]', NULL, NULL, '2026-08-14 19:20:04', '2026-08-14 19:20:04'),
	(54, 'App\\Models\\User', 24, 'api_token', 'ecfda03c326f4622ec512e71e343695c72b5101c01993acf8cb6274f40a318f7', '["*"]', NULL, NULL, '2026-08-14 19:25:01', '2026-08-14 19:25:01'),
	(55, 'App\\Models\\User', 24, 'api_token', '30830498f148cfc34717a65da815fdb1a74d203a9ebc23408d9b81dbaf669c22', '["*"]', NULL, NULL, '2026-08-14 22:05:49', '2026-08-14 22:05:49'),
	(56, 'App\\Models\\User', 24, 'api_token', '3f9c3304700e646156e01e87fda5cfa8bc5ca85272bd25b4391c0f90dc7f41cc', '["*"]', NULL, NULL, '2026-08-14 22:05:52', '2026-08-14 22:05:52'),
	(57, 'App\\Models\\User', 24, 'api_token', 'ba082eb27d0d635ad3d322ef057890277bffb6592488378b734023ee4e565e0b', '["*"]', NULL, NULL, '2026-08-14 22:05:54', '2026-08-14 22:05:54'),
	(58, 'App\\Models\\User', 24, 'api_token', '49f75cb3c498f0fcde2fd3658d8d52ce277b51452982e7c329c0188ac7fe03e5', '["*"]', NULL, NULL, '2026-08-14 22:05:57', '2026-08-14 22:05:57'),
	(59, 'App\\Models\\User', 24, 'api_token', '7c827ebb137fe59db8c8cba8a373d539b24b08914d4e920414ae561f04ddb4ad', '["*"]', NULL, NULL, '2026-08-14 22:05:59', '2026-08-14 22:05:59'),
	(60, 'App\\Models\\User', 24, 'api_token', '4670ff653bb5120d9cdd5c90d10a9122eca7750dc7e0e47945ed4da984baeb5f', '["*"]', NULL, NULL, '2026-08-14 22:06:05', '2026-08-14 22:06:05'),
	(61, 'App\\Models\\User', 24, 'api_token', 'b79af17fbb88496c230bf02aa950b8901dabdcd56fad913e2ec8b198f1aadad1', '["*"]', NULL, NULL, '2026-08-14 22:06:07', '2026-08-14 22:06:07'),
	(62, 'App\\Models\\User', 24, 'api_token', 'cf125bdcca564689d8c10013467068154392fb918f9eed9ae0a41d22215d164e', '["*"]', NULL, NULL, '2026-08-14 22:06:11', '2026-08-14 22:06:11'),
	(63, 'App\\Models\\User', 24, 'api_token', '82dd2b9d4b6762161719fa25f808b06cf8f8ea3a691023367cd73a51ad9da547', '["*"]', NULL, NULL, '2026-08-14 22:06:13', '2026-08-14 22:06:13'),
	(64, 'App\\Models\\User', 24, 'api_token', 'aa8781b41b506a41dee927462c7c74d195fb80fb546e1b2528d2f0bf5b642b79', '["*"]', NULL, NULL, '2026-08-14 22:06:48', '2026-08-14 22:06:48'),
	(65, 'App\\Models\\User', 24, 'api_token', '9a374e2fb96fc8820a4eba75fa7028ac7b72f9b744209b3c62d5138b7f8bd22e', '["*"]', NULL, NULL, '2026-08-14 22:15:01', '2026-08-14 22:15:01'),
	(66, 'App\\Models\\User', 24, 'api_token', '12a61b0c971aa639693802a084ac3b090e9c0da2cc6a175af95ccdb0d5ccce2e', '["*"]', NULL, NULL, '2026-08-14 22:19:15', '2026-08-14 22:19:15'),
	(67, 'App\\Models\\User', 24, 'api_token', '198f28a04f3de4c118b8566a352c96130a39a10b68bb6d070b266a66f85d71db', '["*"]', NULL, NULL, '2026-08-14 22:22:49', '2026-08-14 22:22:49');

-- membuang struktur untuk table db_spmb.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.sessions: ~2 rows (lebih kurang)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('kQI58EibdqwnAh2aH6eOi1KMdIqrFzS6ETU6eiSh', 24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIwS1dGNzBxeEdwNEZ4QXI4bXBpbFNjVW1jSDF2cXJ0MUZVdkNYakk5IiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2Rhc2hib2FyZF9hZG1pbiJ9LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2Jlcmthc19wZW5kYWZ0YXJhbiIsInJvdXRlIjoiYmVya2FzX3BlbmRhZnRhcmFuIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjI0fQ==', 1788585647),
	('OiZMQ9v7593XrJab8e49DVvojwJFTbT0SCvmZjkO', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJsMlY0RFBWWk9INk83WXQ4eGY2dXB4b1J2ekpyZDczNml3djRMbWx4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9iZXJrYXNfcGVuZGFmdGFyYW4iLCJyb3V0ZSI6ImJlcmthc19wZW5kYWZ0YXJhbiJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sInVybCI6eyJpbnRlbmRlZCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kYXNoYm9hcmRfc2lzd2EifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjI5fQ==', 1788591992),
	('RhghU8YndNnFwMgOV154do3vA8dGqGvD48GdHBP0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIySGU4QUd3d05MZzc5RTNDVTZqanNiM3F5UFNEUEZ5N2l5SkUxVU55IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wZW5ndW11bWFuX3Npc3dhIiwicm91dGUiOiJwZW5ndW11bWFuX3Npc3dhIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1788762436),
	('SAPlOnGfYfwxAy9UmXwTru1yFduihuR2fo2SlusR', 24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ1OXVkVWlsckFMbTkyek9yRElnR1lXVkluSGRWTmFwUlJFb2IyenJvIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wZW5ndW11bWFuX3Npc3dhIiwicm91dGUiOiJwZW5ndW11bWFuX3Npc3dhIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2Rhc2hib2FyZF9zaXN3YSJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjR9', 1788750368);

-- membuang struktur untuk table db_spmb.tes_kejuruan
CREATE TABLE IF NOT EXISTS `tes_kejuruan` (
  `id_tes` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pendaftar` bigint unsigned NOT NULL,
  `jenis_tes` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasil_tes` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tes`),
  KEY `tes_kejuruan_id_pendaftar_foreign` (`id_pendaftar`),
  CONSTRAINT `tes_kejuruan_id_pendaftar_foreign` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.tes_kejuruan: ~0 rows (lebih kurang)
DELETE FROM `tes_kejuruan`;

-- membuang struktur untuk table db_spmb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('siswa','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siswa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.users: ~4 rows (lebih kurang)
DELETE FROM `users`;
INSERT INTO `users` (`id_user`, `name`, `email`, `no_hp`, `username`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(7, 'Admin SPMB', 'admin@ppdb.com', NULL, NULL, NULL, '$2y$12$OHbm6jy7m5iChsHgVS/bHuexSiwKEccGRYFfUclv4eikjJGGS0xda', 'admin', NULL, '2026-07-27 23:42:05', '2026-07-27 23:42:05'),
	(8, 'Test User', 'test@example.com', NULL, NULL, '2026-07-27 23:42:10', '$2y$12$kZ0vbep0urHG2w.ODlPu.OudfD0vcqiaP75lERY39ulzRqKkycN3S', 'siswa', 'LV47UQ1snO', '2026-07-27 23:42:10', '2026-07-27 23:42:10'),
	(24, 'Eka Octavia Indriyani', 'ekaoktaviaindriyani@gmail.com', '085867953274', NULL, NULL, '$2y$12$X2nLM6klreeOodnIuG.2kepN3VUITZ5CIkQht192CTG1pwfcTHTIu', 'siswa', NULL, '2026-08-13 18:27:59', '2026-08-13 18:27:59');

-- membuang struktur untuk table db_spmb.verifikasi
CREATE TABLE IF NOT EXISTS `verifikasi` (
  `id_verifikasi` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pendaftar` bigint unsigned NOT NULL,
  `id_user` bigint unsigned DEFAULT NULL,
  `cek_kk` tinyint(1) NOT NULL DEFAULT '0',
  `cek_akte` tinyint(1) NOT NULL DEFAULT '0',
  `cek_ktp_ayah` tinyint(1) NOT NULL DEFAULT '0',
  `cek_ktp_ibu` tinyint(1) NOT NULL DEFAULT '0',
  `cek_skl` tinyint(1) NOT NULL DEFAULT '0',
  `cek_pas_foto` tinyint(1) NOT NULL,
  `status_verifikasi` enum('menunggu','lengkap','kurang','revisi','ditolak') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_verifikasi` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_verifikasi`),
  KEY `verifikasi_id_pendaftar_foreign` (`id_pendaftar`),
  KEY `verifikasi_id_user_foreign` (`id_user`),
  CONSTRAINT `verifikasi_id_pendaftar_foreign` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE,
  CONSTRAINT `verifikasi_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_spmb.verifikasi: ~1 rows (lebih kurang)
DELETE FROM `verifikasi`;
INSERT INTO `verifikasi` (`id_verifikasi`, `id_pendaftar`, `id_user`, `cek_kk`, `cek_akte`, `cek_ktp_ayah`, `cek_ktp_ibu`, `cek_skl`, `cek_pas_foto`, `status_verifikasi`, `tanggal_verifikasi`, `created_at`, `updated_at`) VALUES
	(7, 51, 7, 1, 1, 1, 1, 1, 1, 'lengkap', '2026-09-03 01:43:12', '2026-08-23 19:38:04', '2026-09-02 18:43:12');

-- membuang struktur untuk trigger db_spmb.trg_set_no_pendaftaran
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_set_no_pendaftaran` BEFORE INSERT ON `pendaftar` FOR EACH ROW BEGIN
DECLARE next_num INT;
UPDATE `db_spmb`.`id_counter`
SET `last_number` = `last_number` + 1
WHERE  `tahun` = 2027;
SELECT `last_number` INTO next_num
FROM `db_spmb`.`id_counter`
WHERE `tahun` = 2027;
SET NEW. `no_pendaftaran` = CONCAT('SPMB-2027-', LPAD(next_num, 4, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
