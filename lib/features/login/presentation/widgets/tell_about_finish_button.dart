import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';

class TellAboutFinshButton extends StatelessWidget {
  const TellAboutFinshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.secondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
          child: CustomButton(
              customButtonModel: CustomButtonModel(buttonName: 'Finish'))),
    );
  }
}
