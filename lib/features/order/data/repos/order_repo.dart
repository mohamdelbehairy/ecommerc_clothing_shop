import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/features/order/data/models/order_model.dart';

abstract class OrderRepo {
  Future<void> saveOrder(OrderModel orderModel);

  void getOrders(void Function(QuerySnapshot<Map<String, dynamic>>)? onData);

  Future<Either<Failure, void>> updateOrder(String orderID, String value);
}
