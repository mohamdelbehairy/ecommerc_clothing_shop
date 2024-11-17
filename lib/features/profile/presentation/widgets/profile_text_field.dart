import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../manager/build_profile/build_profile_cubit.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var buildProfile = context.read<BuildProfileCubit>();

    return CustomTextField(
        textFieldModel: TextFieldModel(
            borderRadius: 8,
            hintText: "user name",
            controller: buildProfile.userName));
  }
}
