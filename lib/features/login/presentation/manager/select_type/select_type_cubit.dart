import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_type_state.dart';

class SelectTypeCubit extends Cubit<SelectTypeState> {
  SelectTypeCubit() : super(SelectTypeInitial()) {
    _initItems();
  }

  List items = [];
  int activeIndex = 0;
  String type = 'Men';
  void activeIndexChange(int index) {
    activeIndex = index;
    _initItems();
    if (activeIndex == 0) {
      type = 'Men';
    } else {
      type = 'Women';
    }
    emit(ChangeIndex());
  }

  void _initItems() {
    items = [
      CustomButtonModel(
          buttonColor: activeIndex == 0 ? null : AppColors.secondaryColor,
          width: 161,
          buttonName: 'Men'),
      CustomButtonModel(
          buttonColor: activeIndex == 1 ? null : AppColors.secondaryColor,
          width: 161,
          buttonName: 'Women')
    ];
  }
}
