// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/helper/datetime_helper.dart';
import 'package:news/widget/cache_image/cache_image.dart';

class CardNewsWidget extends StatelessWidget {
  const CardNewsWidget({
    super.key,
    this.title,
    this.date,
    this.author,
    this.urlImage,
    this.press,
  });

  final String? title;
  final String? date;
  final String? author;
  final String? urlImage;
  final VoidCallback? press;

  String? formatDateTime() {
    if (date != null) {
      return DateTimeHelper.formatToString(date: '$date');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(defBorderRadius),
      child: SizedBox(
        width: 130,
        height: 130,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defBorderRadius),
              ),
              child: CacheImage(
                url: '$urlImage',
              ),
            ),
            SizedBox(width: defPadding),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author ?? 'None',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    title ?? 'None',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    formatDateTime() ?? 'None',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
