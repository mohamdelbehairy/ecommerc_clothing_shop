import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'home_category_item.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildHome = context.read<BuildAppCubit>();
    return BlocBuilder<BuildAppCubit, BuildAppState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(
                buildHome.categories.length,
                (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: HomeCategoryItem(
                        categoryItem: buildHome.categories[index]))),
          ),
        );
      },
    );
  }
}
