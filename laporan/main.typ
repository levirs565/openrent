// ============================================================
// LAPORAN TEKNOLOGI DAN PEMROGRAMAN MOBILE - APLIKASI OPENRENT
// ============================================================

#set document(
  title: "Laporan Teknologi dan Pemrograman Mobile - Aplikasi OpenRent",
  author: ("Levi Rizki Saputra", "Muhammad Adel Harits Saifullah"),
)

#set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 3cm, left: 4cm, right: 3cm),
)

#set text(
  font: "Times New Roman",
  size: 12pt,
  lang: "id",
)

#set par(
  justify: true,
  leading: 1em,
)

// ── Halaman Cover ──────────────────────────────────────────
#include "cover.typ"
#pagebreak()

// ── Halaman Pengesahan ─────────────────────────────────────
#include "pengesahan.typ"
#pagebreak()

// ── Daftar Isi ─────────────────────────────────────────────
#set page(numbering: "i")
#counter(page).update(1)

#align(center)[
  #text(weight: "bold", size: 14pt)[DAFTAR ISI]
]
#v(1em)

#outline(
  title: none,
  indent: auto,
  depth: 2,
)
#pagebreak()

// ── Isi Laporan ────────────────────────────────────────────
#set page(numbering: "1")
#counter(page).update(1)

#set heading(numbering: "1.1")

#include "bab1_pendahuluan.typ"
#pagebreak()

#include "bab2_analisis_perancangan.typ"
#pagebreak()

#include "bab3_implementasi.typ"
#pagebreak()

#include "bab4_pengujian.typ"
#pagebreak()

#include "bab5_penutup.typ"
