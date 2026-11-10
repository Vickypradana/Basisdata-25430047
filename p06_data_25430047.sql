-- Data awal proyek PinkTech - Milestone Proyek 6
-- NIM: 25430047 | Parameter P = 3 | Target minimal 30 pesanan
-- Data transaksi tersebar pada 5 tanggal: 1-5 Oktober 2026
USE toko_daring_pinktech_47;
SET NAMES utf8mb4;

-- 1. Pelanggan (5 baris)
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email_pelanggan, no_wa_pelanggan, alamat_pelanggan) VALUES
(1, 'arep', 'arepp_99@example.com', '081234560001', 'Metro, Lampung'),
(2, 'nia Ramadhani', 'niaaa_R@example.com', '081234560002', 'Bandar Lampung, Lampung'),
(3, 'regina', 'gina_gin@example.com', '081234560003', 'Pringsewu, Lampung'),
(4, 'galeh Saputra', 'galeh_saput@example.com', '081234560004', 'Metro, Lampung'),
(5, 'alwann', 'alwanm0@example.com', '081234560005', 'Lampung Timur, Lampung');

-- 2. Kategori (5 baris)
INSERT INTO kategori (kode_kategori, nama_kategori, deskripsi_kategori) VALUES
('LAP', 'Laptop', 'Laptop untuk kebutuhan kerja, kuliah, dan produktivitas.'),
('PC', 'Komputer dan PC', 'Komputer desktop dan komponen komputer.'),
('MON', 'Monitor', 'Monitor untuk kerja, belajar, dan hiburan.'),
('STR', 'Storage dan Memori', 'SSD, hard disk, dan RAM.'),
('AKS', 'Aksesori', 'Perangkat pendukung komputer dan perangkat cetak.');

-- 3. Produk (11 baris)
INSERT INTO produk (kode_produk, kode_kategori, nama_produk, harga_produk, stok_produk, deskripsi) VALUES
('LAP-001', 'LAP', 'Lenovo LOQ 15', 14500000.00, 12, 'Laptop performa untuk produktivitas dan komputasi.'),
('LAP-002', 'LAP', 'ASUS Vivobook 14', 9200000.00, 18, 'Laptop ringkas untuk kuliah dan pekerjaan.'),
('PC-001', 'PC', 'PC Rakitan Ryzen 5', 8750000.00, 8, 'Komputer desktop untuk penggunaan umum.'),
('PC-002', 'PC', 'Mini PC Intel N100', 3850000.00, 10, 'Komputer mini hemat ruang.'),
('MON-001', 'MON', 'Monitor IPS 24 inci', 1850000.00, 20, 'Monitor IPS resolusi Full HD.'),
('MON-002', 'MON', 'Monitor Gaming 27 inci', 3250000.00, 9, 'Monitor 27 inci dengan refresh rate tinggi.'),
('STR-001', 'STR', 'SSD NVMe 1 TB', 1250000.00, 25, 'SSD NVMe untuk penyimpanan cepat.'),
('STR-002', 'STR', 'RAM DDR4 16 GB', 650000.00, 30, 'Memori DDR4 16 GB.'),
('AKS-001', 'AKS', 'Keyboard Mechanical', 475000.00, 22, 'Keyboard mechanical untuk mengetik.'),
('AKS-002', 'AKS', 'Mouse Wireless', 185000.00, 35, 'Mouse nirkabel untuk penggunaan harian.'),
('AKS-003', 'AKS', 'Printer Ink Tank', 2350000.00, 7, 'Printer dengan sistem tangki tinta.');

