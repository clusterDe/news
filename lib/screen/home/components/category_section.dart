import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProv, _) {
        var listCategory = homeProv.listCategory;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              listCategory!.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: defPadding / 2),
                child: ChoiceChip.elevated(
                  onSelected: (value) {
                    homeProv.changeValue(index: index);
                  },
                  label: Text('${listCategory[index].name}'),
                  selected: listCategory[index].selected!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
