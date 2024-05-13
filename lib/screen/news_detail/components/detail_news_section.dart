import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/helper/datetime_helper.dart';
import 'package:provider/provider.dart';

import '../../../providers/news_detail/news_detail_provider.dart';

class DetailNewsSection extends StatelessWidget {
  const DetailNewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defPadding),
        Consumer<NewsDetailProvider>(
          builder: (context, newsDetailProv, _) {
            return Text(
              '${newsDetailProv.dataNews?.title}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
        SizedBox(height: defPadding / 2),
        Consumer<NewsDetailProvider>(
          builder: (context, newsDetailProv, _) {
            return Text(
              newsDetailProv.dataNews?.author ?? 'None',
              style: const TextStyle(
                color: Colors.blue,
              ),
            );
          },
        ),
        Consumer<NewsDetailProvider>(
          builder: (context, newsDetailProv, _) {
            var parse = DateTimeHelper.formatToString(
                date: '${newsDetailProv.dataNews?.publishedAt}');
            return Text('$parse');
          },
        ),
      ],
    );
  }
}
