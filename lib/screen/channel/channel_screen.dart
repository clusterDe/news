import 'package:flutter/material.dart';
import 'package:news/providers/channel/channel_provider.dart';
import 'package:provider/provider.dart';

import 'components/channel_body.dart';

class ChannelScreen extends StatelessWidget {
  static const String routeName = 'channel';
  const ChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ChannelProvider>(
          builder: (context, channelProv, _) {
            return Text('${channelProv.dataChannel?.name}');
          },
        ),
      ),
      body: const ChannelBody(),
    );
  }
}
