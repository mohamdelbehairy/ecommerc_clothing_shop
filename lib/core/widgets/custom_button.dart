import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.customButtonModel});
  final CustomButtonModel customButtonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: customButtonModel.onTap,
      child: Container(
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Text(customButtonModel.buttonName,
                style: Styles.styleMediumWhite16)),
      ),
    );
  }
}
