import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'product_select_details_widget.dart';

class ProductSelectDetailsListView extends StatelessWidget {
  const ProductSelectDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectDetailsList = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductSelectDetailsWidget(
                        productSelectDetailsModel:
                            selectDetailsList.selectDetailsList[index]),
                  ))),
    );
  }
}
