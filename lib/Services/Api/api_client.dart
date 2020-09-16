import 'package:covid19_virus_tracker/Models/general_data_model.dart';
import 'package:covid19_virus_tracker/Models/news_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient() {
    // fetchCurrentNews();
  }
  static const VIRUSAPI = "https://api.thevirustracker.com/free-api?";
  static const APIKEY = "4fd750b52c7345fc86d0d07da4c99312";
  static const NEWSAPI =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey";
  final headers = {"": ""};
  Future<GeneralDataModel> getAllCountryData() async {
    final url = "$VIRUSAPI/global=stats";
    return await http.get(url).then((response) {
      if (response.statusCode == 200) {
        // var data = generalDataModelFromJson(response.body);
        // print(data);

        // print(data.results[0].totalCases);
        print(response.body);
        return generalDataModelFromJson(response.body);
      } else {
        throw Exception("An Error Occured While Processing......");
      }
    });
  }

  Future<NewsModel> fetchCurrentNews() async {
    final url = "$NEWSAPI=$APIKEY";
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        print(response.body);
        return newsModelFromJson(response.body);
      } else {
        throw Exception("A Error Occured While Fetching current news..");
      }
    });
  }
}
