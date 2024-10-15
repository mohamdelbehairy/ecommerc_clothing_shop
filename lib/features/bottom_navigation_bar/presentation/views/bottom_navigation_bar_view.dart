import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/manager/product/product_cubit.dart';
import '../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import '../manager/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import '../widgets/custom_bottom_navigation_bar_item.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    context.read<ProductCubit>().getProduct();
    context.read<WishlistCubit>().getWishlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = context.watch<BottomNavigationBarCubit>();
    return Scaffold(
      body: bottomNavigationBar.views[bottomNavigationBar.activeIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: BottomNavigationBar(
            currentIndex: bottomNavigationBar.activeIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (index) {
              bottomNavigationBar.changeIndex(index);
            },
            items: List.generate(
                bottomNavigationBar.items.length,
                (index) => customBottomNavigationBarItem(
                    bottomNavigationBar.items[index],
                    bottomNavigationBar.activeIndex == index)),
          ),
        ),
      ),
    );
  }
}
