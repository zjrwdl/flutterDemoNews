import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/web/github/home_page.dart';

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  // static const String defaultRoute = routes.defaultRoute;

  @override
  Widget build(BuildContext context) {
    print("testtest WebApp build");
    return MaterialApp(
      restorationScopeId: 'web_app',
      title: 'WebApp',
      // initialRoute: CraneApp.defaultRoute,
      // routes: {
      //   CraneApp.defaultRoute: (context) => const GithubHomepage(),
      // },
      home: GithubHomepage(),
    );
  }
}