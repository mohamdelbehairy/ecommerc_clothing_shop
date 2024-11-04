import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';

Future<Object?> showAlertLogoutSuccessful(BuildContext context) {
  showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: 480,
                width: MediaQuery.sizeOf(context).width - 20,
                decoration: BoxDecoration(
                    color: context.read<ChangeThemeCubit>().isDarkMode
                        ? AppColors.darkModeSecondryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    CustomSvg(
                        svgModel: SvgModel(image: Assets.imagesSigninSuccess)),
                    const SizedBox(height: 24),
                    Text('Log Out\n Successful',
                        textAlign: TextAlign.center,
                        style: Styles.styleBoldUrbainst24),
                    const SizedBox(height: 16),
                    Text(
                        'Please wait...\n You will be directed to the loginpage soon.',
                        textAlign: TextAlign.center,
                        style: Styles.styleMediumUrbainst16.copyWith(
                            color: context.read<ChangeThemeCubit>().isDarkMode
                                ? Colors.white
                                : null)),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                          backgroundColor:
                              context.read<ChangeThemeCubit>().isDarkMode
                                  ? const Color(0xff1D182A)
                                  : AppColors.secondaryColor,
                          strokeWidth: 5),
                    )
                  ],
                ),
              ),
            ),
          ));
  Future.delayed(const Duration(seconds: 3), () {
    // ignore: use_build_context_synchronously
    GoRouter.of(context).go(AppRouter.login);
  });
  return Future.value();
}
