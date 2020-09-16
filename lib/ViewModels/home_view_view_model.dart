import 'package:covid19_virus_tracker/Models/general_data_model.dart';
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

  Future<GeneralDataModel> onRefresh() async {
    _loading = true;
    notifyListeners();
    var refreshed = await _apiNotifier.getAllCountryData();
    _loading = false;
    notifyListeners();
    return refreshed;
  }

  Widget buildHomePageBody() {
    return FutureBuilder(
        future: _apiNotifier.getAllCountryData(),
        builder:
            // ignore: missing_return
            (BuildContext context, AsyncSnapshot<GeneralDataModel> snapshot) {
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
                  icon: Icon(Icons.arrow_upward),
                  cardTitle: "Total Cases",
                  caseTitle: "Total",
                  currentData: snapshot.data.results[0].totalCases,
                  color: Colors.red,
                  newData: snapshot.data.results[0].totalNewCasesToday,
                  percentChange: ((snapshot.data.results[0].totalCases -
                              snapshot.data.results[0].totalNewCasesToday) /
                          snapshot.data.results[0].totalCases) *
                      100,
                ),
                SizedBox(height: 15),
                GlobalSituationCard(
                  cardTitle: "Recovered Cases",
                  caseTitle: "Recovered",
                  color: Colors.green,
                  currentData: snapshot.data.results[0].totalRecovered,
                  // newData:    data.total,
                  cardColor: CardColors.blue,
                  icon: Icon(Icons.arrow_drop_down),
                  newData: (snapshot.data.results[0].totalNewCasesToday -
                      snapshot.data.results[0].totalNewDeathsToday),
                  percentChange: ((snapshot.data.results[0].totalRecovered -
                              (snapshot.data.results[0].totalNewCasesToday -
                                  snapshot
                                      .data.results[0].totalNewDeathsToday)) /
                          snapshot.data.results[0].totalRecovered) *
                      100,
                ),
                SizedBox(height: 15),
                GlobalSituationCard(
                  cardTitle: "Deaths Cases",
                  caseTitle: "Deaths",
                  color: Colors.red,
                  currentData: snapshot.data.results[0].totalDeaths,
                  newData: snapshot.data.results[0].totalNewDeathsToday,
                  percentChange: ((snapshot.data.results[0].totalDeaths -
                              snapshot.data.results[0].totalNewDeathsToday) /
                          snapshot.data.results[0].totalDeaths) *
                      100,
                  cardColor: CardColors.red,
                  icon: Icon(Icons.arrow_upward),
                ),
                SizedBox(height: 15),
                GlobalSituationCard(
                  cardTitle: "Serious Cases",
                  caseTitle: "Serious",
                  color: Colors.green,
                  currentData: snapshot.data.results[0].totalUnresolved,
                  // newData:    data.total,
                  cardColor: CardColors.cyan,
                  icon: Icon(Icons.arrow_upward),
                  newData: (snapshot.data.results[0].totalNewCasesToday -
                      snapshot.data.results[0].totalNewDeathsToday),
                  percentChange: ((snapshot.data.results[0].totalRecovered -
                              (snapshot.data.results[0].totalNewCasesToday -
                                  snapshot
                                      .data.results[0].totalNewDeathsToday)) /
                          snapshot.data.results[0].totalRecovered) *
                      100,
                ),
                SizedBox(height: 15),
              ],
            ),
          );
        });
  }
}

//
//  if (snapshot.hasData) {
//             final data = snapshot.data.results[0];
// return SingleChildScrollView(
//   child: Column(
//     children: <Widget>[
//       GlobalSituationCard(
//         cardColor: CardColors.green,
//         icon: Icon(Icons.arrow_upward),
//         cardTitle: "Total Cases",
//         caseTitle: "Total",
//         currentData: data.totalCases,
//         color: Colors.red,
//         newData: data.totalNewCasesToday,
//         percentChange:
//             ((data.totalCases - data.totalNewCasesToday) /
//                     data.totalCases) *
//                 100,
//       ),
//       GlobalSituationCard(
//         cardTitle: "Recovered Cases",
//         caseTitle: "Recovered",
//         color: Colors.green,
//         currentData: data.totalRecovered,
//         // newData:    data.total,
//         cardColor: CardColors.blue,
//         icon: Icon(Icons.arrow_drop_down),
//         newData:
//             (data.totalNewCasesToday - data.totalNewDeathsToday),
//         percentChange: ((data.totalRecovered -
//                     (data.totalNewCasesToday -
//                         data.totalNewDeathsToday)) /
//                 data.totalRecovered) *
//             100,
//       ),
//       GlobalSituationCard(
//         cardTitle: "Deaths Cases",
//         caseTitle: "Deaths",
//         color: Colors.red,
//         currentData: data.totalDeaths,
//         newData: data.totalNewDeathsToday,
//         percentChange:
//             ((data.totalDeaths - data.totalNewDeathsToday) /
//                     data.totalDeaths) *
//                 100,
//         cardColor: CardColors.red,
//         icon: Icon(Icons.arrow_upward),
//       ),
//       GlobalSituationCard(
//         cardTitle: "Serious Cases",
//         caseTitle: "Serious",
//         color: Colors.green,
//         currentData: data.totalRecovered,
//         // newData:    data.total,
//         cardColor: CardColors.cyan,
//         icon: Icon(Icons.arrow_upward),
//         newData:
//             (data.totalNewCasesToday - data.totalNewDeathsToday),
//         percentChange: ((data.totalRecovered -
//                     (data.totalNewCasesToday -
//                         data.totalNewDeathsToday)) /
//                 data.totalRecovered) *
//             100,
//       ),
//     ],
//   ),
// );
//           }
