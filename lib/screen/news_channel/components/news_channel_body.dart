import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/providers/news_channel/news_channel_provider.dart';
import 'package:news/widget/consumer_state/consumer_state_date.dart';
import 'package:provider/provider.dart';

class NewsChannelBody extends StatelessWidget {
  const NewsChannelBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConsumerStateData<NewsChannelProvider>(
      state: context.watch<NewsChannelProvider>().stateGetNewsChannel!,
      enumValue: ResultGetNewsChannelState.values,
      message: context.watch<NewsChannelProvider>().msgGetNewsChannel,
      builder: (context, newsChannelProv, _) {
        var sources = newsChannelProv.dataNewsChannel?.sources;
        if (sources!.isNotEmpty) {
          return Visibility(
            visible: newsChannelProv.filterNewsChannel!.isEmpty ? true : false,
            replacement: ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(defPadding),
              itemCount: newsChannelProv.filterNewsChannel!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    newsChannelProv.goToChannel(
                      context,
                      data: newsChannelProv.filterNewsChannel![index],
                    );
                  },
                  title:
                      Text('${newsChannelProv.filterNewsChannel![index].name}'),
                  subtitle: Text(
                      '${newsChannelProv.filterNewsChannel![index].description}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: defPadding * 4,
              ),
            ),
            child: ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(defPadding),
              itemCount: sources.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    newsChannelProv.goToChannel(
                      context,
                      data: sources[index],
                    );
                  },
                  title: Text('${sources[index].name}'),
                  subtitle: Text('${sources[index].description}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: defPadding * 4,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
