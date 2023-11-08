# libralogia

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## TUGAS 7
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
   - Perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter adalah sebagai berikut:
        - Stateless widget adalah widget yang tidak dapat berubah atau diperbarui setelah dibuat. Widget ini hanya memiliki konfigurasi awal yang ditentukan oleh developer dan tidak bergantung pada kondisi atau data apa pun. Stateless widget cocok digunakan untuk menampilkan konten yang sifatnya statis atau tetap, seperti teks, ikon, atau gambar.
        - Stateful widget adalah widget yang dapat berubah atau diperbarui sesuai dengan kondisi atau data yang berubah. Widget ini memiliki state atau keadaan yang menyimpan informasi tentang widget tersebut, seperti nilai variabel, warna, ukuran, atau posisi. Stateful widget cocok digunakan untuk menampilkan konten yang sifatnya dinamis atau interaktif, seperti tombol, slider, checkbox, atau form.
2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    - Dalam file menu.dart:
        - MyHomePage (StatelessWidget): Ini adalah halaman utama dari aplikasi. Ini menampilkan daftar item inventaris. "Widget" InventoryCard digunakan untuk mewakili setiap item.
        - InventoryItem (Class): Kelas ini mendefinisikan properti dari suatu item inventaris, termasuk namanya, ikonnya, dan warnanya.
        - InventoryCard (StatelessWidget): "Widget" ini mewakili setiap item inventaris sebagai kartu dengan ikon dan teks. Digunakan untuk membuat tampilan grid dari item.
        - Scaffold: Struktur utama aplikasi yang menyediakan bilah aplikasi dan "body" untuk kontennya.
        - AppBar: Bilah aplikasi di bagian atas yang menampilkan judul aplikasi.
        - SingleChildScrollView: Sebuah "widget" yang memungkinkan pengguliran jika konten melebihi layar.
        - Padding: "Widget" untuk menambahkan ruang putih di sekitar "child"-nya.
        - Column: Mengatur "child"-nya secara vertikal.
        - Text: Menampilkan pesan teks dengan gaya tertentu.
        - GridView.count: Tampilan grid dengan jumlah sel pada sumbu silang yang tetap.
        - Material: Sebuah "widget" yang memberikan kartu desain Material Design.
        - InkWell: Membuat "child"-nya menjadi interaktif dan responsif terhadap sentuhan. Ini menampilkan SnackBar ketika disentuh.
        - Container: Sebuah kotak yang berisi "widget" lainnya.
        - Icon: Menampilkan ikon dengan properti tertentu.
    - Dalam file main.dart:
        - MyApp (StatelessWidget): Ini adalah "widget" akar dari aplikasi, yang menetapkan tema dan mendefinisikan struktur aplikasi.
        - MaterialApp: Sebuah "widget" yang mengatur struktur MaterialApp untuk aplikasi, termasuk judul dan tema.
        - runApp: Menginisialisasi dan menjalankan aplikasi Flutter.
3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- Membuat project baru pada flutter dengan inventory seperti tugas sebelumnya namun di buat ke mobile dengan melakukan 
```
flutter create libralogia
cd libralogia
```
- Memisahkan main.dart dan menu.dart dengan membuat agar main.dart mereturn widget yang ada pada menu.dart. Tujuan dari ini adalah untuk pemisahan fokus.
Pada main.dart 
```
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libralogia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
- Membuat tiga tombol untuk melihat daftar item, menambah item, serta logout yang masing - masing diberikan warna yang berbeda dengan membuat class inventory item serta mengimplementsikan list tombolnya di class MyHomePage pada menu.dart dalam bentuk card 
```
class InventoryItem {
  final String name;
  final IconData icon;
  final Color color; // Tambahkan properti warna

  const InventoryItem(this.name, this.icon, this.color);
}
```
```
final List<InventoryItem> items = [
      const InventoryItem("Lihat Daftar Buku", Icons.library_books, Color(0xFF164863)), // Ganti ikon untuk "Lihat Produk"
      const InventoryItem("Tambah Buku", Icons.create, Color(0xFF427D9D)), // Ganti ikon untuk "Tambah Produk"
      const InventoryItem("Logout", Icons.logout, Color(0xFF9BBEC8)), // Ganti ikon untuk "Logout"
    ];
```
```
 GridView.count(
                        // Container pada card kita.
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((InventoryItem item) {
                        // Iterasi untuk setiap item
                        return InventoryCard(item);
                        }).toList(),
                    ),
```
- Memunculkan snackbar dengan tulisan "Kamu telah menekan tombol ${item.name}!" Hal ini dilakukan dengan menampilkan snackbar saat inventory card di klik ini terjadi pada bagian onTap. Saat InkWell yang mengelilingi InventoryCard ditekan pada potongan kode berikut
```
 ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
```
- Melakukan add-commit-push ke GitHub.

