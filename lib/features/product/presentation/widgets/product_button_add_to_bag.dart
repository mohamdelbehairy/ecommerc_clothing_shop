import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../home/data/models/product_model.dart';

class ProductButtonAddToBag extends StatelessWidget {
  const ProductButtonAddToBag({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var price = num.parse(productData.price);
    var quantity = context.watch<BuildAppCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
          customButtonModel: CustomButtonModel(
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${price * quantity.quantity}',
                        style:
                            Styles.styleBold16.copyWith(color: Colors.white)),
                    Text('Add to Bag',
                        style:
                            Styles.styleMedium16.copyWith(color: Colors.white))
                  ],
                ),
              ),
              buttonName: '')),
    );
  }
}
