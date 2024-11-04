import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/see_all_widget.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeCategoriesHeader extends StatelessWidget {
  const HomeCategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Categories',
              style: Styles.styleBold16.copyWith(
                  color: context.read<ChangeThemeCubit>().isDarkMode
                      ? AppColors.whiteColor
                      : null)),
          SeeAllWidget(
              onTap: () => GoRouter.of(context).push(AppRouter.categories)),
        ],
      ),
    );
  }
}
