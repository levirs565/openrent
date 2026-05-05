// ── BAB 3: IMPLEMENTASI DAN PEMBAHASAN ─────────────────────


#let frame(title: none, body) = {
  let stroke = black + 1pt
//   let font = (font: "Fira Code", size: 10pt)
//   set text(..font)
//   show raw: set text(..font)
  table(
    stroke: stroke, 
    columns: 1,
    [#block(
      width: 100%,
      inset: (rest: 0.5em),
      body,
    )]
  )
}

#let include_code_file(file_path, lang) = {
  frame()[
    #raw(read(file_path), lang: lang, block: true)
  ]
}

= Implementasi dan Pembahasan

== Lingkungan Pengembangan

Aplikasi OpenRent dikembangkan dengan menggunakan lingkungan dan alat sebagai berikut:

#table(
  columns: (4cm, 9cm),
  inset: 8pt,
  align: horizon,
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Alat / Tool*], [*Versi / Spesifikasi*],
  [Flutter SDK], [3.41.6],
  [Dart SDK], [3.11.4],
  [Go], [1.26],
  [PostgreSQL], [16],
  [PostGIS], [3.6.2],
  [pgvector], [0.8.2],
  [GORM], [1.31.1],
  [IDE], [Visual Studio Code dan Android Studio],
  [Version Control], [Git + GitHub],
  [Device], [Perangkat Fisik Android 16],
)

== Implementasi Backend

=== Struktur Direktori Backend

Backend OpenRent diorganisasikan menggunakan pola _feature-based_, di mana setiap
fitur utama memiliki direktori tersendiri yang berisi semua komponen terkait:

```
server/
├── models/                 # Struktur data dan model GORM
├── core/                   # Utilities: context, token, storage, error handling
├── ai/                     # Fitur AI: embedding dan generate
├── {fitur}/                # Direktori untuk setiap fitur, contoh:
│   ├── controller.go       # Handler HTTP dan validasi request
│   ├── service.go          # Logika bisnis utama
│   └── dto.go              # Data Transfer Objects untuk request/response
├── main.go                 # Entry point aplikasi dan registrasi route
├── errors.go               # Definisi error kustom
├── go.mod                  # Manajemen dependensi
└── go.sum
```

=== Implementasi Autentikasi

Sistem autentikasi menggunakan JWT (JSON Web Token) dengan mekanisme _access token_
dan _refresh token_. Proses login menghasilkan sepasang token:
- *Access Token* (short-lived): Digunakan untuk otorisasi pada setiap request API
  melalui header `Authorization: Bearer <token>`.
- *Refresh Token* (long-lived): Digunakan untuk mendapatkan access token baru
  tanpa perlu login ulang.

Untuk meningkatkan keamanan, sistem menerapkan *rotasi refresh token*, di mana
setiap kali refresh token digunakan, token tersebut akan hangus dan digantikan
dengan yang baru.

Middleware autentikasi (`SessionMiddleware`) memverifikasi access token pada
setiap request yang dilindungi dan mengekstrak informasi sesi pengguna (ID, role)
untuk digunakan di layer selanjutnya.

=== Implementasi API Endpoint

API OpenRent mengikuti prinsip RESTful. Berikut adalah
daftar endpoint utama:

