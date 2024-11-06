import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';

class SearchPriceButton extends StatelessWidget {
  const SearchPriceButton(
      {super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: CustomButton(
          customButtonModel: CustomButtonModel(
              height: 58,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text,
                        style: isActive
                            ? Styles.styleMedium16(context)
                                .copyWith(color: Colors.white)
                            : Styles.styleMediumWithOpacity16(context)),
                    Icon(Icons.done,
                        color: isActive ? Colors.white : Colors.transparent,
                        size: 24)
                  ],
                ),
              ),
              buttonColor:
                  isActive ? AppColors.primaryColor : AppColors.secondaryColor,
              buttonName: '')),
    );
  }
}
