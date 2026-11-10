USE kopma_47;
INSERT INTO petugas (kode_petugas, nama_petugas, peran_petugas) VALUES
('K01','Dimas','kasir'), ('K02','Sari','kasir'),
('K03','Rina','kasir'),
('G01','Joko','gudang'), ('P01','Ketua Kopma','ketua');
INSERT INTO barang (kode_barang, nama_barang, kategori_barang,
harga_jual_barang, stok_barang, stok_min_barang) VALUES
('ATK-001','Pulpen Gel 0.5','ATK',4000,120,20),
('ATK-002','Buku Tulis 58','ATK',6500,80,20),
('MNM-001','Air Mineral 600','minuman',4000,48,24),
('MKN-001','Roti Cokelat','makanan',5000,6,10);

INSERT INTO anggota
(no_anggota, nim_anggota, nama_anggota, prodi_anggota,
 no_hp_anggota, status_anggota, tgl_daftar_anggota)
VALUES
('A-0001', '2543004701', 'Andi Saputra', 'Ilmu Komputer',
 '081234567801', 'aktif', '2026-09-01'),

('A-0002', '2543004702', 'Budi Santoso', 'Sistem Informasi',
 '081234567802', 'aktif', '2026-09-02'),

('A-0003', '2543004703', 'Citra Lestari', 'Ilmu Komputer',
 '081234567803', 'nonaktif', '2024-08-15');

INSERT INTO pemasok
(nama_pemasok, telepon_pemasok, alamat_pemasok)
VALUES
('CV Sumber ATK', '081234567811', 'Metro, Lampung'),
('PT Sumber Makmur', '081234567812', 'Bandar Lampung');

INSERT INTO penjualan
(no_nota_penjualan, tgl_penjualan, id_petugas,
 id_anggota, bayar_penjualan)
VALUES
('PJ-2609-0142', '2026-09-24 10:15:00', 3, 1, 30000);

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan,
 harga_satuan_detail_penjualan)
SELECT 1, id_barang, 3, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-001';

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan,
 harga_satuan_detail_penjualan)
SELECT 1, id_barang, 2, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-002';

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan,
 harga_satuan_detail_penjualan)
SELECT 1, id_barang, 1, harga_jual_barang
FROM barang
WHERE kode_barang = 'MNM-001';

UPDATE barang
SET stok_barang = stok_barang - 2
WHERE kode_barang = 'ATK-002';

UPDATE barang
SET stok_barang = stok_barang - 1
WHERE kode_barang = 'MNM-001';
