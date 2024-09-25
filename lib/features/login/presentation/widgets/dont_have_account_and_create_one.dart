import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccountAndCreateOne extends StatelessWidget {
  const DontHaveAccountAndCreateOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Dont have an Account ? ', style: Styles.styleMedium12),
        InkWell(
            onTap: () {},
            child: Text('Create One',
                style:
                    Styles.styleMedium12.copyWith(fontWeight: FontWeight.bold)))
      ],
    );
  }
}
