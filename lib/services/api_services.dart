import 'dart:convert';
import 'package:http/http.dart';

import '/models/articles_model.dart';

class ServiceApi {
  final endPointUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2021-12-06&sortBy=publishedAt&apiKey=79997428015446eba5a681acfcb4516e';

  Future<List<Article>> getArticle() async {
    var newsModel = null;

    try {
      Response res = await get(Uri.parse(endPointUrl));
      //print('got here  again too');

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];

        List<Article> newsModel =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return newsModel;
      }
      print('respons is : ${res.statusCode}');

      //else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load album');
      //  }
    } catch (Exception) {
      return newsModel;
    }
    throw Exception('Failed to load album');
  }
}
