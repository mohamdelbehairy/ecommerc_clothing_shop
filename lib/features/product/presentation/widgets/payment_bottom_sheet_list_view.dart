import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'product_bottom_sheet_list_view_item.dart';

class PaymentBottomSheetListView extends StatelessWidget {
  const PaymentBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
            buildApp.paymentList.length,
            (index) => GestureDetector(
                  onTap: () {
                    buildApp.changePaymentBottomSheet(index);
                  },
                  child: ProductBottomSheetListViewItem(
                      isActive: buildApp.paymentIndex == index,
                      productSelectDetails: buildApp.paymentList[index]),
                )),
      ),
    );
  }
}