import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/product/data/models/product_select_details_model.dart';
import '../../models/category_item_model.dart';
import '../../models/text_field_model.dart';
import '../../utils/assets.dart';
import '../../../features/bottom_navigation_bar/data/models/bottom_navigation_bar_model.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../features/notification/presentation/views/notification_view.dart';
import '../../../features/setting/presentation/views/setting_view.dart';

part 'build_app_state.dart';

class BuildAppCubit extends Cubit<BuildAppState> {
  BuildAppCubit() : super(BuildAppInitial()) {
    _initializeItems();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKeyOne = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyTwo = GlobalKey<FormState>();

  List<TextFieldModel> textFields = [];

  String userName = '';

  void _initializeItems() {
    textFields = [
      TextFieldModel(
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          controller: email,
          validator: (value) {
            if (value!.isNotEmpty && !EmailValidator.validate(value)) {
              return 'please enter a valid email';
            }
            if (value.isEmpty) {
              return 'please enter email';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'Password',
          obscureText: true,
          controller: password,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter password';
            }
            return null;
          }),
    ];
  }

  List bottomItems = [
    BottomNavigationBarModel(icon: Assets.imagesHome2),
    BottomNavigationBarModel(icon: Assets.imagesNotificationbing),
    BottomNavigationBarModel(icon: Assets.imagesOrders),
    BottomNavigationBarModel(icon: Assets.imagesProfile),
  ];

  int bottomActiveIndex = 0;

  List views = [
    const HomeView(),
    const NotificationView(),
    const Scaffold(),
    const SettingView(),
  ];

  void bottomChangeIndex(int index) {
    if (bottomActiveIndex == index) return;
    bottomActiveIndex = index;
    emit(BottomNavigationBarChanged());
  }

  List categories = [
    CategoryItemModel(image: Assets.imagesHoodies, title: 'Hoodies'),
    CategoryItemModel(image: Assets.imagesShorts, title: 'Shorts'),
    CategoryItemModel(image: Assets.imagesShoes, title: 'Shoes'),
    CategoryItemModel(image: Assets.imagesBag, title: 'Bags'),
    CategoryItemModel(image: Assets.imagesAccessories, title: 'Accessories'),
  ];

  int categoryActiveIndex = -1;

  void activeIndexChange(int index) {
    if (categoryActiveIndex == index) return;
    categoryActiveIndex = index;
    emit(CategoryChanged());
  }

  List selectDetailsList = [
    ProductSelectDetailsModel(
        title: 'Size', widget: Text('S', style: Styles.styleBold16)),
    ProductSelectDetailsModel(
        title: 'Color',
        widget:
            const CircleAvatar(radius: 8, backgroundColor: Color(0xffB3B68B))),
    ProductSelectDetailsModel(title: 'Quantity'),
  ];

  num quantity = 1;

  void changeQuantity(int value) {
    if (value == -1 && quantity == 1) return;
    quantity += value;
    emit(QuantityChanged());
  }
}
