import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import '../manager/wishlist/wishlist_cubit.dart';

class FavouriteFoundedHeader extends StatelessWidget {
  const FavouriteFoundedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var wishList = context.watch<WishlistCubit>();
    return Row(
      children: [
        const CustomBackWidget(),
        const Spacer(),
        Text('My Favourites (${wishList.wishlist.length})',
            style: Styles.styleBold16(context)),
        const Spacer(),
        const SizedBox(width: 24)
      ],
    );
  }
}
