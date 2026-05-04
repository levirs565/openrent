// ── BAB 5: PENUTUP ─────────────────────────────────────────

= Penutup

== Kesimpulan

Berdasarkan hasil perancangan, implementasi, dan pengujian yang telah dilakukan,
dapat ditarik kesimpulan sebagai berikut:

+ Aplikasi mobile OpenRent telah berhasil dibangun menggunakan Flutter untuk
  sisi klien dan Node.js dengan Express.js untuk sisi server, dengan PostgreSQL
  sebagai basis data melalui Prisma ORM.

+ Sistem autentikasi berbasis JWT telah berhasil diimplementasikan dengan aman,
  menggunakan enkripsi bcrypt untuk penyimpanan kata sandi dan mekanisme validasi
  token pada setiap request yang memerlukan otorisasi.

+ Fitur manajemen properti untuk pemilik (landlord) dan fitur pencarian serta
  pengajuan sewa untuk penyewa (tenant) telah berhasil diintegrasikan dalam
  satu platform mobile yang kohesif.

+ Antarmuka pengguna yang dibangun menggunakan Flutter menghasilkan tampilan
  yang responsif, intuitif, dan konsisten di berbagai ukuran layar Android.

+ Hasil pengujian Black-Box Testing menunjukkan tingkat keberhasilan 100% pada
  17 test case yang mencakup seluruh modul fungsional aplikasi, membuktikan
  bahwa aplikasi berfungsi sesuai dengan spesifikasi kebutuhan yang telah
  ditetapkan.

+ Seluruh operasi utama aplikasi memiliki waktu respons di bawah 3 detik,
  memenuhi standar performa yang ditetapkan dalam kebutuhan non-fungsional.

== Saran

Untuk pengembangan aplikasi OpenRent ke depannya, terdapat beberapa saran yang
dapat dipertimbangkan:

=== Peningkatan Fitur

+ *Integrasi Pembayaran* — Menambahkan fitur pembayaran sewa secara online
  melalui integrasi dengan payment gateway seperti Midtrans atau Xendit, sehingga
  transaksi dapat dilakukan sepenuhnya di dalam aplikasi.

+ *Notifikasi Real-time* — Mengimplementasikan notifikasi push berbasis
  Firebase Cloud Messaging (FCM) untuk memberikan pemberitahuan instan
  kepada pengguna mengenai pembaruan status pengajuan sewa atau pesan baru.

+ *Fitur Chat* — Menambahkan fitur pesan langsung (direct message) antara
  penyewa dan pemilik properti untuk memudahkan komunikasi negosiasi.

+ *Peta Interaktif* — Mengintegrasikan Google Maps atau peta OpenStreetMap
  untuk menampilkan lokasi properti secara visual dan memudahkan pencarian
  berdasarkan area geografis.

+ *Sistem Review dan Rating* — Mengembangkan sistem ulasan yang lebih
  komprehensif dengan verifikasi bahwa hanya penyewa yang pernah menyewa
  properti yang dapat memberikan ulasan.

=== Peningkatan Teknis

+ *Platform iOS* — Memperluas dukungan platform ke iOS menggunakan kemampuan
  lintas platform Flutter, sehingga aplikasi dapat digunakan oleh pengguna
  iPhone dan iPad.

+ *Optimasi Performa* — Menerapkan strategi caching pada sisi klien dan
  implementasi pagination untuk meningkatkan performa pada dataset yang besar.

+ *CI/CD Pipeline* — Mengimplementasikan pipeline integrasi dan penerapan
  berkelanjutan menggunakan GitHub Actions untuk mengotomatisasi proses
  pengujian dan deployment.

+ *Containerization* — Menggunakan Docker untuk mengemas dan mengelola
  lingkungan backend, sehingga proses deployment menjadi lebih konsisten
  dan mudah direplikasi.

+ *Monitoring dan Logging* — Menerapkan sistem monitoring dan logging
  terpusat untuk memudahkan pemantauan performa dan pendeteksian masalah
  pada lingkungan produksi.
