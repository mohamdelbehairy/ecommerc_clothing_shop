import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/svg_model.dart';
import '../../../../core/widgets/custom_svg.dart';
import '../../data/models/setting_item_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.settingItemModel});
  final SettingItemModel settingItemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: settingItemModel.onTap,
      child: CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            height: 56,
            borderRadiusDouble: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(settingItemModel.name, style: Styles.styleMedium16(context)),
                Transform.rotate(
                    angle: 180 * 3.1415927 / 180,
                    child: CustomSvg(
                        svgModel:
                            SvgModel(height: 18, image: Assets.imagesBack)))
              ],
            )),
      ),
    );
  }
}
