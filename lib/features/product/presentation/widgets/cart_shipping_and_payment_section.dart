import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../data/models/shipping_and_payment_model.dart';
import 'add_address_bottom_sheet_widget.dart';
import 'cart_shipping_and_payment_item.dart';
import '../../../../core/widgets/function/custom_bottom_sheet.dart';
import 'select_payment_bottom_sheet.dart';

class CartShippingAndPaymentSection extends StatelessWidget {
  const CartShippingAndPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: [
        CartShippingAndPaymentItem(
            shippingAndPaymentModel: ShippingAndPaymentModel(
          title: 'Shipping Address',
          subtitle: buildApp.shippingAddress.isNotEmpty
              ? buildApp.shippingAddress
              : 'Add Shipping Address',
          onTap: () => customBottomSheet(context,
              child: const AddAddressBottomSheetWidget()),
        )),
        const SizedBox(height: 16),
        CartShippingAndPaymentItem(
          shippingAndPaymentModel: ShippingAndPaymentModel(
            title: 'Payment Method',
            subtitle: buildApp.paymentMethod.isNotEmpty
                ? buildApp.paymentMethod
                : 'Select Payment Method',
            onTap: () => customBottomSheet(context,
                child: const SelectPaymentBottomSheet()),
          ),
        ),
      ],
    );
  }
}
