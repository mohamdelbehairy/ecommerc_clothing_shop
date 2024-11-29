import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/update/presentation/manager/update_data/update_data_cubit.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_bottom_sheet_header.dart';

class SettingAddAdressBottomSheetHeader extends StatelessWidget {
  const SettingAddAdressBottomSheetHeader({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomBottomSheetheader(
          clear: 'Clear',
          text: 'Add Address',
          onTap: () async {
            if (userData.shippingAddress != null) {
              await context
                  .read<UpdateDataCubit>()
                  .updateUserData(key: Constants.shippingAddress, value: null);
            }
            // ignore: use_build_context_synchronously
            context.read<BuildAppCubit>().clearUserTextField();
          }),
    );
  }
}
