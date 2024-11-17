import 'package:e_clot_shop/core/models/select_type_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'select_type_to_buttons.dart';

class SelectTypeSection extends StatelessWidget {
  const SelectTypeSection({super.key, required this.selectTypeModel});
  final SelectTypeModel selectTypeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Who do you shop for ?', style: Styles.styleMedium16(context)),
        const SizedBox(height: 24),
        SelectTypeToShopButtons(selectTypeModel: selectTypeModel),
      ],
    );
  }
}
