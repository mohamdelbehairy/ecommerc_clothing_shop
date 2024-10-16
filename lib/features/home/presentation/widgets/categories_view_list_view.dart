import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'categories_view_list_tile.dart';

class CategoriesViewListView extends StatelessWidget {
  const CategoriesViewListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildHome = context.read<BuildAppCubit>();
    return BlocBuilder<BuildAppCubit, BuildAppState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
              buildHome.categories.length,
              (index) => GestureDetector(
                    onTap: () {
                      buildHome.activeIndexChange(index);
                      GoRouter.of(context).push(AppRouter.categoryProducts);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CategoriesViewListTile(
                            categoryItem: buildHome.categories[index])),
                  )),
        );
      },
    );
  }
}
