import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/constant.dart';
import 'package:news/helper/api_helper.dart';
import 'package:news/models/error/error_model.dart';
import 'package:news/screen/channel/channel_screen.dart';

import '../../models/news_channel/data_channel.dart';
import '../../models/news_channel/news_channel_model.dart';

enum ResultGetNewsChannelState { loading, noData, hasData, error }

class NewsChannelProvider extends ChangeNotifier {
  NewsChannelProvider() {
    getNewsChannel();
    _searchCtrl = TextEditingController();
  }

  // ---------------- SEARCH CONTROLLER --------------------

  TextEditingController? _searchCtrl;
  TextEditingController? get searchCtrl => _searchCtrl;

  search() {
    var list = _dataNewsChannel?.sources?.where((e) {
      var name = e.name?.toLowerCase();
      var contains = name?.contains(_searchCtrl!.text);

      return contains!;
    }).toList();

    _filterNewsChannel = list;
    notifyListeners();
  }

  // ----------------- FILTER --------------------

  List<DataChannel>? _filterNewsChannel = [];
  List<DataChannel>? get filterNewsChannel => _filterNewsChannel;

  // ---------------- GET ALL NEWS CHANNEL ------------------

  NewsChannelModel? _dataNewsChannel;
  NewsChannelModel? get dataNewsChannel => _dataNewsChannel;

  ResultGetNewsChannelState? _stateGetNewsChannel;
  ResultGetNewsChannelState? get stateGetNewsChannel => _stateGetNewsChannel;

  String _msgGetNewsChannel = '';
  String get msgGetNewsChannel => _msgGetNewsChannel;

  getNewsChannel() async {
    try {
      _stateGetNewsChannel = ResultGetNewsChannelState.loading;
      notifyListeners();

      var resultData = await ApiHelper.getAllNewsChannel();

      var newsChannelModel = NewsChannelModel.fromMap(resultData);

      if (newsChannelModel.status != 'ok') {
        var errorModel = ErrorModel.fromMap(resultData);

        _msgGetNewsChannel = '${errorModel.message}';
        notifyListeners();

        _stateGetNewsChannel = ResultGetNewsChannelState.noData;
        notifyListeners();
      } else {
        _dataNewsChannel = newsChannelModel;
        notifyListeners();

        _msgGetNewsChannel = '${newsChannelModel.status}';
        notifyListeners();

        _stateGetNewsChannel = ResultGetNewsChannelState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _msgGetNewsChannel = '$e';
      notifyListeners();

      _stateGetNewsChannel = ResultGetNewsChannelState.error;
      notifyListeners();
    }
  }

  // ------------------- SEARCH CHANNEL -----------------

  bool _showSearch = false;
  bool get showSearch => _showSearch;

  searchChannel() {
    if (_showSearch) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defPadding),
          child: TextFormField(
            controller: _searchCtrl,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: defPadding),
              hintText: 'Search',
            ),
            onChanged: (value) {
              search();
            },
          ),
        ),
      );
    } else {
      return null;
    }
  }

  btnSearch() {
    _showSearch = !_showSearch;
    notifyListeners();

    _filterNewsChannel?.clear();
    _searchCtrl?.clear();
    notifyListeners();
  }

  // ------------------ GOTO CHANNEL -------------------

  goToChannel(BuildContext context, {required DataChannel data}) {
    context.goNamed(
      ChannelScreen.routeName,
      extra: data,
    );
  }
}
