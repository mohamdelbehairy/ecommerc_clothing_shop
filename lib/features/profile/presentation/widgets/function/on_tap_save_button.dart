
import '../../../../user_data/data/models/user_data_model.dart';
import '../../../data/models/on_tap_save_model.dart';

Future<void> onTapSaveButton(OnTapSaveModel onTapSaveModel) async {
  if (onTapSaveModel.image.image != null) {
    await onTapSaveModel.image.uploadImage();
  }

  if (onTapSaveModel.image.image != null ||
      (onTapSaveModel.userData.userName !=
          onTapSaveModel.buildProfile.userName.text) ||
      (onTapSaveModel.buildProfile.activeIndex != -1 &&
          onTapSaveModel.userData.type !=
              onTapSaveModel.buildProfile.activeIndex) ||
      onTapSaveModel.buildProfile.year != 0) {
    await onTapSaveModel.updateUserData.updateAllUserData(
        userData: UserDataModel(
            userName: onTapSaveModel.buildProfile.userName.text,
            userImage: onTapSaveModel.image.image != null
                ? onTapSaveModel.image.imageUrl
                : onTapSaveModel.userData.userImage,
            type: onTapSaveModel.buildProfile.activeIndex != -1
                ? onTapSaveModel.buildProfile.activeIndex
                : onTapSaveModel.userData.type,
            age: onTapSaveModel.buildProfile.year != 0
                ? onTapSaveModel.buildProfile.year
                : onTapSaveModel.userData.age,
            dateTime: onTapSaveModel.buildProfile.year != 0
                ? onTapSaveModel.buildProfile.date
                : onTapSaveModel.userData.dateTime));
  }
}
