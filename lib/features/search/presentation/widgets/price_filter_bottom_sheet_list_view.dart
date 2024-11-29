import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import 'search_price_button.dart';

class PriceFilterBottomSheetListView extends StatelessWidget {
  const PriceFilterBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: List.generate(
          2,
          (index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                buildApp.changePriceIndex(index);
              },
              child: SearchPriceButton(
                isActive: buildApp.priceIndex == index,
                text: buildApp.priceList[index],
              ))),
    );
  }
}
