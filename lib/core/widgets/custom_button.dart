import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/function/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.customButtonModel});
  final CustomButtonModel customButtonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: customButtonModel.onTap,
      child: Container(
        height: customButtonModel.height ?? 55,
        width: customButtonModel.width ?? MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: customButtonModel.buttonColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: customButtonModel.widget ??
            Center(
                child: customButtonModel.isLoading
                    ? loadingAnimationWidget(color: Colors.white)
                    : Text(customButtonModel.buttonName,
                        style: customButtonModel.buttonColor != null
                            ? Styles.styleMedium16(context)
                            : Styles.styleMediumWhite16(context))),
      ),
    );
  }
}
