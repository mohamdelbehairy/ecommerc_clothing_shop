import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../models/cached_network_image_model.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.cachedImage});
  final CachedNetworkImageModel cachedImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(cachedImage.borderRadius),
      child: CachedNetworkImage(
          height: cachedImage.height,
          width: cachedImage.width,
          fit: cachedImage.fit,
          placeholder: (context, url) =>
              cachedImage.placeholder ?? const SizedBox(),
          errorWidget: (context, url, error) =>
              cachedImage.errorWidget ?? const SizedBox(),
          imageUrl: cachedImage.imageUrl),
    );
  }
}

class CustomCachedNetworkImageProvider extends StatelessWidget {
  const CustomCachedNetworkImageProvider(
      {super.key, required this.cachedImage});
  final CachedNetworkImageProviderModel cachedImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: cachedImage.raduis,
        backgroundColor: context.read<ChangeThemeCubit>().isDarkMode
            ? Colors.grey.shade800
            : Colors.grey.shade300,
        backgroundImage: cachedImage.fileImage != null
            ? FileImage(cachedImage.fileImage!)
            : CachedNetworkImageProvider(cachedImage.imageUrl,
                maxHeight: cachedImage.height, maxWidth: cachedImage.width));
  }
}
