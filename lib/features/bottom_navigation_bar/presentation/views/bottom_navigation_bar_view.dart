import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import '../widgets/custom_bottom_navigation_bar_item.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = context.watch<BottomNavigationBarCubit>();
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: SizedBox(
          height: 85,
          child: BottomNavigationBar(
            currentIndex: bottomNavigationBar.activeIndex,
            type: BottomNavigationBarType.fixed,
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
