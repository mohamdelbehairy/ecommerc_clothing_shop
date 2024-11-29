import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'custom_fading_widget.dart';

class CustomPlaceholderWidget extends StatelessWidget {
  const CustomPlaceholderWidget(
      {super.key,
      required this.height,
      this.width = double.infinity,
      this.borderRadius = 0});
  final double? height, width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: context.read<BuildAppCubit>().isDarkMode
              ? Colors.grey.shade800
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius)),
    ));
  }
}
