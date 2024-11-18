import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/pick_image_repo.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this._pickImage) : super(PickImageInitial());

  final PickImageRepo _pickImage;

  File? image;
  Future<void> pickImage() async {
    final result = await _pickImage.pickImage();

    result.fold((e) {
      emit(PickImageFailure(errorMessage: e.toString()));
      log("error from pick image: ${e.message}");
    }, (e) {
      if (e != null) {
        image = File(e.path);
        log("XFile image: ${e.path}");
        log("File image: $image");

        emit(PickImageSuccess());
      }
    });
  }
}
