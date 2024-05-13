import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    Key? key,
    this.url,
    this.errorImage,
  }) : super(key: key);

  final String? url;
  final Widget? errorImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$url',
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        );
      },
      errorWidget: (context, url, error) {
        if (errorImage != null) {
          return errorImage!;
        } else {
          return const Icon(
            Icons.error_outline,
            size: 40,
          );
        }
      },
      errorListener: (value) {
        print('error : $value');
      },
      fit: BoxFit.cover,
    );
  }
}
