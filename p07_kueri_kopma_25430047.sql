-- KI-03: barang yang perlu dipesan ulang
-- Hasil yang diharapkan: barang dengan stok di bawah batas minimum, urut dari paling kurang
SELECT kode_barang, nama_barang, stok_barang, stok_min_barang,
       stok_min_barang - stok_barang AS kurang
FROM barang
WHERE stok_barang < stok_min_barang
ORDER BY kurang DESC;

-- Barang dengan kategori ATK atau Minuman
-- Hasil yang diharapkan: hanya barang dari dua kategori tersebut
SELECT kode_barang, nama_barang, kategori_barang
FROM barang
WHERE kategori_barang IN ('ATK', 'Minuman')
ORDER BY kategori_barang;

-- Nota penjualan pada rentang tanggal tertentu
-- Hasil yang diharapkan: nota dalam bulan September 2026
SELECT no_nota_penjualan, tgl_penjualan, bayar_penjualan
FROM penjualan
WHERE tgl_penjualan BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY tgl_penjualan;

-- Anggota yang belum mengisi nomor HP
-- Hasil yang diharapkan: anggota dengan kolom no_hp kosong (NULL)
SELECT no_anggota, nama_anggota, no_hp_anggota
FROM anggota
WHERE no_hp_anggota IS NULL;

-- =============================================
-- D.2 Pola Teks dan Nilai Kosong
-- =============================================

-- D.2 LIKE + Fungsi Skalar: anggota yang namanya mengandung huruf 'a'
-- Hasil yang diharapkan: 5 anggota terbaru yang namanya ada huruf 'a',
-- tampil dengan label gabungan, format tanggal Indonesia, HP atau '-', dan keterangan diskon
SELECT CONCAT(nama_anggota, ' (', no_anggota, ')')     AS anggota,
       DATE_FORMAT(tgl_daftar_anggota, '%d-%m-%Y')      AS tgl_daftar,
       IFNULL(no_hp_anggota, '-')                       AS hp,
       CASE status_anggota 
           WHEN 'aktif' THEN 'Diskon 5%'
           ELSE 'Tanpa diskon' 
       END AS keterangan
FROM anggota
WHERE nama_anggota LIKE '%a%'
ORDER BY tgl_daftar_anggota DESC
LIMIT 5;


-- D.3 Kueri 1: hitung lama keanggotaan dan kategori baru/lama
-- Hasil yang diharapkan: semua anggota tampil dengan lama hari bergabung
-- dan label 'baru' jika < 180 hari, 'lama' jika >= 180 hari
SELECT no_anggota,
       nama_anggota,
       tgl_daftar_anggota,
       DATEDIFF(CURDATE(), tgl_daftar_anggota) AS lama_hari,
       CASE
           WHEN DATEDIFF(CURDATE(), tgl_daftar_anggota) < 180 THEN 'baru'
           ELSE 'lama'
       END AS kategori
FROM anggota
ORDER BY lama_hari DESC;

-- D.3 Kueri 2: subtotal setiap baris detail nota PJ-2609-0142
-- Hasil yang diharapkan: setiap baris detail tampil beserta subtotal qty x harga
SELECT d.id_penjualan,
       d.id_barang,
       d.qty_detail_penjualan,
       d.harga_satuan_detail_penjualan,
       d.qty_detail_penjualan * d.harga_satuan_detail_penjualan AS subtotal
FROM detail_penjualan d
JOIN penjualan p ON d.id_penjualan = p.id_penjualan
WHERE p.no_nota_penjualan = 'PJ-2609-0142';


