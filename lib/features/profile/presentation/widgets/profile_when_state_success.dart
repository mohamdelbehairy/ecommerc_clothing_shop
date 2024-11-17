import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'profile_image_widget.dart';
import 'profile_text_field.dart';
import 'select_type_and_age_section.dart';

class ProfileWhenStateSuccess extends StatelessWidget {
  const ProfileWhenStateSuccess({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ProfileImageWidget(userImage: userData.userImage),
          const SizedBox(height: 32),
          const ProfileTextField(),
          const SizedBox(height: 32),
          const SelectTypeAndAgeSection(),
          const Spacer(),
          CustomButton(
              customButtonModel: CustomButtonModel(buttonName: "Save")),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}


