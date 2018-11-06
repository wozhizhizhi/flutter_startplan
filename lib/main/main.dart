import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starforparents/main/HomePage.dart';
import 'package:flutter_starforparents/main/BooksPage.dart';
import 'package:flutter_starforparents/main/UserPage.dart';
import 'package:flutter_starforparents/main/GuidePage.dart';
import 'package:flutter_starforparents/pages/Splash.dart';
import 'package:flutter_starforparents/pages/LoginPage.dart';
import 'package:flutter_starforparents/pages/Registeredpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "悦读教师端",
      theme: defaultTargetPlatform == TargetPlatform.android
          ? new ThemeData(
              primaryColor: Colors.blue, primaryColorLight: Colors.lightBlue)
          : new ThemeData(
              primaryColor: Colors.blue, primaryColorLight: Colors.lightBlue),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage(),
        '/BooksPage': (BuildContext context) => new BooksPage(),
        '/UserPage': (BuildContext context) => new UserPage(),
        '/GuidePage': (BuildContext context) => new GuidePage(),
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/RegisteredPage': (BuildContext context) => new RegisteredPage(),
      },
      home: new Splash(),
    );
  }
}
