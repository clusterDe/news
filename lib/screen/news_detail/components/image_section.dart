import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/providers/news_detail/news_detail_provider.dart';
import 'package:provider/provider.dart';

import '../../../widget/cache_image/cache_image.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsDetailProvider>(
      builder: (context, newsDetailProv, _) {
        return Container(
          height: 300,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defBorderRadius),
          ),
          child: CacheImage(
            url: newsDetailProv.dataNews?.urlToImage,
          ),
        );
      },
    );
  }
}
