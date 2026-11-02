USE toko_daring_pinktech_47 ;

DROP TABLE IF EXISTS pengiriman;
DROP TABLE IF EXISTS pembayaran;
DROP TABLE IF EXISTS detail_pesanan;
DROP TABLE IF EXISTS pesanan;
DROP TABLE IF EXISTS produk;
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS pelanggan;

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email_pelanggan VARCHAR(100) NOT NULL,
    no_wa_pelanggan VARCHAR(20),
    alamat_pelanggan TEXT,

    CONSTRAINT pk_pelanggan
        PRIMARY KEY (id_pelanggan),

    CONSTRAINT uq_pelanggan_email
        UNIQUE (email_pelanggan)
) ENGINE=InnoDB;

CREATE TABLE kategori (
    kode_kategori VARCHAR(10),
    nama_kategori VARCHAR(50) NOT NULL,
    deskripsi_kategori TEXT,

    CONSTRAINT pk_kategori
        PRIMARY KEY (kode_kategori),

    CONSTRAINT uq_kategori_nama
        UNIQUE (nama_kategori)
) ENGINE=InnoDB;

CREATE TABLE produk (
    kode_produk VARCHAR(20),
    kode_kategori VARCHAR(10) NOT NULL,
    nama_produk VARCHAR(100) NOT NULL,
    harga_produk DECIMAL(12,2) NOT NULL,
    stok_produk INT NOT NULL,
    deskripsi TEXT,

    CONSTRAINT pk_produk
        PRIMARY KEY (kode_produk),

    -- AB-03: Harga produk tidak boleh negatif.
    CONSTRAINT ck_produk_harga
        CHECK (harga_produk >= 0),

    -- AB-03: Stok produk tidak boleh negatif.
    CONSTRAINT ck_produk_stok
        CHECK (stok_produk >= 0),

    CONSTRAINT fk_produk_kategori
        FOREIGN KEY (kode_kategori)
        REFERENCES kategori (kode_kategori)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pesanan (
    id_pesanan INT AUTO_INCREMENT,
    tanggal_pesanan DATETIME NOT NULL,
    id_pelanggan INT NOT NULL,
    alamat_pengiriman TEXT NOT NULL,
    ongkir_pesanan DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_pesanan DECIMAL(12,2) NOT NULL DEFAULT 0,
    status_pesanan VARCHAR(30) NOT NULL DEFAULT 'menunggu_pembayaran',

    CONSTRAINT pk_pesanan
        PRIMARY KEY (id_pesanan),

    -- AB-02: Nilai biaya tidak boleh negatif.
    CONSTRAINT ck_pesanan_biaya
        CHECK (ongkir_pesanan >= 0 AND total_pesanan >= 0),

    CONSTRAINT fk_pesanan_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan (id_pelanggan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE detail_pesanan (
    id_detail_pesanan INT AUTO_INCREMENT,
    id_pesanan INT NOT NULL,
    kode_produk VARCHAR(20) NOT NULL,
    jumlah_produk INT NOT NULL,
    harga_saat_pesanan DECIMAL(12,2) NOT NULL,
    subtotal_detail DECIMAL(12,2)
        GENERATED ALWAYS AS (jumlah_produk * harga_saat_pesanan) STORED,

    CONSTRAINT pk_detail_pesanan
        PRIMARY KEY (id_detail_pesanan),

    CONSTRAINT ck_detail_jumlah
        CHECK (jumlah_produk > 0 AND jumlah_produk <= 5),

    CONSTRAINT ck_detail_harga
        CHECK (harga_saat_pesanan >= 0 ),

    CONSTRAINT fk_detail_pesanan
        FOREIGN KEY (id_pesanan)
        REFERENCES pesanan (id_pesanan)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_detail_produk
        FOREIGN KEY (kode_produk)
        REFERENCES produk (kode_produk)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- AB-06: Batas maksimal P+2 = 5 item per transaksi.
-- Jika batas berlaku pada total item dalam satu pesanan,
-- CHECK tidak dapat menghitung beberapa baris detail.
-- Penegakan aturan total item dicatat untuk Modul 14.

CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT,
    id_pesanan INT NOT NULL,
    tanggal_pembayaran DATETIME,
    metode_pembayaran VARCHAR(30) NOT NULL,
    jumlah_pembayaran DECIMAL(12,2) NOT NULL,
    status_pembayaran VARCHAR(30) NOT NULL DEFAULT 'menunggu',

    CONSTRAINT pk_pembayaran
        PRIMARY KEY (id_pembayaran),

    CONSTRAINT ck_pembayaran_jumlah
        CHECK (jumlah_pembayaran >= 0),

    CONSTRAINT fk_pembayaran_pesanan
        FOREIGN KEY (id_pesanan)
        REFERENCES pesanan (id_pesanan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pengiriman (
    id_pengiriman INT AUTO_INCREMENT,
    id_pesanan INT NOT NULL,
    ekspedisi_pengiriman VARCHAR(50) NOT NULL,
    no_resi_pengiriman VARCHAR(100) NOT NULL,
    tanggal_pengiriman DATETIME,
    status_pengiriman VARCHAR(30) NOT NULL DEFAULT 'menunggu',

    CONSTRAINT pk_pengiriman
        PRIMARY KEY (id_pengiriman),

    CONSTRAINT uq_pengiriman_pesanan
        UNIQUE (id_pesanan),

    CONSTRAINT uq_pengiriman_resi
        UNIQUE (no_resi_pengiriman),

    CONSTRAINT fk_pengiriman_pesanan
        FOREIGN KEY (id_pesanan)
        REFERENCES pesanan (id_pesanan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- AB-04: Pesanan hanya boleh diproses setelah pembayaran
-- berhasil dikonfirmasi.
-- Penegakan alur status memerlukan logika proses bisnis,
-- bukan CHECK sederhana.