import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../manager/build_register/build_register_cubit.dart';

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    var buildRegister = context.watch<BuildRegisterCubit>();
    return Column(
      children: List.generate(
          buildRegister.items.length,
          (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child:
                  CustomTextField(textFieldModel: buildRegister.items[index]))),
    );
  }
}
