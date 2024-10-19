import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'product_button_add_to_bag.dart';
import 'product_name_and_price_widget.dart';
import 'product_select_details_list_view.dart';
import 'product_view_header.dart';
import 'product_view_images.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 63),
        const ProductViewHeader(),
        const SizedBox(height: 20),
        ProductViewImages(productData: productData),
        const SizedBox(height: 20),
        ProductNameAndPriceWidget(productData: productData),
        const SizedBox(height: 28),
        const ProductSelectDetailsListView(),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
              'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
              style: Styles.styleMedium12
                  .copyWith(color: const Color(0xff272727).withOpacity(.5))),
        ),
        const Spacer(),
        ProductButtonAddToBag(productData: productData),
        const SizedBox(height: 32)
      ],
    );
  }
}


