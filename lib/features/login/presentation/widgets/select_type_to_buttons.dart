import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/select_type/select_type_cubit.dart';

class SelectTypeToShopButtons extends StatelessWidget {
  const SelectTypeToShopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var selectType = context.read<SelectTypeCubit>();
    return BlocBuilder<SelectTypeCubit, SelectTypeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(selectType.items.length, (index) {
            return InkWell(
                onTap: () {
                  selectType.activeIndexChange(index);
                },
                child:
                    CustomButton(customButtonModel: selectType.items[index]));
          }),
        );
      },
    );
  }
}
