import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../home/data/models/product_model.dart';

class ProductViewImages extends StatelessWidget {
  const ProductViewImages({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        height: 248,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index != 0 ? 8 : 0.0),
                child: CustomBakgroundContainer(
                    backgroundModel: BackgroundModel(
                        width: 161,
                        padding: 0.0,
                        child: CustomCachedNetworkImage(
                            cachedImage: CachedNetworkImageModel(
                                fit: BoxFit.cover,
                                imageUrl: productData.image)))),
              );
            }),
      ),
    );
  }
}
