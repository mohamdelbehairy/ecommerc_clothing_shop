import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/background_model.dart';
import '../models/cached_network_image_model.dart';
import '../models/custom_product_model.dart';
import 'custom_background_container.dart';
import 'custom_cached_network_image.dart';
import 'custom_placeholder_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.customProductModel});
  final CustomProductModel customProductModel;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
          height: 281,
          width: customProductModel.width ?? 159,
          padding: 0.0,
          color: context.read<BuildAppCubit>().isDarkMode ? AppColors.darkModeSecondryColor:null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedNetworkImage(
                  cachedImage: CachedNetworkImageModel(
                      height: 220,
                      width: double.infinity,
                      imageUrl: customProductModel.productModel.images[0],
                      placeholder: const CustomPlaceholderWidget(height: 220))),
              const SizedBox(height: 6),
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(customProductModel.productModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.styleMedium12(context))),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text('\$${customProductModel.productModel.price}',
                    style: Styles.styleBoldGarabito12(context)),
              )
            ],
          )),
    );
  }
}
