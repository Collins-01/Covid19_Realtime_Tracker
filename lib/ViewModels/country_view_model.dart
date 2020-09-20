import 'package:covid19_virus_tracker/Models/kmodel.dart';
import 'package:covid19_virus_tracker/Services/Notifiers/Api_Notifier.dart';
import 'package:covid19_virus_tracker/Views/Widgets/country_card.dart';
import 'package:covid19_virus_tracker/Views/Widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryViewModel with ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  ApiNotifier _apiNotifier = ApiNotifier();
  List<Country> searchList = [];
  List<Country> countryList = [];

  Future<CountryCasesModel> fetchCountryModel() async {
    var data = await _apiNotifier.fetchCountryCases();
    return data;
  }

  onChanged(String value) {
    value = value.toLowerCase();
    searchList = searchList.where((item) {
      var countryName = item.country.toLowerCase();
      return countryName.contains(value);
    }).toList();
    notifyListeners();
  }

  Widget buildCountryModelBody() {
    return FutureBuilder<CountryCasesModel>(
        future: fetchCountryModel(),
        builder:
            (BuildContext contex, AsyncSnapshot<CountryCasesModel> snapshot) {
          if (snapshot.hasData) {
            List<Country> tempList = snapshot.data.countries;
            notifyListeners();

            if (searchController.text == "") {
              tempList = countryList;
              notifyListeners();
            } else {
              tempList = searchList;
              notifyListeners();
            }
            return ListView.builder(
                itemCount: tempList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CountryCard(
                    totalCases: tempList[index].totalConfirmed,
                    totalDeaths: tempList[index].totalDeaths,
                    totalRecovery: tempList[index].totalRecovered,
                    country: tempList[index].country,
                  );
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Loading();
          }
          return Loading();
        });
  }
}
