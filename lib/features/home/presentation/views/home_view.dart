import 'package:e_clot_shop/features/home/data/repo/product_repo_impl.dart';
import 'package:e_clot_shop/features/home/presentation/manager/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductRepoImpl()),
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