#table(
  columns: (1.8cm, 5.5cm, 6cm),
  inset: 7pt,
  align: (center, left, left),
  fill: (col, row) => if row == 0 { luma(220) } else { white },
  [*Metode*], [*Endpoint*], [*Keterangan*],
  table.cell(colspan: 3, fill: luma(230))[*Autentikasi & Profil*],
  [POST], [/auth/register], [Registrasi pengguna baru],
  [POST], [/auth/login], [Login dan mendapatkan JWT],
  [POST], [/auth/logout], [Logout dan membatalkan refresh token],
  [GET], [/auth/state], [Mendapatkan profil pengguna saat ini],
  [POST], [/auth/refresh_token], [Memperbarui access token dan refresh token baru],
  [POST], [/auth/avatar/presigned-url], [Mendapatkan URL untuk upload avatar],
  [POST], [/auth/avatar/confirm], [Konfirmasi upload avatar],
  [POST], [/auth/me/fcm], [Mengirim token FCM],
  [DELETE], [/auth/me/fcm/:id], [Menghapus token FCM],
  [GET], [/users/:id], [Mendapatkan profil publik pengguna lain],
  table.cell(colspan: 3, fill: luma(230))[*Alamat Pengguna*],
  [GET], [/addresses], [Mendapatkan semua alamat pengguna],
  [GET], [/addresses/:id], [Mendapatkan detail satu alamat],
  [POST], [/addresses], [Menambahkan alamat baru],
  [PUT], [/addresses/:id], [Memperbarui alamat],
  [DELETE], [/addresses/:id], [Menghapus alamat],
  table.cell(colspan: 3, fill: luma(230))[*Produk (Pemilik)*],
  [GET], [/me/products], [Mendapatkan semua produk milik pengguna],
  [POST], [/me/products], [Menambahkan produk baru],
  [GET], [/me/products/:id], [Mendapatkan detail produk milik pengguna],
  [PUT], [/me/products/:id], [Memperbarui produk],
  [DELETE], [/me/products/:id], [Menghapus produk],
  [POST], [/me/products/:id/image/presigned-url], [Mendapatkan URL untuk upload gambar produk],
  [POST], [/me/products/:id/image/confirm], [Konfirmasi upload gambar produk],
  table.cell(colspan: 3, fill: luma(230))[*Produk (Publik)*],
  [GET], [/products], [Mencari dan mendapatkan semua produk],
  [GET], [/products/:id], [Mendapatkan detail publik produk],
  table.cell(colspan: 3, fill: luma(230))[*Penyewaan (Penyewa)*],
  [POST], [/products/:id/rent], [Mengajukan permintaan sewa],
  [GET], [/rents], [Mendapatkan riwayat sewa (sebagai penyewa)],
  [GET], [/rents/:id], [Mendapatkan detail sewa (sebagai penyewa)],
  [POST], [/rents/:id/receive], [Konfirmasi penerimaan barang],
  [POST], [/rents/:id/return], [Mengajukan pengembalian barang],
  table.cell(colspan: 3, fill: luma(230))[*Penyewaan (Pemilik)*],
  [GET], [/owner/rents], [Mendapatkan daftar sewa],
  [GET], [/owner/rents/:id], [Mendapatkan detail sewa],
  [POST], [/owner/rents/:id/approve], [Menyetujui permintaan sewa],
  [POST], [/owner/rents/:id/reject], [Menolak permintaan sewa],
  [POST], [/owner/rents/:id/handover], [Konfirmasi penyerahan barang],
  [POST], [/owner/rents/:id/confirm-return], [Konfirmasi barang telah kembali],
  [POST], [/owner/rents/:id/cancel], [Membatalkan sewa (sebagai pemilik)],
  table.cell(colspan: 3, fill: luma(230))[*Ulasan & Chat*],
  [POST], [/rents/:id/review], [Menambahkan review],
  [DELETE], [/reviews/:id], [Menghapus ulasan],
  [GET], [/chats], [Mendapatkan daftar percakapan],
  [GET], [/chats/:id/messages], [Mendapatkan riwayat pesan dalam percakapan],
  [POST], [/chats/:id], [Mengirim pesan baru],
  table.cell(colspan: 3, fill: luma(230))[*Nilai Tukar Mata Uang*],
  [GET], [/exchange-rates], [Mendapatkan data tukar mata urang terhadap IDR],
)


=== Login dan Register

