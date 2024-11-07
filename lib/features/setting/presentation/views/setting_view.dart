import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../manager/build_setting/build_setting_cubit.dart';
import '../widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildSettingCubit(context),
      child: Scaffold(
        body: BlocListener<WishlistCubit, WishlistState>(
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
          child: const SettingViewBody(),
        ),
      ),
    );
  }
}
