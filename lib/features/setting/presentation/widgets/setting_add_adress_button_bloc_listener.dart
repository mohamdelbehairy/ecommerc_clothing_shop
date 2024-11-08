import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../product/presentation/widgets/add_address_button.dart';
import '../../../update/presentation/manager/update_data/update_data_cubit.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'function/setting_add_adress_button_on_tap.dart';

class SettingAddAddressButtonBlocListener extends StatelessWidget {
  const SettingAddAddressButtonBlocListener(
      {super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateDataCubit, UpdateDataState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          GoRouter.of(context).pop();
        }
      },
      child: AddAddressButton(onTap: () {
        settingAddAddressButtonOnTap(context, userData);
      }),
    );
  }
}