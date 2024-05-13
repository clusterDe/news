import 'package:flutter/material.dart';
import 'package:news/widget/consumer_state/consumer_state_date.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../../../providers/home/home_provider.dart';
import '../../../widget/card_news/card_news_widget.dart';

class TopHeadlineSection extends StatelessWidget {
  const TopHeadlineSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConsumerStateData<HomeProvider>(
      state: context.watch<HomeProvider>().stateGetTopHeadline!,
      enumValue: ResultGetTopHeadlineState.values,
      message: context.watch<HomeProvider>().msgGetTopHeadline,
      builder: (context, homeProv, _) {
        var article = homeProv.dataNews?.articles;
        if (article!.isNotEmpty) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: article.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CardNewsWidget(
                press: () {
                  homeProv.goToNewsDetail(
                    context,
                    index: index,
                  );
                },
                urlImage: '${article[index].urlToImage}',
                title: article[index].title ?? 'None',
                author: article[index].author ?? 'None',
                date: article[index].publishedAt ?? 'None',
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
