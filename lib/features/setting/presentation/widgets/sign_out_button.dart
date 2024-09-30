import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text('Sign Out',
          style: Styles.styleBold16.copyWith(color: const Color(0xffFA3636))),
    );
  }
}
