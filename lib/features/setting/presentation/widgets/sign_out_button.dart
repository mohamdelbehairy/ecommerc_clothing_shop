import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/function/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'logout_bottom_sheet_body.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customBottomSheet(
            context: context, child: const LogoutBottomSheetBody());
      },
      child: Text('Sign Out',
          style: Styles.styleBold16.copyWith(color: const Color(0xffFA3636))),
    );
  }
}

