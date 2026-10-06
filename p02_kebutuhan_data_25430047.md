# Dokumen Kebutuhan Data - PinkTech

## 1. Latar belakang dan aktivitas organisasi
pinktech marupakan organisasi , digeraknya dalam toko daring kek kayak e-commerce. Ini dijual produk teknologi, perangkat komputer, laptop. Jadi produk yang dijual tuh kayak laptop, PC, monitor, SSD, RAM, printer, kabel, keyboard, mouse, dan macam-macem Ada cadangan sperpart juga Aktivitasnya ini, pelanggan bisa memilih produknya yang tersedia, bisa melakukan pesanan secara daring, pembayarannya bisa pakai OVO, kartu kredit, transfer antar bank, bisa pakai dompet digital kayak Dana, GoPay, OVO. Bisa cash juga, COD juga bisa Pengirimannya cepat, pakai jasa ekspedisi JNE dan JNT pinktech masih membutuhkan pengelolaan yang baik karena banyak jenis produk yang informasinya berbeda-beda jadi butuh pengelolaan yang benar-benar terstruktur Data produknya ini masih sulit dikelompokkan, dicari juga kadang susah dikelola Dibutuhkan basis data yang bisa membantu pinktech dalam mengelola data pelanggan, pesanan, pembayaran, dan pengiriman yang terstruktur.

## 2. Aktor dan proses bisnis
| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | mengolah data produk | admin toko | produk baru yg ditambahin/ perubahan data produk  |
| PB-02 | catat pesanan pelanggan | admin toko | pelanggan melakuan pemesan produk |
| PB-03 | memproses pembayaran | admin toko/sistem pembayaran | pelanggan menyelesaikan pembayar |
| PB-04 | menyiapkan dan mengirimkan pesanan | petugas gudang | pesanan udah di bayar dan siap di proses |
| PB-05 | menyusun laporan penjualan | admin toko | periode pelaporan telah berakhir |
## 3. Dokumen sumber yang dianalisis

![rwsi fiktif pengiriman](laporan/img/p02/f05-Label-resi-pengiriman.png)
Ini contoh dokumen yg dipakai pada pinktech pakai dari halaman pesanan, bukti pembayaran, dan resi pengiriman. Pakai ketiga dokumen itu yg dipakai salah satu untuk tahu data dalam proses pemesanan, pembayaran, dan pengiriman barang dan ini pake resi pengiriman barang

halaman pesanan dipake catat informasi pesanan pelanggan Kayak nomor pesanan, seri data pelanggan, produk yang dipesan, berapa jumlahnya, harga berapa, alamat pelanggan, dan ongkir. Ini disimpan berdasarkan pesananan Biar informasi pesanan lama tetap dapat diketahui

bukti pembayaran ini dipakai buat informasi pembayaran ,nomor pembayaran ,nomor pesanan , tanggal pembayaran juga metode pembayaran jumlah dan status pembayaran ini dipakai biar tahu pesanan tuh udah dibayar apa belum

resi pengiriman dipakai buat nyatet informasi pengiriman barang, kayak nomor seri, nomor pesanan, ekspedisi, tanggal pengiriman, status pengiriman. Jadi biar tahu proses dan status pengiriman pesanan pelanggan

## 4. Entitas kandidat dan elemen data
| Entitas kandidat | Elemen data utama | Sumber |
|---|---|---|
| pelanggan | id pelanggan, nama email, no wa, alamat | halaman pesanan |
| produk | kode produk, nama produk, ketegori, harga, stok, deskripsi | katalog produk |
| pesanan | nomor pesanan, tanggal pesanan, pelanggan, alamat pengiriman, ongkos kirim, total pesanan, status pesanan | nota penjulan |
| detail pesanan | nomer pesanan , produk, harga saat pesanan , subtotal | nota penjualan |
| pembayaran | nomor pembayaran, nomor pesanan, tanggal pembayaran,metode pembayaran, jumlah pembayaran, status pembayaran | bukti pembayaran |
| pengiriman | nomor pengiriman, nomor pesanan, ekspedisi, nomor resi,tanggal pengiriman, status pengiriman | resi pengiriman |
| kategori | kode kategori, nama kategori, deskripsi kategori | katalog produk |

