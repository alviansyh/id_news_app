import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:id_news_app/data/models/article.dart';

class ApiService {
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = '7f1f710bf3a44bacb31688e0d50abccc';
  static final String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(_baseUrl + "top-headlines?apiKey=$_apiKey&country=$_country");

    if(response.statusCode == 200){
      return ArticleResult.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load top headlines');
    }
  }
}