#frame[
```go
type CreateUserInput struct {
	Email    string
	Name     string
	Password string
}

var argon2idParams = argon2id.Params{
	Memory:      64 * 1024,
	Iterations:  3,
	Parallelism: 2,
	SaltLength:  16,
	KeyLength:   32,
}

func (s *Service) CreateUserAccount(ctx context.Context, input CreateUserInput) error {
	passwordHash, err := argon2id.CreateHash(input.Password, &argon2idParams)
	if err != nil {
		return err
	}

	err = gorm.G[models.Account](s.db).Create(ctx, &models.Account{
		Email:        input.Email,
		Name:         input.Name,
		PasswordHash: passwordHash,
		Role:         string(models.AccountRoleUser),
		User:         &models.UserAccount{},
	})

	if err != nil {
		if errors.Is(err, gorm.ErrDuplicatedKey) {
			return ErrEmailDuplicated
		}
	}
	return err
}

type LoginResult struct {
	ID                    uint      `json:"id"`
	Role                  string    `json:"role"`
	RefreshToken          string    `json:"refresh_token"`
	RefreshTokenExpiresAt time.Time `json:"refresh_token_expires_at"`
	AccessToken           string    `json:"access_token"`
	AccessTokenExpiresAt  time.Time `json:"access_token_expires_at"`
}

func (s *Service) Login(ctx context.Context, email string, password string) (LoginResult, error) {
	account, err := gorm.G[models.Account](s.db).Select(
		"ID", "PasswordHash", "Email", "Role").Where(&models.Account{Email: email}).First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return LoginResult{}, ErrEmailNotFound
		}
		return LoginResult{}, err
	}

	match, err := argon2id.ComparePasswordAndHash(password, account.PasswordHash)

	if err != nil {
		return LoginResult{}, err
	}

	if !match {
		return LoginResult{}, ErrPasswordNotMatch
	}

	token, err := s.tokenHelper.GenerateToken(account.ID, models.AccountRole(account.Role))

	if err != nil {
		return LoginResult{}, err
	}

	err = gorm.G[models.RefreshToken](s.db).Create(ctx, &models.RefreshToken{
		AccountID: account.ID,
		TokenHash: token.RefreshTokenHash,
		ExpiresAt: token.RefreshTokenExpiresAt,
	})

	if err != nil {
		return LoginResult{}, err
	}

	return LoginResult{
		ID:                    account.ID,
		Role:                  account.Role,
		RefreshToken:          token.RefreshToken,
		RefreshTokenExpiresAt: token.RefreshTokenExpiresAt,
		AccessToken:           token.AccessToken,
		AccessTokenExpiresAt:  token.AccessTokenExpiresAt,
	}, nil
}
```
]

=== JWT

#include_code_file("../server/core/token.go", "go")

=== Pencarian Berdasarkan Stok, Kata Kunci dan AI Search

#frame[
```go
if len(parameters.Query) > 0 {
  if parameters.DisableAISearch {
    pattern := fmt.Sprintf("%%%s%%", parameters.Query)
    q = q.Where("products.name ILIKE ? OR products.description ILIKE ?", pattern, pattern)
  } else {
    content := fmt.Sprintf("Product search: %s", parameters.Query)
    vector, err := s.embedder.Embed(ctx, content)
    if err != nil {
      return []ResponseItemShort{}, err
    }

    q = q.Where("(products.embedding <=> ?) < 0.3", pgvector.NewVector(vector))
  }
}

if !parameters.StartDate.IsZero() && !parameters.EndDate.IsZero() {
  quntity := parameters.Quantity
  if quntity == 0 {
    quntity = 1
  }
  q = q.Joins(`
      LEFT JOIN rents ON
      rents.product_id = products.id AND
      rents.state NOT IN ? AND
      (
        (rents.start_date <= ? AND rents.end_date >= ?) OR
        (rents.end_date < CURRENT_DATE)
      )
      `,
    []models.RentState{
      models.RentStateAwaitingFinalPayment,
      models.RentStateCompleted,
      models.RentStateCancelled,
    },
    core.ConvertTimeToDate(parameters.EndDate),
    core.ConvertTimeToDate(parameters.StartDate),
  ).
    Group(`products.id, "UserAccount__Account".id,  "UserAddress".id`).
    Having("products.stock - COALESCE(SUM(rents.quantity), 0) >= ?", quntity)
}
```
]

