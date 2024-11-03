import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordAndReset extends StatelessWidget {
  const ForgetPasswordAndReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Forgot Password ? ', style: Styles.styleMedium12(context)),
        InkWell(
            onTap: () => GoRouter.of(context).push(AppRouter.forgetPassword),
            child: Text('Reset',
                style:
                    Styles.styleMedium12(context).copyWith(fontWeight: FontWeight.bold)))
      ],
    );
  }
}
