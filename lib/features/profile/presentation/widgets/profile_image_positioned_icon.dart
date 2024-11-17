import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileImagePositionedIcon extends StatelessWidget {
  const ProfileImagePositionedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const CircleAvatar(
        radius: 13,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            radius: 11,
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.camera_alt, size: 16, color: Colors.white)),
      ),
    );
  }
}
