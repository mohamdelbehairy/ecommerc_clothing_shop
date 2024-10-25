import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/payment/data/repo/currency_repo_impl.dart';
import 'package:e_clot_shop/features/payment/data/repo/strip_repo_impl.dart';
import 'package:e_clot_shop/features/payment/presentation/manager/currency/currency_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                StripPaymentCubit(StripRepoImpl(getIt.get<ApiService>()))),
        BlocProvider(
            create: (context) =>
                CurrencyCubit(CurrencyRepoImpl(getIt.get<ApiService>()))),
      ],
      child: Scaffold(
        body: CartViewBody(productData: productData),
      ),
    );
  }
}