## 5. Aturan bisnis
| Kode | Aturan bisnis |
|---|---|
| AB-01 | setiap pelanggan  dapat memiliki satu atau lebih pesanan |
| AB-02 | setiap pesanan memiliki nomer pesanan unik dan ada 1 detail produk |
| AB-03 | setiap produk memiliki harga dan jumlah stok yg tercatat |
| AB-04 | pesanan hnaya dapat diproses setelah pembayaran berhasil di konfirmasi|
| AB-05 | harga produk yg digunakan dalam pesanan disimpan bedasarkan harga saat transaksi dan tidak berubah ketika harga produk di perbarui |
| AB-06 | jumlah produk yg dipesan tidak boleh memebihi stok yg ada |
| AB-07 | setaip pembayaran harus tarkait dangan satu pesanan dan memiliki status pembayaran |
| AB-08 | setiap pesanan yg dikirm harus memiliki informasi ekspedisi dan nomer resi pengiriaman |

## 6. Kebutuhan informasi
| Kode | Kebutuhan informasi | Data yang diperlukan |
|---|---|---|
| KI-01 | mengetahui jumlah dan niai penjualan perhari dan perbulan | pesanan , detail pesanan , pembayaran |
| KI-02 | mengetahui produk yg paling laris terjual | produk , detail pesanan |
| KI-03 | mengetahui produk ygy stoknya menipis | produk  |
| KI-04 | mengetahui metode pembayaran yg sering di gunakan pelanggan | pembayaran , pesanan |
| KI-05 | mengetahui status pengiriman setiap pesanan | pesanan, pengriman |
| KI-06 | mengetahui pelanggan dengan jumlah pembelian terbesar dalam periode tertentu | pelanggan, pesanan, detail pesanan |

## 7. Matriks CRUD

| Proses | pelanggan | produk| pesanan | Detail pesanan | pembayaran | pengiriman |
|---|---|---|---|---|---|---|
| PB-01 mengolah data pengggan | C,R,U | ... | ... | ... | ... | ... |
| PB-02 mengolah data produk | .... | C,R,U | ... | ... | ... | ... |
| PB-03 mencatat pesanan | R | R,U | C | C | ... | ... |
| PB-04 memproses pembayaran | R | ... | R,U | ... | C,U | ... |
| PB-05 memproses pengiriman | ... | ... | R,U | ... | R | C,U |
| PB-06 menyusun laporan penjualan | R | R | R | R | R | R |

## 8. Kamus data awal
| Elemen | entitas | deskripsi | contoh | Penanggung jawab |
|---|---|---|---|---|
| id_pelanggan | pelanggan  | Identitas unik pelanggan | PGL001 | admin |
| nama_pelanggan | pelanggan  | Nama lengkap pelanggan  | VICKY PRDANA | admin |
| email_pelanggan | pelanggan  | alamat email pelanggan | pelanggan@email.com | admin |
| no_wa_pelanggan | pelanggan  |  no wa pelanggan | 0878332211 | admin |
| alamat_pelanggan | pelanggan  | alamat pelanggan | metro,lampung | admin |
| kode_produk | produk  | Kode unik produk | LAPP08 | admin |
| nama_produk | produk | Nama produk yang dijual | LAPTOP LOQ15 | admin |
| kategori_produk | produk | Kelompok atau jenis produk | laptop | admin |
| harga_produk | produk | harga jual produk | 15.550.000 | admin |
| stok_produk | produk  |  jumlah produk yg ada | 15 |
| id_pesanan | pesanan | nomwr unik pesanan | ORDI023 | admin |
| tanggal_pesanan | pesanan | waktu pesanan | 05-10-2026 | admin |
| alamat_pengiriman | pesanan | alamat tujuan pengiriman pesanan | metro,lampung | admin |
| ongkir_pesanan | pesanan | biaya pengiriman pesanan  | RP.340.000 | admin |
| status_pesanan | pesanan | status proses pesanan | diproses | admin |
| id_detail_pesanan | detail_pesanan |  identitas unik detail | DKKL0034 | admin |
| jumlah_produk | detail_pesanan | jumalah prodyuyuk yg di pesan | 2 | admin |
| harga_saat_pesanan | detail_pesanan | harga produk saat di pesan | 14.750.400 | admin |
| subtotal_detail | detail_pesanan |  nilai hasil julmah dikali harga saat pesanan | 28.500.800 | sistem|
| id_pembayaran | pembayaran | identitas unik pembyaran | GOY3455 | admin |
| metode_pembayaran | pembayaran | metode pembayaran yg di pake |   QRIS | admin |
| jumlah_pembayaran | pembayaran | nominal pembayaran pelanggan | 28.840.800 | admin |
| status_pembayaran | pembayaran | status pembayran | berhasil | admin |
| id_pengiriman | pengiriman | identitas unik pengiriman | JNT34450 | petugas gudang |
| ekspedisi_pengiriman | pengiriman |  jasa ekspedisi yg di pake | JNT | petugas gudang |
| no_resi_pengiriman | pengiriman | NO RESI pengiriman | JNT03002334 | petugas gudang |
| status pengiriman | pengiriman | status proses pengiriman | dikirim | petugas gudang |

