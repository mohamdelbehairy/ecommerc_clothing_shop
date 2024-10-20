import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_back_widget.dart';
import 'product_header_fav_and_unfav_widget.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackWidget(onTap: () {
            GoRouter.of(context).pop();
            buildApp.quantity = 1;
            buildApp.sizeIndex = 0;
            buildApp.colorIndex = 0;
          }),
          ProductHeaderFavAndnoFavWidget(productData: productData)
        ],
      ),
    );
  }
}

