import 'package:flutter/material.dart';

import 'models/articles_model.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key, this.article}) : super(key: key);

  final Article? article;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var dsc = article?.content;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('News'),
          centerTitle: true,
        ),
        body: Container(
          // padding: const EdgeInsets.all(30.0),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(article!.urlToImage as String),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: width * 0.95,
                child: Text(
                  article?.title as String,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: height * 0.03),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    article?.source?.name as String,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
                padding: EdgeInsets.all(10),
                width: width * 0.95,
                child: Text('$dsc',
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, height: 1.8),
                    textAlign: TextAlign.justify),
              )
            ],
          ),
        ),
      ),
    );
  }
}
