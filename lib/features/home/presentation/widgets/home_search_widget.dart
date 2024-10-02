import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
          height: 44,
          borderRadius: 100,
          padding: 20,
          child: Row(
            children: [
              CustomSvg(
                  svgModel: SvgModel(height: 18, image: Assets.imagesSearch)),
              const SizedBox(width: 12),
              Text('Search', style: Styles.styleMedium16)
            ],
          )),
    );
  }
}
