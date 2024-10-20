import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../home/data/models/product_model.dart';
import 'cart_list_tile_subtitle.dart';
import 'cart_list_tile_title.dart';

class CartProductListTile extends StatelessWidget {
  const CartProductListTile({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomCachedNetworkImage(
          cachedImage: CachedNetworkImageModel(
              fit: BoxFit.cover, imageUrl: productData.image)),
      title: CartListTileTitle(productData: productData),
      subtitle: const CartListTileSubTitle(),
    );
  }
}

