// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String image;
    String author;
    int year;
    String publisher;
    String genre;
    String description;
    String rating;
    int amount;
    DateTime dateAdded;
    int user;

    Fields({
        required this.name,
        required this.image,
        required this.author,
        required this.year,
        required this.publisher,
        required this.genre,
        required this.description,
        required this.rating,
        required this.amount,
        required this.dateAdded,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        image: json["image"],
        author: json["author"],
        year: json["year"],
        publisher: json["publisher"],
        genre: json["genre"],
        description: json["description"],
        rating: json["rating"],
        amount: json["amount"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "author": author,
        "year": year,
        "publisher": publisher,
        "genre": genre,
        "description": description,
        "rating": rating,
        "amount": amount,
        "date_added": dateAdded.toIso8601String(),
        "user": user,
    };
}