=== Pengiriman Notifikasi Ke Perangkat Pengguna

#frame[
```go

func (s *fcmService) SendNotification(ctx context.Context, userId uint, notification Notification) error {
	list, err := gorm.G[models.FCMToken](s.db).
		Select("id", "token").
		Where("user_account_id = ?", userId).
		Find(ctx)
	if err != nil {
		return err
	}

	if len(list) == 0 {
		return nil
	}

	tokens := lo.Map(list, func(model models.FCMToken, _ int) string {
		return model.Token
	})
	br, err := s.fcmClient.SendEachForMulticast(ctx, &messaging.MulticastMessage{
		Tokens:       tokens,
		Notification: notification.Notification,
		Data:         notification.Data,
		Android:      notification.Android,
		Webpush:      notification.Webpush,
		APNS:         notification.APNS,
		FCMOptions:   notification.FCMOptions,
	})

	if br.FailureCount > 0 {
		var failedTokenIds []uint
		for idx, resp := range br.Responses {
			if !resp.Success {
				log.Printf("failed to send notification to token %s: %v", tokens[idx], resp.Error)
				failedTokenIds = append(failedTokenIds, list[idx].ID)
			}
		}
		if len(failedTokenIds) > 0 {
			_, err := gorm.G[models.FCMToken](s.db).
				Where("id IN ?", failedTokenIds).
				Delete(ctx)
			if err != nil {
				return err
			}
		}
	}
	if err != nil {
		return err
	}

	return nil
}
```
]

=== Penghitungan Skor Review Berdasarkan Kegunaan


#frame[
```go

var reviewScoreSystemPrompt = `
Anda adalah asisten ahli analisis konten untuk aplikasi persewaan (P2P Rental). Tugas Anda adalah menilai tingkat "Helpfulness" (kegunaan) sebuah ulasan dari pengguna. Berikan skor dari 0 hingga 100.

Kriteria Penilaian:
1. Spesifisitas (40%): Apakah ulasan menyebutkan kondisi barang secara detail? (Contoh: "Lensa bersih, tidak ada jamur" vs "Barangnya bagus").
2. Konteks Transaksi (30%): Apakah mengulas tentang ketepatan waktu pengiriman, keramahan pemilik, atau kemudahan proses rental?
3. Objektivitas (20%): Apakah ulasan memberikan gambaran seimbang (kelebihan dan kekurangan)?
5. Keterbacaan (10%): Penggunaan bahasa yang jelas dan mudah dipahami.

Aturan Output:
- Output harus berupa JSON valid: {"score": number"}.
- Jangan memberikan penjelasan di luar format JSON.
- Skor 0 jika teks tidak relevan (spam/hanya karakter acak).
`

type reviewScoreResult struct {
	Score uint `json:"score"`
}

func (s *Service) getReviewScore(ctx context.Context, text string) (uint, error) {
	result, err := s.generative.Generate(ctx, reviewScoreSystemPrompt, text, "application/json")
	if err != nil {
		return 0, err
	}

	var resultObject reviewScoreResult
	err = json.Unmarshal([]byte(result), &resultObject)
	if err != nil {
		return 0, err
	}

	return resultObject.Score, nil
}
```
]

=== Pengujian Stok Pada Permintaan Sewa

