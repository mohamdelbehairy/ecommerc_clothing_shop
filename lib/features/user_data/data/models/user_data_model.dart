import 'package:e_clot_shop/core/utils/constants.dart';

class UserDataModel {
  final String userName;
  final String email;
  final String userId;
  final String userImage;

  UserDataModel(
      {required this.userName,
      required this.email,
      required this.userId,
      this.userImage = Constants.defaultUserImageUrl});

  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(
        userName: jsonData['userName'],
        email: jsonData['email'],
        userId: jsonData['userId']);
  }

  toJson() {
    return {
      'userName': userName,
      'email': email,
      'userId': userId,
      'userImage': userImage
    };
  }
}
