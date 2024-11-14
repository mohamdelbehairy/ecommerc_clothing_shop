import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id, name, price, category, gender;
  final List<dynamic> images;
  final DateTime createdTime;
  final int? sellingCount, discountPercent;
  final String? discountNumber;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.category,
      required this.gender,
      required this.images,
      required this.createdTime,
      this.sellingCount,
      this.discountPercent,
      this.discountNumber});

  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        category: json['category'],
        gender: json['gender'],
        images: json['images'],
        createdTime: (json['createdTime'] as Timestamp).toDate(),
        sellingCount: json['sellingCount'],
        discountPercent: json['discountPercent'],
        discountNumber: json['discountNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'gender': gender,
      'images': images,
      'createdTime': createdTime,
      'sellingCount': sellingCount,
    };
  }
}
