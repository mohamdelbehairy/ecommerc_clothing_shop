import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/order/data/repos/order_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order_model.dart';

class OrderRepoImpl extends OrderRepo {
  @override
  Future<void> saveOrder(OrderModel orderModel) async {
    await FirebaseFirestore.instance
        .collection(Constants.ordersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Constants.ordersCollection)
        .doc(orderModel.id)
        .set(orderModel.toJson());
  }

  @override
  void getOrders(void Function(QuerySnapshot<Map<String, dynamic>>)? onData) {
    FirebaseFirestore.instance
        .collection(Constants.ordersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Constants.ordersCollection)
        .orderBy('orderTime', descending: true)
        .snapshots()
        .listen(onData);
  }

  @override
  Future<Either<Failure, void>> updateOrder(
      String orderID, String value) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.ordersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.ordersCollection)
          .doc(orderID)
          .update({'orderType': value});

      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
