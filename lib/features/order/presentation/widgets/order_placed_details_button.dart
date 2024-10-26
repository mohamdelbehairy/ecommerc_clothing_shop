import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_button.dart';

class OrderPlacedDetailsButton extends StatelessWidget {
  const OrderPlacedDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        customButtonModel: CustomButtonModel(
            onTap: () {
              GoRouter.of(context).go(AppRouter.bottomNavigationBar);
              context.read<BuildAppCubit>().resetOrder();
            },
            buttonName: 'Go to Home'));
  }
}
