import 'package:flutter/material.dart';
import 'package:sample_blog/pages/account_page.dart';
import 'package:sample_blog/pages/blog_page.dart';
import 'package:sample_blog/pages/home_page.dart';
import 'package:sample_blog/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  _checkAuth() {
    // TODO Implement checking logged in
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var isAuth = _checkAuth();
    if (isAuth)
      return MaterialApp(
        title: 'Sample blog',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/blog': (context) => BlogPage(),
          '/account': (context) => AccountPage()
        },
        home: new LoginPage(),
      );
    else
      return MaterialApp(
        title: 'Sample blog',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/blog': (context) => BlogPage(),
          '/account': (context) => AccountPage()
        },
        home: new LoginPage(),
      );
  }
}
