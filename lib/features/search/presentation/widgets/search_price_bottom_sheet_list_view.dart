import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'search_price_button.dart';

class SearchPriceBottomSheetListView extends StatelessWidget {
  const SearchPriceBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: List.generate(
          2,
          (index) => GestureDetector(
              onTap: () {
                buildApp.changePriceIndex(index);
              },
              child: SearchPriceButton(
                isActive: buildApp.priceIndex == index,
                text: buildApp.priceList[index],
              ))),
    );
  }
}

