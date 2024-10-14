part of 'wishlist_cubit.dart';

sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class AddedToWishlistSuccess extends WishlistState {}

final class RemovedFromWishlistSuccess extends WishlistState {}

final class GetWishlistSuccess extends WishlistState {}

final class WishlistFailure extends WishlistState {
  final String errorMessage;

  WishlistFailure({required this.errorMessage});
}
