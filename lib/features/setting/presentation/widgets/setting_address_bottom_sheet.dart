import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../product/presentation/widgets/add_address_list_view.dart';
import 'function/init_add_address_text_field.dart';
import 'setting_add_address_bottom_sheet_header.dart';
import 'setting_add_adress_button_bloc_listener.dart';

class SettingAddressBottomSheet extends StatelessWidget {
  const SettingAddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var textFields = context.read<BuildAppCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          initUserAddAdressTextField(context, state.user.shippingAddress);

          return Form(
            key: textFields.userAddAddressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingAddAdressBottomSheetHeader(userData: state.user),
                const SizedBox(height: 8),
                AddAddressListView(
                    columnTextField: textFields.userAddAddressColumn,
                    rowTextField: textFields.userAddAddressRow),
                const SizedBox(height: 24),
                SettingAddAddressButtonBlocListener(userData: state.user),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
