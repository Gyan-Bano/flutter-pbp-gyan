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

## Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
    - Navigator.push() adalah metode yang digunakan untuk menambahkan route baru ke stack navigasi, tanpa menghapus route sebelumnya. Metode ini berguna untuk membuat navigasi yang dapat kembali ke halaman sebelumnya dengan menekan tombol back atau memanggil Navigator.pop(). Contoh penggunaan Navigator.push() adalah ketika kita ingin membuka halaman detail dari sebuah item di daftar, atau ketika kita ingin membuka halaman baru yang memiliki keterkaitan dengan halaman sekarang.
    - Navigator.pushReplacement() adalah metode yang digunakan untuk mengganti route yang ada di stack navigasi dengan route baru, dan menghapus route sebelumnya. Metode ini berguna untuk membuat navigasi yang tidak dapat kembali ke halaman sebelumnya, atau untuk mengakhiri suatu alur dalam aplikasi. Contoh penggunaan Navigator.pushReplacement() adalah ketika kita ingin beralih dari halaman login ke halaman utama, atau ketika kita ingin beralih dari halaman splash screen ke halaman lain.
2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
    - Center adalah widget yang menempatkan widget anaknya di tengah-tengah ruang yang tersedia. Widget ini berguna untuk membuat tampilan yang sederhana dan simetris, seperti halaman selamat datang atau halaman kosong. 
    - Column adalah widget yang menyusun widget anaknya secara vertikal, dari atas ke bawah. Widget ini berguna untuk membuat tampilan yang memiliki banyak elemen yang berurutan, seperti formulir, daftar, atau menu.
    - Row adalah widget yang menyusun widget anaknya secara horizontal, dari kiri ke kanan. Widget ini berguna untuk membuat tampilan yang memiliki banyak elemen yang sejajar, seperti ikon, tombol, atau label.
    - Stack adalah widget yang menyusun widget anaknya secara tumpang tindih, dengan widget pertama di bawah dan widget terakhir di atas. Widget ini berguna untuk membuat tampilan yang memiliki elemen yang saling menutupi, seperti gambar dengan teks, atau kartu dengan bayangan. 
    - Wrap adalah widget yang menyusun widget anaknya secara horizontal atau vertikal, dengan mengganti baris atau kolom jika tidak ada ruang yang cukup. Widget ini berguna untuk membuat tampilan yang memiliki banyak elemen yang berukuran bervariasi, seperti tag, chip, atau badge.
3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
    - TextFormField untuk Judul Buku:
      - Penggunaan: Digunakan untuk mengambil input judul buku dari pengguna.
      - Alasan: TextFormField digunakan karena menyediakan antarmuka pengguna yang baik dengan label dan hint, serta memungkinkan validasi input dengan mudah. Validasi pada elemen ini memastikan bahwa judul buku tidak boleh kosong.
    - TextFormField untuk Jumlah:
      - Penggunaan: Digunakan untuk mengambil input jumlah buku dari pengguna.
      - Alasan: TextFormField digunakan karena memungkinkan pengguna memasukkan jumlah buku dengan keyboard numerik. Validasi pada elemen ini memastikan bahwa input harus berupa angka, dan tidak boleh kosong.
    - TextFormField untuk Deskripsi:
      - Penggunaan: Digunakan untuk mengambil input deskripsi buku dari pengguna.
      - Alasan: TextFormField dipilih karena memberikan antarmuka yang baik untuk mengambil input teks panjang, seperti deskripsi. Validasi pada elemen ini memastikan bahwa deskripsi tidak boleh kosong.
