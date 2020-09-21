import 'dart:convert';

import 'package:covid19_virus_tracker/Models/global_cases.dart';
import 'package:covid19_virus_tracker/Models/country_model.dart';
import 'package:covid19_virus_tracker/Models/news_model.dart';
import 'package:covid19_virus_tracker/Services/Api/http_exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient() {
    fetchCountryCases();
    // fetchCurrentNews();
  }
  static const VIRUSAPI = "https://api.thevirustracker.com/free-api?";
  static const APIKEY = "4fd750b52c7345fc86d0d07da4c99312";
  static const NEWSAPI =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey";
  final headers = {"": ""};

  Future<NewsModel> fetchCurrentNews() async {
    final url = "$NEWSAPI=$APIKEY";
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        return newsModelFromJson(response.body);
      } else {
        throw Exception("A Error Occured While Fetching current news..");
      }
    });
  }

  // ignore: missing_return
  Future<GlobalCases> fetchCountryData() async {
    try {
      final url = "https://api.covid19api.com/summary";
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        Map<String, dynamic> data = jsonData["Global"];
        var globalCases = GlobalCases.fromJson(data);

        return globalCases;
      } else {
        throw HttpException(
            message: response.body.toString(), statusCode: response.statusCode);
      }
    } catch (e, s) {
      print('The Exception thrown from country api was $e');
      print("the StackTrace was==$s");
    }
  }

  // ignore: missing_return
  Future<CountryCasesModel> fetchCountryCases() async {
    final url = "https://api.covid19api.com/summary";
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var dataFromeWeb = countryCasesModelFromJson(response.body);
        return dataFromeWeb;
      } else {
        throw HttpException(
            message:
                "The Error Infetching Country Cases=${jsonDecode(response.body)}",
            statusCode: response.statusCode);
      }
    } catch (e) {
      print("The Error Caught was $e");
    }
  }
}
// "articles": List<dynamic>.from(articles.map((x) => x.toJson())),

// {"Country":"Afghanistan","CountryCode":"AF","Slug":"afghanistan","NewConfirmed":11,"TotalConfirmed":38883,"NewDeaths":1,"TotalDeaths":1437,"NewRecovered":71,"TotalRecovered":32576,"Date":"2020-09-20T00:53:32Z","Premium":{}}
// https://api.covid19api.com/summary,https://api.covid19api.com/countries
// onChanged(value){
// value=value.toLowerCase()
// countryList=oldCountryList.where(virus){
// var kcountry=virus.country.toLowerCase()
// return kcountry.contains(value)
//.toList()
//
//
//
// }
