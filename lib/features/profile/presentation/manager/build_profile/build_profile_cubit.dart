import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_profile_state.dart';

class BuildProfileCubit extends Cubit<BuildProfileState> {
  BuildProfileCubit() : super(BuildProfileInitial());

  TextEditingController userName = TextEditingController();

  DateTime date = DateTime(2000);
  String showdate = '';

  void pickDate(DateTime dateTime) {
    date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    showdate = '${(DateTime.now().year - dateTime.year)} years';
    emit(PickDateSuccess());
  }
}
