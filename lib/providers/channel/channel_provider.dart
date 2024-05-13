import 'package:flutter/material.dart';
import 'package:news/helper/api_helper.dart';
import 'package:news/models/error/error_model.dart';
import 'package:news/models/news/news_model.dart';
import 'package:provider/provider.dart';

import '../../models/news_channel/data_channel.dart';
import '../../screen/news_detail/news_detail_screen.dart';
import '../news_detail/news_detail_provider.dart';

enum ResultGetNewsByChannelState { loading, noData, hasData, error }

class ChannelProvider extends ChangeNotifier {
  ChannelProvider({DataChannel? data}) {
    getDataChannel(data: data);
    getNewsByChannel();
  }

  // ------------------ DATA CHANNEL -------------------

  DataChannel? _dataChannel;
  DataChannel? get dataChannel => _dataChannel;

  getDataChannel({DataChannel? data}) {
    _dataChannel = data;
    notifyListeners();
  }

  // ------------------------- GET NEWS BY CHANNEL -------------------

  NewsModel? _dataNews;
  NewsModel? get dataNews => _dataNews;

  ResultGetNewsByChannelState? _stateGetNewsByChannel;
  ResultGetNewsByChannelState? get stateGetNewsByChannel =>
      _stateGetNewsByChannel;

  String _msgGetNewsByChannel = '';
  String get msgGetNewsByChannel => _msgGetNewsByChannel;

  getNewsByChannel() async {
    try {
      _stateGetNewsByChannel = ResultGetNewsByChannelState.loading;
      notifyListeners();

      var resultData = await ApiHelper.getNewsBySource(
        source: '${_dataChannel?.id}',
      );

      var newsModel = NewsModel.fromMap(resultData);

      if (newsModel.status != 'ok') {
        var errorModel = ErrorModel.fromMap(resultData);

        _msgGetNewsByChannel = '${errorModel.message}';
        notifyListeners();

        _stateGetNewsByChannel = ResultGetNewsByChannelState.noData;
        notifyListeners();
      } else {
        _dataNews = newsModel;
        notifyListeners();

        _msgGetNewsByChannel = '${newsModel.status}';
        notifyListeners();

        _stateGetNewsByChannel = ResultGetNewsByChannelState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _msgGetNewsByChannel = '$e';
      notifyListeners();

      _stateGetNewsByChannel = ResultGetNewsByChannelState.error;
      notifyListeners();
    }
  }

  // --------------- GOTO NEWS DETAIL --------------------

  goToNewsDetail(BuildContext context, {int? index}) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => ChangeNotifierProvider.value(
        value: NewsDetailProvider(dataArticle: _dataNews?.articles?[index!]),
        child: const NewsDetailScreen(),
      ),
    );
  }
}
