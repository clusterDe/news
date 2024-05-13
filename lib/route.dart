import 'package:go_router/go_router.dart';
import 'package:news/providers/channel/channel_provider.dart';
import 'package:news/providers/news_channel/news_channel_provider.dart';
import 'package:news/screen/channel/channel_screen.dart';
import 'package:news/screen/home/home_screen.dart';
import 'package:news/providers/home/home_provider.dart';
import 'package:news/screen/news_channel/news_channel_screen.dart';
import 'package:provider/provider.dart';

import 'models/news_channel/data_channel.dart';

class MyRoute {
  static GoRouter route = GoRouter(
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: HomeScreen.routeName,
    restorationScopeId: HomeScreen.routeName,
    routes: [
      GoRoute(
        path: HomeScreen.routeName,
        name: HomeScreen.routeName,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: HomeProvider(),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: NewsChannelScreen.routeName,
        name: NewsChannelScreen.routeName,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: NewsChannelProvider(),
          child: const NewsChannelScreen(),
        ),
        routes: [
          GoRoute(
            path: ChannelScreen.routeName,
            name: ChannelScreen.routeName,
            builder: (context, state) {
              var extra = state.extra;
              if (extra is DataChannel) {
                return ChangeNotifierProvider.value(
                  value: ChannelProvider(data: extra),
                  child: const ChannelScreen(),
                );
              }
              return ChangeNotifierProvider.value(
                value: ChannelProvider(),
                child: const ChannelScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
