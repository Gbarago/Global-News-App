import 'package:flutter/material.dart';
import 'package:futures_app/models/articles_model.dart';
import 'package:futures_app/widgets/mainnews_wiget.dart';
import 'package:http/http.dart';
import 'package:futures_app/services/api_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ServiceApi client = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // elevation: 1,
          centerTitle: true,
          title: const Text('Global News Update'),
        ),
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return RefreshIndicator(
                onRefresh: () {
                  return client.getArticle();
                },
                child: ListView.builder(
                    itemCount: articles!.length,
                    itemBuilder: (context, index) =>
                        Mainnews(articles[index], context)),
              );
            }
            print('no data');
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
