import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
        customButtonModel: CustomButtonModel(
          buttonName: 'Save',
          onTap: onTap,
        ),
      ),
    );
  }
}
