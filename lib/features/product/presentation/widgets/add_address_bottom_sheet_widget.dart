import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import 'add_address_button.dart';
import 'add_address_list_view.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import 'function/add_adress_button_on_tap.dart';

class AddAddressBottomSheetWidget extends StatelessWidget {
  const AddAddressBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var textFields = context.read<BuildAppCubit>();

    return Form(
      key: textFields.productAddAddressFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomBottomSheetheader(text: 'Add Address'),
          const SizedBox(height: 8),
          AddAddressListView(
              columnTextField: textFields.productAddAddressColumn,
              rowTextField: textFields.productAddAddressRow),
          const SizedBox(height: 24),
          AddAddressButton(onTap: () {
            addAddressButtonOnTap(context);
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
