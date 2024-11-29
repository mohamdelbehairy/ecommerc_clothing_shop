import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/app/presentation/manager/build_app/build_app_cubit.dart';

class CustomBottomSheetheader extends StatelessWidget {
  const CustomBottomSheetheader(
      {super.key, required this.text, this.clear, this.onTap});
  final String text;
  final String? clear;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (clear != null)
            GestureDetector(
                onTap: onTap,
                child: Text(clear!, style: Styles.styleMedium16(context))),
          if (clear == null) const Spacer(flex: 4),
          Text(text,
              style: clear != null
                  ? Styles.styleBoldGarabito24(context)
                  : Styles.styleBoldNunito24(context)),
          if (clear == null) const Spacer(flex: 3),
          IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(Icons.close,
                  size: 28,
                  color: context.watch<BuildAppCubit>().isDarkMode
                      ? Colors.white
                      : const Color(0xff272727)))
        ],
      ),
    );
  }
}
