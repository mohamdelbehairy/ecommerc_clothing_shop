import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_home/build_home_cubit.dart';
import 'home_category_item.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildHome = context.read<BuildHomeCubit>();
    return BlocBuilder<BuildHomeCubit, BuildHomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(
                buildHome.items.length,
                (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child:
                        HomeCategoryItem(categoryItem: buildHome.items[index]))),
          ),
        );
      },
    );
  }
}
