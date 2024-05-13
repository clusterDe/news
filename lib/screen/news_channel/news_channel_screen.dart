import 'package:flutter/material.dart';
import 'package:news/providers/news_channel/news_channel_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/drawer_widget/drawer_widget.dart';
import 'components/news_channel_body.dart';

class NewsChannelScreen extends StatelessWidget {
  static const String routeName = '/all_news_channel';
  const NewsChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('All News Channel'),
        actions: [
          Consumer<NewsChannelProvider>(
            builder: (context, newsChannelProv, _) {
              return IconButton(
                onPressed: () {
                  newsChannelProv.btnSearch();
                },
                icon: Icon(
                  newsChannelProv.showSearch ? Icons.close : Icons.search,
                ),
              );
            },
          ),
        ],
        bottom: context.watch<NewsChannelProvider>().searchChannel(),
      ),
      body: const NewsChannelBody(),
    );
  }
}
