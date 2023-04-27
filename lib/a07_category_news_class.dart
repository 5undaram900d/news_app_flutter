

import 'dart:convert';

import 'package:a07_news_app/a08_article_model.dart';
import 'package:http/http.dart' as http;

class A06_CategoryNewsClass{
  List<A08_ArticleModel> news = [];

  getNews(String category) async {
    var link = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=baeb92f9212c4ef9a736e2547ab274ff";
    var url = Uri.parse(link);
    var res = await http.get(url);

    if(res.statusCode==200){
      var data = jsonDecode(res.body.toString());
      data['articles'].forEach((element) {
        if(element['urlToImage'] != null && element['description'] != null) {
          A08_ArticleModel articleModel = A08_ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );

          news.add(articleModel);

        }
      });
    }

  }

}