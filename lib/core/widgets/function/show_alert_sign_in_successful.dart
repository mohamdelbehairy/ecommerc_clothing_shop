import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

Future<Object?> showAlertSignInSuccessful(BuildContext context) {
  return showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: 480,
                width: MediaQuery.sizeOf(context).width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    CustomSvg(
                        svgModel: SvgModel(image: Assets.imagesSigninSuccess)),
                    const SizedBox(height: 24),
                    Text('Sign In\n Successful',
                        textAlign: TextAlign.center,
                        style: Styles.styleBoldUrbainst24),
                    const SizedBox(height: 16),
                    Text(
                        'Please wait...\n You will be directed to the homepage soon.',
                        textAlign: TextAlign.center,
                        style: Styles.styleMediumUrbainst16),
                    const SizedBox(height: 32),
                    const SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                          backgroundColor: AppColors.secondaryColor,
                          strokeWidth: 5),
                    )
                  ],
                ),
              ),
            ),
          ));
}
