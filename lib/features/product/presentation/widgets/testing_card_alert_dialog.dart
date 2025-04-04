import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import 'testing_card_alert_item.dart';

class TestingCardAlertDialog extends StatelessWidget {
  const TestingCardAlertDialog({super.key, required this.buildApp});
  final BuildAppCubit buildApp;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor:
          buildApp.isDarkMode ? AppColors.blackColor : AppColors.whiteColor,
      title: Text("For testing only. Use the demo card info",
          style: Styles.style16(context)),
      content: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          TestingCardAlertItem(
              index: 0,
              text: "Card: 4242 4242 4242 4242",
              buildAppCubit: buildApp),
          TestingCardAlertItem(
              index: 1,
              text: "Paymob: 5123 4567 8901 2346",
              buildAppCubit: buildApp),
          TestingCardAlertItem(
              index: 2,
              text: "Paypal: sb-8jayz39744940@personal.example.com",
              buildAppCubit: buildApp),
          TestingCardAlertItem(
              index: 3,
              text: "Paypal Password: yj*3_d9T",
              buildAppCubit: buildApp),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
              buildApp.changeDialogOpen();
            },
            icon: Icon(
              Icons.close,
              size: 18,
              color: buildApp.isDarkMode
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ))
      ],
    );
  }
}
