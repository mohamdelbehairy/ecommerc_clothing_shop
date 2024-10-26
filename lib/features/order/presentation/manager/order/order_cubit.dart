import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/order/data/repos/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepo) : super(OrderInitial());

  final OrderRepo _orderRepo;

  List<OrderModel> processing = [];
  List<OrderModel> shipped = [];
  List<OrderModel> delivered = [];

  Future<void> saveOrder({required OrderModel orderModel}) async {
    emit(OrderLoading());
    try {
      await _orderRepo.saveOrder(orderModel);
      emit(SaveOrderSuccess());
    } catch (e) {
      emit(OrderFailure(errorMessage: e.toString()));
      log('error from save order: $e');
    }
  }

  void getOrders() {
    try {
      _orderRepo.getOrders((snapshot) {
        processing = [];
        shipped = [];
        delivered = [];

        for (var element in snapshot.docs) {
          var order = OrderModel.fromJson(element.data());
          if (order.orderType.contains(Constants.orderProcessing)) {
            processing.add(order);
          }

          if (order.orderType.contains(Constants.orderShipped)) {
            shipped.add(order);
          }

          if (order.orderType.contains(Constants.orderDelivered)) {
            delivered.add(order);
          }
        }
        emit(GetOrderSuccess());
      });
    } catch (e) {
      log('error from get orders: $e');
      emit(OrderFailure(errorMessage: e.toString()));
    }
  }
}
