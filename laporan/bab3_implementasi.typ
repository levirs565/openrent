// ── BAB 3: IMPLEMENTASI DAN PEMBAHASAN ─────────────────────

= Implementasi dan Pembahasan

== Lingkungan Pengembangan

Aplikasi OpenRent dikembangkan dengan menggunakan lingkungan dan alat sebagai berikut:

#table(
  columns: (4cm, 9cm),
  inset: 8pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Alat / Tool*], [*Versi / Spesifikasi*],
  [Flutter SDK], [3.x (stable channel)],
  [Dart SDK], [3.x],
  [Node.js], [v20 LTS],
  [PostgreSQL], [16],
  [Prisma ORM], [5.x],
  [IDE], [Visual Studio Code],
  [Version Control], [Git + GitHub],
  [Emulator / Device], [Android Emulator (API 33) / Perangkat Fisik],
)

== Implementasi Backend

=== Struktur Direktori Backend

Backend OpenRent diorganisasikan dalam struktur direktori berikut:

```
server/
├── src/
│   ├── controllers/       # Logika request handler
│   ├── middlewares/        # Autentikasi, validasi, error handler
│   ├── routes/             # Definisi endpoint API
│   ├── utils/              # Fungsi utilitas
│   └── app.js              # Konfigurasi Express
├── prisma/
│   ├── schema.prisma       # Skema database
│   └── migrations/         # Migrasi database
└── package.json
```

=== Implementasi Autentikasi

Sistem autentikasi menggunakan JWT (JSON Web Token). Proses login menghasilkan
access token yang disertakan pada setiap request API yang memerlukan otorisasi
melalui header `Authorization: Bearer <token>`.

Middleware autentikasi memverifikasi token pada setiap request yang dilindungi dan
mengekstrak informasi pengguna (id, role) untuk digunakan di layer controller.

=== Implementasi API Endpoint

API OpenRent mengikuti prinsip RESTful dengan base URL `/api/v1`. Berikut adalah
daftar endpoint utama:

#table(
  columns: (1.5cm, 5cm, 6.5cm),
  inset: 7pt,
  align: (center, left, left),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Metode*], [*Endpoint*], [*Keterangan*],
  [POST], [/auth/register], [Registrasi pengguna baru],
  [POST], [/auth/login], [Login dan mendapatkan JWT],
  [GET], [/properties], [Mendapatkan semua properti tersedia],
  [GET], [/properties/:id], [Mendapatkan detail satu properti],
  [POST], [/properties], [Menambahkan properti baru (Landlord)],
  [PUT], [/properties/:id], [Memperbarui data properti (Landlord)],
  [DELETE], [/properties/:id], [Menghapus properti (Landlord)],
  [POST], [/rentals], [Mengajukan permintaan sewa (Tenant)],
  [GET], [/rentals], [Mendapatkan daftar pengajuan sewa],
  [PATCH], [/rentals/:id/status], [Memperbarui status pengajuan (Landlord)],
  [GET], [/users/me], [Mendapatkan profil pengguna],
  [PUT], [/users/me], [Memperbarui profil pengguna],
)

== Implementasi Frontend (Mobile)

=== Struktur Direktori Client

Aplikasi Flutter diorganisasikan dengan struktur direktori berikut:

```
client/
├── lib/
│   ├── core/
│   │   ├── constants/      # Konstanta aplikasi (warna, string, URL)
│   │   ├── errors/         # Kelas penanganan error
│   │   └── utils/          # Fungsi utilitas
│   ├── data/
│   │   ├── datasources/    # Remote data source (API calls)
│   │   ├── models/         # Data model & serialisasi JSON
│   │   └── repositories/   # Implementasi repository
│   ├── domain/
│   │   ├── entities/       # Entitas bisnis
│   │   └── repositories/   # Abstrak repository
│   ├── presentation/
│   │   ├── bloc/           # BLoC / Cubit state management
│   │   ├── pages/          # Halaman-halaman aplikasi
│   │   └── widgets/        # Widget yang dapat digunakan ulang
│   └── main.dart           # Entry point aplikasi
└── pubspec.yaml
```

=== Implementasi Halaman Autentikasi

Halaman login dan registrasi dibangun menggunakan widget `TextFormField` dengan
validasi form bawaan Flutter. State dikelola menggunakan `AuthBloc` yang memanggil
`AuthRepository` untuk berkomunikasi dengan endpoint autentikasi backend.

Setelah berhasil login, JWT yang diterima disimpan secara aman menggunakan paket
`flutter_secure_storage` dan pengguna diarahkan ke halaman utama sesuai perannya.

=== Implementasi Halaman Daftar Properti

Halaman utama menampilkan daftar properti menggunakan widget `ListView.builder`
yang dioptimalkan untuk performa. Data properti diambil dari API menggunakan
`PropertyBloc` dengan menangani tiga state: `loading`, `loaded`, dan `error`.

Fitur pencarian diimplementasikan menggunakan `TextField` dengan _debounce_ untuk
mengurangi frekuensi pemanggilan API saat pengguna mengetik.

=== Implementasi Halaman Detail Properti

Halaman detail properti menampilkan galeri foto menggunakan `PageView` dengan
indikator halaman. Data properti dan pengajuan sewa dikelola terpisah menggunakan
`PropertyDetailBloc` dan `RentalBloc`.

=== Implementasi Manajemen State

Manajemen state menggunakan pola BLoC (Business Logic Component) dari paket
`flutter_bloc`. Setiap fitur memiliki BLoC tersendiri yang memisahkan logika
bisnis dari antarmuka pengguna:

- `AuthBloc` — Mengelola state autentikasi.
- `PropertyBloc` — Mengelola daftar dan pencarian properti.
- `PropertyDetailBloc` — Mengelola detail properti.
- `RentalBloc` — Mengelola pengajuan dan riwayat sewa.
- `ProfileBloc` — Mengelola data profil pengguna.

== Implementasi Keamanan

=== Enkripsi Password

Kata sandi pengguna di-_hash_ menggunakan algoritma `bcrypt` dengan faktor salt
sebesar 12 sebelum disimpan ke database. Kata sandi tidak pernah disimpan dalam
bentuk teks biasa.

=== Validasi Input

Setiap endpoint API dilindungi oleh middleware validasi menggunakan library `Zod`
yang memverifikasi tipe data, format, dan batasan nilai sebelum data diproses
oleh controller.

=== CORS dan Rate Limiting

Backend dikonfigurasi dengan kebijakan CORS yang ketat untuk hanya mengizinkan
request dari origin yang terdaftar. Rate limiting diterapkan untuk mencegah
serangan _brute force_ pada endpoint autentikasi.
