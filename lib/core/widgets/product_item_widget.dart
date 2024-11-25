import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/product/presentation/views/product_view.dart';
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
        return GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ProductView(productData: customProductModel.productModel))),
          child: Stack(
            children: [
              ProductItem(customProductModel: customProductModel),
              Positioned(
                  right: MediaQuery.sizeOf(context).width == 480 ? 40 : 8,
                  top: 8,
                  child: CustomSvg(
                      svgModel: SvgModel(
                    onTap: () async {
                      isWishlisted
                          ? await wishlistCubit.removeFromWishlist(
                              customProductModel.productModel.id)
                          : await wishlistCubit.addToWishlist(
                              product: customProductModel.productModel);
                    },
                    image: isWishlisted ? Assets.imagesFav : Assets.imagesUnfav,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        isWishlisted  ? Colors.red:
                                context.read<BuildAppCubit>().isDarkMode
                            ? AppColors.whiteColor
                            : AppColors.blackColor.withOpacity(.8),
                        BlendMode.srcIn),
                  )))
            ],
          ),
        );
      },
    );
  }
}
