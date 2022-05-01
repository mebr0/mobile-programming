import 'package:dio/dio.dart';
import 'package:lab3/models/news.dart';

class NewsService {
  static String apiKey = "83e5dafad0184cf2a7c6e06ff7a33f38";
  String headlinesURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  late Dio _dio;

  NewsService() {
    _dio = Dio();
  }

  Future<List<News>> listAllNews() async {
    try {
      Response res = await _dio.get(headlinesURL);
      NewsResponse body = NewsResponse.fromJson(res.data);
      return body.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  Future<List<News>> listNewsByCategory(String category) async {
    try {
      Response res = await _dio.get(headlinesURL + "&category=$category");
      NewsResponse body = NewsResponse.fromJson(res.data);
      return body.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}