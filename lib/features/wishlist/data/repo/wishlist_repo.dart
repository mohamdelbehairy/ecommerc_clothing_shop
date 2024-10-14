import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';

import '../../../home/data/models/product_model.dart';

abstract class WishlistRepo {
  Future<Either<Failure, void>> addToWishlist(ProductModel product);
  Future<Either<Failure, void>> removeFromWishlist(String productID);
  void getWishlist(Function(QuerySnapshot<Map<String, dynamic>>)? onData);
}
