import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../data/models/product_select_details_model.dart';
import 'add_or_minus_section.dart';
import 'size_and_color_section.dart';

class ProductSelectDetailsWidget extends StatelessWidget {
  const ProductSelectDetailsWidget(
      {super.key, required this.productSelectDetailsModel});
  final ProductSelectDetailsModel productSelectDetailsModel;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 56,
        borderRadius: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productSelectDetailsModel.title, style: Styles.styleMedium16),
            if (productSelectDetailsModel.widget != null)
              SizeAndColorSection(
                  productSelectDetailsModel: productSelectDetailsModel),
            if (productSelectDetailsModel.widget == null)
              const AddOrMinusSection()
          ],
        ),
      ),
    );
  }
}

