import 'source_model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? discription;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.discription,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        discription: json['discription'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.parse(json['publishedAt']),
        content: json['content'],
      );
}
