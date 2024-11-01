import 'package:flutter/material.dart';

import '../../../product/presentation/widgets/product_bottom_sheet_header.dart';
import 'setting_payment_bottom_sheet_list_view.dart';

class SettingSelectPaymentBottomSheet extends StatelessWidget {
  const SettingSelectPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProductBottomSheetheader(text: 'Payment Method'),
        SizedBox(height: 8),
        SettingPaymentBottomSheetListView(),
        SizedBox(height: 8),
        SizedBox(height: 24),
      ],
    );
  }
}
