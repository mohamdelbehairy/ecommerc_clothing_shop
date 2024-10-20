import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/loading_animation_widget.dart';
import '../manager/wishlist/wishlist_cubit.dart';
import 'no_favourite_founded.dart';
import 'favourite_founded_body.dart';

class MyFavouriteViewBody extends StatelessWidget {
  const MyFavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var wishlist = context.read<WishlistCubit>();
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (wishlist.iwishListClear) {
          return Center(
            child: loadingAnimationWidget(),
          );
        }
        if (wishlist.wishlist.isEmpty) return const NoFavouriteFounded();
        return const FavouriteFoundedBody();
      },
    );
  }
}
