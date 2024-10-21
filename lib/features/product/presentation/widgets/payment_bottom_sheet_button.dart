import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';

class PaymentBottomSheetButton extends StatelessWidget {
  const PaymentBottomSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildAppCubit = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
        customButtonModel: CustomButtonModel(
          buttonName: 'Save',
          onTap: () {
            if (buildAppCubit.paymentIndex > -1) {
              buildAppCubit.updatePaymentMethod();
              GoRouter.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
