import 'package:flutter/material.dart';
import 'package:libralogia/widgets/shop_card.dart';
import 'package:libralogia/widgets/left_drawer.dart';



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
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
            ),
          drawer: const LeftDrawer(),
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

  


