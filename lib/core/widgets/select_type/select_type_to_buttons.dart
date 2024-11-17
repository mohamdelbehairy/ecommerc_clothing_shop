import 'package:e_clot_shop/core/models/select_type_model.dart';
import 'package:flutter/material.dart';

import 'select_type_list_view.dart';

class SelectTypeToShopButtons extends StatelessWidget {
  const SelectTypeToShopButtons({super.key, required this.selectTypeModel});
  final SelectTypeModel selectTypeModel;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width <= 360) {
      return FittedBox(
        child: SelectTypeListView(selectTypeModel: selectTypeModel),
      );
    }
    return SelectTypeListView(selectTypeModel: selectTypeModel);
  }
}
