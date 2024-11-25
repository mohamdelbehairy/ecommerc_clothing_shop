import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../widgets/custom_bottom_navigation_bar_item.dart';
import '../widgets/function/init_data.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  @override
  void initState() {
    initData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = context.watch<BuildAppCubit>();
    return Scaffold(
      body: bottomNavigationBar.views[bottomNavigationBar.bottomActiveIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: BottomNavigationBar(
            elevation: 0.0,
            currentIndex: bottomNavigationBar.bottomActiveIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: bottomNavigationBar.isDarkMode
                ? AppColors.darkModePrimaryColor
                : Colors.white,
            onTap: (index) {
              bottomNavigationBar.bottomChangeIndex(index);
            },
            items: List.generate(
                bottomNavigationBar.bottomItems.length,
                (index) => customBottomNavigationBarItem(
                    bottomNavigationBar.bottomItems[index],
                    bottomNavigationBar.bottomActiveIndex == index,
                    context)),
          ),
        ),
      ),
    );
  }
}
