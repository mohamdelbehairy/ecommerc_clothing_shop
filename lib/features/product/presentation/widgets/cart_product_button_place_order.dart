import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../payment/presentation/manager/strip/strip_payment_cubit.dart';
import '../../../update/presentation/manager/update_data/update_data_cubit.dart';
import 'function/place_order_button_on_tap.dart';

class CartProductButtonPlaceOrder extends StatelessWidget {
  const CartProductButtonPlaceOrder(
      {super.key, required this.productData, required this.userData});
  final ProductModel productData;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return BlocConsumer<StripPaymentCubit, StripPaymentState>(
      listener: (context, state) async {
        if (state is StripPaymentSuccess) {
          buildApp.productData = productData;
          if (userData.shippingAddress != null) {
            buildApp.userData = userData;
          }
          GoRouter.of(context).go(AppRouter.orderPlacedSuccess);
          await context.read<UpdateDataCubit>().updateProductData(
              productID: productData.id,
              value: (productData.sellingCount! +
                  context.read<BuildAppCubit>().quantity));
        }
        if (state is StripPaymentFailure) {
          // ignore: use_build_context_synchronously
          customSnackbarWidget(context,
              margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 100),
              message: 'Payment has been cancelled');
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: state is StripPaymentLoading,
                onTap: () async {
                  await placeOrderButtonOnTap(context,
                      userData: userData, productData: productData);
                },
                buttonName: 'Place Order'));
      },
    );
  }
}
