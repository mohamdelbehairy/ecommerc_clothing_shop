import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import '../manager/wishlist/wishlist_cubit.dart';

class WishlistFoundedHeader extends StatelessWidget {
  const WishlistFoundedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackWidget(),
        const Spacer(flex: 3),
        Text('Cart', style: Styles.styleBold16),
        const Spacer(flex: 3),
        GestureDetector(
            onTap: () async {
              await context.read<WishlistCubit>().removeAllFromWishlist();
            },
            child: Text('Remove All', style: Styles.styleMedium16))
      ],
    );
  }
}
