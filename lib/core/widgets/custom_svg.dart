import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({super.key, required this.svgModel});
  final SvgModel svgModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: svgModel.onTap,
      child: SvgPicture.asset(
        svgModel.image,
        height: svgModel.height,
        width: svgModel.width,
        fit: svgModel.fit,
        colorFilter: svgModel.colorFilter,
      ),
    );
  }
}