-- 4. Pesanan (30 baris, 5 tanggal berbeda)
INSERT INTO pesanan (id_pesanan, tanggal_pesanan, id_pelanggan, alamat_pengiriman, ongkir_pesanan, total_pesanan, status_pesanan) VALUES
(1, '2026-10-01 09:07:00', 1, 'Penerima: arep, Metro, Lampung', 18000.00, 29942500.00, 'diproses'),
(2, '2026-10-01 10:14:00', 2, 'Penerima: nia Ramadhani, Bandar Lampung, Lampung', 22000.00, 9140000.00, 'dikirim'),
(3, '2026-10-01 11:21:00', 3, 'Penerima: regina, Pringsewu, Lampung', 25000.00, 8173000.00, 'selesai'),
(4, '2026-10-01 12:28:00', 4, 'Penerima: galeh Saputra, Metro, Lampung', 30000.00, 9730000.00, 'diproses'),
(5, '2026-10-01 13:35:00', 5, 'Penerima: alwann, Lampung Timur, Lampung', 35000.00, 4109000.00, 'dikirim'),
(6, '2026-10-01 14:42:00', 1, 'Penerima: arep, Metro, Lampung', 18000.00, 3219000.00, 'selesai'),
(7, '2026-10-02 15:49:00', 2, 'Penerima: nia Ramadhani, Bandar Lampung, Lampung', 22000.00, 31935000.00, 'diproses'),
(8, '2026-10-02 16:56:00', 3, 'Penerima: regina, Pringsewu, Lampung', 25000.00, 5554000.00, 'dikirim'),
(9, '2026-10-02 09:03:00', 4, 'Penerima: galeh Saputra, Metro, Lampung', 30000.00, 8760000.00, 'selesai'),
(10, '2026-10-02 10:10:00', 5, 'Penerima: alwann, Lampung Timur, Lampung', 35000.00, 844950.00, 'diproses'),
(11, '2026-10-02 11:17:00', 1, 'Penerima: arep, Metro, Lampung', 18000.00, 9300900.00, 'dikirim'),
(12, '2026-10-02 12:24:00', 2, 'Penerima: nia Ramadhani, Bandar Lampung, Lampung', 22000.00, 17676000.00, 'selesai'),
(13, '2026-10-03 13:31:00', 3, 'Penerima: regina, Pringsewu, Lampung', 25000.00, 17630500.00, 'diproses'),
(14, '2026-10-03 14:38:00', 4, 'Penerima: galeh Saputra, Metro, Lampung', 30000.00, 4104000.00, 'dikirim'),
(15, '2026-10-03 15:45:00', 5, 'Penerima: alwann, Lampung Timur, Lampung', 35000.00, 19435000.00, 'selesai'),
(16, '2026-10-03 16:52:00', 1, 'Penerima: arep, Metro, Lampung', 18000.00, 3631250.00, 'diproses'),
(17, '2026-10-03 09:59:00', 2, 'Penerima: nia Ramadhani, Bandar Lampung, Lampung', 22000.00, 5041750.00, 'dikirim'),
(18, '2026-10-03 10:06:00', 3, 'Penerima: regina, Pringsewu, Lampung', 25000.00, 37079000.00, 'selesai'),
(19, '2026-10-04 11:13:00', 4, 'Penerima: galeh Saputra, Metro, Lampung', 30000.00, 9293500.00, 'diproses'),
(20, '2026-10-04 12:20:00', 5, 'Penerima: alwann, Lampung Timur, Lampung', 35000.00, 4400000.00, 'dikirim'),
(21, '2026-10-04 13:27:00', 1, 'Penerima: arep, Metro, Lampung', 18000.00, 1637900.00, 'selesai'),
(22, '2026-10-04 14:34:00', 2, 'Penerima: nia Ramadhani, Bandar Lampung, Lampung', 22000.00, 9125450.00, 'diproses'),
(23, '2026-10-04 15:41:00', 3, 'Penerima: regina, Pringsewu, Lampung', 25000.00, 29949500.00, 'dikirim'),
(24, '2026-10-04 16:48:00', 4, 'Penerima: galeh Saputra, Metro, Lampung', 30000.00, 9778500.00, 'selesai'),
(25, '2026-10-05 09:55:00', 5, 'Penerima: alwann, Lampung Timur, Lampung', 35000.00, 5903500.00, 'menunggu_pembayaran'),
(26, '2026-10-05 10:02:00', 1, 'Penerima: arep, Metro, Lampung', 18000.00, 9718000.00, 'menunggu_pembayaran'),
(27, '2026-10-05 11:09:00', 2, 'Penerima: nia Ramadhani, Bandar Lampung, Lampung', 22000.00, 7248500.00, 'menunggu_pembayaran'),
(28, '2026-10-05 12:16:00', 3, 'Penerima: regina, Pringsewu, Lampung', 25000.00, 2765250.00, 'dibatalkan'),
(29, '2026-10-05 13:23:00', 4, 'Penerima: galeh Saputra, Metro, Lampung', 30000.00, 31943000.00, 'dibatalkan'),
(30, '2026-10-05 14:30:00', 5, 'Penerima: alwann, Lampung Timur, Lampung', 35000.00, 7358500.00, 'dibatalkan');

