  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_clot_shop/core/utils/constants.dart';

Future<bool> isUserDataSaved(String userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .doc(userId)
        .get();
    return snapshot.exists;
  }