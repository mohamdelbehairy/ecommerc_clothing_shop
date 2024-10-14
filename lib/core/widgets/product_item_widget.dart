import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import '../models/custom_product_model.dart';
import '../models/svg_model.dart';
import 'custom_svg.dart';
import 'product_item.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.customProductModel});
  final CustomProductModel customProductModel;

  @override
  Widget build(BuildContext context) {
    var wishlistCubit = context.read<WishlistCubit>();

    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        bool isWishlisted =
            wishlistCubit.isWishlisted(customProductModel.productModel.id);
        return Stack(
          children: [
            ProductItem(customProductModel: customProductModel),
            Positioned(
                right: 6,
                top: 6,
                child: CustomSvg(
                    svgModel: SvgModel(
                        onTap: () async {
                          if (isWishlisted) {
                            await wishlistCubit.removeFromWishlist(
                                customProductModel.productModel.id);
                          } else {
                            await wishlistCubit.addToWishlist(
                                product: customProductModel.productModel);
                          }
                        },
                        image: isWishlisted
                            ? Assets.imagesUnfav
                            : Assets.imagesFav,
                        height: 25,
                        width: 25)))
          ],
        );
      },
    );
  }
}
