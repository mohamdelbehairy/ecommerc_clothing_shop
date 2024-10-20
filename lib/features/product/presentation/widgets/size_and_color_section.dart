import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_svg.dart';
import '../../data/models/product_select_details_model.dart';

class SizeAndColorSection extends StatelessWidget {
  const SizeAndColorSection(
      {super.key,
      required this.productSelectDetailsModel,
      required this.onTap,
      required this.index});

  final ProductSelectDetailsModel productSelectDetailsModel;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Row(
      children: [
        if (index == 0)
          Text(buildApp.sizeList[buildApp.sizeIndex].title,
              style: Styles.styleBold16),
        if (index == 1)
          CircleAvatar(
              radius: 8,
              backgroundColor: buildApp.colorList[buildApp.colorIndex].color),
        const SizedBox(width: 32),
        Transform.rotate(
            angle: -90 * 3.1415927 / 180,
            child: CustomSvg(
                svgModel: SvgModel(
                    onTap: onTap, height: 18, image: Assets.imagesBack))),
        const SizedBox(width: 12),
      ],
    );
  }
}
