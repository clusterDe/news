import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/providers/channel/channel_provider.dart';
import 'package:news/widget/card_news/card_news_widget.dart';
import 'package:news/widget/consumer_state/consumer_state_date.dart';
import 'package:provider/provider.dart';

class ChannelBody extends StatelessWidget {
  const ChannelBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConsumerStateData<ChannelProvider>(
      state: context.watch<ChannelProvider>().stateGetNewsByChannel!,
      enumValue: ResultGetNewsByChannelState.values,
      message: context.watch<ChannelProvider>().msgGetNewsByChannel,
      builder: (context, channelProv, _) {
        var articles = channelProv.dataNews?.articles;
        if (articles!.isNotEmpty) {
          return ListView.separated(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(defPadding),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return CardNewsWidget(
                press: () {
                  channelProv.goToNewsDetail(
                    context,
                    index: index,
                  );
                },
                title: articles[index].title,
                author: articles[index].author,
                urlImage: articles[index].urlToImage,
                date: articles[index].publishedAt,
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: defPadding * 4,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
