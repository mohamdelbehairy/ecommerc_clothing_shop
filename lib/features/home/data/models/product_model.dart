import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id, name, price, image, category;
  final DateTime createdTime;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.category,
      required this.createdTime});

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
      createdTime: (json['createdTime'] as Timestamp).toDate(),
    );
  }
}
