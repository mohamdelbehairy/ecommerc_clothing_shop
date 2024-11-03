import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';

class CheckEmailViewBody extends StatelessWidget {
  const CheckEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesCheckEmail, height: 100, width: 100),
            const SizedBox(height: 24),
            Text('We Sent you an Email to reset your password.',
                textAlign: TextAlign.center, style: Styles.styleMedium24(context)),
            const SizedBox(height: 24),
            CustomButton(
                customButtonModel: CustomButtonModel(
              width: 160,
              buttonName: 'Return to Login',
              onTap: () => GoRouter.of(context).go(AppRouter.login),
            )),
          ],
        ),
      ),
    );
  }
}
