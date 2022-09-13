import 'package:flutter/material.dart';
import 'package:flutter_news_app/web/github/nav_bar.dart';

class GithubHomepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GithubHomepageState();
  }

}

class GithubHomepageState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///第一页
            Container(
              height: 800,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

