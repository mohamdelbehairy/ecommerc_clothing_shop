import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:e_clot_shop/features/update/presentation/manager/update_data/update_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';

class SettingPaymentBottomSheetListView extends StatelessWidget {
  const SettingPaymentBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: List.generate(
                  3,
                  (index) => GestureDetector(
                        onTap: () async {
                          buildApp.changeSettingPaymentBottomSheet(index);
                          await context
                              .read<UpdateDataCubit>()
                              .updateUserData(value: index);
                        },
                        child: BottomSheetListViewItem(
                            isActive: buildApp.settingPaymentIndex != -1
                                ? buildApp.settingPaymentIndex == index
                                : state.user.paymentMethod == index,
                            productSelectDetails: buildApp.paymentList[index]),
                      )),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
