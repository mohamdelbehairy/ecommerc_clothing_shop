import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordAndReset extends StatelessWidget {
  const ForgetPasswordAndReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Forgot Password ? ', style: Styles.styleMedium12),
        InkWell(
            onTap: () {},
            child: Text('Reset',
                style:
                    Styles.styleMedium12.copyWith(fontWeight: FontWeight.bold)))
      ],
    );
  }
}
