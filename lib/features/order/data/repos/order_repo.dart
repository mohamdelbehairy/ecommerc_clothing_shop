import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/features/order/data/models/order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure,void>> saveOrder(OrderModel orderModel);
}