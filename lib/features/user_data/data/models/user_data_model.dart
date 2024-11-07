import 'package:e_clot_shop/core/utils/constants.dart';

class UserDataModel {
  final String userName, email, userId, userImage, authType;
  final String? shippingAddress;
  final int? type, age;
  final int paymentMethod;

  UserDataModel(
      {required this.userName,
      required this.email,
      required this.userId,
      this.userImage = Constants.defaultUserImageUrl,
      this.authType = Constants.email,
      this.shippingAddress,
      this.type = 0,
      this.age,
      this.paymentMethod = -1});

  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(
        userName: jsonData['userName'],
        email: jsonData['email'],
        userId: jsonData['userId'],
        userImage: jsonData['userImage'],
        authType: jsonData['authType'],
        shippingAddress: jsonData['shippingAddress'],
        type: jsonData['type'],
        age: jsonData['age'],
        paymentMethod: jsonData['paymentMethod']);
  }

  toJson() {
    return {
      'userName': userName,
      'email': email,
      'userId': userId,
      'userImage': userImage,
      'authType': authType,
      'shippingAddress': shippingAddress,
      'type': type,
      'age': age,
      'paymentMethod': paymentMethod
    };
  }
}
