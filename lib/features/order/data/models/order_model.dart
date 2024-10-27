import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_clot_shop/core/utils/constants.dart';

import '../../../home/data/models/product_model.dart';

class OrderModel {
  final String id,
      orderID,
      quantity,
      color,
      size,
      shippingAddress,
      orderType,
      shippingCost;
  final DateTime orderTime;
  final ProductModel productModel;

  OrderModel(
      {required this.id,
      required this.orderID,
      required this.quantity,
      required this.color,
      required this.size,
      required this.shippingAddress,
      this.orderType = Constants.orderProcessing,
      required this.shippingCost,
      required this.orderTime,
      required this.productModel});

  factory OrderModel.fromJson(json) {
    return OrderModel(
      id: json['id'],
      orderID: json['orderID'],
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
      shippingAddress: json['shippingAddress'],
      shippingCost: json['shippingCost'],
      orderType: json['orderType'],
      orderTime: (json['orderTime'] as Timestamp).toDate(),
      productModel: ProductModel.fromJson(json['productModel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderID': orderID,
      'quantity': quantity,
      'color': color,
      'size': size,
      'shippingAddress': shippingAddress,
      'shippingCost': shippingCost,
      'orderType': orderType,
      'orderTime': orderTime,
      'productModel': productModel.toJson(),
    };
  }
}
