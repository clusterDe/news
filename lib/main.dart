import 'package:flutter/material.dart';
import 'package:news/providers/home/home_provider.dart';
import 'package:news/theme.dart';
import 'package:provider/provider.dart';

import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => HomeProvider(),
      child: MaterialApp.router(
        title: 'News',
        theme: DataTheme.themeData(),
        routerDelegate: MyRoute.route.routerDelegate,
        routeInformationParser: MyRoute.route.routeInformationParser,
        routeInformationProvider: MyRoute.route.routeInformationProvider,
      ),
    );
  }
}
