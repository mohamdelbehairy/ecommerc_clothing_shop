import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import '../../../product/presentation/widgets/add_address_button.dart';
import '../../../product/presentation/widgets/add_address_list_view.dart';
import 'function/setting_add_adress_button_on_tap.dart';

class SettingAddressBottomSheet extends StatelessWidget {
  const SettingAddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var textFields = context.read<BuildAppCubit>();

    return Form(
      key: textFields.userAddAddressFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomBottomSheetheader(text: 'Add Address'),
          const SizedBox(height: 8),
          AddAddressListView(
              columnTextField: textFields.userAddAddressColumn,
              rowTextField: textFields.userAddAddressRow),
          const SizedBox(height: 24),
          AddAddressButton(onTap: () {
            settingAddAddressButtonOnTap(context);
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
