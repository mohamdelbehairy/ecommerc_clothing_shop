import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddAddressListView extends StatelessWidget {
  const AddAddressListView({super.key});

  @override
  Widget build(BuildContext context) {
    var textFields = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ...textFields.addAddressColumn.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomTextField(textFieldModel: e))),
          Row(
              children: List.generate(
                  2,
                  (index) => Expanded(
                        flex: index == 0 ? 3 : 2,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: index == 0 ? 20 : 0.0),
                          child: CustomTextField(
                              textFieldModel: textFields.addAddressRow[index]),
                        ),
                      )))
        ],
      ),
    );
  }
}