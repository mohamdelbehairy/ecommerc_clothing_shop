import 'package:e_clot_shop/core/models/cart_product_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/background_model.dart';
import '../custom_background_container.dart';
import 'cart_product_list_tile.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadiusDouble: 8,
        color: context.read<ChangeThemeCubit>().isDarkMode
            ? AppColors.darkModeSecondryColor
            : null,
        child: Center(child: CartProductListTile(cartProduct: cartProduct)),
      ),
    );
  }
}
