import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../data/models/product_select_details_model.dart';
import 'add_or_minus_section.dart';
import 'size_and_color_section.dart';

class ProductSelectDetailsWidget extends StatelessWidget {
  const ProductSelectDetailsWidget(
      {super.key,
      required this.productSelectDetails,
      required this.onTap,
      required this.index});
  final ProductSelectDetailsModel productSelectDetails;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 56,
        borderRadiusDouble: 100,
        color: context.read<BuildAppCubit>().isDarkMode
            ? AppColors.darkModeSecondryColor
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productSelectDetails.title,
                style: Styles.styleMedium16(context)),
            if (index != 2)
              SizeAndColorSection(
                  index: index,
                  onTap: onTap,
                  productSelectDetailsModel: productSelectDetails),
            if (index == 2) const AddOrMinusSection()
          ],
        ),
      ),
    );
  }
}
