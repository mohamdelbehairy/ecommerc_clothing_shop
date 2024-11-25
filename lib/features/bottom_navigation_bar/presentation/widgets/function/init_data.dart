import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/product/product_cubit.dart';
import '../../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';

void initData(BuildContext context) {
  context.read<ProductCubit>().getProduct();
  context.read<WishlistCubit>().getWishlist();
}
