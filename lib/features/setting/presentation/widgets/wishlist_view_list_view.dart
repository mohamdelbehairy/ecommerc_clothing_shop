import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/features/order/presentation/manager/order/order_cubit.dart';
import 'package:e_clot_shop/features/order/presentation/views/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import '../../data/models/wishlist_list_tile_model.dart';
import 'wishlist_view_list_tile.dart';

class WishlistViewListView extends StatelessWidget {
  const WishlistViewListView({super.key});

  @override
  Widget build(BuildContext context) {
    var wishList = context.read<WishlistCubit>();
    var orderList = context.read<OrderCubit>();
    return Column(
      children: [
        WishlistViewListTile(
            wishlistModel: WishlistListTileModel(
                name: 'My Favorite',
                productsNumber: '${wishList.wishlist.length} Products',
                onTap: () => GoRouter.of(context).push(AppRouter.myFavourite))),
        const SizedBox(height: 8),
        WishlistViewListTile(
          wishlistModel: WishlistListTileModel(
              name: 'Orders',
              productsNumber: '${orderList.orders.length} Orders',
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const OrderView(isSetting: true)),
                  )),
        ),
      ],
    );
  }
}
