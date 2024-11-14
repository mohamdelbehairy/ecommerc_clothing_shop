import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'wishlist_repo.dart';

class WishlistRepoImpl extends WishlistRepo {
  @override
  Future<Either<Failure, void>> addToWishlist(ProductModel product) async {
    try {
      var productModel = ProductModel(
          id: product.id,
          name: product.name,
          price: product.price,
          images: product.images,
          category: product.category,
          gender: product.gender,
          createdTime: DateTime.now());
      await FirebaseFirestore.instance
          .collection(Constants.wishlistCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.wishlistCollection)
          .doc(productModel.id)
          .set(productModel.toJson());

      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromWishlist(String productID) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.wishlistCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.wishlistCollection)
          .doc(productID)
          .delete();

      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  void getWishlist(Function(QuerySnapshot<Map<String, dynamic>>)? onData) {
    FirebaseFirestore.instance
        .collection(Constants.wishlistCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Constants.wishlistCollection)
        .snapshots()
        .listen(onData);
  }

  @override
  Future<Either<Failure, void>> removeAllFromWishlist() async {
    try {
      var documents = await FirebaseFirestore.instance
          .collection(Constants.wishlistCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.wishlistCollection)
          .get();

      for (var doc in documents.docs) {
        await doc.reference.delete();
      }
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(Failure(message: e.code));
      }
      return left(Failure(message: e.toString()));
    }
  }
}
