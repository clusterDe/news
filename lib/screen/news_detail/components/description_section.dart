import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:provider/provider.dart';

import '../../../providers/news_detail/news_detail_provider.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defPadding),
        Consumer<NewsDetailProvider>(
          builder: (context, newsDetailProv, _) {
            return Text('${newsDetailProv.dataNews?.description}');
          },
        ),
      ],
    );
  }
}
