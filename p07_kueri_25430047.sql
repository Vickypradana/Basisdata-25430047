USE toko_daring_pinktech_47;

-- --------------------------------------------------------------------
-- Kueri 01 (Mendukung KI-03)
-- Pertanyaan: Produk apa saja yang stoknya menipis (<= 10 unit) dan perlu dipesan ulang?
-- Hasil yang diharapkan: Produk dengan stok <= 10 diurutkan dari stok terkecil (Printer Ink Tank, PC Rakitan, Monitor Gaming, Mini PC).
-- --------------------------------------------------------------------
SELECT kode_produk, nama_produk, stok_produk, harga_produk
FROM produk
WHERE stok_produk <= 10
ORDER BY stok_produk ASC;

-- --------------------------------------------------------------------
-- Kueri 02 (Pencarian Katalog dengan LIKE)
-- Pertanyaan: Produk apa saja yang memiliki kata 'Monitor' pada nama produknya?
-- Hasil yang diharapkan: 2 produk monitor (Monitor IPS 24 inci dan Monitor Gaming 27 inci) urut harga termurah.
-- --------------------------------------------------------------------
SELECT kode_produk, nama_produk, kode_kategori, harga_produk
FROM produk
WHERE nama_produk LIKE '%Monitor%'
ORDER BY harga_produk ASC;

-- --------------------------------------------------------------------
-- Kueri 03 (Penyaringan Multi-Kategori dengan IN)
-- Pertanyaan: Tampilkan semua produk yang termasuk dalam kategori Laptop (LAP) atau Komputer PC (PC)!
-- Hasil yang diharapkan: 4 produk kategori LAP dan PC diurutkan berdasarkan kategori dan harga termahal.
-- --------------------------------------------------------------------
SELECT kode_produk, nama_produk, kode_kategori, harga_produk, stok_produk
FROM produk
WHERE kode_kategori IN ('LAP', 'PC')
ORDER BY kode_kategori, harga_produk DESC;

-- --------------------------------------------------------------------
-- Kueri 04 (Filter Rentang Waktu dengan BETWEEN)
-- Pertanyaan: Pesanan apa saja yang tercatat antara tanggal 1 Oktober 2026 hingga 2 Oktober 2026?
-- Hasil yang diharapkan: 12 pesanan (id_pesanan 1 s.d. 12) yang berada dalam rentang tanggal tersebut.
-- --------------------------------------------------------------------
SELECT id_pesanan, id_pelanggan, tanggal_pesanan, total_pesanan, status_pesanan
FROM pesanan
WHERE tanggal_pesanan BETWEEN '2026-10-01 00:00:00' AND '2026-10-02 23:59:59'
ORDER BY tanggal_pesanan ASC;

-- --------------------------------------------------------------------
-- Kueri 05 (Pengecekan Kelengkapan Data dengan IS NOT NULL)
-- Pertanyaan: Siapa saja pelanggan yang data nomor WhatsApp-nya sudah terisi lengkap (tidak NULL)?
-- Hasil yang diharapkan: Seluruh 5 pelanggan muncul karena semua memiliki kontak nomor WhatsApp terdaftar.
-- --------------------------------------------------------------------
SELECT id_pelanggan, nama_pelanggan, email_pelanggan, no_wa_pelanggan
FROM pelanggan
WHERE no_wa_pelanggan IS NOT NULL
ORDER BY id_pelanggan ASC;

-- --------------------------------------------------------------------
-- Kueri 06 (Logika Kondisional dengan CASE)
-- Pertanyaan: Bagaimana segmentasi nominal pesanan jika dikelompokkan ke Transaksi Besar (>= 10 jt), Sedang (3-10 jt), dan Kecil (< 3 jt)?
-- Hasil yang diharapkan: Daftar 10 pesanan teratas beserta label kategori transaksi berdasarkan nilai total pesanan.
-- --------------------------------------------------------------------
SELECT id_pesanan, total_pesanan, status_pesanan,
       CASE 
           WHEN total_pesanan >= 10000000 THEN 'Transaksi Besar (>= 10 Juta)'
           WHEN total_pesanan >= 3000000  THEN 'Transaksi Sedang (3 - 10 Juta)'
           ELSE 'Transaksi Kecil (< 3 Juta)'
       END AS kategori_transaksi
