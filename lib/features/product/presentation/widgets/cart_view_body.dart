import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../home/data/models/product_model.dart';
import '../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'cart_view_when_state_success.dart';
import 'function/testing_card_show_dialog.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
      if (buildApp.isDialogOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          testingCardShowDialog(context, buildApp);
        });
      }

      if (state is GetUserDataSuccess) {
        if (productData.discountNumber != null &&
            productData.discountNumber!.isNotEmpty) {
          buildApp.discountNumber = productData.discountNumber!;
        }
        if (productData.discountPercent != null &&
            productData.discountPercent! > 0) {
          buildApp.discountPercent = productData.discountPercent!;
        }

        return CartViewWhenStateSuccess(
            productData: productData, userData: state.user);
      }
      return const SizedBox();
    });
  }
}
