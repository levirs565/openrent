// ── BAB 2: ANALISIS DAN PERANCANGAN SISTEM ─────────────────

= Analisis dan Perancangan Sistem

== Analisis Kebutuhan Sistem

Tahap analisis kebutuhan bertujuan untuk mengidentifikasi kebutuhan fungsional dan
non-fungsional yang harus dipenuhi oleh aplikasi OpenRent.

=== Kebutuhan Fungsional

Kebutuhan fungsional merupakan deskripsi fitur dan layanan yang harus disediakan
oleh sistem:

*Modul Autentikasi:*
- Pengguna dapat mendaftar akun baru sebagai penyewa atau pemilik produk.
- Pengguna dapat masuk (login) menggunakan email dan kata sandi.
- Pengguna dapat mengatur agar diperlukan biometrik sebelum masuk aplikasi
- Pengguna dapat keluar (logout) dari aplikasi.

*Modul Alamat*:
- Pengguna dapat menambahkan alamat baru
- Pengguna dapat menghapus dan mengubah alamat
- Pengguna dapat melihat daftar alamat

*Modul Produk:*
- Pemilik dapat menambahkan produk baru beserta detail dan foto.
- Pemilik dapat memilik alamat berdasarkan lokasi saat ini pada saat menambahkkan produk
- Pemilik dapat mengedit produk yang dimiliki.
- Peminjam dapat melihat daftar produk.
- Peminjam dapat melihat detail lengkap suatu produk.
- Peminjam dapat mencari produk berdasarkan kata kunci dan ketersedian stok di rentang tanggal tertentu
- Peminjam dapat melihat daftar review yang telah diurutkan dari tingkat skor relevansi AI
- Peminjam dapat melihat harga estimasi yang telah disesuaikan dengan mata uang pilihan
- Peminjam mendapatkan rekomendasi produk yang mirip

*Modul Penyewaan:*
- Penyewa dapat menentukan tanggal awal sewa dan akhir sewa
- Penyewa dapat mengajukan permintaan sewa pada suatu produk.
- Pemilik dapat menerima atau menolak permintaan sewa.
- Peminjam dapat mengajukan permintaan pengambilan produk
- Pemilik dapat mengkonfirmasi pengambilan produk dan mencatat pembayaran awal
- Peminjam dapat mengajukan permintaan pengembalian produk
- Pemilik dapat mengkonfimasi pengembalian produk dan mencatatat pembayaran akhir termasuk denda
- Pemilik dapat menlakukan konversi mata uang saat menerima pembayaran
- Pengguna mendapatkan notifikasi jika status penyewaan berubah
- Pengguna dapat melihat riwayat dan status penyewaan.
- Penyewa dapat membuat review produk dari penyewaan yang sudah selesai
- Penyewa dapat melihat estimasi pembayaran berdasarkan mata uang pilihan
- Pengguna dapat melihat waktu penyewaan dalam zona waktu pilihan

*Modul Chat:*
- Penyewa dan pemilik dapat melakukan komunikasi pesan
- Pengguna mendapatkan notifikasi jika mendapatkan pesan baru

*Modul Profil:*
- Pengguna dapat mengunggah foto profil.

*Modul Pengaturan:*
- Pengguna dapat mengatur preferensi aplikasi seperti biometrik, mata uang, dan zona waktu. 

*Modul Mini Game*:
- Pengguna dapat memainkan mini game yang dapat melatih keseimbangan serta menggunakan Giroskop dan Akselerometer

=== Kebutuhan Non-Fungsional

- *Performa:* Waktu respons aplikasi tidak lebih dari 3 detik pada kondisi jaringan
  normal.
- *Keamanan:* Data sensitif pengguna dienkripsi; autentikasi menggunakan JWT
  (JSON Web Token). Password harus disimpan menggunakan algoritma Argon2id.
- *Kegunaan:* Antarmuka intuitif yang dapat dioperasikan tanpa pelatihan khusus.
- *Keandalan:* Sistem backend tersedia minimal 99% waktu operasional.
- *Skalabilitas:* Arsitektur mendukung penambahan fitur di masa mendatang.

== Perancangan Sistem

#block(breakable: false)[
=== Use Case Diagram

#image("diagram/output/use_case.svg")
]

#block(breakable: false)[
=== Activity Diagram

A. Autentikasi

#image("diagram/output/auth.svg")
]

#block(breakable: false)[
B. Manajemen Alamat

#image("diagram/output/address_management.svg")
]

#block(breakable: false)[
C. Manajemen Produk


#image("diagram/output/product_management.svg")
]

#block(breakable: false)[
D. Pencarian dan Mulai Sewa

#image("diagram/output/search_and_rent.svg")
]

#block(breakable: false)[
E. Manajemen Peminjaman untuk Pemilik Barang

#image("diagram/output/rental_management_owner.svg")
]

#block(breakable: false)[
F. Manajemen Peminjaman untuk Peminjam

#image("diagram/output/rental_management_borrower.svg")
]

#block(breakable: false)[
G. Alur Peminjaman Secara Lengkap

#image("diagram/output/rental_full_flow.svg")
]

#block(breakable: false)[
=== Sequence Diagram

A. Autentikasi

#image("diagram/output/sequence_auth.svg")
]

