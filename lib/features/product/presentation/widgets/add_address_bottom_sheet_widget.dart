import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'add_address_button.dart';
import 'add_address_list_view.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';

class AddAddressBottomSheetWidget extends StatelessWidget {
  const AddAddressBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<BuildAppCubit>().addAddressFormKey,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBottomSheetheader(text: 'Add Address'),
          SizedBox(height: 8),
          AddAddressListView(),
          SizedBox(height: 24),
          AddAddressButton(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