4.  Bagaimana penerapan clean architecture pada aplikasi Flutter? Penerapan clean architecture pada aplikasi Flutter adalah salah satu cara untuk membuat aplikasi yang bersih, modular, dan mudah diuji. Clean architecture membagi aplikasi menjadi tiga lapisan utama, yaitu:
    - Lapisan presentasi, yang berisi komponen antarmuka pengguna, seperti widget, layar, dan tampilan. Lapisan ini bertanggung jawab untuk menangani interaksi pengguna dan menampilkan UI. Lapisan ini juga menggunakan berbagai pola manajemen state untuk mengontrol state aplikasi, seperti BLoC, Provider, atau Redux.
    - Lapisan domain, yang berisi logika bisnis inti aplikasi, seperti entitas, kasus penggunaan, dan kontrak repositori. Lapisan ini merepresentasikan aturan dan kebutuhan aplikasi, tanpa bergantung pada kerangka kerja atau sumber data tertentu. Lapisan ini juga menggunakan konsep dependency inversion untuk mengurangi ketergantungan antar modul.
    - Lapisan data, yang berisi mekanisme pengambilan dan penyimpanan data, seperti API, database, atau cache. Lapisan ini mengimplementasikan kontrak repositori yang ditentukan oleh lapisan domain, dan menyediakan data yang dibutuhkan oleh aplikasi. Lapisan ini juga menggunakan konsep dependency injection untuk menyuntikkan ketergantungan yang dibutuhkan oleh lapisan lain.

    Dengan menggunakan clean architecture, aplikasi Flutter dapat memiliki beberapa keuntungan, seperti: 
    - Memisahkan tanggung jawab antara modul, sehingga lebih mudah untuk mengembangkan, memelihara, dan mengubah kode.
    - Meningkatkan keterbacaan, keterujiian, dan keterulangan kode, sehingga lebih mudah untuk menemukan dan memperbaiki bug, serta menambah fitur baru.
    - Mengurangi ketergantungan antara modul, sehingga lebih mudah untuk mengganti atau menambah sumber data, kerangka kerja, atau teknologi tanpa mengganggu modul lain.
5.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
    - Menambahkan drawer untuk menu navigasi, pada kasus ini drawer saya tambahkan disebelah kiri aplikasi. Tujuan dari drawer ini adalah untuk mempermudah navigasi di aplikasi. Yang dilakukan adalah membuat file dart baru bernama left_drawer.dart lalu membuatnya ada 2 tombol untuk ke home page ataupun ke form page yamg mengarahkan untuk menambah buku baru. Dengan memasukkan ListView yang berisi ListTile untuk setiap opsi navigasi.
```
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Text(
                'Libralogia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "Catat seluruh stok bukumu di sini!",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),

            ],
          ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text('Tambah Buku'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
```
   - Dikarenakan pada drawer ada tombol untuk menambahkan produk dengan form, oleh karena itu langkah selanjutnya yang saya lakukan adalah membuat form tersebut. Saya membuat file shoplist_form.dart pada form ini terdapat 3 text field untuk menampung judul buku, jumlah buku, serta deskripsi dari buku. Saya juga membuat kondisi dimana misalkan tidak ada input tapi pengguna menekan tombol save maka form tidak akan tersubmit, untuk mengetahui jika form telah tersubmit adalah dengan memberikan penanda berupa pop - up yang menjadi konfirmasi bahwa form tersebut telah tersubmit. Untuk komponen form dimasukkan dengan padding.
```
Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
```

``` 
if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Judul Buku: $_name'),
                                    Text('Jumlah: $_ammount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
                      }
```
- Mengintegrasikan left drawer ke menu, selanjutnya untuk memunculkan left drawer di menu saya melakukan integrasi dengan cara menambahkan ``` drawer: const LeftDrawer(), ```
tidak hanya dimenu baris ini juga ditambahkan di form tambah produk agar user bisa balik ke menu sehabis mengisi form atau memilih tidak mengisi. 
- Mengintegrasikan form ke button tambah buku di menu, selain melakukan hal itu saya juga mengintegrasikan form ke button tambah buku yang ada di menu, dengan ini memberikan opsi kepada user untuk menambahkan produk selain lewat left drawer bisa langsung lewat menu, yang dilakukan adalah 
```
if (item.name == "Tambah Buku") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()),
            );
          }
```
- Melakukan add, commit dan push untuk memperbarui repositori GitHub.

