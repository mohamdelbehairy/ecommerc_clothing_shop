import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/custom_button_model.dart';
import 'custom_button.dart';
import '../../features/product/data/models/product_select_details_model.dart';

class BottomSheetListViewItem extends StatelessWidget {
  const BottomSheetListViewItem(
      {super.key, required this.productSelectDetails, required this.isActive});
  final ProductSelectDetailsModel productSelectDetails;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomButton(
          customButtonModel: CustomButtonModel(
              height: 58,
              buttonColor: isActive
                  ? AppColors.primaryColor
                  : isDarkMode
                      ? AppColors.darkModeBackground
                      : AppColors.secondaryColor,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(productSelectDetails.title,
                        style: isActive
                            ? Styles.styleMedium16(context).copyWith(
                                color: isDarkMode
                                    ? const Color(0xff272727)
                                    : Colors.white)
                            : Styles.styleMedium16(context)),
                    Row(
                      children: [
                        if (productSelectDetails.color != null)
                          CircleAvatar(
                              radius: 11,
                              backgroundColor:
                                  isActive ? Colors.white : Colors.transparent,
                              child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: productSelectDetails.color)),
                        const SizedBox(width: 20),
                        Icon(Icons.done,
                            color: isActive
                                ? isDarkMode
                                    ? const Color(0xff272727)
                                    : Colors.white
                                : Colors.transparent,
                            size: 24)
                      ],
                    )
                  ],
                ),
              ),
              buttonName: '')),
    );
  }
}