-- 5. Detail pesanan (60 baris; subtotal_detail dihitung otomatis)
INSERT INTO detail_pesanan (id_pesanan, kode_produk, jumlah_produk, harga_saat_pesanan) VALUES
(1, 'LAP-001', 2, 14500000.00),
(1, 'MON-001', 1, 1850000.00),
(2, 'PC-001', 1, 8750000.00),
(2, 'STR-002', 1, 650000.00),
(3, 'MON-001', 2, 1850000.00),
(3, 'AKS-003', 2, 2350000.00),
(4, 'STR-001', 1, 1250000.00),
(4, 'PC-001', 1, 8750000.00),
(5, 'AKS-001', 2, 475000.00),
(5, 'MON-002', 1, 3250000.00),
(6, 'AKS-003', 1, 2350000.00),
(6, 'AKS-001', 2, 475000.00),
(7, 'LAP-002', 2, 9200000.00),
(7, 'LAP-001', 1, 14500000.00),
(8, 'PC-002', 1, 3850000.00),
(8, 'MON-001', 1, 1850000.00),
(9, 'MON-002', 2, 3250000.00),
(9, 'STR-001', 2, 1250000.00),
(10, 'STR-002', 1, 650000.00),
(10, 'AKS-002', 1, 185000.00),
(11, 'AKS-002', 2, 185000.00),
(11, 'LAP-002', 1, 9200000.00),
(12, 'LAP-001', 1, 14500000.00),
(12, 'MON-001', 2, 1850000.00),
(13, 'PC-001', 2, 8750000.00),
(13, 'STR-002', 1, 650000.00),
(14, 'MON-001', 1, 1850000.00),
(14, 'AKS-003', 1, 2350000.00),
(15, 'STR-001', 2, 1250000.00),
(15, 'PC-001', 2, 8750000.00),
(16, 'AKS-001', 1, 475000.00),
(16, 'MON-002', 1, 3250000.00),
(17, 'AKS-003', 2, 2350000.00),
(17, 'AKS-001', 1, 475000.00),
(18, 'LAP-002', 1, 9200000.00),
(18, 'LAP-001', 2, 14500000.00),
(19, 'PC-002', 2, 3850000.00),
(19, 'MON-001', 1, 1850000.00),
(20, 'MON-002', 1, 3250000.00),
(20, 'STR-001', 1, 1250000.00),
(21, 'STR-002', 2, 650000.00),
(21, 'AKS-002', 2, 185000.00),
(22, 'AKS-002', 1, 185000.00),
(22, 'LAP-002', 1, 9200000.00),
(23, 'LAP-001', 2, 14500000.00),
(23, 'MON-001', 1, 1850000.00),
(24, 'PC-001', 1, 8750000.00),
(24, 'STR-002', 2, 650000.00),
(25, 'MON-001', 2, 1850000.00),
(25, 'AKS-003', 1, 2350000.00),
(26, 'STR-001', 1, 1250000.00),
(26, 'PC-001', 1, 8750000.00),
(27, 'AKS-001', 2, 475000.00),
(27, 'MON-002', 2, 3250000.00),
(28, 'AKS-003', 1, 2350000.00),
(28, 'AKS-001', 1, 475000.00),
(29, 'LAP-002', 2, 9200000.00),
(29, 'LAP-001', 1, 14500000.00),
(30, 'PC-002', 1, 3850000.00),
(30, 'MON-001', 2, 1850000.00);

-- 6. Pembayaran (30 baris: 24 berhasil, 3 menunggu, 3 gagal)
INSERT INTO pembayaran (id_pesanan, tanggal_pembayaran, metode_pembayaran, jumlah_pembayaran, status_pembayaran) VALUES
(1, '2026-10-01 10:07:00', 'transfer_bank', 29942500.00, 'berhasil'),
(2, '2026-10-01 11:14:00', 'OVO', 9140000.00, 'berhasil'),
(3, '2026-10-01 12:21:00', 'DANA', 8173000.00, 'berhasil'),
(4, '2026-10-01 13:28:00', 'GoPay', 9730000.00, 'berhasil'),
(5, '2026-10-01 14:35:00', 'kartu_kredit', 4109000.00, 'berhasil'),
(6, '2026-10-01 15:42:00', 'COD', 3219000.00, 'berhasil'),
(7, '2026-10-02 16:49:00', 'transfer_bank', 31935000.00, 'berhasil'),
(8, '2026-10-02 17:56:00', 'OVO', 5554000.00, 'berhasil'),
(9, '2026-10-02 10:03:00', 'DANA', 8760000.00, 'berhasil'),
(10, '2026-10-02 11:10:00', 'GoPay', 844950.00, 'berhasil'),
(11, '2026-10-02 12:17:00', 'kartu_kredit', 9300900.00, 'berhasil'),
(12, '2026-10-02 13:24:00', 'COD', 17676000.00, 'berhasil'),
(13, '2026-10-03 14:31:00', 'transfer_bank', 17630500.00, 'berhasil'),
(14, '2026-10-03 15:38:00', 'OVO', 4104000.00, 'berhasil'),
(15, '2026-10-03 16:45:00', 'DANA', 19435000.00, 'berhasil'),
(16, '2026-10-03 17:52:00', 'GoPay', 3631250.00, 'berhasil'),
(17, '2026-10-03 10:59:00', 'kartu_kredit', 5041750.00, 'berhasil'),
(18, '2026-10-03 11:06:00', 'COD', 37079000.00, 'berhasil'),
(19, '2026-10-04 12:13:00', 'transfer_bank', 9293500.00, 'berhasil'),
(20, '2026-10-04 13:20:00', 'OVO', 4400000.00, 'berhasil'),
(21, '2026-10-04 14:27:00', 'DANA', 1637900.00, 'berhasil'),
(22, '2026-10-04 15:34:00', 'GoPay', 9125450.00, 'berhasil'),
(23, '2026-10-04 16:41:00', 'kartu_kredit', 29949500.00, 'berhasil'),
(24, '2026-10-04 17:48:00', 'COD', 9778500.00, 'berhasil'),
(25, '2026-10-05 11:55:00', 'transfer_bank', 5903500.00, 'menunggu'),
(26, '2026-10-05 12:02:00', 'OVO', 9718000.00, 'menunggu'),
(27, '2026-10-05 13:09:00', 'DANA', 7248500.00, 'menunggu'),
(28, '2026-10-05 14:16:00', 'GoPay', 2765250.00, 'gagal'),
(29, '2026-10-05 15:23:00', 'kartu_kredit', 31943000.00, 'gagal'),
(30, '2026-10-05 16:30:00', 'COD', 7358500.00, 'gagal');

