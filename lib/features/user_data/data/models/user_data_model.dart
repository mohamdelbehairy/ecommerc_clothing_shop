import 'package:e_clot_shop/core/utils/constants.dart';

class UserDataModel {
  final String userName, email, userId, userImage;
  final int? type, age;

  UserDataModel(
      {required this.userName,
      required this.email,
      required this.userId,
      this.userImage = Constants.defaultUserImageUrl,
      this.type = 0,
      this.age});

  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(
        userName: jsonData['userName'],
        email: jsonData['email'],
        userId: jsonData['userId'],
        userImage: jsonData['userImage'],
        type: jsonData['type'],
        age: jsonData['age']);
  }

  toJson() {
    return {
      'userName': userName,
      'email': email,
      'userId': userId,
      'userImage': userImage,
      'type': type,
      'age': age
    };
  }
}
