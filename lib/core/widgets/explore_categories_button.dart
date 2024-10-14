import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/custom_button_model.dart';

class ExploreCategoriesButton extends StatelessWidget {
  const ExploreCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        customButtonModel: CustomButtonModel(
      height: 56,
      width: 185,
      buttonName: 'Explore Categories',
      onTap: () => GoRouter.of(context).push(AppRouter.categories),
    ));
  }
}
