import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import '../../../update/presentation/manager/update_data/update_data_cubit.dart';
import '../../../user_data/data/models/user_data_model.dart';

class SettingSelectPaymentSheetHeader extends StatelessWidget {
  const SettingSelectPaymentSheetHeader({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomBottomSheetheader(
          text: 'Payment Method',
          clear: 'Clear',
          onTap: () async {
            if (userData.paymentMethod >= 0) {
              await context
                  .read<UpdateDataCubit>()
                  .updateUserData(key: Constants.paymentMethod, value: -1);
            }
          }),
    );
  }
}
