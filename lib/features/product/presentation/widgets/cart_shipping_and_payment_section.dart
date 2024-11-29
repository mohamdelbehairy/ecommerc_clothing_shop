import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../data/models/shipping_and_payment_model.dart';
import 'add_address_bottom_sheet_widget.dart';
import 'cart_shipping_and_payment_item.dart';
import '../../../../core/widgets/function/custom_bottom_sheet.dart';
import 'function/convert_shipping_address.dart';
import 'select_payment_bottom_sheet.dart';

class CartShippingAndPaymentSection extends StatelessWidget {
  const CartShippingAndPaymentSection({super.key, required this.userData});
  final UserDataModel userData;

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
              : userData.shippingAddress != null
                  ? convertShippingAddress(userData.shippingAddress!)
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
                : userData.paymentMethod > -1
                    ? buildApp.paymentList[userData.paymentMethod].title
                    : 'Select Payment Method',
            onTap: () => customBottomSheet(context,
                child: const SelectPaymentBottomSheet()),
          ),
        ),
      ],
    );
  }
}


