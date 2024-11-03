import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBottomSheetheader extends StatelessWidget {
  const CustomBottomSheetheader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Spacer(flex: 4),
          Text(text, style: Styles.styleBoldNunito24(context)),
          const Spacer(flex: 3),
          IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(Icons.close,
                  size: 28,
                  color: context.watch<ChangeThemeCubit>().isDarkMode
                      ? Colors.white
                      : const Color(0xff272727)))
        ],
      ),
    );
  }
}
