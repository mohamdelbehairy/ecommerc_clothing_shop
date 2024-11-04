import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/product_model.dart';
import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';

class ProductNameAndPriceWidget extends StatelessWidget {
  const ProductNameAndPriceWidget({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productData.name,
              style: Styles.styleBold16.copyWith(
                  color: context.read<ChangeThemeCubit>().isDarkMode
                      ? AppColors.whiteColor
                      : null)),
          const SizedBox(height: 8),
          Text('\$${productData.price}',
              style: Styles.styleBold16.copyWith(color: AppColors.primaryColor))
        ],
      ),
    );
  }
}
