// ── BAB 2: ANALISIS DAN PERANCANGAN SISTEM ─────────────────

= Analisis dan Perancangan Sistem

== Analisis Kebutuhan Sistem

Tahap analisis kebutuhan bertujuan untuk mengidentifikasi kebutuhan fungsional dan
non-fungsional yang harus dipenuhi oleh aplikasi OpenRent.

=== Kebutuhan Fungsional

Kebutuhan fungsional merupakan deskripsi fitur dan layanan yang harus disediakan
oleh sistem:

*Modul Autentikasi:*
- Pengguna dapat mendaftar akun baru sebagai penyewa atau pemilik properti.
- Pengguna dapat masuk (login) menggunakan email dan kata sandi.
- Pengguna dapat keluar (logout) dari aplikasi.
- Sistem mendukung pemulihan kata sandi melalui email.

*Modul Properti:*
- Pemilik dapat menambahkan properti baru beserta detail dan foto.
- Pemilik dapat mengedit dan menghapus properti yang dimiliki.
- Pemilik dapat mengubah status ketersediaan properti.
- Penyewa dapat melihat daftar properti yang tersedia.
- Penyewa dapat melihat detail lengkap suatu properti.
- Penyewa dapat mencari properti berdasarkan lokasi, harga, atau tipe.

*Modul Penyewaan:*
- Penyewa dapat mengajukan permintaan sewa pada suatu properti.
- Pemilik dapat menerima atau menolak permintaan sewa.
- Pengguna dapat melihat riwayat dan status penyewaan.

*Modul Profil:*
- Pengguna dapat melihat dan mengedit informasi profil.
- Pengguna dapat mengunggah foto profil.

=== Kebutuhan Non-Fungsional

- *Performa:* Waktu respons aplikasi tidak lebih dari 3 detik pada kondisi jaringan
  normal.
- *Keamanan:* Data sensitif pengguna dienkripsi; autentikasi menggunakan JWT
  (JSON Web Token).
- *Kegunaan:* Antarmuka intuitif yang dapat dioperasikan tanpa pelatihan khusus.
- *Keandalan:* Sistem backend tersedia minimal 99% waktu operasional.
- *Skalabilitas:* Arsitektur mendukung penambahan fitur di masa mendatang.

== Perancangan Arsitektur Sistem

Aplikasi OpenRent menggunakan arsitektur _client-server_ dua tingkat:

=== Arsitektur Client (Mobile)

Aplikasi mobile dibangun menggunakan Flutter dengan pola arsitektur
*BLoC (Business Logic Component)*. Lapisan aplikasi terdiri dari:

- *Presentation Layer* — Halaman (pages) dan komponen widget Flutter.
- *Business Logic Layer* — BLoC/Cubit yang mengelola state dan logika bisnis.
- *Data Layer* — Repository dan data source untuk komunikasi dengan API.

=== Arsitektur Server (Backend)

Backend dibangun menggunakan Node.js dengan framework Express.js dan mengikuti
pola *MVC (Model-View-Controller)*:

- *Route* — Mendefinisikan endpoint dan mengarahkan request ke controller.
- *Controller* — Menangani logika request dan response HTTP.
- *Model* — Berinteraksi dengan database melalui ORM Prisma.
- *Middleware* — Menangani autentikasi, validasi, dan pengelolaan error.

=== Teknologi yang Digunakan

#table(
  columns: (3cm, 4cm, 7cm),
  inset: 8pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Komponen*], [*Teknologi*], [*Keterangan*],
  [Mobile Client], [Flutter (Dart)], [Framework UI lintas platform],
  [Backend], [Node.js + Express], [Runtime JavaScript server-side],
  [Database], [PostgreSQL], [Sistem manajemen basis data relasional],
  [ORM], [Prisma], [Object-Relational Mapper untuk Node.js],
  [Autentikasi], [JWT], [Token-based authentication],
  [State Management], [BLoC / Riverpod], [Manajemen state Flutter],
  [HTTP Client], [Dio], [HTTP client untuk Flutter],
)

== Perancangan Database

=== Entity Relationship Diagram

Basis data OpenRent terdiri dari entitas-entitas utama berikut:

