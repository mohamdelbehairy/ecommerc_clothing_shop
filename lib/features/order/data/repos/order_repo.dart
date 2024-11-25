import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_clot_shop/features/order/data/models/order_model.dart';

abstract class OrderRepo {
  Future<void> storeOrder(OrderModel orderModel);

  void getOrders(void Function(QuerySnapshot<Map<String, dynamic>>)? onData);
}
