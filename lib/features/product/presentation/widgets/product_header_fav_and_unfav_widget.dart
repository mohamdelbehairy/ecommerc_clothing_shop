import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/background_circle_avatar.dart';
import '../../../home/data/models/product_model.dart';
import '../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';

class ProductHeaderFavAndnoFavWidget extends StatelessWidget {
  const ProductHeaderFavAndnoFavWidget({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var wishListCubit = context.read<WishlistCubit>();
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        bool isWishlisted = wishListCubit.isWishlisted(productData.id);
        return BackgroundCircleAvatar(
            height: 22,
            onTap: () async {
              isWishlisted
                  ? await wishListCubit.removeFromWishlist(productData.id)
                  : await wishListCubit.addToWishlist(product: productData);
            },
            image: isWishlisted ? Assets.imagesFav : Assets.imagesUnfav);
      },
    );
  }
}
