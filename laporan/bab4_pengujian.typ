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
)

=== Modul Produk

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [6],
  [Melihat daftar produk],
  [Buka halaman daftar produk],
  [Daftar properti tersedia ditampilkan dengan benar],
  [✓ Lulus],

  [8],
  [Melihat detail properti],
  [Tekan salah satu properti dari daftar],
  [Detail properti ditampilkan lengkap beserta foto],
  [✓ Lulus],

  [9],
  [Tambah produk)],
  [Isi form tambah produk dengan data valid, tekan Simpan],
  [Properti baru berhasil ditambahkan dan muncul di daftar],
  [✓ Lulus],

  [10],
  [Edit produk],
  [Ubah salah satu informasi produk, tekan Perbarui],
  [Data properti berhasil diperbarui],
  [✓ Lulus],
)

=== Modul Penyewaan

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [12],
  [Ajukan sewa (Tenant)],
  [Isi form pengajuan sewa, tekan Ajukan],
  [Pengajuan berhasil dikirim dengan status Menuggu Persetujuan Pemilik],
  [✓ Lulus],

  [13],
  [Terima pengajuan],
  [Pemilik tekan Terima pada pengajuan masuk],
  [Status pengajuan berubah menjadi Siap],
  [✓ Lulus],

  [14],
  [Tolak pengajuan],
  [Pemilik tekan Tolak pada pengajuan masuk],
  [Status pengajuan berubah menjadi Dibatalkan],
  [✓ Lulus],

  [15],
  [Lihat riwayat sewa],
  [Buka halaman Riwayat Sewa],
  [Semua pengajuan sewa pengguna ditampilkan dengan status],
  [✓ Lulus],
)

=== Modul Profil

#table(
  columns: (0.6cm, 3.5cm, 4.5cm, 3cm, 1.5cm),
  inset: 7pt,
  align: (center, left, left, left, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*No*], [*Skenario*], [*Langkah Uji*], [*Hasil yang Diharapkan*], [*Status*],
  [16],
  [Lihat profil],
  [Buka halaman Profil],
  [Informasi profil pengguna ditampilkan dengan benar],
  [✓ Lulus],

  [17],
  [Upload Foto Profil],
  [Klik Ubah Foto Profil dan Pilih Gambar],
  [Perubahan foto profil berhasil disimpan],
  [✓ Lulus],
)

== Hasil Pengujian

=== Rekapitulasi Hasil Pengujian

#table(
  columns: (5cm, 3cm, 3cm, 2.5cm),
  inset: 8pt,
  align: (left, center, center, center),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Modul*], [*Jumlah TC*], [*Lulus*], [*Persentase*],
  [Autentikasi], [5], [5], [100%],
  [Properti], [6], [6], [100%],
  [Penyewaan], [4], [4], [100%],
  [Profil], [2], [2], [100%],
  [*Total*], [*17*], [*17*], [*100%*],
)

=== Analisis Hasil Pengujian

Berdasarkan hasil pengujian yang dilakukan terhadap 17 test case yang mencakup
seluruh modul aplikasi OpenRent, semua skenario pengujian berhasil dilaksanakan
dengan hasil yang sesuai dengan yang diharapkan. Tingkat keberhasilan pengujian
mencapai 100%.

Hal ini menunjukkan bahwa aplikasi OpenRent telah berhasil mengimplementasikan
seluruh fitur yang direncanakan dengan benar dan dapat berfungsi sesuai dengan
spesifikasi kebutuhan yang telah ditetapkan pada tahap analisis.