#block(breakable: false)[
B. Manajemen Alamat

#image("diagram/output/sequence_address.svg")
]

#block(breakable: false)[
C. Manajemen Produk

#image("diagram/output/sequence_product.svg")
]

#block(breakable: false)[
D. Pencarian dan Mulai Sewa

#image("diagram/output/sequence_search_and_rent.svg")
]

#block(breakable: false)[
E. Manajemen Peminjaman untuk Pemilik Barang

#image("diagram/output/sequence_rental_management_owner.svg")
]

#block(breakable: false)[
F. Manajemen Peminjaman untuk Peminjam

#image("diagram/output/sequence_rental_management_borrower.svg")
]

#block(breakable: false)[
G. Alur Peminjaman Secara Lengkap

#image("diagram/output/sequence_rental_full_flow.svg")
]


== Perancangan Arsitektur Sistem

Aplikasi OpenRent menggunakan arsitektur _client-server_ dua tingkat:

=== Arsitektur Client (Mobile)

Aplikasi mobile dibangun menggunakan Flutter dengan pola arsitektur
*BLoC (Business Logic Component)*. Lapisan aplikasi terdiri dari:

- *Presentation Layer* — Halaman (pages) dan komponen widget Flutter.
- *Business Logic Layer* — BLoC/Cubit yang mengelola state dan logika bisnis.
- *Data Layer* — Repository dan data source untuk komunikasi dengan API.

=== Arsitektur Server (Backend)

Backend dibangun menggunakan Go dengan framework Echo dan mengikuti pola
*Service-Controller* dengan pemisahan ketebalan lapisan:

- *Controller* — Menangani request HTTP, validasi input, dan mengembalikan response.
- *Service* — Mengandung logika bisnis utama dan orchestration antar entitas.
- *Model* — Struktur data yang berinteraksi dengan database melalui ORM GORM.
- *DTO (Data Transfer Object)* — Mendefinisikan format request dan response API.
- *Core Utilities* — Helper functions untuk autentikasi, error handling, dan transformasi data.

=== Teknologi yang Digunakan

#table(
  columns: (3cm, 4cm, 7cm),
  inset: 8pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Komponen*], [*Teknologi*], [*Keterangan*],
  [Autentikasi], [JWT], [Token-based authentication],
  [Notifikasi], [Firebase Cloud Messaging], [Layanan notifikasi push dari Google],
  table.cell(colspan: 3)[Server],
  [Framework], [Echo (Go)], [Web framework untuk bahasa Go],
  [Database], [PostgreSQL], [Sistem manajemen basis data relasional],
  [Database Vector], [pgvector], [Eskstensi PostgresQL untuk menyimpan vector],
  [Database Spasial], [PostGIS], [Ekstensi PostgresQL untuk menyimpan data spasial (lokasi)],
  [ORM], [GORM], [Library ORM untuk Go],
  table.cell(colspan: 3)[Client],
  [UI Framework], [Flutter (Dart)], [Framework UI lintas platform],
  [State Management], [BLoC], [Manajemen state Flutter],
  [HTTP Client], [Retrofit dan Dio], [HTTP client untuk Flutter],
)

#block(breakable: false)[
== Perancangan Database

=== ERD Database Server

#image("diagram/output/erd.svg")
]

Basis data OpenRent terdiri dari entitas-entitas utama berikut:

- *Account* — Menyimpan informasi login pengguna berupa email, hash password, dan role (user/admin).
- *UserAccount* — Profil detail pengguna sebagai penyewa yang mencakup nama, tanggal lahir, NIK, dan foto avatar.
- *AdminAccount* — Profil pengguna dengan role admin untuk mengelola sistem (*tidak digunakan*).
- *UserAddress* — Alamat lengkap pengguna yang mencakup provinsi, kota, kecamatan, detail alamat, dan koordinat lokasi.
- *Product* — Data produk yang dapat disewa dengan informasi nama, harga per hari, biaya denda, stok, deskripsi, dan embedding vektor untuk pencarian.
- *Rent* — Catatan transaksi penyewaan yang melacak status, tanggal mulai/berakhir, jumlah, dan detail pembayaran.
- *Review* — Ulasan dan rating yang diberikan penyewa setelah selesai melakukan penyewaan.
- *Message* — Pesan chat antar pengguna untuk komunikasi terkait penyewaan.
- *RefreshToken* — Token untuk refresh autentikasi pengguna yang tersimpan dan dapat di-invalidate.
- *FCMToken* — Token Firebase Cloud Messaging untuk mengirim notifikasi push ke perangkat pengguna. 

=== Rancangan Database Client

Refresh token dan access token disimpan menggunakan Secure Storage.

Pengturan pengguna disimpan menggunakan Hive dengan Box yang berisi data berikut:

#table(
  columns: (4cm, 8cm),
  inset: 8pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Key*], [*Fungsi*],
  [`needBiometric`], [Menyimpan preferensi apakah pengguna ingin menggunakan autentikasi biometrik saat masuk.],
  [`currency`], [Menyimpan kode mata uang pilihan pengguna (misal: "IDR", "USD").],
  [`timezone`], [Menyimpan zona waktu pilihan pengguna (misal: "Asia/Jakarta").],
)
