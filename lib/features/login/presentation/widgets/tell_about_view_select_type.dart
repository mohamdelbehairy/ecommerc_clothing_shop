import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/select_type_model.dart';
import '../manager/tell_us/tell_us_cubit.dart';
import '../../../../core/widgets/select_type/select_type_section.dart';

class TellAboutViewSelectType extends StatelessWidget {
  const TellAboutViewSelectType({super.key});

  @override
  Widget build(BuildContext context) {
    var selectType = context.watch<TellUsCubit>();

    return SelectTypeSection(
        selectTypeModel: SelectTypeModel(
            onTap1: () => selectType.activeIndexChange(0),
            onTap2: () => selectType.activeIndexChange(1),
            activeIndex: selectType.activeIndex));
  }
}
