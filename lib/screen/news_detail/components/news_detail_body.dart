import 'package:flutter/material.dart';
import 'package:news/constant.dart';

import 'description_section.dart';
import 'detail_news_section.dart';
import 'image_section.dart';

class NewsDetailBody extends StatelessWidget {
  const NewsDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(defPadding),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: const [
        ImageSection(),
        DetailNewsSection(),
        DescriptionSection(),
      ],
    );
  }
}
