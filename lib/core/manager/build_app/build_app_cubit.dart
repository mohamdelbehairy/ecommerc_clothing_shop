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
    _initializeLogin();
    _initializeAddAddress();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKeyOne = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyTwo = GlobalKey<FormState>();

  List<TextFieldModel> loginTextFields = [];

  String userName = '';

  void _initializeLogin() {
    loginTextFields = [
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
    ProductSelectDetailsModel(title: 'Size'),
    ProductSelectDetailsModel(title: 'Color'),
    ProductSelectDetailsModel(title: 'Quantity'),
  ];

  num quantity = 1;
  num shippingCost = 8.0;

  void changeQuantity(int value) {
    if (value == -1 && quantity == 1) return;
    quantity += value;
    emit(QuantityChanged());
  }

  int sizeIndex = 0;
  int colorIndex = 0;
  String size = 'S';
  String color = 'Orange';

  List<ProductSelectDetailsModel> sizeList = [
    ProductSelectDetailsModel(title: 'S'),
    ProductSelectDetailsModel(title: 'M'),
    ProductSelectDetailsModel(title: 'L'),
    ProductSelectDetailsModel(title: 'XL'),
    ProductSelectDetailsModel(title: '2XL'),
  ];

  List<ProductSelectDetailsModel> colorList = [
    ProductSelectDetailsModel(title: 'Orange', color: Colors.orange),
    ProductSelectDetailsModel(title: 'Black', color: Colors.black),
    ProductSelectDetailsModel(title: 'Red', color: Colors.red),
    ProductSelectDetailsModel(title: 'Yellow', color: Colors.yellow),
    ProductSelectDetailsModel(title: 'Blue', color: Colors.blue),
  ];

  void changeSizeBottomSheet(int index) {
    if (sizeIndex == index) return;
    sizeIndex = index;
    size = sizeList[index].title;
    emit(BottomSheetChanged());
  }

  void changeColorBottomSheet(int index) {
    if (colorIndex == index) return;
    colorIndex = index;
    color = colorList[index].title;
    emit(BottomSheetChanged());
  }

  bool productButton = false;

  void productButtonChange() async {
    productButton = true;
    emit(ProductButtonTrue());
    await Future.delayed(const Duration(seconds: 1));
    productButton = false;
    emit(ProductButtonFalse());
  }

  TextEditingController streetAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController stateTextEditing = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();

  List<TextFieldModel> addAddressColumn = [];
  List<TextFieldModel> addAddressRow = [];

  void _initializeAddAddress() {
    addAddressColumn = [
      TextFieldModel(
          hintText: 'Street Address',
          controller: streetAddress,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a street address';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'City',
          controller: city,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a city';
            }
            return null;
          }),
    ];

    addAddressRow = [
      TextFieldModel(
          hintText: 'State',
          controller: stateTextEditing,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a state';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'Zip Code',
          controller: zipCode,
          keyboardType: TextInputType.number,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a zip code';
            }
            if (RegExp(r'^[0-9]+$').hasMatch(value) == false) {
              return 'numbers only';
            }
            return null;
          }),
    ];
  }
}
