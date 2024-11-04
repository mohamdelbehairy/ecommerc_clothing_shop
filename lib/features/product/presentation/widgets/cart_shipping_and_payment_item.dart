import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/back_widget.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../data/models/shipping_and_payment_model.dart';

class CartShippingAndPaymentItem extends StatelessWidget {
  const CartShippingAndPaymentItem(
      {super.key, required this.shippingAndPaymentModel});
  final ShippingAndPaymentModel shippingAndPaymentModel;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadiusDouble: 8,
        color: context.read<ChangeThemeCubit>().isDarkMode
            ? AppColors.darkModeSecondryColor
            : null,
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(shippingAndPaymentModel.title,
                    style: Styles.styleMediumWithOpacity12(context))),
            subtitle: Text(shippingAndPaymentModel.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.styleMedium16(context)),
            trailing: BackWidget(
                backWidgetModel:
                    BackWidgetModel(onTap: shippingAndPaymentModel.onTap)),
          ),
        ),
      ),
    );
  }
}
