import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/tell_us/tell_us_cubit.dart';

class SelectTypeToShopButtons extends StatelessWidget {
  const SelectTypeToShopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var selectType = context.read<TellUsCubit>();
    return BlocBuilder<TellUsCubit, TellUsState>(
      builder: (context, state) {
        if (MediaQuery.sizeOf(context).width <= 360) {
          return FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(selectType.items.length, (index) {
                return InkWell(
                    onTap: () {
                      selectType.activeIndexChange(index);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(right: index == 0 ? 12 : 0.0),
                        child: CustomButton(
                            customButtonModel: selectType.items[index])));
              }),
            ),
          );
        }
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
