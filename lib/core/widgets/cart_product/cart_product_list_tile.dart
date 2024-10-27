import 'package:flutter/material.dart';

import '../../models/cached_network_image_model.dart';
import '../../models/cart_product_model.dart';
import '../custom_cached_network_image.dart';
import 'cart_list_tile_subtitle.dart';
import '../../../features/product/presentation/widgets/cart_list_tile_title.dart';

class CartProductListTile extends StatelessWidget {
  const CartProductListTile({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomCachedNetworkImage(
          cachedImage: CachedNetworkImageModel(
              fit: BoxFit.cover, imageUrl: cartProduct.productData!.image)),
      title: CartListTileTitle(cartProduct: cartProduct),
      subtitle: CartListTileSubTitle(cartProduct: cartProduct),
    );
  }
}