## TUGAS 9
1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Salah satu caranya adalah dengan menggunakan metode jsonDecode yang tersedia di paket dart:convert. Metode ini akan mengubah data JSON menjadi objek Map atau List yang bisa kita akses dengan menggunakan indeks. 
Namun, ada beberapa kelemahan dari cara ini, yaitu:
   - Kita harus mengetahui struktur dan kunci dari data JSON yang kita ambil. Jika kita salah menulis kunci atau indeks, maka kita akan mendapatkan null atau error.
   - Kita harus melakukan konversi tipe data secara manual jika kita ingin menggunakan data JSON untuk operasi lain. Misalnya, jika kita ingin menambahkan umur seseorang dengan 5, kita harus mengubah data JSON yang berupa String menjadi int terlebih dahulu.
   - Kita tidak bisa menggunakan fitur autocompletion atau type checking yang disediakan oleh IDE atau editor kita. Hal ini bisa menyebabkan kesalahan penulisan atau tipe data yang sulit dideteksi.

   Oleh karena itu, cara yang lebih baik adalah dengan membuat model terlebih dahulu sebelum melakukan pengambilan data JSON. Model adalah kelas yang merepresentasikan struktur dan tipe data dari objek yang kita ambil dari JSON. Dengan menggunakan model, kita bisa mendapatkan beberapa keuntungan, yaitu:
    - Kita bisa menggunakan konstruktor, metode, atau properti yang kita definisikan di dalam model untuk memanipulasi atau mengakses data JSON dengan mudah dan cepat.
    - Kita bisa menggunakan fitur autocompletion atau type checking yang disediakan oleh IDE atau editor kita. Hal ini bisa membantu kita menghindari kesalahan penulisan atau tipe data yang tidak sesuai.
    Kita bisa menggunakan paket json_serializable yang bisa membantu kita menghasilkan kode untuk mengubah data JSON menjadi objek model dan sebaliknya secara otomatis. 
2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter. CookieRequest adalah kelas yang digunakan untuk mengirim permintaan HTTP yang mengandung cookie ke server. Cookie adalah data kecil yang disimpan di browser atau aplikasi klien yang bisa digunakan untuk mengidentifikasi pengguna, menyimpan preferensi, atau mengirim informasi tambahan ke server. CookieRequest memungkinkan kita untuk mengatur cookie yang ingin kita kirim melalui properti cookies yang berupa daftar objek Cookie. Alasan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter adalah karena cookie biasanya digunakan untuk menyimpan informasi yang bersifat global atau berlaku untuk seluruh aplikasi, seperti sesi pengguna, token autentikasi, atau preferensi bahasa. Jika kita tidak membagikan instance CookieRequest, maka kita harus membuat cookie baru setiap kali kita ingin mengirim permintaan HTTP ke server yang sama, atau kita harus menyimpan cookie di tempat lain seperti SharedPreferences atau Hive. Hal ini bisa menyebabkan kerumitan, inkonsistensi, atau ketidakamanan dalam pengelolaan cookie. Dengan membagikan instance CookieRequest, kita bisa memastikan bahwa cookie yang kita kirim ke server selalu sama dan terjaga keamanannya. Salah satu cara untuk membagikan instance CookieRequest adalah dengan menggunakan provider atau get_it yang merupakan paket Flutter untuk melakukan dependency injection atau injeksi ketergantungan. Dengan menggunakan paket ini, kita bisa membuat instance CookieRequest yang bisa diakses oleh semua komponen di aplikasi Flutter melalui context atau locator. 
3.  Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
    - Menambahkan dependensi http di file pubspec.yaml untuk melakukan permintaan HTTP.
    - Membuat kelas model yang sesuai dengan struktur data JSON, dengan properti, konstruktor, metode fromJson, dan metode toJson.
    - Melakukan permintaan HTTP GET ke URL yang mengandung data JSON, dan mendapatkan objek Response yang berisi status code, header, dan body.
    - Mengubah data JSON yang ada di body menjadi objek Map atau List dengan menggunakan paket dart:convert.
    - Mengubah objek Map atau List menjadi objek model dengan menggunakan metode fromJson yang ada di kelas model.
    - Menampilkan objek model ke dalam widget Flutter dengan menggunakan properti yang ada di objek model, dan widget yang sesuai dengan kebutuhan, seperti Text, ListTile, ListView, Card, dll.
