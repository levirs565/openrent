// ── BAB 4: PENGUJIAN SISTEM ────────────────────────────────

= Pengujian Sistem

== Metodologi Pengujian

Pengujian aplikasi OpenRent dilakukan menggunakan metode *Black-Box Testing* yang
berfokus pada fungsionalitas sistem tanpa memperhatikan struktur internal kode.
Setiap fitur diuji berdasarkan skenario kasus uji (_test case_) yang telah
ditetapkan sebelumnya.

Pengujian dilakukan pada:
- *Perangkat:* Perangkat fisik Android 16.
- *Jaringan:* Jaringan lokal (Wi-Fi).
- *Backend:* Server lokal dalam 1 LAN.

== Rencana Pengujian

=== Modul Autentikasi

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [1],
  [Registrasi berhasil],
  [Isi form registrasi dengan data valid, tekan tombol Daftar],
  [Akun berhasil dibuat, pengguna diarahkan ke halaman login],
  [✓ Lulus],

  [2],
  [Registrasi email duplikat],
  [Daftarkan email yang sudah terdaftar],
  [Muncul pesan error "Email sudah digunakan"],
  [✓ Lulus],

  [3],
  [Login berhasil],
  [Masukkan email dan password yang valid, tekan Login],
  [Pengguna berhasil masuk dan diarahkan ke halaman utama],
  [✓ Lulus],

  [4],
  [Login password salah],
  [Masukkan email valid dengan password yang salah],
  [Muncul pesan error "Email atau password salah"],
  [✓ Lulus],

  [5],
  [Logout berhasil],
  [Tekan tombol logout pada halaman profil],
  [Pengguna keluar dan diarahkan ke halaman login],
  [✓ Lulus],

  [6],
  [Login dengan biometrik],
  [Aktifkan biometrik, tutup aplikasi, buka kembali],
  [Aplikasi meminta autentikasi biometrik sebelum masuk],
  [✓ Lulus],

  [7],
  [Sesi pengguna tersimpan],
  [Login, tutup paksa aplikasi, buka kembali],
  [Pengguna tetap dalam keadaan login tanpa harus memasukkan kredensial lagi],
  [✓ Lulus],
)

=== Modul Alamat

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [8],
  [Melihat daftar alamat],
  [Buka halaman "Alamat Saya"],
  [Daftar alamat pengguna ditampilkan],
  [✓ Lulus],

  [9],
  [Tambah alamat baru],
  [Isi form tambah alamat, tekan Simpan],
  [Alamat baru berhasil ditambahkan],
  [✓ Lulus],

  [10],
  [Ubah alamat],
  [Pilih alamat, ubah data, tekan Simpan],
  [Data alamat berhasil diperbarui],
  [✓ Lulus],

  [11],
  [Hapus alamat],
  [Pilih alamat, tekan Hapus],
  [Alamat berhasil dihapus dari daftar],
  [✓ Lulus],
)

=== Modul Produk

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [12],
  [Melihat daftar produk],
  [Buka halaman daftar produk],
  [Daftar produk tersedia ditampilkan dengan benar],
  [✓ Lulus],

  [13],
  [Melihat detail produk],
  [Tekan salah satu produk dari daftar],
  [Detail produk ditampilkan lengkap beserta foto dan review],
  [✓ Lulus],

  [14],
  [Tambah produk (Pemilik)],
  [Isi form tambah produk dengan data valid, tekan Simpan],
  [Produk baru berhasil ditambahkan dan muncul di daftar],
  [✓ Lulus],

  [15],
  [Tambah produk dari lokasi saat ini (Pemilik)],
  [Pada form tambah produk, pilih opsi "Gunakan Lokasi Saat Ini"],
  [Alamat produk otomatis terisi berdasarkan koordinat GPS pengguna],
  [✓ Lulus],

  [16],
  [Edit produk (Pemilik)],
  [Ubah salah satu informasi produk, tekan Perbarui],
  [Data produk berhasil diperbarui],
  [✓ Lulus],

  [17],
  [Pencarian produk standar],
  [Masukkan kata kunci dan rentang tanggal di bar pencarian],
  [Hasil pencarian menampilkan produk yang relevan dan tersedia],
  [✓ Lulus],

  [18],
  [Pencarian produk berbasis AI],
  [Masukkan deskripsi naratif (misal: "kamera untuk pemula") di pencarian],
  [Hasil pencarian menampilkan produk yang paling sesuai secara semantik],
  [✓ Lulus],

  [19],
  [Lihat rekomendasi produk],
  [Buka detail produk],
  [Menampilkan daftar produk serupa di bagian bawah],
  [✓ Lulus],

  [20],
  [Lihat harga dalam mata uang lain],
  [Ubah mata uang di pengaturan, buka detail produk],
  [Estimasi harga sewa ditampilkan dalam mata uang yang dipilih],
  [✓ Lulus],

  [21],
  [Urutan review berdasarkan skor relevansi AI],
  [Buka detail produk dengan banyak review],
  [Review dengan skor relevansi tertinggi dari AI ditampilkan paling atas],
  [✓ Lulus],
)

