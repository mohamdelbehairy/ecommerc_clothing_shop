import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildAppCubit = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
        customButtonModel: CustomButtonModel(
          buttonName: 'Save',
          onTap: () {
            if (buildAppCubit.addAddressFormKey.currentState!.validate()) {
              buildAppCubit.addAddressFormKey.currentState!.save();
            }
          },
        ),
      ),
    );
  }
}
