import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'custom_add_or_minus_widget.dart';

class AddOrMinusSection extends StatelessWidget {
  const AddOrMinusSection({super.key});

  @override
  Widget build(BuildContext context) {
    var quantity = context.watch<BuildAppCubit>();
    return Row(
      children: [
        CustomAddOrMinusWidget(icon: Icons.add, onTap: () {
          quantity.changeQuantity(1);
        }),
        const SizedBox(width: 24),
        Text('${quantity.quantity}', style: Styles.styleMedium16(context)),
        const SizedBox(width: 24),
        CustomAddOrMinusWidget(icon: Icons.remove, onTap: () {
          quantity.changeQuantity(-1);
        }),
        const SizedBox(width: 4),
      ],
    );
  }
}
