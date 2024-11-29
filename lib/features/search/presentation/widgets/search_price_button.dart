import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              buttonColor: isActive
                  ? AppColors.primaryColor
                  : context.read<BuildAppCubit>().isDarkMode
                      ? AppColors.darkModeSecondryColor
                      : AppColors.secondaryColor,
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
              buttonName: '')),
    );
  }
}
