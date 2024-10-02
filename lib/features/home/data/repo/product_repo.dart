import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductRepo {
  void getAllProducts(Function(QuerySnapshot<Map<String, dynamic>>)? onData);
}
