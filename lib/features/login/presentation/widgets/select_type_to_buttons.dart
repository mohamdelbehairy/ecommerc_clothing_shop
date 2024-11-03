import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/tell_us/tell_us_cubit.dart';
import 'select_type_list_view.dart';

class SelectTypeToShopButtons extends StatelessWidget {
  const SelectTypeToShopButtons({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TellUsCubit, TellUsState>(
      builder: (context, state) {
        if (MediaQuery.sizeOf(context).width <= 360) {
          return const FittedBox(
            child: SelectTypeListView(),
          );
        }
        return const SelectTypeListView();
      },
    );
  }
}


