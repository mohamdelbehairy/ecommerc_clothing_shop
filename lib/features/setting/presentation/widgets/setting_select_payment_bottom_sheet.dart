import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'setting_payment_bottom_sheet_list_view.dart';
import 'setting_select_payment_sheet_header.dart';

class SettingSelectPaymentBottomSheet extends StatelessWidget {
  const SettingSelectPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingSelectPaymentSheetHeader(userData: state.user),
              const SizedBox(height: 8),
              SettingPaymentBottomSheetListView(userData: state.user),
              const SizedBox(height: 32),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}


