# Dokumen Kebutuhan Data - Kopma

## 1. Latar belakang dan aktivitas organisasi
Kopma merupakan koperasi tidak asli yang jual alat tulis, makanan ringan, dan minuman di lingkungan kampus. pembeli dapat berasal dari manapun itu bisa umum atau mahasiswa. mahasiswa yg mau join anggota daftar pake npm, nama, prodi, dan no wa, terus dapet no anggota dengan format a-xxxx anggota aktif dapet diskon 5% untuk setiap nota

dalam kegiatan operasional, dapat 3 kasir yg bekerja bergantian/bergilir tiap sif mencatat penjualan dan mencetak nota, petugas gudang mengecek stok setiap sore. Jika stok salah satu barang di bawah batas minimum, petugas gudang membuat pesanan pembelian kepada pemasok,ketika barang datang, stok bertambah sesuai faktur pemasok. tiap awal bulan, ketua koperasi menerima laporan tentang omzet, barang terlaris, barang dengan stok mau abis, dan anggota yg paling aktif

dari hasil wawancara, dapat beberapa permasalahan dalam pengelolaan data, yaitu harga barang sering naik sehingga harga pada nota lama susah dicari, pencatatan stok kadang nunjukkin nilai mines, dan anggota sering lupa bawa kartu sehingga kasir perlu mencari data anggota pake npm


## 2. Aktor dan proses bisnis
| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | mendaftarkan anggota | Kasir (atas permintaan mahasiswa) | mahasiswa ingit jadi anggota  |
| PB-02 | mencatat penjualan | kasir | pembeli membayar di kasir |
| PB-03 | memesan barang ke pemasok | petugas gudang | stok di bawah batas minimum |
| PB-04 | menrima barang dari pemasok | petugas | barang daateng bersama faktur |
| PB-05 | menyusun laporan bulanan | ketua koprasi | awal bulan |

## 3. Dokumen sumber yang dianalisis
![dokumen sumber](laporan/img/p02/d03-dokumen-sumber.png)

dokumen sumber yang di analsis adalah nota penjualan kopma ,nota digunakn untuk mengidentifikasi elemen data yg ada saat transaksi di penjulan seperti barang , qty(jumlah barang) , harga satuan barang , diskon subtotal dan total.

dari itu dapet simpulan qty,harga satuan, dan diskon = data si simpen 
subtotal dan total = nilai yg diturunkan dari data transaksi
harga satuan yg dipake tetap dicatat detail penjualan biar nota lama dapat tau meski harga sewaktu saat ngalemin perubahan

## 4. Entitas kandidat dan elemen data

**before modifikasi**
| Entitas kandidat | Elemen data utama | Sumber |
|---|---|---|
| anggota | no anggota, npm, nama, prodi, no wa , status aktif , poin royalitas | formulir pendaftaran |
| barang | kode , nama kategori , harga jual , stok , batas minimum stok | daftar barang fakfur |
| penjualan | nomer nota , tanggal-jam , kasir, anggota(opsional) , bayar | nota penjulan |
| detail penjualan | nomer nota , barang , qty , harga saat transaksi | nota penjualan |

**after Modifikasi**
### Hasil D.1 — Penandaan kunci dan atribut turunan

| Entitas kandidat | Elemen data utama | Status |
|---|---|---|
| anggota | **id_anggota (PK)**, no_anggota (AK), npm_anggota (AK), nama_anggota, prodi_anggota, no_wa_anggota, status_anggota, poin_loyalitas | no_anggota dan npm_anggota merupakan kunci alternatif karena keduanya unik. |
| barang | **id_barang (PK)**, kode_barang (AK), nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang | kode_barang merupakan kunci alternatif. |
| penjualan | **id_penjualan (PK)**, no_nota_penjualan (AK), tgl_penjualan, id_petugas (FK), id_anggota (FK, opsional), bayar_penjualan | no_nota_penjualan merupakan kunci alternatif. total merupakan atribut turunan. |
| detail_penjualan | **id_penjualan (PK, FK)**, **id_barang (PK, FK)**, qty_detail_penjualan, harga_satuan_detail_penjualan | PK komposit terdiri dari id_penjualan dan id_barang. subtotal merupakan atribut turunan. |

**Keterangan:**
- PK = Primary Key / kunci primer.
- AK = Alternate Key / kunci alternatif.
- FK = Foreign Key / kunci tamu.
- `subtotal` diturunkan dari `qty × harga_satuan`.
- `total` diturunkan dari penjumlahan subtotal dalam satu nota.
- `poin_loyalitas` berkaitan dengan anggota dan akan dibahas lebih lanjut pada latihan Modul 3 untuk menentukan apakah cukup sebagai atribut anggota atau membutuhkan entitas riwayat poin.

### Pemecahan entitas pembelian

