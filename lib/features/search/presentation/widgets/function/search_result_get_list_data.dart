import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../manager/build_search/build_search_cubit.dart';

void searchResultGetListData(BuildContext context) {
  var search = context.read<BuildSearchCubit>();
  var buildApp = context.watch<BuildAppCubit>();

  if (buildApp.priceIndex == 0 &&
      buildApp.sortbyIndex == 1 &&
      buildApp.genderIndex == 0) {
    search.list = search.minNewestMen;
  } else if ((buildApp.priceIndex == 0 &&
      buildApp.sortbyIndex == 2 &&
      buildApp.genderIndex == 0)) {
    search.list = search.minOldestMen;
  } else if (buildApp.priceIndex == 1 &&
      buildApp.sortbyIndex == 1 &&
      buildApp.genderIndex == 0) {
    search.list = search.maxNewestMen;
  } else if (buildApp.priceIndex == 1 &&
      buildApp.sortbyIndex == 2 &&
      buildApp.genderIndex == 0) {
    search.list = search.maxOldestMen;
  } else if (buildApp.priceIndex == 0 &&
      buildApp.sortbyIndex == 1 &&
      buildApp.genderIndex == 1) {
    search.list = search.minNewestWomen;
  } else if ((buildApp.priceIndex == 0 &&
      buildApp.sortbyIndex == 2 &&
      buildApp.genderIndex == 1)) {
    search.list = search.minOldestWomen;
  } else if (buildApp.priceIndex == 1 &&
      buildApp.sortbyIndex == 1 &&
      buildApp.genderIndex == 1) {
    search.list = search.maxNewestWomen;
  } else if (buildApp.priceIndex == 1 &&
      buildApp.sortbyIndex == 2 &&
      buildApp.genderIndex == 1) {
    search.list = search.maxOldestWomen;
  } else if (buildApp.priceIndex == 0 && buildApp.genderIndex == 0) {
    search.list = search.minPriceMen;
  } else if (buildApp.priceIndex == 1 && buildApp.genderIndex == 0) {
    search.list = search.maxPriceMen;
  } else if (buildApp.priceIndex == 0 && buildApp.genderIndex == 1) {
    search.list = search.minPriceWomen;
  } else if (buildApp.priceIndex == 1 && buildApp.genderIndex == 1) {
    search.list = search.maxPriceWomen;
  } else if (buildApp.sortbyIndex == 1 && buildApp.genderIndex == 0) {
    search.list = search.newestMen;
  } else if (buildApp.sortbyIndex == 2 && buildApp.genderIndex == 0) {
    search.list = search.oldestMen;
  } else if (buildApp.sortbyIndex == 1 && buildApp.genderIndex == 1) {
    search.list = search.newestWomen;
  } else if (buildApp.sortbyIndex == 2 && buildApp.genderIndex == 1) {
    search.list = search.oldestWomen;
  } else if (buildApp.genderIndex == 0) {
    search.list = search.men;
  } else if (buildApp.genderIndex == 1) {
    search.list = search.women;
  } else {
    search.list = search.allProducts;
  }
}