#frame[
```go
var reservedStock int
err = gorm.G[models.Rent](tx).
  Where("rents.product_id = ?", request.ID).
  Where(
    "rents.state NOT IN ?",
    []models.RentState{
      models.RentStateAwaitingFinalPayment,
      models.RentStateCompleted,
      models.RentStateCancelled,
    },
  ).
  Where(clause.Or(
    clause.And(
      gorm.Expr("rents.start_date <= ?", core.ConvertTimeToDate(request.EndDate)),
      gorm.Expr("rents.end_date >= ?", core.ConvertTimeToDate(request.StartDate)),
    ),
    gorm.Expr("rents.end_date < CURRENT_DATE"),
  )).
  Select("COALESCE(SUM(rents.quantity), 0)").
  Scan(ctx, &reservedStock)
if err != nil {
  return err
}

if request.Quantity+reservedStock > model.Stock {
  return ErrStockUnavailable
}
```
]

== Implementasi Frontend (Mobile)

=== Struktur Direktori Client

Aplikasi Flutter diorganisasikan dengan struktur direktori berikut yang berfokus
pada pemisahan antara data, logika bisnis, dan antarmuka pengguna:

```
client/
├── lib/
│   ├── data/         # Repositories dan model data
│   │   ├── remote/   # Komunikasi dengan API server
│   │   └── local/    # Akses penyimpanan lokal (secure storage dan Hive)
│   ├── bloc/         # Global BLoC (Business Logic Components)
│   ├── ui/           # Lapisan presentasi (UI)
│   │   ├── components/ # Widget yang dapat digunakan ulang
│   │   └── {fitur}/    # Halaman dan Cubit untuk setiap fitur
│   ├── biometrics/   # Logika terkait autentikasi biometrik
│   └── main.dart     # Entry point aplikasi
└── pubspec.yaml
```

=== JWT Interceptor

Berikut adalah kode yang memasukkan header Access Token ke request dan merefreshnya jika expired.

#include_code_file("../client/lib/data/remote/auth_interceptor.dart", "dart")

=== Autentikasi

#include_code_file("../client/lib/bloc/auth.dart", "dart")

=== Mencari Alamat Terdekat dengan Pengguuna

#frame[
```dart
final Distance distance = const Distance();

final distances = addressList
    .map(((item) => LatLng(item.lat, item.lng)))
    .map((item) => distance.as(LengthUnit.Meter, result.data, item))
    .toList();
int minIndex = 0;
for (int i = 1; i < distances.length; i++) {
  if (distances[i] < distances[minIndex]) {
    minIndex = i;
  }
}
```
]

=== Cek Stok di Tanggal atau Renttang Tanggal

Digunakan untuk feedback UI yang cepat

#frame[
```dart
int getAvailableStock(DateTime day) {
  final normalized = normalizeStartDate(state.timeZone, day);
  final stateSnapshot = state;
  if (stateSnapshot.data == null) return 0;

  int usedStock = 0;
  for (final rent in stateSnapshot.data!.availability) {
    if (rent.isOverdue ||
        (!rent.startDate.isAfter(normalized) &&
            !rent.endDate.isBefore(normalized))) {
      usedStock += rent.quantity;
    }
  }
  return stateSnapshot.data!.stock - usedStock;
}

void setSelectedRange(DateTime startDate, DateTime endDate) {
  final start = normalizeStartDate(state.timeZone, startDate);
  final end = normalizeEndDate(state.timeZone, endDate);

  final stateSnapshot = state;
  if (stateSnapshot.data == null) return;

  int used = 0;
  for (final rent in stateSnapshot.data!.availability) {
    if (rent.isOverdue ||
        (!rent.startDate.isAfter(end) && !rent.endDate.isBefore(start))) {
      used += rent.quantity;
    }
  }

  if (stateSnapshot.data!.stock - used <= 0) {
    emit(
      state.copyWith(
        error: .new(source: .dateRanges, message: "Tidak ada stok"),
      ),
    );
    return;
  }

  emit(state.copyWith(startDate: startDate, endDate: endDate));
}
```
]

=== Mini Game


#include_code_file("../client/lib/ui/game/page.dart", "dart")