## 9. Kebutuhan non-fungsional data

kebutuhan non-fungsional data pada PinkTech berkaitan bagaimana data disimpan, dijaga, dan dipake biar tetap aman serta dapat mendukung kegiatan operasional toko daring

### Parameter personal berbasis npm
Parameter personal digunakan berdasarkan dua digit terakhir Npm, yaitu 47.

Perhitungan parameter:

P = (47 mod 9) + 1
P = 2 + 1
P = 3

Berdasarkan nilai P tersebut, parameter yang digunakan pada proyek PinkTech adalah:
batas maksimal item dalam satu transaksi = P + 2 = 5 item
persentase diskon = P = 3%
perkiraan volume transaksi harian = 40 + (5 × P) = 55 transaksi per hari

### Volume data
PinkTech diperkirakan memiliki volume transaksi sebanyak 55 transaksi per hari berdasarkan perhitungan parameter personal NIM. Data yang dikelola meliputi data pelanggan, produk, pesanan, detail pesanan, pembayaran, dan pengiriman. Jumlah data tersebut akan terus bertambah seiring dengan adanya transaksi baru.

### Retensi data 
data pesanan, pembayaran, dan pengiriman perlu disimpan dalam jangka panjang agar dapat digunakan kembali untuk pengecekan transaksi, pembuatan laporan, dan melihat riwayat transaksi pelanggan

### Privasi data
Data pelanggan seperti nama, email, nomor HP, dan alamat pengiriman merupakan data yang harus dijaga kerahasiaannya Data tersebut tidak boleh diakses oleh pengguna yg tidak memiliki kewenangan

### Hak akses data 
Admin memiliki akses untuk mengelola data pelanggan, produk, pesanan, dan pembayaran. Petugas gudang dapat mengakses data produk, detail pesanan, dan alamat pengiriman yg diperlukan untuk menyiapkan serta mengirim pesanan

### Keamanan data pembayaran  
data pembayaran yang disimpan cukup berupa metode pembayaran, jumlah pembayaran, status pembayaran, dan identitas transaksi. Informasi sensitif seperti nomor kartu kredit lengkap dan kode keamanan kartu tidak perlu disimpan.

### Konsistensi data
data antara pesanan, detail pesanan, pembayaran, dan pengiriman harus tetap konsisten agar tidak terjadi perbedaan informasi ketika data digunakan untuk proses operasional maupun pembuatan laporan.

### Ketersediaan data 
Data harus dapat diakses oleh pengguna yang memiliki hak akses ketika dibutuhkan untuk menjalankan proses bisnis, melakukan pengecekan transaksi, dan membuat laporan.

## 10. Isu kualitas data yang diantisipasi

Dalam pengelolaan data PinkTech, terdapat beberapa masalah kualitas data yang mungkin terjadi selama kegiatan operasional. Beberapa isu yang perlu diantisipasi yaitu:

### data pelanggan ganda
satu pelanggan dapat tercatat lebih dari satu kali karena adanya kesalahan saat memasukkan data. Hal ini dapat menyebabkan data pelanggan menjadi tidak konsisten

### data produk tidak lengkap
data produk dapat tersimpan tanpa informasi yang lengkap, seperti harga, stok, kategori, atau nama produk

### ketidaksesuaian stok
jumlah stok yang tercatat dalam basis data dapat berbeda dengan jumlah stok sebenarnya karena transaksi penjualan atau pembaruan stok belum tercatat dengan benar

### kesalahan data pesanan
kesalahan dalam memasukkan jumlah produk, alamat pengiriman, atau data pelanggan dapat menyebabkan pesanan tidak sesuai dengan permintaan pelanggan

### ketidaksesuaian data pembayaran
data pembayaran dapat memiliki jumlah atau status yang tidak sesuai dengan pesanan yang dilakukan

### data pengiriman tidak lengkap
data pengiriman dapat tidak memiliki nomor resi, ekspedisi, atau status pengiriman sehingga proses pelacakan pesanan menjadi sulit

### perubahan harga produk
harga produk dapat berubah setelah pelanggan melakukan pemesanan. Oleh karena itu, harga yang digunakan pada saat transaksi perlu tetap tersimpan pada detail pesanan agar riwayat transaksi tidak berubah

### data yang tidak konsisten
perbedaan penulisan atau format data dapat menyebabkan kesulitan ketika data digunakan untuk pencarian, pengolahan, maupun pembuatan laporan