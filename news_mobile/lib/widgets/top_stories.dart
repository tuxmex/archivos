import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_mobile/models/news.dart';
import 'package:news_mobile/services/news_service.dart';

class TopStories extends StatefulWidget {
  @override
  _TopStoriesState createState() => _TopStoriesState();
}

class _TopStoriesState extends State<TopStories> {
  News _featuredNews = new News();

  @override
  void initState() {
    super.initState();
    _getFeaturedNews();
  }

  _getFeaturedNews() async {
    final _newsService = NewsService();
    var _result = await _newsService.getFeaturedNews();
    print(_result.body);
    var featuredNews = json.decode(_result.body);

    setState(() {
      _featuredNews.id = featuredNews['news']['id'];
      _featuredNews.title = featuredNews['news']['title'];
      _featuredNews.imageUrl =
          "http://192.168.1.73:3000" + featuredNews['news']['news_photo'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(_featuredNews.imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _featuredNews.title,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
