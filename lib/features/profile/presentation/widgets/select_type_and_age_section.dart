import 'package:e_clot_shop/core/models/bottom_picker_date_model.dart';
import 'package:e_clot_shop/features/profile/presentation/manager/build_profile/build_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/select_type_model.dart';
import '../../../../core/widgets/select_type/select_type_section.dart';
import '../../../../core/widgets/select_age/select_age_section.dart';
import '../../../user_data/data/models/user_data_model.dart';

class SelectTypeAndAgeSection extends StatelessWidget {
  const SelectTypeAndAgeSection({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var buildProfile = context.read<BuildProfileCubit>();
    return BlocBuilder<BuildProfileCubit, BuildProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            SelectTypeSection(
                selectTypeModel: SelectTypeModel(
                    onTap1: () => buildProfile.activeIndexChange(0),
                    onTap2: () => buildProfile.activeIndexChange(1),
                    activeIndex: buildProfile.activeIndex != -1
                        ? buildProfile.activeIndex
                        : userData.type!)),
            const SizedBox(height: 32),
            SelectAgeSection(
                bottomPickerModel: BottomPickerDateModel(
                    initialDateTime: userData.dateTime,
                    age: buildProfile.showdate.isNotEmpty
                        ? buildProfile.showdate
                        : userData.age.toString(),
                    onSubmit: (index) {
                      if (userData.dateTime != index) {
                        buildProfile.pickDate(index);
                      }
                    })),
          ],
        );
      },
    );
  }
}
