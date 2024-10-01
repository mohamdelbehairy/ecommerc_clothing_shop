import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutBottomSheetBody extends StatelessWidget {
  const LogoutBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Are you sure that you want to logout?',
              style: Styles.styleBold20),
          const SizedBox(height: 8),
          Text(
              'You have to login again with your username and password if you confirm to logout.',
              style: Styles.styleRegular15),
          const SizedBox(height: 16),
          CustomButton(
              customButtonModel: CustomButtonModel(
                  buttonName: 'Log out',
                  onTap: () {
                    GoRouter.of(context).pop();
                  })),
          const SizedBox(height: 4),
          CustomButton(
              customButtonModel: CustomButtonModel(
                  buttonColor: Colors.transparent,
                  buttonName: 'no',
                  onTap: () => GoRouter.of(context).pop())),
        ],
      ),
    );
  }
}
