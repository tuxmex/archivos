import 'package:flutter/material.dart';
import 'package:news_mobile/widgets/live.dart';
import 'package:news_mobile/widgets/my_news.dart';
import 'package:news_mobile/widgets/popular.dart';
import 'package:news_mobile/widgets/top_stories.dart';
import 'package:news_mobile/widgets/videos.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News Mobile'),
          bottom: TabBar(tabs: [
            Tab(
              child: Text('Top Stories'),
            ),
            Tab(
              child: Text('Video'),
            ),
            Tab(
              child: Text('My News'),
            ),
            Tab(
              child: Text('Popular'),
            ),
            Tab(
              child: Text('Live'),
            ),
          ]),
        ),
        body: TabBarView(
            children: [TopStories(), Videos(), MyNews(), Popular(), Live()]),
      ),
    );
  }
}
