  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/product/product_cubit.dart';
import '../../../../order/presentation/manager/order/order_cubit.dart';
import '../../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import '../../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';

void initData(BuildContext context) {
    context.read<ProductCubit>().getProduct();
    context.read<WishlistCubit>().getWishlist();
    context.read<GetUserDataCubit>().getUserData();
    context.read<OrderCubit>().getOrders();
  }