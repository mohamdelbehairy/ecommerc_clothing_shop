import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:e_clot_shop/features/update/presentation/manager/update_data/update_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';

class SettingPaymentBottomSheetListView extends StatelessWidget {
  const SettingPaymentBottomSheetListView({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
            3,
            (index) => GestureDetector(
                  onTap: () async {
                    await context
                        .read<UpdateDataCubit>()
                        .updateUserData(value: index);
                  },
                  child: BottomSheetListViewItem(
                      isActive: userData.paymentMethod == index,
                      productSelectDetails: buildApp.paymentList[index]),
                )),
      ),
    );
  }
}
