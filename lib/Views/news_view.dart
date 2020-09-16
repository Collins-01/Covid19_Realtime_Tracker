import 'package:covid19_virus_tracker/ViewModels/news_view_model.dart';
import 'package:covid19_virus_tracker/Views/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  // final Function wp
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
        builder: (BuildContext context, model, child) {
          return RefreshIndicator(
              child: model.loading
                  ? Loading()
                  : SafeArea(
                      child: Scaffold(
                      body: Container(
                        child: model.buildNewsBody(),
                      ),
                    )),
              onRefresh: () async {
                await model.fetchCurrentNews();
              });
        },
        viewModelBuilder: () => NewsViewModel());
  }
}
