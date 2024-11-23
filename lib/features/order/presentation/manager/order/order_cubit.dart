import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/notification/data/models/notification_model.dart';
import 'package:e_clot_shop/features/order/data/repos/order_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../notification/data/repo/notification_repo.dart';
import '../../../data/models/order_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepo, this._notifyRepo) : super(OrderInitial()) {
    _changeProcessingToShippedOrder();
  }

  final OrderRepo _orderRepo;
  final NotificationRepo _notifyRepo;

  List<OrderModel> processing = [];
  List<OrderModel> shipped = [];
  List<OrderModel> delivered = [];
  List<OrderModel> notDelivered = [];
  List<OrderModel> orders = [];

  bool isLoading = false;

  Future<void> saveOrder({required OrderModel orderModel}) async {
    isLoading = true;
    emit(OrderLoading());
    try {
      await _orderRepo.saveOrder(orderModel);
      isLoading = false;
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
        notDelivered = [];
        orders = [];

        for (var element in snapshot.docs) {
          var order = OrderModel.fromJson(element.data());
          orders.add(order);

          if (order.orderType == Constants.orderProcessing) {
            processing.add(order);
          }

          if (order.orderType == Constants.orderShipped) {
            shipped.add(order);
          }

          if (order.orderType == Constants.orderDelivered) {
            delivered.add(order);
          }

          if (order.orderType == Constants.orderNotDelivered) {
            notDelivered.add(order);
          }
        }
        emit(GetOrderSuccess());
      });
    } catch (e) {
      log('error from get orders: $e');
      emit(OrderFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateOrder(
      {required String orderID, required String value}) async {
    final result = await _orderRepo.updateOrder(orderID, value);

    result.fold((failure) {
      emit(OrderFailure(errorMessage: failure.message));
      log('error from update order: ${failure.message}');
    }, (success) => emit(UpdateOrderSuccess()));
  }

  void _changeProcessingToShippedOrder() {
    _orderRepo.getOrders((snapshot) async {
      for (var element in snapshot.docs) {
        var order = OrderModel.fromJson(element.data());
        if (order.orderType == Constants.orderProcessing &&
            DateTime.now().difference(order.orderTime!).inHours > 1) {
          await updateOrder(orderID: order.id!, value: Constants.orderShipped);
          await _notifyRepo.storeNotification(NotificationModel(
              notifyID: const Uuid().v4(),
              notifyDate: order.orderTime!.add(const Duration(hours: 1)),
              userName: FirebaseAuth.instance.currentUser!.displayName != null
                  ? FirebaseAuth.instance.currentUser!.displayName!
                      .split(' ')[0]
                  : '',
              orderModel: order.copyWith(orderType: Constants.orderShipped)));
        }
      }
      emit(ChangeProccessingToShippedOrder());
    });
  }
}
