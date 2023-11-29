import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:libralogia/models/product.dart';
import 'package:libralogia/util/user_utility.dart';
import 'package:libralogia/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!

    try {
      var url = Uri.parse('http://localhost:8000/json-modif/');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({'user_id': UserUtility.user_id}),
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    List<Product> list_product = [];
    for (var productData in data['products']) {
      Product product = Product.fromJson(productData);
      list_product.add(product);
    }
    return list_product;
    } catch (err) {
      print(err);
      return [];
    }
    // melakukan konversi data json menjadi object Product
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Amount: ${snapshot.data![index].fields.amount}"),
                          const SizedBox(height: 10),
                          Text("Description: ${snapshot.data![index].fields.description}"),
                          const SizedBox(height: 10),
                          Text("Author: ${snapshot.data![index].fields.author}"),
                          const SizedBox(height: 10),
                          Text("Year: ${snapshot.data![index].fields.year}"),
                          const SizedBox(height: 10),
                          Text("Publisher: ${snapshot.data![index].fields.publisher}"),
                          const SizedBox(height: 10),
                          Text("Genre: ${snapshot.data![index].fields.genre}"),
                          const SizedBox(height: 10),
                          Text("Rating: ${snapshot.data![index].fields.rating}"),
                          // Tambahkan widget lainnya sesuai kebutuhan
                        ],
                      ),
                    ),
                  );

                }
              }
            }));
  }
}