4.  Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    - Membuat form input data akun pada Flutter, yang berisi field untuk email dan password, serta tombol untuk login atau register.
    - Membuat fungsi untuk mengirim data akun ke Django melalui permintaan HTTP POST, dengan menggunakan paket http atau dio pada Flutter.
    - Membuat API endpoint untuk menerima data akun pada Django, dengan menggunakan paket djangorestframework atau django-rest-auth pada Django.
    - Membuat fungsi untuk memvalidasi data akun yang diterima oleh Django, dengan menggunakan paket django.contrib.auth atau django-allauth pada Django.
    - Membuat fungsi untuk mengirim respons berupa status autentikasi (sukses atau gagal) dan token (jika sukses) dari Django ke Flutter, dengan menggunakan paket djangorestframework atau django-rest-auth pada Django.
    - Membuat fungsi untuk menerima respons dari Django dan menyimpan token (jika ada) pada Flutter, dengan menggunakan paket shared_preferences atau hive pada Flutter.
    - Membuat fungsi untuk menampilkan menu atau halaman lain sesuai dengan status autentikasi pada Flutter, dengan menggunakan paket get atau flutter_bloc pada Flutter.
  5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
     - MaterialApp: Widget ini digunakan sebagai root dari aplikasi Flutter yang mengikuti desain Material Design. Ini mencakup konfigurasi umum seperti judul aplikasi, tema, dan navigasi.
     - Scaffold: Widget ini menyediakan struktur dasar untuk sebuah layar yang mengikuti konsep Material Design. Ini bisa berisi app bar, body, drawer, bottom navigation, dan lainnya.
     - Container: Widget yang serbaguna untuk mengatur tata letak dan dekorasi. Ini bisa berupa wadah kosong atau berisi widget lain di dalamnya.
     - Column dan Row: Digunakan untuk mengatur tata letak vertikal (Column) dan horizontal (Row) dari widget-widget yang ditempatkan di dalamnya.
     - Text: Menampilkan teks di layar dengan gaya dan format tertentu.
     - ListView : Untuk menampilkan daftar item dalam bentuk vertikal (ListView).
     - TextField: Widget input untuk menerima input teks dari pengguna
     - FlatButton, RaisedButton, atau ElevatedButton: Tombol-tombol untuk interaksi pengguna.
     - Stack dan Positioned: Untuk mengatur tata letak dengan lapisan di atas lapisan lainnya.
  6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
     - Menginstall depedensi yang diperlukan antara lain: flutter pub add provider, flutter pub add pbp_django_auth, serta flutter pub add http.
     - Menambahkan modul autentikasi pada proyek Django sebelumnya dan mengatur views.py agar dapat menangani permintaan yang akan diterima dari aplikasi Flutter, termasuk proses login, logout, dan pendaftaran pengguna baru.
     - Membuat model yang sesuai dengan struktur data JSON, dengan menggunakan situs web Quicktype dengan langkah-langkah seperti membuka endpoint JSON yang sudah dibuat, memasukkan data JSON ke Quicktype dengan pengaturan seperti nama model "Product", tipe sumber "JSON", dan bahasa "Dart", lalu gunakan opsi "Copy Code" untuk mendapatkan kode yang dihasilkan.
     - Membuat laman login untuk memungkinkan user login.
     - Mengkonfigurasi button logout pada main.dart agar dapat membuat user logout.
     - Mengkonfigurasi views.py pada app main pada tugas django sebelumnya untuk menghandle request untuk mengambil data user.
     - Melakukan git add, commit, dan push.
