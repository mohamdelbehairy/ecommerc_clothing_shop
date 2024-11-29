import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/product/presentation/widgets/custom_add_or_minus_widget.dart';
import '../../../features/app/presentation/manager/build_app/build_app_cubit.dart';

class SubTitleAddOrRemoveQuantity extends StatelessWidget {
  const SubTitleAddOrRemoveQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return Row(
      children: [
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.add,
            onTap: () {
              buildApp.changeQuantity(1);
            }),
        const SizedBox(width: 12),
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.remove,
            onTap: () {
              buildApp.changeQuantity(-1);
            }),
      ],
    );
  }
}
