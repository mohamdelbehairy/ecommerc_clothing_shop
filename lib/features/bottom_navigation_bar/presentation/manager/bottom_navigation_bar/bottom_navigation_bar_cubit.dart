import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/bottom_navigation_bar_model.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  List items = [
    BottomNavigationBarModel(icon: Assets.imagesHome2),
    BottomNavigationBarModel(icon: Assets.imagesNotificationbing),
    BottomNavigationBarModel(icon: Assets.imagesOrders),
    BottomNavigationBarModel(icon: Assets.imagesProfile),
  ];

  int activeIndex = 0;

  void changeIndex(int index) {
    activeIndex = index;
    emit(BottomNavigationBarChanged());
  }
}
