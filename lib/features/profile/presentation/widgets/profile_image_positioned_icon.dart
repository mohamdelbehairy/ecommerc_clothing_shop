import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../image/presentation/manager/image_cubit/image_cubit.dart';

class ProfileImagePositionedIcon extends StatelessWidget {
  const ProfileImagePositionedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<ImageCubit>().pickImage();
      },
      child: CircleAvatar(
        radius: 13,
        backgroundColor: context.read<BuildAppCubit>().isDarkMode
            ? AppColors.blackColor
            : AppColors.whiteColor,
        child: const CircleAvatar(
            radius: 11,
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.camera_alt, size: 16, color: Colors.white)),
      ),
    );
  }
}
