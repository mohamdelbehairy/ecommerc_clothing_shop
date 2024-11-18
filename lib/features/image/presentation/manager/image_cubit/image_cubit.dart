import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/image_repo.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(this._pickImage) : super(ImageInitial());

  final ImageRepo _pickImage;

  File? image;
  Future<void> pickImage() async {
    final result = await _pickImage.pickImage();

    result.fold((e) {
      emit(ImageFailure(errorMessage: e.toString()));
      log("error from pick image: ${e.message}");
    }, (e) {
      if (e != null) {
        image = File(e.path);
        emit(PickImageSuccess());
      }
    });
  }
}
