import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/background_list_tiled.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/back_widget.dart';
import '../../data/models/setting_item_model.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.settingItemModel});
  final SettingItemModel settingItemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: settingItemModel.onTap,
      child: BackgroundListTile(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(settingItemModel.name, style: Styles.styleMedium16(context)),
              BackWidget(backWidgetModel: BackWidgetModel())
            ],
          )),
    );
  }
}
