import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:flutter/services.dart';

class Catalog extends StatefulWidget {

  @override
  createState() => CatalogState();
}

class CatalogState extends State<Catalog> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> _items = [];
  List? _currentPageItems;

  void jumpPage(int i) {
    switch (i) {
      case 0: {
        Navigator.pushNamed(context, "AvartarBubbleAnim");
      }
      break;
      case 1: {
        Navigator.pushNamed(context, "ShakeAnim");
      }
      break;
      case 2: {
        Navigator.pushNamed(context, "HorizonOnly");
      }
      break;
    }
  }

  String getPageName(int i) {
    String name = "";
    switch (i) {
      case 0: {
        name = "AvartarBubbleAnim";
      }
      break;
      case 1: {
        name = "ShakeAnim";
      }
      break;
      case 2: {
        name = "HorizonOnly";
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
            itemBuilder: (context,index){
              return ListTile(
                title: Text(getPageName(index)),
                onTap:() {
                  jumpPage(index);
                },
              );
            },
          )
      ),

    );

  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    int size = 3;
    _items = List.generate(size, (i) => "item $i");
    _currentPageItems = [];
    _currentPageItems?.clear();
    for(int i = 0; i < size; i++) {
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
    _tabController?.dispose();
    super.dispose();
  }

}