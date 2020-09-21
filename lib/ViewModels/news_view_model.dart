import 'package:covid19_virus_tracker/Models/news_model.dart';
import 'package:covid19_virus_tracker/Services/Notifiers/Api_Notifier.dart';
import 'package:covid19_virus_tracker/Views/Widgets/loading.dart';
import 'package:covid19_virus_tracker/Views/Widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier {
  ApiNotifier _apiNotifier = new ApiNotifier();
  bool _loading = false;
  bool get loading => _loading;

  Future<NewsModel> fetchCurrentNews() async {
    _loading = true;
    notifyListeners();
    var news = await _apiNotifier.fetchCurrentNews().whenComplete(() {
      _loading = false;
      notifyListeners();
    });
    return news;
  }

  Widget buildNewsBody() {
    return FutureBuilder<NewsModel>(
        future: _apiNotifier.fetchCurrentNews(),
        builder: (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasError) {
            return Loading();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Loading();
          }
          return snapshot.data == null
              ? Loading()
              : ListView.separated(
                  itemBuilder: (BuildContext cotext, int index) {
                    var news = snapshot.data.articles[index];
                    return snapshot.hasData
                        ? NewsCard(
                            name: news.source.name,
                            content: news.content,
                            description: news.description,
                            publishedAt: news.publishedAt,
                            title: news.title,
                            url: news.url,
                            urlToImage: news.urlToImage,
                          )
                        : Center(child: Text("Loading....."));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: snapshot.data.articles.length);
        });
  }
}
