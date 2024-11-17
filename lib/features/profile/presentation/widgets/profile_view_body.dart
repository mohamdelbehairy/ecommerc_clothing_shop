import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/models/select_type_model.dart';
import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/core/widgets/custom_back_widget.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_user_image.dart';
import '../../../login/presentation/widgets/select_age_section.dart';
import '../../../../core/widgets/select_type/select_type_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63),
          CustomBackWidget(),
          Flexible(child: ProfileViewWhenStateSuccess())
        ],
      ),
    );
  }
}

class ProfileViewWhenStateSuccess extends StatelessWidget {
  const ProfileViewWhenStateSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const CustomUserImage(userImage: Constants.defaultUserImageUrl),
          const SizedBox(height: 32),
          CustomTextField(
              textFieldModel: TextFieldModel(
                  borderRadius: 8,
                  hintText: "user name",
                  controller: TextEditingController())),
          const SizedBox(height: 32),
          SelectTypeSection(
              selectTypeModel: SelectTypeModel(
                  onTap1: () {}, onTap2: () {}, activeIndex: 0)),
          const SizedBox(height: 32),
          const SelectAgeSection(),
          const Spacer(),
          CustomButton(
              customButtonModel: CustomButtonModel(buttonName: "Save")),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
