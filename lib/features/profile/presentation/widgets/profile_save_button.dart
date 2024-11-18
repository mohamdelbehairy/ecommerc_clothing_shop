import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/profile/presentation/manager/build_profile/build_profile_cubit.dart';
import 'package:e_clot_shop/features/update/presentation/manager/update_data/update_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../image/presentation/manager/image_cubit/image_cubit.dart';
import '../../../user_data/data/models/user_data_model.dart';
import '../../data/models/on_tap_save_model.dart';
import 'function/on_tap_save_button.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var image = context.read<ImageCubit>();
    var updateUserData = context.watch<UpdateDataCubit>();
    var buildProfile = context.read<BuildProfileCubit>();

    return BlocListener<UpdateDataCubit, UpdateDataState>(
      listener: (context, state) {
        if (state is UpdateAllUserDataSuccess) {
          buildProfile.year = 0;
          if (buildProfile.activeIndex != -1) {
            buildProfile.activeIndex = -1;
          }
          customSnackbarWidget(context,
              width: 100, color: AppColors.primaryColor, message: "done");
        }
      },
      child: BlocConsumer<ImageCubit, ImageState>(
        listener: (context, state) {
          if (state is UploadImageSuccess) {
            image.image = null;
          }
        },
        builder: (context, state) {
          return CustomButton(
              customButtonModel: CustomButtonModel(
                  isLoading: state is UploadImageLoading ||
                      updateUserData.state is UpdateAllUserDataLoading,
                  onTap: () async {
                    await onTapSaveButton(OnTapSaveModel(
                        image: image,
                        buildProfile: buildProfile,
                        updateUserData: updateUserData,
                        userData: userData));
                  },
                  buttonName: "Save"));
        },
      ),
    );
  }
}
