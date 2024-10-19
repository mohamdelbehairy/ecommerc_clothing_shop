import 'package:flutter/material.dart';

import '../models/svg_model.dart';
import '../utils/assets.dart';
import '../utils/colors.dart';
import 'custom_svg.dart';

class BackgroundCircleAvatar extends StatelessWidget {
  const BackgroundCircleAvatar({super.key, this.image, this.height});
  final String? image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.secondaryColor,
      child: CustomSvg(
          svgModel: SvgModel(
              height: height ?? 14, image: image ?? Assets.imagesBack)),
    );
  }
}
