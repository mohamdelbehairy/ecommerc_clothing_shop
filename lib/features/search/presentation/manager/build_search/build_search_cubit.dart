import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_search_state.dart';

class BuildSearchCubit extends Cubit<BuildSearchState> {
  BuildSearchCubit() : super(BuildSearchInitial()) {
    checkSearch();
  }

  TextEditingController searchController = TextEditingController();

  bool isSearch = false;
  void checkSearch() {
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        isSearch = true;
      } else {
        isSearch = false;
      }
      emit(CheckSearchSuccess());
    });
  }

  void clearSearch() {
    searchController.clear();
    emit(ClearSearchSuccess());
  }
}
