import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/cart_product_model.dart';
import '../../../../core/utils/styles.dart';
import 'custom_add_or_minus_widget.dart';

class CartListTileSubTitle extends StatelessWidget {
  const CartListTileSubTitle({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Size - ',
                style: Styles.styleMedium12
                    .copyWith(color: const Color(0xff272727).withOpacity(.5))),
            Text(cartProduct.size!, style: Styles.styleBoldGarabito12),
            const SizedBox(width: 24),
            Text('Color - ',
                style: Styles.styleMedium12
                    .copyWith(color: const Color(0xff272727).withOpacity(.5))),
            Text(cartProduct.color!, style: Styles.styleBoldGarabito12),
            if (cartProduct.isOrder && !cartProduct.isProduct)
              const SizedBox(width: 24),
            if (cartProduct.isOrder && !cartProduct.isProduct)
              Text('Quantity - ',
                  style: Styles.styleMedium12.copyWith(
                      color: const Color(0xff272727).withOpacity(.5))),
            if (cartProduct.isOrder && !cartProduct.isProduct)
              Text(buildApp.quantity.toString(),
                  style: Styles.styleBoldGarabito12),
          ],
        ),
        if (!cartProduct.isOrder && !cartProduct.isProduct)
          Row(
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
          ),
      ],
    );
  }
}
