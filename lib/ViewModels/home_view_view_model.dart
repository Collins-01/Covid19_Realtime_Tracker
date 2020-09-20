import 'package:covid19_virus_tracker/Models/global_cases.dart';
import 'package:covid19_virus_tracker/Services/Notifiers/Api_Notifier.dart';
import 'package:covid19_virus_tracker/Theme/colors.dart';
import 'package:covid19_virus_tracker/Views/Widgets/covid_card.dart';
import 'package:covid19_virus_tracker/Views/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:covid19_virus_tracker/Views/Widgets/error_widget.dart';

class HomeViewViewModel extends ChangeNotifier {
  ApiNotifier _apiNotifier = new ApiNotifier();
  bool _loading = false;
  bool get loading => _loading;

  Future<GlobalCases> onRefresh() async {
    _loading = true;
    notifyListeners();
    var refreshed = await _apiNotifier.fetchGlobalCases();
    _loading = false;
    notifyListeners();
    return refreshed;
  }

  Widget buildHomePageBody() {
    return FutureBuilder<GlobalCases>(
        future: _apiNotifier.fetchGlobalCases(),
        builder:
            // ignore: missing_return
            (BuildContext context, AsyncSnapshot<GlobalCases> snapshot) {
          if (snapshot.hasError) {
            return Error(
              title:
                  "An Error Occured While Loading\n Check Your Internet Connections",
              function: () async {
                await onRefresh();
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Error(
              title:
                  "An Error Occured While Loading\n Check Your Internet Connections",
              function: () async {
                await onRefresh();
              },
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GlobalSituationCard(
                  cardColor: CardColors.green,
                  cardTitle: "Total Cases",
                  caseTitle: "Total",
                  currentData: snapshot.data.totalConfirmed,
                  color: Colors.red,
                  newData: snapshot.data.newConfirmed,
                  percentChange: (snapshot.data.newConfirmed /
                          snapshot.data.totalConfirmed) *
                      100,
                ),
                SizedBox(height: 15),
                GlobalSituationCard(
                  cardTitle: "Recovered Cases",
                  caseTitle: "Recovered",
                  color: Colors.green,
                  currentData: snapshot.data.totalRecovered,
                  // newData:    data.total,
                  cardColor: CardColors.blue,
                  newData: snapshot.data.newRecovered,
                  percentChange: (snapshot.data.newRecovered /
                          snapshot.data.totalRecovered) *
                      100,
                ),
                SizedBox(height: 15),
                GlobalSituationCard(
                  cardTitle: "Deaths Cases",
                  caseTitle: "Deaths",
                  color: Colors.red,
                  currentData: snapshot.data.totalDeaths,
                  newData: snapshot.data.newDeaths,
                  percentChange:
                      (snapshot.data.newDeaths / snapshot.data.totalDeaths) *
                          100,
                  cardColor: CardColors.red,
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
              ],
            ),
          );
        });
  }
}
