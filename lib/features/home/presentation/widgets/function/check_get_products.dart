import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../manager/build_home/build_home_cubit.dart';
import '../../manager/product/product_cubit.dart';

({String header, List<ProductModel> products}) getProducts(
    BuildContext context) {
  var buildHome = context.read<BuildHomeCubit>();
  var productCubit = context.read<ProductCubit>();
  List<ProductModel> products;
  String header;
  if (buildHome.activeIndex == 0) {
    products = productCubit.hoddies;
    header = Constants.hoodies;
  } else if (buildHome.activeIndex == 1) {
    products = productCubit.shorts;
    header = Constants.shorts;
  } else if (buildHome.activeIndex == 2) {
    products = productCubit.shoes;
    header = Constants.shoes;
  } else if (buildHome.activeIndex == 3) {
    products = productCubit.bags;
    header = Constants.bags;
  } else {
    products = productCubit.accessories;
    header = Constants.accessories;
  }
  return (header: header, products: products);
}
