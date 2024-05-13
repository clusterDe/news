import 'package:flutter/material.dart';

import '../../models/news/components/data_article.dart';

class NewsDetailProvider extends ChangeNotifier {
  NewsDetailProvider({Article? dataArticle}) {
    getDataNews(data: dataArticle);
  }

  // ----------------- GET DATA NEWS ------------------

  Article? _dataNews;
  Article? get dataNews => _dataNews;

  getDataNews({Article? data}) {
    _dataNews = data;
    notifyListeners();
  }
}
