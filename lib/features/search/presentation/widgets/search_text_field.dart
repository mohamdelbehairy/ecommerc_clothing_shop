import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/search_icon.dart';
import '../manager/build_search/build_search_cubit.dart';
import 'search_close_icon.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var search = context.watch<BuildSearchCubit>();

    return CustomTextField(
        textFieldModel: TextFieldModel(
            hight: 44,
            borderRadius: 100,
            hintText: 'Search',
            hintStyle: Styles.styleMedium14(context),
            prefixIcon: const SearchIcon(),
            suffixIcon: search.isSearch ? const SearchCloseIcon() : null,
            controller: search.searchController,
           ));
  }
}
