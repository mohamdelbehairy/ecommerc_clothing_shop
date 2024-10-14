import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/function/custom_snack_bar_widget.dart';
import 'package:e_clot_shop/features/wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'home_categories_section.dart';
import 'home_header_section.dart';
import 'home_new_in_section.dart';
import 'home_search_widget.dart';
import 'home_top_selling_section.dart';

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
        if (state is RemovedFromWishlistSuccess) {
          customSnackbarWidget(context,
              width: 200,
              color: AppColors.primaryColor,
              message: 'Removed from wishlist');
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 63),
            HomeHeaderSection(userData: userData),
            const SizedBox(height: 24),
            const HomeSearchWidget(),
            const SizedBox(height: 28),
            const HomeCategoiresSection(),
            const SizedBox(height: 24),
            const HomeTopSellingSection(),
            const SizedBox(height: 24),
            const HomeNewInSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
