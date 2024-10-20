import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class CustomAddOrMinusWidget extends StatelessWidget {
  const CustomAddOrMinusWidget(
      {super.key, required this.onTap, required this.icon, this.size = 40});
  final Function() onTap;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
