import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/repo/product_repo_impl.dart';
import '../manager/build_search/build_search_cubit.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BuildSearchCubit(context, getIt.get<ProductRepoImpl>()),
      child: const Scaffold(body: SearchViewBody()),
    );
  }
}
