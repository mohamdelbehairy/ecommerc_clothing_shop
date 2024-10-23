import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/payment/data/repo/strip_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/product_model.dart';
import '../../../payment/presentation/manager/strip/strip_payment_cubit.dart';
import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StripPaymentCubit(StripRepoImpl(getIt.get<ApiService>())),
      child: Scaffold(
        body: CartViewBody(productData: productData),
      ),
    );
  }
}
