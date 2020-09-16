import 'package:covid19_virus_tracker/Models/general_data_model.dart';
import 'package:covid19_virus_tracker/Models/news_model.dart';
import 'package:covid19_virus_tracker/Services/Api/api_client.dart';
import 'package:flutter/cupertino.dart';

class ApiNotifier extends ChangeNotifier {
  ApiClient _apiClient = ApiClient();
  Future<GeneralDataModel> getAllCountryData() async {
    var data = await _apiClient.getAllCountryData();
    notifyListeners();
    return data;
  }

  Future<NewsModel> fetchCurrentNews() async {
    var news = await _apiClient.fetchCurrentNews();
    notifyListeners();
    return news;
  }
}
