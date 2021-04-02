import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_mobile/models/news.dart';
import 'package:news_mobile/services/news_service.dart';

class MyNews extends StatefulWidget {
  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  List<News> _allNews = List.empty(growable: true);

  _getNews() async {
    final _newsService = NewsService();
    var _result = await _newsService.getAllNews();
    print(_result.body);
    var news = json.decode(_result.body);
    setState(() {
      for (var n in news['news']) {
        var model = News();
        model.id = n['id'];
        model.title = n['title'];
        model.imageUrl = "http://10.0.2.2:3000" + n['news_photo'];
        _allNews.add(model);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: ListView.builder(
                itemCount: _allNews.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(_allNews[index].imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _allNews[index].title,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                })));
  }
}
