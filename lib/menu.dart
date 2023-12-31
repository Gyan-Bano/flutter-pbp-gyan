import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<InventoryItem> items = [
      const InventoryItem("Lihat Daftar Buku", Icons.library_books, Color(0xFF164863)), // Ganti ikon untuk "Lihat Produk"
      const InventoryItem("Tambah Buku", Icons.create, Color(0xFF427D9D)), // Ganti ikon untuk "Tambah Produk"
      const InventoryItem("Logout", Icons.logout, Color(0xFF9BBEC8)), // Ganti ikon untuk "Logout"
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Libralogia',
                ),
            ),
            body: SingleChildScrollView(
                // Widget wrapper yang dapat discroll
                child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                    // Widget untuk menampilkan children secara vertikal
                    children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                        child: Text(
                        'Welcome to your personal library!', // Text yang menandakan toko
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    // Grid layout
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
                    ],
                ),
                ),
            ),
            );
    }
}

  


class InventoryItem {
  final String name;
  final IconData icon;
  final Color color; // Tambahkan properti warna

  const InventoryItem(this.name, this.icon, this.color);
}

class InventoryCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {

    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}