-- 7. Pengiriman hanya untuk 24 pesanan dengan pembayaran berhasil
INSERT INTO pengiriman (id_pesanan, ekspedisi_pengiriman, no_resi_pengiriman, tanggal_pengiriman, status_pengiriman) VALUES
(1, 'JNE', 'PTK000001ID', '2026-10-02 09:07:00', 'diproses'),
(2, 'J&T', 'PTK000002ID', '2026-10-02 10:14:00', 'dikirim'),
(3, 'JNE', 'PTK000003ID', '2026-10-02 11:21:00', 'diterima'),
(4, 'J&T', 'PTK000004ID', '2026-10-02 12:28:00', 'diproses'),
(5, 'JNE', 'PTK000005ID', '2026-10-02 13:35:00', 'dikirim'),
(6, 'J&T', 'PTK000006ID', '2026-10-02 14:42:00', 'diterima'),
(7, 'JNE', 'PTK000007ID', '2026-10-03 15:49:00', 'diproses'),
(8, 'J&T', 'PTK000008ID', '2026-10-03 16:56:00', 'dikirim'),
(9, 'JNE', 'PTK000009ID', '2026-10-03 09:03:00', 'diterima'),
(10, 'J&T', 'PTK000010ID', '2026-10-03 10:10:00', 'diproses'),
(11, 'JNE', 'PTK000011ID', '2026-10-03 11:17:00', 'dikirim'),
(12, 'J&T', 'PTK000012ID', '2026-10-03 12:24:00', 'diterima'),
(13, 'JNE', 'PTK000013ID', '2026-10-04 13:31:00', 'diproses'),
(14, 'J&T', 'PTK000014ID', '2026-10-04 14:38:00', 'dikirim'),
(15, 'JNE', 'PTK000015ID', '2026-10-04 15:45:00', 'diterima'),
(16, 'J&T', 'PTK000016ID', '2026-10-04 16:52:00', 'diproses'),
(17, 'JNE', 'PTK000017ID', '2026-10-04 09:59:00', 'dikirim'),
(18, 'J&T', 'PTK000018ID', '2026-10-04 10:06:00', 'diterima'),
(19, 'JNE', 'PTK000019ID', '2026-10-05 11:13:00', 'diproses'),
(20, 'J&T', 'PTK000020ID', '2026-10-05 12:20:00', 'dikirim'),
(21, 'JNE', 'PTK000021ID', '2026-10-05 13:27:00', 'diterima'),
(22, 'J&T', 'PTK000022ID', '2026-10-05 14:34:00', 'diproses'),
(23, 'JNE', 'PTK000023ID', '2026-10-05 15:41:00', 'dikirim'),
(24, 'J&T', 'PTK000024ID', '2026-10-05 16:48:00', 'diterima');

-- Catatan: jumlah item tiap pesanan pada data ini tidak melebihi 5.
-- Pesanan belum/gagal dibayar tidak dibuatkan data pengiriman.
-- Harga saat pesanan disimpan pada detail_pesanan.
-- DDL belum menegakkan batas total item lintas baris dan alur status pembayaran;
-- kedua keterbatasan tersebut perlu dicatat dalam skenario uji sebagai utang desain Modul 14.
