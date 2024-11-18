import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_profile_state.dart';

class BuildProfileCubit extends Cubit<BuildProfileState> {
  BuildProfileCubit() : super(BuildProfileInitial());

  TextEditingController userName = TextEditingController();

  int activeIndex = -1;
  DateTime date = DateTime(2000);
  int year = 0;
  String showdate = '';

  void activeIndexChange(int index) {
    if (activeIndex == index) return;
    activeIndex = index;
    emit(ChangeIndex());
  }

  void pickDate(DateTime dateTime) {
    year = DateTime.now().year - dateTime.year;
    date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    showdate = '${(DateTime.now().year - dateTime.year)}';
    emit(PickDateSuccess());
  }
}
