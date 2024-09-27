import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccountAndCreateOne extends StatelessWidget {
  const DontHaveAccountAndCreateOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Dont have an Account ? ', style: Styles.styleMedium12),
        InkWell(
            onTap: () => GoRouter.of(context).push(AppRouter.register),
            child: Text('Create One',
                style:
                    Styles.styleMedium12.copyWith(fontWeight: FontWeight.bold)))
      ],
    );
  }
}
