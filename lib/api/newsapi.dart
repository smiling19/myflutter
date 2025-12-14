import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/news.dart';

class API {
  Future<List<Article>> getNews() async {
    var dio = Dio();
    
    try {
      var response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=f3db104dd4a04dee9fac2db84984bf0d');

      if (response.statusCode == 200) {
        final data = response.data;

        NewsResponse newsResponse = NewsResponse.fromJson(data);

        return newsResponse.articles;
      } else {
        print('Lỗi kết nối: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Có lỗi xảy ra: $e');
      return [];
    }
  }
}

var test_api = API();