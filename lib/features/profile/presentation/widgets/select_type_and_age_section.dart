import 'package:e_clot_shop/core/models/bottom_picker_date_model.dart';
import 'package:e_clot_shop/features/profile/presentation/manager/build_profile/build_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/select_type_model.dart';
import '../../../../core/widgets/select_type/select_type_section.dart';
import '../../../../core/widgets/select_age/select_age_section.dart';

class SelectTypeAndAgeSection extends StatelessWidget {
  const SelectTypeAndAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    var buildProfile = context.watch<BuildProfileCubit>();
    return Column(
      children: [
        SelectTypeSection(
            selectTypeModel:
                SelectTypeModel(onTap1: () {}, onTap2: () {}, activeIndex: 0)),
        const SizedBox(height: 32),
        SelectAgeSection(
            bottomPickerModel: BottomPickerDateModel(
                initialDateTime: DateTime(2010),
                age: buildProfile.showdate,
                onSubmit: (index) {
                  buildProfile.pickDate(index);
                })),
      ],
    );
  }
}
