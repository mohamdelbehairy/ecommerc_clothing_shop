import 'package:e_clot_shop/core/utils/constants.dart';

import '../../../home/data/models/product_model.dart';

class OrderModel {
  final String orderID, quantity, color, size, shippingAddress, orderType;

  final ProductModel productModel;

  OrderModel(
      {required this.orderID,
      required this.quantity,
      required this.color,
      required this.size,
      required this.shippingAddress,
      this.orderType = Constants.orderProcessing,
      required this.productModel});

  factory OrderModel.fromJson(json) {
    return OrderModel(
      orderID: json['orderID'],
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
      shippingAddress: json['shippingAddress'],
      orderType: json['orderType'],
      productModel: ProductModel.fromJson(json['productModel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'quantity': quantity,
      'color': color,
      'size': size,
      'shippingAddress': shippingAddress,
      'orderType': orderType,
      'productModel': productModel.toJson(),
    };
  }
}
