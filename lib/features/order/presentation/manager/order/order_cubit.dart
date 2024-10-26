import 'dart:developer';

import 'package:e_clot_shop/features/order/data/repos/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepo) : super(OrderInitial());

  final OrderRepo _orderRepo;

  Future<void> saveOrder({required OrderModel orderModel}) async {
    emit(OrderLoading());

    final result = await _orderRepo.saveOrder(orderModel);

    result.fold((e) {
      emit(OrderFailure(errorMessage: e.message));
      log('error from save order: ${e.message}');
    }, (e) => emit(SaveOrderSuccess()));
  }
}
