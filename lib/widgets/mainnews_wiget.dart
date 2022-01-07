import 'package:flutter/material.dart';
import 'package:futures_app/models/articles_model.dart';

import '../news_detail_screen.dart';

Widget Mainnews(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailScreen(article: article),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  article.urlToImage.toString(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Text(
                  article.source!.name.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(article.publishedAt!.toLocal().toString())
            ],
          ),
          const SizedBox(
            height: 8.5,
          ),
          Text(
            article.title as String,
            style: const TextStyle(fontSize: 18
                // color: Colors.white10,
                ),
          ),
        ],
      ),
    ),
  );
}
