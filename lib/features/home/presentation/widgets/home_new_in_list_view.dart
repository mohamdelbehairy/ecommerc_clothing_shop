import 'package:e_clot_shop/core/models/custom_product_model.dart';
import 'package:e_clot_shop/core/widgets/custom_list_view.dart';
import 'package:e_clot_shop/core/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/product/product_cubit.dart';

class HomeNewInListView extends StatelessWidget {
  const HomeNewInListView({super.key});

  @override
  Widget build(BuildContext context) {
    var newIn = context.watch<ProductCubit>();
    return CustomListView(
        itemCount: newIn.newIn.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ProductItemWidget(
                customProductModel:
                    CustomProductModel(
                      width: 165,
                      productModel: newIn.newIn[index]),
              ));
        });
  }
}
