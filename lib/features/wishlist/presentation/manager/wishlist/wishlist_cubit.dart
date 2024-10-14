import 'dart:developer';

import 'package:e_clot_shop/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._wishlistRepo) : super(WishlistInitial());
  final WishlistRepo _wishlistRepo;

  List<ProductModel> wishlist = [];

  Future<void> addToWishlist({required ProductModel product}) async {
    emit(WishlistLoading());

    final result = await _wishlistRepo.addToWishlist(product);
    result.fold((e) {
      emit(WishlistFailure(errorMessage: e.message));
      log('error from add to wishlist: $e');
    }, (e) => emit(AddedToWishlistSuccess()));
  }

  Future<void> removeFromWishlist(String productID) async {
    emit(WishlistLoading());
    final result = await _wishlistRepo.removeFromWishlist(productID);
    result.fold((e) {
      emit(WishlistFailure(errorMessage: e.message));
      log('error from remove from wishlist: $e');
    }, (e) => emit(RemovedFromWishlistSuccess()));
  }

  void getWishlist() {
    _wishlistRepo.getWishlist((snapshot) {
      wishlist = [];
      for (var element in snapshot.docs) {
        wishlist.add(ProductModel.fromJson(element.data()));
      }
      emit(GetWishlistSuccess());
    });
  }

  bool isWishlisted(String productID) {
    bool exists = wishlist.any((product) => product.id == productID);
    return exists;
  }
}
