import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_profile_state.dart';

class BuildProfileCubit extends Cubit<BuildProfileState> {
  BuildProfileCubit() : super(BuildProfileInitial());

  TextEditingController userName = TextEditingController();
}