Sesuai langkah D.1, entitas kandidat **“Pembelian dan detailnya”** dipecah menjadi dua entitas:

| Entitas | Atribut utama | Status |
|---|---|---|
| pembelian | **id_pembelian (PK)**, no_faktur_pembelian (AK), tgl_pembelian, id_pemasok (FK), status_pembelian | no_faktur_pembelian merupakan kunci alternatif. |
| detail_pembelian | **id_pembelian (PK, FK)**, **id_barang (PK, FK)**, qty_detail_pembelian, harga_beli_detail_pembelian | PK komposit terdiri dari id_pembelian dan id_barang. |

### Entitas yang digunakan setelah D.1

Hasil identifikasi D.1 menjadi:
1. `anggota`
2. `barang`
3. `petugas`
4. `penjualan`
5. `detail_penjualan`
6. `pemasok`
7. `pembelian`
8. `detail_pembelian`

## 5. Aturan bisnis
| Kode | Aturan bisnis |
|---|---|
| AB-01 | setiap nota memiliki nomor unik dan minimal satu baris barang |
| AB-02 | penjualan boleh tanpa anggota (pembeli umum) jika ada, anggota harus berstatus aktif untuk memperoleh diskon 5% |
| AB-03 | stok barang gk boleh negatif; penjualan ditolak bila qty melebihi stok tersedia |
| AB-04 | harga jual yang dipakai pada nota disimpan per baris dan tidak berubah meski harga barang kemudian naik |
| AB-05 | npm anggota unik; pencarian anggota dapat dilakukan lewat nomor anggota atau npm |
| AB-06 | pesanan pembelian dibuat bila stok kurang dari batas minimum barang tersebut|
| AB-07 | setiap kelipatan Rp10.000 belanja anggota bernilai 1 poin loyalitas |
| AB-08 | setiap 50 poin loyalitas dapat ditukar dengan potongan Rp5.000 |

## 6. Kebutuhan informasi
| Kode | Kebutuhan informasi | Data yang diperlukan |
|---|---|---|
| KI-01 | omzet dan jumlah nota per hari dan per bulan | penjualan, detail penjualan |
| KI-02 | Lima barang terlaris per bulan berdasarkan qty | detail penjualan, barang |
| KI-03 | Barang dengan stok di bawah batas minimum | barang  |
| KI-04 | sepuluh anggota dangan belanja terbesar per bulan | penjualan, detail penjualan, anggota |
| KI-05 | mengetahui jumlah poin loyalitas setiap anggota | penjualan, detail penjualan, anggota |

## 7. Matriks CRUD

| Proses | Anggota | Barang | Penjualan | Detail Penjualan | Pemasok | Pembelian |
|---|---|---|---|---|---|---|
| PB-01 daftar anggota | C | ... | ... | ... | ... | ... |
| PB-02 catat penjulan | R,U | R,U | C | C | ... | ... |
| PB-03 pesan ke pemasok | ... | R | ... | ... | R | C |
| PB-04 terima barang | ... | U | ... | ... | R | U |
| PB-05  laporan bulanan | R | R | R | R | ... | R |

## 8. Kamus data awal

| Elemen | Arti | Contoh | Aturan | Penanggung jawab |
|---|---|---|---|---|
| no_anggota | nomer anggota koperasi  |  A-0457 | Unik, format A-4 digit | ketua |
| npm_anggota | npm anggota | 2301010123  | unik, 10 digit  | ketua |
| no_wa_anggota | no wa anggota | 0812xxxx | data pribadi dan akses terbatas | ketua |
| no_nota_penjualan | nomer nota penjualan |  PJ-2609-0142 | unik per nota  | kasir |
| harga_satuan_detail_penjualan | harga jual saat transaksi | 4000 | Bilangan bulat 0(rupiah)  | kasir |
| stok_barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 (AB-03) | petugas |

## 9. Kebutuhan non-fungsional data

disimpan minimal lima tahun, dan nomor HP anggota hanya boleh dilihat oleh ketua. 
Pembatasan akses data pribadi seperti ini sejalan dengan kewajiban pengendali data 
dalam Undang-Undang Pelindungan Data Pribadi

E.2 perbaikian kebutuhan yg kabur
### Data anggota harus aman
Data anggota,kek no wa hanya dapat diakses ketua koperasi

### Sistem harus cepat mencari barang
Pencarian barang harus menampilkan hasil dalam waktu singkat misalnya 2 detik

### Laporan stok harus akurat
Jumlah stok pada laporan harus sama antara stok yg di simpen ketika stransaksi dan penerima barang 

## 10. Isu kualitas data yang diantisipasi
beberapa permasalahan dalam pengelolaan data, yaitu harga barang sering naik sehingga harga pada nota lama susah dicari, pencatatan stok kadang nunjukkin nilai mines, dan anggota sering lupa bawa kartu sehingga kasir perlu mencari data anggota pake npm
