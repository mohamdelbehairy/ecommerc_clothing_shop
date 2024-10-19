import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'background_circle_avatar.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).pop(),
      child: const BackgroundCircleAvatar(),
    );
  }
}


