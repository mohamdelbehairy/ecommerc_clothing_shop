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
