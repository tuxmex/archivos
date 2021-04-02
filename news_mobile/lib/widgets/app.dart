import 'package:flutter/material.dart';
import 'package:news_mobile/helpers/theme_settings.dart';
import 'package:news_mobile/screens/home_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          unselectedWidgetColor: primaryColor, primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}
