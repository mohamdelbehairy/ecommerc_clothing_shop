import 'package:flutter/material.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddAddressListView extends StatelessWidget {
  const AddAddressListView(
      {super.key, required this.columnTextField, required this.rowTextField});
  final List<TextFieldModel> columnTextField, rowTextField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ...columnTextField.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomTextField(textFieldModel: e))),
          Row(
              children: List.generate(
                  rowTextField.length,
                  (index) => Expanded(
                        flex: index == 0 ? 3 : 2,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: index == 0 ? 20 : 0.0),
                          child: CustomTextField(
                              textFieldModel: rowTextField[index]),
                        ),
                      )))
        ],
      ),
    );
  }
}
