import 'package:e_clot_shop/features/home/presentation/manager/build_home/build_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_view_list_tile.dart';

class CategoriesViewListView extends StatelessWidget {
  const CategoriesViewListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildHome = context.read<BuildHomeCubit>();
    return BlocBuilder<BuildHomeCubit, BuildHomeState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
              buildHome.items.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CategoriesViewListTile(
                      categoryItem: buildHome.items[index]))),
        );
      },
    );
  }
}