=== Modul Penyewaan

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [22],
  [Ajukan sewa (Penyewa)],
  [Isi form pengajuan sewa, tekan Ajukan],
  [Pengajuan berhasil dikirim dengan status "Menunggu Persetujuan"],
  [✓ Lulus],

  [23],
  [Pengajuan sewa ditolak otomatis (stok habis)],
  [Dua pengguna mengajukan sewa pada produk & tanggal yang sama (stok 1)],
  [Pengajuan kedua otomatis ditolak atau tidak dapat dilakukan],
  [✓ Lulus],

  [24],
  [Terima pengajuan (Pemilik)],
  [Pemilik tekan "Terima" pada pengajuan masuk],
  [Status pengajuan berubah menjadi "Disetujui"],
  [✓ Lulus],

  [25],
  [Tolak pengajuan (Pemilik)],
  [Pemilik tekan "Tolak" pada pengajuan masuk],
  [Status pengajuan berubah menjadi "Ditolak"],
  [✓ Lulus],

  [26],
  [Konfirmasi pengambilan (Pemilik)],
  [Pemilik mengonfirmasi pengambilan barang oleh penyewa],
  [Status sewa berubah menjadi "Disewa", pembayaran awal tercatat],
  [✓ Lulus],

  [27],
  [Konfirmasi pengembalian (Pemilik)],
  [Pemilik mengonfirmasi pengembalian barang],
  [Status sewa berubah menjadi "Selesai", pembayaran akhir tercatat],
  [✓ Lulus],

  [28],
  [Buat ulasan (Penyewa)],
  [Pilih sewa yang sudah selesai, isi form ulasan, kirim],
  [Ulasan berhasil ditambahkan pada produk terkait],
  [✓ Lulus],

  [29],
  [Lihat riwayat sewa],
  [Buka halaman "Riwayat Sewa"],
  [Semua transaksi sewa pengguna ditampilkan dengan statusnya],
  [✓ Lulus],

  [30],
  [Lihat waktu sewa sesuai zona waktu],
  [Ubah zona waktu di pengaturan, lihat detail riwayat sewa],
  [Waktu mulai dan selesai sewa ditampilkan sesuai zona waktu yang dipilih],
  [✓ Lulus],

  [31],
  [Notifikasi perubahan status],
  [Status sewa diubah oleh salah satu pihak],
  [Pengguna lain menerima notifikasi push terkait perubahan status],
  [✓ Lulus],
)

=== Modul Chat

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [32],
  [Mengirim pesan],
  [Buka halaman chat dari transaksi sewa, ketik dan kirim pesan],
  [Pesan terkirim dan diterima oleh pengguna lain],
  [✓ Lulus],

  [33],
  [Menerima notifikasi pesan],
  [Pengguna lain mengirim pesan],
  [Menerima notifikasi push untuk pesan baru],
  [✓ Lulus],
)

=== Modul Profil dan Pengaturan

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [34],
  [Lihat profil],
  [Buka halaman "Profil"],
  [Informasi profil pengguna ditampilkan dengan benar],
  [✓ Lulus],

  [35],
  [Upload Foto Profil],
  [Klik "Ubah Foto Profil" dan pilih gambar],
  [Perubahan foto profil berhasil disimpan],
  [✓ Lulus],

  [36],
  [Ubah Pengaturan],
  [Masuk ke halaman Pengaturan, ubah preferensi (biometrik, mata uang, zona waktu)],
  [Perubahan berhasil disimpan dan diterapkan di aplikasi],
  [✓ Lulus],
)

=== Modul Mini Game

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [37],
  [Responsivitas sensor gerak],
  [Buka mini game, gerakkan perangkat ke berbagai arah (miring, putar, guncang)],
  [Objek dalam game merespons secara akurat sesuai input dari sensor giroskop dan akselerometer],
  [✓ Lulus],
)

== Hasil Pengujian

=== Rekapitulasi Hasil Pengujian

#table(
  columns: (4cm, 2.5cm, 2.5cm, 2.5cm),
  inset: 8pt,
  align: (left, center, center, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Modul*], [*Jumlah TC*], [*Lulus*], [*Persentase*],
  [Autentikasi], [7], [7], [100%],
  [Alamat], [4], [4], [100%],
  [Produk], [10], [10], [100%],
  [Penyewaan], [10], [10], [100%],
  [Chat], [2], [2], [100%],
  [Profil & Pengaturan], [3], [3], [100%],
  [Mini Game], [1], [1], [100%],
  [*Total*], [*37*], [*37*], [*100%*],
)

=== Analisis Hasil Pengujian

Berdasarkan hasil pengujian yang dilakukan terhadap 37 test case yang mencakup
seluruh modul aplikasi OpenRent, semua skenario pengujian berhasil dilaksanakan
dengan hasil yang sesuai dengan yang diharapkan. Tingkat keberhasilan pengujian
mencapai 100%.

Hal ini menunjukkan bahwa aplikasi OpenRent telah berhasil mengimplementasikan
seluruh fitur yang direncanakan dengan benar dan dapat berfungsi sesuai dengan
spesifikasi kebutuhan fungsional yang telah ditetapkan pada tahap analisis.