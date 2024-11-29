import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'cart_coupon_prefix_icon.dart';
import 'cart_coupon_suffix_icon.dart';

class CartCouponCodeWidget extends StatelessWidget {
  const CartCouponCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Form(
      key: buildApp.couponFormKey,
      child: CustomTextField(
          textFieldModel: TextFieldModel(
        enabled: !buildApp.isCouponApplied,
        borderRadius: 8,
        keyboardType: TextInputType.number,
        hintText: 'Enter Coupon Code',
        hintStyle: Styles.styleMediumWithOpacity12(context),
        prefixIcon: const CartCouponPrefixIcon(),
        suffixIcon: const CartCouponSuffixIcon(),
        controller: buildApp.couponController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Coupon Code';
          }
          if (value.length != 6) {
            return 'Coupon Code should be 6 digits';
          }
          if (value.length == 6 && value != buildApp.discountNumber) {
            return 'Invalid Coupon Code';
          }
          return null;
        },
      )),
    );
  }
}
