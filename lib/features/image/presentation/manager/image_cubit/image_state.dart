part of 'image_cubit.dart';

sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class PickImageLoading extends ImageState {}

final class PickImageSuccess extends ImageState {}

final class ImageFailure extends ImageState {
  final String errorMessage;

  ImageFailure({required this.errorMessage});
}
