import 'package:flutter/material.dart';
import 'package:news/constant.dart';

import 'top_headline_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.all(defPadding),
      children: [
        TopHeadlineSection(),
      ],
    );
  }
}
