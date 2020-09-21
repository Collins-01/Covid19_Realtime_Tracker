import 'package:covid19_virus_tracker/Models/global_cases.dart';
import 'package:covid19_virus_tracker/Models/country_model.dart';
import 'package:covid19_virus_tracker/Models/news_model.dart';
import 'package:covid19_virus_tracker/Services/Api/api_client.dart';
import 'package:flutter/cupertino.dart';

class ApiNotifier extends ChangeNotifier {
  ApiClient _apiClient = ApiClient();

  Future<NewsModel> fetchCurrentNews() async {
    var news = await _apiClient.fetchCurrentNews();
    notifyListeners();
    return news;
  }

  Future<GlobalCases> fetchGlobalCases() async {
    var data = await _apiClient.fetchCountryData();
    notifyListeners();
    return data;
  }

  Future<CountryCasesModel> fetchCountryCases() async {
    var data = await _apiClient.fetchCountryCases();
    notifyListeners();
    return data;
  }
}
