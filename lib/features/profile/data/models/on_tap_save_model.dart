import '../../../image/presentation/manager/image_cubit/image_cubit.dart';
import '../../../update/presentation/manager/update_data/update_data_cubit.dart';
import '../../../user_data/data/models/user_data_model.dart';
import '../../presentation/manager/build_profile/build_profile_cubit.dart';

class OnTapSaveModel {
  final ImageCubit image;
  final BuildProfileCubit buildProfile;
  final UpdateDataCubit updateUserData;
  final UserDataModel userData;

  OnTapSaveModel(
      {required this.image,
      required this.buildProfile,
      required this.updateUserData,
      required this.userData});
}
