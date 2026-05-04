// ── Halaman Pengesahan ─────────────────────────────────────

#set page(
  numbering: none,
  background: place(center, dy: 4cm)[
    #image("logo_upn_bg.jpeg", width: 14cm, fit: "contain")
  ],
)


#align(center)[
  // #v(1fr)

  #text(weight: "bold", size: 14pt)[
    HALAMAN PENGESAHAN \
    LAPORAN PROYEK AKHIR
  ]

  #v(2em)

  #text(size: 12pt)[Disusun oleh :]

  #v(0.8em)

  #grid(
    columns: (7cm, 3cm),
    row-gutter: 0.4em,
    align: (left, left),
    [#underline[Levi Rizki Saputra]], [123230127],
    [#underline[Muhammad Adel Harits Saifullah]], [123230156],
  )

  #v(2em)

  #text(size: 12pt)[
    Telah Diperiksa dan Disetujui oleh Dosen Mata Kuliah \
    Pada Tanggal : ………………………
  ]

  #v(3em)

  #text(weight: "bold", size: 12pt)[Dosen Teknologi dan Pemrograman Mobile,]

  #v(3em)

  #text(weight: "bold", size: 12pt)[
    #underline[Bagus Muhammad Akbar, S. ST., M. Kom.] \
    NIP. 198908012019031013
  ]

  #v(1fr)
]
