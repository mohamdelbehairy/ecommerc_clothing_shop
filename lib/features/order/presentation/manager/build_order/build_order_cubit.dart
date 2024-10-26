import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_order_state.dart';

class BuildOrderCubit extends Cubit<BuildOrderState> {
  BuildOrderCubit() : super(BuildOrderInitial());

  int orderActiveIndex = 0;
  List<String> ordersHeader = [
    'Processing',
    'Shipped',
    'Delivered',
  ];

  void orderChange(int index) {
    if (orderActiveIndex == index) return;
    orderActiveIndex = index;
    emit(OrderIndexChanged());
  }
}
