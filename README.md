📌 UTS Mobile Programming – Cart App (Flutter + Cubit)

Repositori ini berisi proyek aplikasi Flutter sederhana untuk sistem keranjang belanja (cart system) menggunakan Cubit (Flutter Bloc).
Aplikasi dibuat untuk memenuhi tugas Ujian Tengah Semester – Universitas Teknologi Bandung, Teknik Informatika.

🧠 Bagian A – Jawaban Teori
1. Jelaskan perbedaan antara Cubit dan Bloc dalam arsitektur Flutter.
Cubit dan Bloc sama-sama bagian dari paket flutter_bloc, namun:
~ Cubit
- Lebih sederhana
- Mengelola state menggunakan fungsi langsung
- Tidak menggunakan event
- Cocok untuk state yang tidak kompleks

~ Bloc
- Menggunakan event dan state terpisah
- Lebih terstruktur dan scalable untuk aplikasi besar
- Cocok untuk logika yang lebih banyak langkah

2. Mengapa penting memisahkan UI, data model, dan business logic?
Pemisahan ini penting karena:
- Memudahkan maintenance
- Kode tidak bercampur dan lebih rapi
- Mencegah UI memproses logika berat
- Memudahkan debugging dan testing
- Mendukung scalability aplikasi

3. Sebutkan dan jelaskan tiga state yang mungkin digunakan dalam CartCubit beserta fungsinya.
1. List Produk dalam Keranjang
- Menyimpan daftar barang yang sedang ada dalam cart.
2. Quantity per Item
- Menyimpan jumlah item setiap produk untuk perhitungan total.
3. Total Harga & Total Item
- Menghasilkan nilai total belanja berdasarkan isi cart saat ini.

🛒 Bagian B – Implementasi
✔️ 1. ProductModel
Berisi:
- id (String)
- name (String)
- price (int)
- image (String path asset)
- toMap()
- fromMap()
File: models/product_model.dart

✔️ 2. CartCubit
Berisi fungsi:
- addToCart(ProductModel product)
- removeFromCart(ProductModel product)
- updateQuantity(ProductModel product, int qty)
- getTotalItems()
- getTotalPrice()
- clearCart()
File: blocs/cart_cubit.dart

✔️ 3. ProductCard Widget
Menampilkan:
- Gambar produk
- Nama produk
- Harga
- Tombol Tambah ke Keranjang
File: widgets/product_card.dart

✔️ 4. Halaman cart_summary_page.dart
Menampilkan:
- Daftar produk dalam keranjang
- Total item
- Total harga
- Tombol Checkout (mengosongkan keranjang)
File: pages/cart_summary_page.dart

⭐ Bagian C – Bonus (Opsional)
- Aplikasi ini menambahkan fitur:
- Tombol + dan – untuk menambah atau mengurangi jumlah barang
- Total harga dan total item langsung terupdate otomatis menggunakan Cubit

Struktur Folder
lib/
 ├─ blocs/
 │   └─ cart_cubit.dart
 ├─ models/
 │   └─ product_model.dart
 ├─ pages/
 │   ├─ cart_home_page.dart
 │   └─ cart_summary_page.dart
 ├─ widgets/
 │   └─ product_card.dart
 └─ main.dart

🎨 Tampilan Aplikasi

Tema aplikasi menggunakan warna pink aesthetic
Font: Cherry Bomb (custom font)
Aset gambar gitar:
assets/images/gitar_pink.png
assets/images/gitar_biru.png
assets/images/gitar_ungu.png

Hasil Output
### Screenshot
![Hasil Output](./uts_cart_app1.png)
![Detail Informasi 2](./uts_cart_app2.png)
