import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/constant.dart';
import 'package:news/screen/home/home_screen.dart';
import 'package:news/screen/news_channel/news_channel_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterLogo(
                  size: defPadding * 5,
                ),
                const Text('My News'),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                onTap: () {
                  context.pop();
                  context.goNamed(HomeScreen.routeName);
                },
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  context.pop();
                  context.goNamed(NewsChannelScreen.routeName);
                },
                title: const Text('News Channel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
