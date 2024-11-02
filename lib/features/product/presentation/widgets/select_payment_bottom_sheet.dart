import 'package:flutter/material.dart';

import 'payment_bottom_sheet_button.dart';
import 'payment_bottom_sheet_list_view.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';

class SelectPaymentBottomSheet extends StatelessWidget {
  const SelectPaymentBottomSheet({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomBottomSheetheader(text: 'Payment Method'),
        SizedBox(height: 8),
        PaymentBottomSheetListView(),
        SizedBox(height: 8),
        PaymentBottomSheetButton(),
        SizedBox(height: 24),
      ],
    );
  }
}