FROM pesanan
ORDER BY total_pesanan DESC
LIMIT 10;

-- --------------------------------------------------------------------
-- Kueri 07 (Fungsi String UPPER, CONCAT, dan FORMAT)
-- Pertanyaan: Bagaimana menyajikan nama produk dalam huruf kapital dan harga dalam format rupiah standar Indonesia?
-- Hasil yang diharapkan: Seluruh 11 produk tampil dengan nama kapital dan format harga berawalan Rp.
-- --------------------------------------------------------------------
SELECT kode_produk,
       UPPER(nama_produk) AS nama_produk_kapital,
       CONCAT('Rp', FORMAT(harga_produk, 0, 'id_ID')) AS harga_rupiah,
       stok_produk
FROM produk
ORDER BY harga_produk DESC;

-- --------------------------------------------------------------------
-- Kueri 08 (Fungsi Tanggal DATE_FORMAT)
-- Pertanyaan: Tampilkan tanggal pembayaran untuk transaksi yang berhasil dalam format baku tanggal Indonesia (DD/MM/YYYY)!
-- Hasil yang diharapkan: 10 data pembayaran berhasil dengan tampilan tanggal dan jam yang mudah dibaca.
-- --------------------------------------------------------------------
SELECT id_pembayaran, id_pesanan, metode_pembayaran,
       DATE_FORMAT(tanggal_pembayaran, '%d/%m/%Y %H:%i') AS tgl_bayar_indonesia,
       jumlah_pembayaran, status_pembayaran
FROM pembayaran
WHERE status_pembayaran = 'berhasil'
ORDER BY tanggal_pembayaran ASC
LIMIT 10;

-- --------------------------------------------------------------------
-- Kueri 09 (Penyaringan Nilai Unik dengan DISTINCT)
-- Pertanyaan: Apa saja kombinasi unik antara jasa ekspedisi dan status pengiriman yang ada pada sistem?
-- Hasil yang diharapkan: Daftar unik kombinasi ekspedisi (JNE, J&T) dengan masing-masing status pengiriman (diproses, dikirim, diterima).
-- --------------------------------------------------------------------
SELECT DISTINCT ekspedisi_pengiriman, status_pengiriman
FROM pengiriman
ORDER BY ekspedisi_pengiriman, status_pengiriman;

-- --------------------------------------------------------------------
-- Kueri 10 (Mendukung KI-05 secara parsial satu tabel)
-- Pertanyaan: Nomor resi dan pesanan mana saja yang saat ini statusnya masih dalam proses pengiriman kurir ('dikirim')?
-- Catatan Keterbatasan: Kueri ini baru menjawab data dari tabel pengiriman saja.
-- Kebutuhan informasi lengkap (nama penerima, alamat tujuan, dan rincian produk pesanan)
-- belum dapat dijawab dengan satu tabel karena memerlukan JOIN antar tabel (akan dipelajari pada Modul 10).
-- Hasil yang diharapkan: Daftar 8 data pengiriman dengan status 'dikirim' urut dari tanggal pengiriman terbaru.
-- --------------------------------------------------------------------
SELECT id_pengiriman, id_pesanan, ekspedisi_pengiriman, no_resi_pengiriman,
       DATE_FORMAT(tanggal_pengiriman, '%d-%m-%Y') AS tgl_kirim,
       status_pengiriman
FROM pengiriman
WHERE status_pengiriman = 'dikirim'
ORDER BY tanggal_pengiriman DESC;
