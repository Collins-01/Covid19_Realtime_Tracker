import 'package:covid19_virus_tracker/ViewModels/home_view_view_model.dart';
import 'package:covid19_virus_tracker/Views/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewViewModel>.reactive(
      builder: (BuildContext context, model, child) {
        return RefreshIndicator(
          onRefresh: () async {
            model.onRefresh();
          },
          child: model.loading
              ? Loading()
              : SafeArea(
                  child: Scaffold(
                    body: Container(
                      child: model.buildHomePageBody(),
                    ),
                  ),
                ),
        );
      },
      viewModelBuilder: () => HomeViewViewModel(),
    );
  }
}
// ListView(
//                 children: <Widget>[
//                   GlobalSituationCard(
//                     cardTitle: "Total ",
//                     caseTitle: "Total",
//                     color: Colors.green,
//                     currentData: 876590,
//                     newData: 100,
//                     percentChange: ((1000 - 650) / 107) * 100,
//                     cardColor: Colors.green,
//                     icon: Icon(Icons.arrow_upward),
//                   ),
//                   GlobalSituationCard(
//                     cardTitle: "Recovered",
//                     caseTitle: "Recovered",
//                     color: Colors.green,
//                     currentData: 8767890,
//                     newData: 989,
//                     percentChange: ((1000 - 650) / 1065) * 100,
//                     cardColor: Colors.blue,
//                     icon: Icon(Icons.arrow_back),
//                   ),
//                   GlobalSituationCard(
//                     cardTitle: "Death",
//                     caseTitle: "Death",
//                     color: Colors.red,
//                     currentData: 8767890,
//                     newData: 98,
//                     percentChange: ((1000 - 650) / 1065) * 100,
//                     cardColor: Colors.red,
//                     icon: Icon(Icons.arrow_back),
//                   ),

//                   // Center(
//                   //   child: SpinKitChasingDots(
//                   //     color: Colors.pink,
//                   //   ),
//                   // ),
//                 ],
//               ),
