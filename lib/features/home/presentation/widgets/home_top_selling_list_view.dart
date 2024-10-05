import 'package:e_clot_shop/core/models/custom_product_model.dart';
import 'package:e_clot_shop/features/home/presentation/manager/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_list_view.dart';
import '../../../../core/widgets/product_item_widget.dart';

class HomeTopSellingListView extends StatelessWidget {
  const HomeTopSellingListView({super.key});

  @override
  Widget build(BuildContext context) {
    var topSelling = context.watch<ProductCubit>();
    return CustomListView(
        itemCount: topSelling.topSelling.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ProductItemWidget(
                customProductModel: CustomProductModel(
                    width: 165,
                    productModel: topSelling.topSelling[index]),
              ));
        });

  }
}

