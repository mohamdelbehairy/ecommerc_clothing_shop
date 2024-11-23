import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_clot_shop/core/utils/constants.dart';

import '../../../home/data/models/product_model.dart';

class OrderModel {
  final String? id,
      orderID,
      quantity,
      color,
      size,
      shippingAddress,
      orderType,
      shippingCost;
  final DateTime? orderTime;
  final ProductModel? productModel;

  OrderModel(
      {this.id,
      this.orderID,
      this.quantity,
      this.color,
      this.size,
      this.shippingAddress,
      this.orderType = Constants.orderProcessing,
      this.shippingCost,
      this.orderTime,
      this.productModel});

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
      'productModel': productModel!.toJson(),
    };
  }

  OrderModel copyWith({
    String? id,
    String? orderID,
    String? quantity,
    String? color,
    String? size,
    String? shippingAddress,
    String? orderType,
    String? shippingCost,
    DateTime? orderTime,
    ProductModel? productModel,
  }) {
    return OrderModel(
      id: id ?? this.id,
      orderID: orderID ?? this.orderID,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      orderType: orderType ?? this.orderType,
      shippingCost: shippingCost ?? this.shippingCost,
      orderTime: orderTime ?? this.orderTime,
      productModel: productModel ?? this.productModel,
    );
  }
}
