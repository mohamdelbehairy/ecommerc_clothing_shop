import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_view_body_details.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 63),
        Center(
            child: Text('Orders',
                style: Styles.styleBold16.copyWith(
                    color: context.read<ChangeThemeCubit>().isDarkMode
                        ? Colors.white
                        : null))),
        const SizedBox(height: 24),
        const OrderViewBodyDetails()
      ],
    );
  }
}
