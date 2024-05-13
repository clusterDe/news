import 'package:flutter/material.dart';
import 'package:news/constant.dart';
import 'package:news/extensions/string_extension.dart';
import 'package:news/helper/api_helper.dart';
import 'package:news/models/category/category_model.dart';
import 'package:news/models/error/error_model.dart';
import 'package:news/models/news/news_model.dart';
import 'package:news/providers/news_detail/news_detail_provider.dart';
import 'package:news/screen/news_detail/news_detail_screen.dart';
import 'package:provider/provider.dart';

enum ResultGetTopHeadlineState { loading, noData, hasData, error }

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    generateCategory();
    getTopHeadline();
  }

  // ---------------- GENERATE CATEGORY -------------------

  CategoryModel? _selectedCategory;
  CategoryModel? get selectedCategory => _selectedCategory;

  List<CategoryModel>? _listCategory;
  List<CategoryModel>? get listCategory => _listCategory;

  generateCategory() {
    var list = [
      CategoryModel(
        name: categoryBusiness.capitalizeEachWord,
        value: categoryBusiness,
        selected: true,
      ),
      CategoryModel(
        name: categoryEntertain.capitalizeEachWord,
        value: categoryEntertain,
        selected: false,
      ),
      CategoryModel(
        name: categoryGeneral.capitalizeEachWord,
        value: categoryGeneral,
        selected: false,
      ),
      CategoryModel(
        name: categoryHealth.capitalizeEachWord,
        value: categoryHealth,
        selected: false,
      ),
      CategoryModel(
        name: categoryScience.capitalizeEachWord,
        value: categoryScience,
        selected: false,
      ),
      CategoryModel(
        name: categorySport.capitalizeEachWord,
        value: categorySport,
        selected: false,
      ),
      CategoryModel(
        name: categoryTechnology.capitalizeEachWord,
        value: categoryTechnology,
        selected: false,
      ),
    ];

    _listCategory = list;
    _selectedCategory = list[0];
    notifyListeners();
  }

  // ----------- CHANGE VALUE --------------

  changeValue({int? index}) {
    _listCategory?.map((e) {
      var result = e.selected == true;
      if (result) {
        e.selected = false;
      } else {
        _listCategory?[index!].selected = true;
      }
      notifyListeners();
    }).toList();

    _selectedCategory = _listCategory?[index!];
    notifyListeners();

    getTopHeadline();
  }

  // ------------ GET TOP HEADLINE ------------------

  NewsModel? _dataNews;
  NewsModel? get dataNews => _dataNews;

  ResultGetTopHeadlineState? _stateGetTopHeadline;
  ResultGetTopHeadlineState? get stateGetTopHeadline => _stateGetTopHeadline;

  String _msgGetTopHeadline = '';
  String get msgGetTopHeadline => _msgGetTopHeadline;

  getTopHeadline() async {
    try {
      _stateGetTopHeadline = ResultGetTopHeadlineState.loading;
      notifyListeners();

      var resultData = await ApiHelper.getTopHeadlineByCategory(
        category: '${_selectedCategory?.value}',
      );

      var newsModel = NewsModel.fromMap(resultData);

      if (newsModel.status != 'ok') {
        var errorModel = ErrorModel.fromMap(resultData);

        _msgGetTopHeadline = '${errorModel.message}';
        notifyListeners();

        _stateGetTopHeadline = ResultGetTopHeadlineState.noData;
        notifyListeners();
      } else {
        _dataNews = newsModel;
        notifyListeners();

        _msgGetTopHeadline = '${newsModel.status}';
        notifyListeners();

        _stateGetTopHeadline = ResultGetTopHeadlineState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _msgGetTopHeadline = '${e}';
      notifyListeners();

      _stateGetTopHeadline = ResultGetTopHeadlineState.error;
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
