import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/order/data/repos/order_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order_model.dart';

class OrderRepoImpl extends OrderRepo {
  @override
  Future<Either<Failure, void>> saveOrder(OrderModel orderModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.ordersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.ordersCollection)
          .doc()
          .set(orderModel.toJson());

      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  void getOrders(void Function(QuerySnapshot<Map<String, dynamic>>)? onData) {
    FirebaseFirestore.instance
        .collection(Constants.ordersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Constants.ordersCollection)
        .snapshots()
        .listen(onData);
  }
}
