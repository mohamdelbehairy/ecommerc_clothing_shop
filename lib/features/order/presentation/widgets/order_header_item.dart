import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class OrderHeaderItem extends StatelessWidget {
  const OrderHeaderItem(
      {super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
          color: isActive ? AppColors.primaryColor : null,
          borderRadiusDouble: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(text,
                style: isActive
                    ? Styles.styleMedium12.copyWith(color: Colors.white)
                    : Styles.styleMedium12),
          )),
    );
  }
}
