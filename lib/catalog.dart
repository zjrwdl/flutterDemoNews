import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:flutter_news_app/util/Constants.dart';

class Catalog extends StatefulWidget {
  @override
  createState() => CatalogState();
}

class CatalogState extends State<Catalog> {
  List<String> _items = [];
  List? _currentPageItems;

  Future<void> jumpPage(String pageName) async {
    Navigator.pushNamed(context, pageName);
  }

  String getPageName(int i) {
    String name = "";
    switch (i) {
      case 0:
        {
          name = Constants.avatarBubbleAnim;
        }
        break;
      case 1:
        {
          name = Constants.shakeAnim;
        }
        break;
      case 2:
        {
          name = Constants.horizonOnly;
        }
        break;
      case 3:
        {
          name = Constants.longPicture;
        }
        break;
      case 4:
        {
          name = Constants.astDemo;
        }
        break;
      case 5:
        {
          name = Constants.extendedTextDemo;
        }
        break;
      case 6:
        {
          name = Constants.webViewExample;
        }
        break;
      case 7:
        {
          name = Constants.webGithubExample;
        }
        break;
      case 8:
        {
          name = Constants.devToolMemoryLeakExample;
        }
        break;
      case 9:
        {
          name = Constants.devToolSetting;
        }
        break;
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Catalog'),
      ),
      body: new Listener(
          child: new ListView.builder(
        itemCount: _currentPageItems?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(getPageName(index)),
            onTap: () {
              jumpPage(getPageName(index));
            },
          );
        },
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    int size = 10;
    _items = List.generate(size, (i) => "item $i");
    _currentPageItems = [];
    _currentPageItems?.clear();
    for (int i = 0; i < size; i++) {
      _currentPageItems?.add(_items[i]);
    }
    SystemChrome.setPreferredOrientations([
      //强制横屏
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
