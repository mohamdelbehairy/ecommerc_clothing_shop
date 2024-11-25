import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/data/models/product_model.dart';
import '../../../features/order/presentation/views/order_view.dart';
import '../../../features/product/data/models/product_select_details_model.dart';
import '../../../features/user_data/data/models/user_data_model.dart';
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
    _initializeAddAddressTextFields();
    _initializeUserTextFields();
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
    const OrderView(),
    const SettingView(),
  ];

  void bottomChangeIndex(int index) {
    if (bottomActiveIndex == index) return;
    bottomActiveIndex = index;
    emit(BottomNavigationBarChanged());
  }

  List<CategoryItemModel> categories = [
    CategoryItemModel(image: Assets.imagesHoodies, title: Constants.hoodies),
    CategoryItemModel(image: Assets.imagesShorts, title: Constants.shorts),
    CategoryItemModel(image: Assets.imagesShoes, title: Constants.shoes),
    CategoryItemModel(image: Assets.imagesBag, title: Constants.bags),
    CategoryItemModel(
        image: Assets.imagesAccessories, title: Constants.accessories),
  ];

  int categoryActiveIndex = -1;

  void activeIndexChange(int index) {
    if (categoryActiveIndex == index) return;
    categoryActiveIndex = index;
    emit(IndexChanged());
  }

  List selectDetailsList = [
    ProductSelectDetailsModel(title: 'Size'),
    ProductSelectDetailsModel(title: 'Color'),
    ProductSelectDetailsModel(title: 'Quantity'),
  ];

  num quantity = 1;
  num shippingCost = 1.5;

  void changeQuantity(int value) {
    if (value == -1 && quantity == 1) return;
    quantity += value;
    emit(IndexChanged());
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
    emit(IndexChanged());
  }

  void changeColorBottomSheet(int index) {
    if (colorIndex == index) return;
    colorIndex = index;
    color = colorList[index].title;
    emit(IndexChanged());
  }

  bool productButton = false;

  void productButtonChange() async {
    productButton = true;
    emit(ProductButtonTrue());
    await Future.delayed(const Duration(seconds: 1));
    productButton = false;
    emit(ProductButtonFalse());
  }

  TextEditingController productStreetAddress = TextEditingController();
  TextEditingController productCity = TextEditingController();
  TextEditingController productStateTextEditing = TextEditingController();
  TextEditingController productZipCode = TextEditingController();

  GlobalKey<FormState> productAddAddressFormKey = GlobalKey<FormState>();
  List<TextFieldModel> productAddAddressColumn = [];
  List<TextFieldModel> productAddAddressRow = [];

  TextEditingController userStreetAddress = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userStateTextEditing = TextEditingController();
  TextEditingController userZipCode = TextEditingController();

  GlobalKey<FormState> userAddAddressFormKey = GlobalKey<FormState>();
  List<TextFieldModel> userAddAddressColumn = [];
  List<TextFieldModel> userAddAddressRow = [];

  void _initializeAddAddressTextFields() {
    productAddAddressColumn = [
      TextFieldModel(
          hintText: 'Street Address',
          controller: productStreetAddress,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a street address';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'City',
          controller: productCity,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a city';
            }
            return null;
          }),
    ];

    productAddAddressRow = [
      TextFieldModel(
          hintText: 'State',
          controller: productStateTextEditing,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a state';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'Zip Code',
          controller: productZipCode,
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

  void _initializeUserTextFields() {
    userAddAddressColumn = [
      TextFieldModel(
          hintText: 'Street Address',
          controller: userStreetAddress,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a street address';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'City',
          controller: userCity,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a city';
            }
            return null;
          }),
    ];

    userAddAddressRow = [
      TextFieldModel(
          hintText: 'State',
          controller: userStateTextEditing,
          borderRadius: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a state';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'Zip Code',
          controller: userZipCode,
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

  void clearUserTextField() {
    userStreetAddress.clear();
    userCity.clear();
    userStateTextEditing.clear();
    userZipCode.clear();
    emit(ClearUserTextField());
  }

  String shippingAddress = '';

  void updateShippingAddress() {
    if (shippingAddress ==
        '${productStreetAddress.text}, ${productCity.text}, ${productStateTextEditing.text} ${productZipCode.text}') {
      return;
    }
    shippingAddress =
        '${productStreetAddress.text}, ${productCity.text}, ${productStateTextEditing.text} ${productZipCode.text}';
    emit(IndexChanged());
  }

  List<ProductSelectDetailsModel> paymentList = [
    ProductSelectDetailsModel(title: 'Pay using card'),
    ProductSelectDetailsModel(title: 'Pay using paymob'),
    ProductSelectDetailsModel(title: 'Pay using paypal'),
  ];

  int paymentIndex = -1;

  void changePaymentBottomSheet(int index) {
    if (paymentIndex == index) return;
    paymentIndex = index;
    emit(IndexChanged());
  }

  String paymentMethod = '';

  void updatePaymentMethod() {
    if (paymentMethod == paymentList[paymentIndex].title) return;
    paymentMethod = paymentList[paymentIndex].title;
    emit(IndexChanged());
  }

  String isEmptyDetails(UserDataModel userData) {
    if ((shippingAddress.isEmpty && paymentMethod.isEmpty) &&
        (userData.shippingAddress == null && userData.paymentMethod < 0)) {
      return 'Shipping and Payment Missing';
    } else if (shippingAddress.isEmpty && userData.shippingAddress == null) {
      return 'Shipping Address Missing';
    } else if (paymentMethod.isEmpty && userData.paymentMethod < 0) {
      return 'Payment Method Missing';
    }
    return '';
  }

  ProductModel? productData;
  UserDataModel? userData;

  TextEditingController couponController = TextEditingController();
  GlobalKey<FormState> couponFormKey = GlobalKey<FormState>();

  String discountNumber = "";
  int discountPercent = 0;
  bool isCouponLoading = false;
  bool isCouponApplied = false;

  void couponState() async {
    isCouponLoading = true;
    emit(CouponSussess());
    await Future.delayed(const Duration(seconds: 2));
    isCouponLoading = false;
    isCouponApplied = true;
    emit(CouponSussess());
  }

  void resetOrder() {
    quantity = 1;
    sizeIndex = 0;
    colorIndex = 0;
    productStreetAddress.clear();
    productCity.clear();
    productStateTextEditing.clear();
    productZipCode.clear();
    paymentIndex = -1;
    paymentMethod = '';
    shippingAddress = '';
    size = 'S';
    color = 'Orange';
    productData = null;
    userData = null;
    isCouponApplied = false;
    discountNumber = "";
    discountPercent = 0;
    couponController.clear();

    emit(ResetOrder());
  }

  int priceIndex = -1;
  int searchCategoryIndex = -1;
  int sortbyIndex = 0;
  int genderIndex = 0;

  List priceList = [
    'Min',
    'Max',
  ];

  List sortbyList = [
    'Recommended',
    'Newest',
    'Oldest',
  ];

  List gender = [
    'Men',
    'Women',
  ];

  void changePriceIndex(int index) {
    if (priceIndex == index) return;
    priceIndex = index;
    emit(IndexChanged());
  }

  void clearPriceBottomSheet() {
    priceIndex = -1;
    emit(ClearFilterBottomSheet());
  }

  void searchCategoryActiveIndex(int index) {
    if (searchCategoryIndex == index) return;
    searchCategoryIndex = index;
    emit(IndexChanged());
  }

  void clearCategoryBottomSheet() {
    searchCategoryIndex = -1;
    emit(ClearFilterBottomSheet());
  }

  void sortbyActiveIndex(int index) {
    if (sortbyIndex == index) return;
    sortbyIndex = index;
    emit(IndexChanged());
  }

  void clearSortbyBottomSheet() {
    sortbyIndex = 0;
    emit(ClearFilterBottomSheet());
  }

  void genderActiveIndex(int index) {
    if (genderIndex == index) return;
    genderIndex = index;
    emit(IndexChanged());
  }

  void clearGenderBottomSheet() {
    genderIndex = 0;
    emit(ClearFilterBottomSheet());
  }

  // Future<void> storeNotification(
  //     {required NotificationModel notifyModel}) async {
  //   emit(NotificationLoading());
  //   final result = await _notifiyRepo.storeNotification(notifyModel);

  //   result.fold((e) {
  //     emit(NotificationFailure(errorMessage: e.toString()));
  //     log('error from store notification: $e');
  //   }, (e) => emit(StoreNotifiySuccess()));
  // }
}
