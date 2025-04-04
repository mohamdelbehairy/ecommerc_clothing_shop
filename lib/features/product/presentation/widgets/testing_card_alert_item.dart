import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class TestingCardAlertItem extends StatelessWidget {
  const TestingCardAlertItem(
      {super.key,
      required this.buildAppCubit,
      required this.text,
      required this.index});

  final BuildAppCubit buildAppCubit;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (index == 2)
          Flexible(child: Text(text, style: Styles.style16(context)))
        else
          Text(text, style: Styles.style16(context)),
        GestureDetector(
          onTap: () {
            if (index == 0) {
              Clipboard.setData(
                  const ClipboardData(text: "4242 4242 4242 4242"));
            } else if (index == 1) {
              Clipboard.setData(
                  const ClipboardData(text: "5123 4567 8901 2346"));
            } else if (index == 2) {
              Clipboard.setData(const ClipboardData(
                  text: "sb-8jayz39744940@personal.example.com"));
            } else {
              Clipboard.setData(const ClipboardData(text: "yj*3_d9T"));
            }
            buildAppCubit.changeDialogOpen();
            GoRouter.of(context).pop();
          },
          child: Icon(Icons.copy,
              size: 18,
              color: buildAppCubit.isDarkMode
                  ? AppColors.whiteColor
                  : AppColors.blackColor),
        ),
      ],
    );
  }
}
