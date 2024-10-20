import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_products_grid_view.dart';
import '../manager/wishlist/wishlist_cubit.dart';
import 'favourite_founded_header.dart';

class FavouriteFoundedBody extends StatelessWidget {
  const FavouriteFoundedBody({super.key});

  @override
  Widget build(BuildContext context) {
    var wishlist = context.watch<WishlistCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 63),
          const FavouriteFoundedHeader(),
          const SizedBox(height: 24),
          CustomProductsGridView(products: wishlist.wishlist)
        ],
      ),
    );
  }
}
