import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/custom_bottom_sheet.dart';
import '../manager/build_setting/build_setting_cubit.dart';
import 'setting_dark_mode_bottom_sheet.dart';
import 'setting_item.dart';
import 'setting_select_payment_bottom_sheet.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildSetting = context.read<BuildSettingCubit>();

    return BlocBuilder<BuildSettingCubit, BuildSettingState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
              buildSetting.items.length,
              (index) => GestureDetector(
                    onTap: () {
                      if (index == 2) {
                        customBottomSheet(context,
                            child: const SettingSelectPaymentBottomSheet());
                      }

                      if (index == 3) {
                        customBottomSheet(context,
                            child: const SettingDarkModeBottomSheet());
                      }
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SettingItem(
                            settingItemModel: buildSetting.items[index])),
                  )),
        );
      },
    );
  }
}
