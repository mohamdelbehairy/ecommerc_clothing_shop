import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../user_data/data/models/user_data_model.dart';
import '../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import 'home_when_state_success_body.dart';

class HomeWhenStateSuccess extends StatelessWidget {
  const HomeWhenStateSuccess({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is AddedToWishlistSuccess) {
          customSnackbarWidget(context,
              width: 200,
              color: AppColors.primaryColor,
              message: 'Added to wishlist');
        }
        if (state is RemovedFromWishlistSuccess ||
            state is RemovedAllFromWishlistSuccess) {
          customSnackbarWidget(context,
              width: 200,
              color: AppColors.primaryColor,
              message: 'Removed from wishlist');
        }
      },
      child: HomeWhenStateSuccessBody(userData: userData),
    );
  }
}
