import 'package:e_clot_shop/core/models/cached_network_image_model.dart';
import 'package:e_clot_shop/features/image/presentation/manager/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_data/data/models/user_data_model.dart';
import 'profile_image_widget.dart';
import 'profile_save_button.dart';
import 'profile_text_field.dart';
import 'select_type_and_age_section.dart';

class ProfileWhenStateSuccess extends StatelessWidget {
  const ProfileWhenStateSuccess({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var image = context.watch<ImageCubit>().image;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ProfileImageWidget(
              cachedImagel: CachedNetworkImageProviderModel(
                  fileImage: image, imageUrl: userData.userImage)),
          const SizedBox(height: 32),
          const ProfileTextField(),
          const SizedBox(height: 32),
          const SelectTypeAndAgeSection(),
          const Spacer(),
          const ProfileSaveButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}


