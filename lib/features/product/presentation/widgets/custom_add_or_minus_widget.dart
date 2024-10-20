import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class CustomAddOrMinusWidget extends StatelessWidget {
  const CustomAddOrMinusWidget(
      {super.key, required this.onTap, required this.icon});
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
