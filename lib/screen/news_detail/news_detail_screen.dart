import 'package:flutter/material.dart';

import 'components/news_detail_body.dart';

class NewsDetailScreen extends StatelessWidget {
  static const String routeName = 'news_detail';
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: const NewsDetailBody(),
    );
  }
}