- *User* — Menyimpan data akun pengguna (penyewa dan pemilik).
- *Property* — Menyimpan data properti yang disewakan.
- *PropertyImage* — Menyimpan gambar-gambar dari suatu properti.
- *RentalRequest* — Menyimpan data pengajuan sewa dari penyewa.
- *Review* — Menyimpan ulasan dan penilaian dari penyewa.

=== Skema Tabel

*Tabel User*

#table(
  columns: (3cm, 3cm, 1.5cm, 5.5cm),
  inset: 7pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Kolom*], [*Tipe*], [*PK/FK*], [*Keterangan*],
  [id], [UUID], [PK], [Identifikasi unik pengguna],
  [name], [VARCHAR], [-], [Nama lengkap pengguna],
  [email], [VARCHAR], [-], [Email unik pengguna],
  [password], [VARCHAR], [-], [Hash kata sandi],
  [role], [ENUM], [-], [Peran: TENANT atau LANDLORD],
  [phone], [VARCHAR], [-], [Nomor telepon],
  [avatar], [VARCHAR], [-], [URL foto profil],
  [createdAt], [TIMESTAMP], [-], [Waktu pembuatan akun],
)

*Tabel Property*

#table(
  columns: (3cm, 3cm, 1.5cm, 5.5cm),
  inset: 7pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Kolom*], [*Tipe*], [*PK/FK*], [*Keterangan*],
  [id], [UUID], [PK], [Identifikasi unik properti],
  [ownerId], [UUID], [FK], [Referensi ke User (pemilik)],
  [title], [VARCHAR], [-], [Nama/judul properti],
  [description], [TEXT], [-], [Deskripsi properti],
  [address], [TEXT], [-], [Alamat properti],
  [city], [VARCHAR], [-], [Kota lokasi properti],
  [price], [DECIMAL], [-], [Harga sewa per bulan],
  [type], [ENUM], [-], [Tipe: KOST, KONTRAKAN, APARTEMEN],
  [isAvailable], [BOOLEAN], [-], [Status ketersediaan],
  [createdAt], [TIMESTAMP], [-], [Waktu penambahan properti],
)

*Tabel RentalRequest*

#table(
  columns: (3cm, 3cm, 1.5cm, 5.5cm),
  inset: 7pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Kolom*], [*Tipe*], [*PK/FK*], [*Keterangan*],
  [id], [UUID], [PK], [Identifikasi unik pengajuan],
  [tenantId], [UUID], [FK], [Referensi ke User (penyewa)],
  [propertyId], [UUID], [FK], [Referensi ke Property],
  [startDate], [DATE], [-], [Tanggal mulai sewa],
  [duration], [INTEGER], [-], [Durasi sewa (bulan)],
  [status], [ENUM], [-], [Status: PENDING, ACCEPTED, REJECTED],
  [message], [TEXT], [-], [Pesan dari penyewa],
  [createdAt], [TIMESTAMP], [-], [Waktu pengajuan],
)

== Perancangan Antarmuka Pengguna

=== Alur Navigasi Aplikasi

Aplikasi OpenRent memiliki dua alur navigasi utama berdasarkan peran pengguna:

*Alur Penyewa (Tenant):*
Splash Screen → Login/Register → Home (Daftar Properti) → Detail Properti →
Form Pengajuan Sewa → Riwayat Sewa → Profil

*Alur Pemilik (Landlord):*
Splash Screen → Login/Register → Dashboard Properti → Tambah/Edit Properti →
Manajemen Pengajuan → Profil

=== Desain Halaman Utama

Halaman utama aplikasi (Home) menampilkan:
- Search bar untuk pencarian properti.
- Filter berdasarkan tipe, kota, dan rentang harga.
- Daftar properti dalam format kartu (card) dengan foto, nama, lokasi, dan harga.
- Navigasi bawah (bottom navigation bar) untuk berpindah antara menu utama.

=== Desain Halaman Detail Properti

Halaman detail properti menampilkan:
- Galeri foto properti (swipeable image carousel).
- Informasi lengkap: nama, lokasi, harga, deskripsi, fasilitas.
- Informasi pemilik properti.
- Tombol "Ajukan Sewa" bagi pengguna yang sudah login sebagai penyewa.
- Rating dan ulasan dari penyewa sebelumnya.
