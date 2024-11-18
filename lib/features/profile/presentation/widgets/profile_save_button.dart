import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../image/presentation/manager/image_cubit/image_cubit.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    var image = context.read<ImageCubit>();
    return CustomButton(
        customButtonModel: CustomButtonModel(
            onTap: () {
              if (image.image != null) {
                print("image: ${image.image}");
              }
            },
            buttonName: "Save"));
  }
}
