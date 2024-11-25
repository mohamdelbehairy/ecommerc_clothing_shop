import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/update/data/repo/update_data_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../notification/data/models/notification_model.dart';
import '../../../../notification/data/repo/notification_repo.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repos/order_repo.dart';

part 'build_order_state.dart';

class BuildOrderCubit extends Cubit<BuildOrderState> {
  BuildOrderCubit(this._orderRepo, this._notifyRepo, this._updateDataRepo)
      : super(BuildOrderInitial()) {
    _getOrders();
    _changeProcessingToShippedOrder();
  }
  final OrderRepo _orderRepo;
  final NotificationRepo _notifyRepo;
  final UpdateDataRepo _updateDataRepo;

  int orderActiveIndex = 0;

  List<String> ordersHeader = [
    'Processing',
    'Shipped',
    'Delivered',
    'Not Delivered',
  ];

  void orderChange(int index) {
    if (orderActiveIndex == index) return;
    orderActiveIndex = index;
    emit(OrderIndexChanged());
  }

  List<OrderModel> processing = [];
  List<OrderModel> shipped = [];
  List<OrderModel> delivered = [];
  List<OrderModel> notDelivered = [];
  List<OrderModel> orders = [];

  void _getOrders() async {
    emit(OrderLoading());
    await Future.delayed(const Duration(seconds: 1));
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

  bool isLoading = false;

  Future<void> storeOrder({required OrderModel orderModel}) async {
    isLoading = true;
    emit(OrderLoading());
    try {
      await _orderRepo.saveOrder(orderModel);
      isLoading = false;
      emit(StoreOrderSuccess());
    } catch (e) {
      emit(OrderFailure(errorMessage: e.toString()));
      log('error from store order: $e');
    }
  }

  void _changeProcessingToShippedOrder() {
    _orderRepo.getOrders((snapshot) async {
      for (var element in snapshot.docs) {
        var order = OrderModel.fromJson(element.data());
        if (order.orderType == Constants.orderProcessing &&
            DateTime.now().difference(order.orderTime!).inHours > 1) {
          await _updateDataRepo.updateOrder(order.id!, Constants.orderShipped);
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
