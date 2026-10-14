# d.1.Dari UNF ke 1NF

## bentuk UNF

NOTA_UNF (no_nota_penjualan, tgl_penjualan, kode_petugas, nama_petugas,
no_anggota, nama_anggota,
{ kode_barang, nama_barang, qty_detail_penjualan,
harga_satuan_detail_penjualan, subtotal_detail_penjualan },
jumlah_penjualan, diskon_penjualan, total_penjualan)

## Bentuk 1NF

NOTA_1NF (no_nota_penjualan, kode_barang, tgl_penjualan, kode_petugas,
nama_petugas, no_anggota,
nama_anggota, nama_barang, qty_detail_penjualan,
harga_satuan_detail_penjualan, subtotal_detail_penjualan,
jumlah_penjualan, diskon_penjualan, total_penjualan)

# D.2 Menuliskan Dependensi Fungsional

Di buku praktikum Penjelasan
FD1: no_nota_penjualan → tgl_penjualan, kode_petugas, no_anggota Satu nomor nota menentukan tanggal, petugas, dan anggota yang terkait. (AB-01)
FD2: kode_petugas → nama_petugas Kode petugas menentukan nama petugas.
FD3: no_anggota → nama_anggota Nomor anggota menentukan nama anggota. (AB-05)
FD4: kode_barang → nama_barang Kode barang menentukan nama barang.
FD5: (no_nota_penjualan, kode_barang) → qty_detail_penjualan, harga_satuan_detail_penjualan Kombinasi nomor nota dan kode barang menentukan jumlah dan harga barang pada nota. (AB-04)
FD6: qty_detail_penjualan, harga_satuan_detail_penjualan → subtotal_detail_penjualan Subtotal merupakan nilai turunan dari jumlah dikalikan harga satuan.

# D.3 Menuju 2NF dan 3NF

Skema Relasional Hasil 3NF

PENJUALAN (
no_nota_penjualan,
tgl_penjualan,
kode_petugas*,
no_anggota*,
bayar_penjualan
)

DETAIL_PENJUALAN (
no_nota_penjualan*,
kode_barang*,
qty_detail_penjualan,
harga_satuan_detail_penjualan
)

BARANG (
kode_barang,
nama_barang,
kategori_barang,
harga_jual_barang,
stok_barang,
stok_min_barang
)

PETUGAS (
kode_petugas,
nama_petugas,
peran_petugas
)

ANGGOTA (
no_anggota,
nim_anggota,
nama_anggota,
prodi_anggota,
no_hp_anggota,
status_anggota,
tgl_daftar_anggota
)

# D.4 Mencocokkan dengan Skema Kanonik

## Table skema kanonik Kopma hasil normalisasi

| Tabel            | Kunci Primer (PK)             | Kunci Unik                  | Kunci Tamu (FK)                         |
| ---------------- | ----------------------------- | --------------------------- | --------------------------------------- |
| petugas          | `id_petugas`                  | `kode_petugas`              | —                                       |
| anggota          | `id_anggota`                  | `no_anggota`, `nim_anggota` | —                                       |
| barang           | `id_barang`                   | `kode_barang`               | —                                       |
| pemasok          | `id_pemasok`                  | —                           | —                                       |
| penjualan        | `id_penjualan`                | `no_nota_penjualan`         | `id_petugas`, `id_anggota` (boleh NULL) |
| detail_penjualan | (`id_penjualan`, `id_barang`) | —                           | `id_penjualan`, `id_barang`             |
| pembelian        | `id_pembelian`                | —                           | `id_pemasok`                            |
| detail_pembelian | (`id_pembelian`, `id_barang`) | —                           | `id_pembelian`, `id_barang`             |

### table Pemeriksaaan BCNF

| Tabel            | Penentu                                   | Hasil Pemeriksaan |
| ---------------- | ----------------------------------------- | ----------------- |
| petugas          | `id_petugas`, `kode_petugas`              | Memenuhi BCNF     |
| anggota          | `id_anggota`, `no_anggota`, `nim_anggota` | Memenuhi BCNF     |
| barang           | `id_barang`, `kode_barang`                | Memenuhi BCNF     |
| pemasok          | `id_pemasok`                              | Memenuhi BCNF     |
| penjualan        | `id_penjualan`, `no_nota_penjualan`       | Memenuhi BCNF     |
| detail_penjualan | (`id_penjualan`, `id_barang`)             | Memenuhi BCNF     |
| pembelian        | `id_pembelian`                            | Memenuhi BCNF     |
| detail_pembelian | (`id_pembelian`, `id_barang`)             | Memenuhi BCNF     |
