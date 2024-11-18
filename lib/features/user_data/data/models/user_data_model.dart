import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_clot_shop/core/utils/constants.dart';

class UserDataModel {
  final String userName, userImage, authType;
  final String? email, userId, shippingAddress;
  final int? type, age;
  final DateTime dateTime;
  final int paymentMethod;

  UserDataModel(
      {required this.userName,
      this.email,
      this.userId,
      this.userImage = Constants.defaultUserImageUrl,
      this.authType = Constants.email,
      this.shippingAddress,
      this.type = 0,
      this.age,
      required this.dateTime,
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
        dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
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
      'dateTime': dateTime,
      'paymentMethod': paymentMethod
    };
  }
}
