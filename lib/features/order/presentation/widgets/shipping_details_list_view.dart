import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class ShippingDetailsListTile extends StatelessWidget {
  const ShippingDetailsListTile(
      {super.key, required this.shippingAddress, required this.shippingCost});
  final String shippingAddress, shippingCost;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 64,
        borderRadiusDouble: 8,
        width: double.infinity,
        color: context.read<ChangeThemeCubit>().isDarkMode
            ? AppColors.darkModeSecondryColor
            : null,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(),
          Text(shippingAddress,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.styleMedium14(context)),
          const SizedBox(height: 4),
          Text('\$$shippingCost', style: Styles.styleMedium14(context)),
          const Spacer(),
        ]),
      ),
    );
  }
}
