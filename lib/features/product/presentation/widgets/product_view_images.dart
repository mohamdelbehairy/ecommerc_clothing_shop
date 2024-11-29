import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return SizedBox(
      height: MediaQuery.sizeOf(context).width <= 360 ? 200 : 248,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: productData.images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index != 0 ? 8 : 24),
              child: CustomBakgroundContainer(
                  backgroundModel: BackgroundModel(
                      width: 161,
                      padding: 0.0,
                      color: context.read<BuildAppCubit>().isDarkMode
                          ? AppColors.darkModeSecondryColor
                          : null,
                      child: CustomCachedNetworkImage(
                          cachedImage: CachedNetworkImageModel(
                              fit: BoxFit.cover,
                              imageUrl: productData.images[index])))),
            );
          }),
    );
  }
}
