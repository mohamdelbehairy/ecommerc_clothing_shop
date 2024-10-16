import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../data/models/product_model.dart';
import '../../manager/product/product_cubit.dart';

({String header, List<ProductModel> products}) getProducts(
    BuildContext context) {
  var buildHome = context.read<BuildAppCubit>();
  var productCubit = context.read<ProductCubit>();
  List<ProductModel> products;
  String header;
  if (buildHome.categoryActiveIndex == 0) {
    products = productCubit.hoddies;
    header = Constants.hoodies;
  } else if (buildHome.categoryActiveIndex == 1) {
    products = productCubit.shorts;
    header = Constants.shorts;
  } else if (buildHome.categoryActiveIndex == 2) {
    products = productCubit.shoes;
    header = Constants.shoes;
  } else if (buildHome.categoryActiveIndex == 3) {
    products = productCubit.bags;
    header = Constants.bags;
  } else {
    products = productCubit.accessories;
    header = Constants.accessories;
  }
  return (header: header, products: products);
}
