import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/styles.dart';

class HomeNewInHeader extends StatelessWidget {
  const HomeNewInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('New In',
            style: Styles.styleBold16.copyWith(color: AppColors.primaryColor)),
        SeeAllWidget(onTap: () =>GoRouter.of(context).push(AppRouter.newIn)),
      ],
    );
  }
}
