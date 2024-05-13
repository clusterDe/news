import 'package:flutter/material.dart';

import 'components/category_section.dart';
import '../../widget/drawer_widget/drawer_widget.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('News'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CategorySection(),
        ),
      ),
      body: const HomeBody(),
    );
  }
}
