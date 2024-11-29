import 'package:e_clot_shop/features/product/presentation/widgets/product_color_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/function/custom_bottom_sheet.dart';
import 'product_size_bottom_sheet.dart';
import 'product_select_details_widget.dart';

class ProductSelectDetailsListView extends StatelessWidget {
  const ProductSelectDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectList = context.read<BuildAppCubit>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductSelectDetailsWidget(
                        index: index,
                        onTap: () => customBottomSheet(context,
                            child: index == 0
                                ? const ProductSizeBottomSheet()
                                : const ProductColorBottomSheet()),
                        productSelectDetails:
                            selectList.selectDetailsList[index]),
                  ))),
    );
  }
}
