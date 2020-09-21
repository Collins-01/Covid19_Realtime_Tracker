import 'package:covid19_virus_tracker/Models/country_model.dart';
import 'package:covid19_virus_tracker/Services/Notifiers/Api_Notifier.dart';
import 'package:covid19_virus_tracker/ViewModels/country_view_model.dart';
import 'package:covid19_virus_tracker/Views/Widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  TextEditingController searchController = TextEditingController();
  ApiNotifier _apiNotifier = ApiNotifier();
  List<Country> allResult = [];
  List<Country> resultList = [];
  Future<List<Country>> countryCases;
  @override
  void initState() {
    super.initState();
    searchController.addListener(onEventChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(onEventChanged);
    searchController.dispose();
    super.dispose();
  }

  onEventChanged() {
    searchCalled();
    print(searchController.text);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    countryCases = fetchCountryCases();
  }

  searchCalled() {
    List<Country> tempList = [];
    if (searchController.text != "") {
      // we have a search params
      for (var item in allResult) {
        var country = item.country.toLowerCase();
        if (country.contains(searchController.text.toLowerCase())) {
          tempList.add(item);
        }
      }
    } else {
      tempList = List.from(allResult);
    }
    setState(() {
      resultList = tempList;
    });
  }

  Future<List<Country>> fetchCountryCases() async {
    var data = await _apiNotifier.fetchCountryCases();
    setState(() {
      allResult = data.countries;
    });
    searchCalled();
    return data.countries;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text("Infected Countries", style: GoogleFonts.grenze()),
            centerTitle: true,
            bottom: PreferredSize(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(LineIcons.search),
                      border: InputBorder.none,
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(top: 10, left: 12),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(80)),
          ),
          body: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (BuildContext context, int index) {
                return CountryCard(
                  newCases: resultList[index].newConfirmed,
                  country: resultList[index].country,
                  totalCases: resultList[index].totalConfirmed,
                  totalDeaths: resultList[index].totalDeaths,
                  totalRecovery: resultList[index].totalRecovered,
                );
              })),
    );
  }
}
