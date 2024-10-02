import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCategoriesHeader extends StatelessWidget {
  const HomeCategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Categories', style: Styles.styleBold16),
        SeeAllWidget(
            onTap: () => GoRouter.of(context).push(AppRouter.categories)),
      ],
    );
  }
}
