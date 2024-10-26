import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class ShippingDetailsListTile extends StatelessWidget {
  const ShippingDetailsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 64,
        borderRadiusDouble: 8,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(),
          Text(buildApp.shippingAddress, style: Styles.styleMedium14),
          const SizedBox(height: 4),
          Text('121-224-7890', style: Styles.styleMedium14),
          const Spacer(),
        ]),
      ),
    );
  }
}
