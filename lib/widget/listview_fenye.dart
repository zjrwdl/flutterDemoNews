import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

class ListviewFenye extends StatefulWidget {

  @override
  createState() => ListviewFenyeState();
}

enum SlideDirection {
  down,
  up
}

class ListviewFenyeState extends State<ListviewFenye> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _items;
  List _currentPageItems;
  int page = 0;
  int onePageItems = 5;
  double lastDownY = 0;
  SlideDirection slipDirection;

  void _getMoreData(SlideDirection direction) async {
    setState(() {
      if (page == 0 && direction == SlideDirection.up) {
        print("slide fail, already in top");
        return;
      }
      if ((page + 1)* onePageItems >= _items.length && direction == SlideDirection.down) {
        print("slide fail, already in bottom");
        return;
      }
      direction == SlideDirection.down ? page++ : page--;
      int start = page * onePageItems;
      _currentPageItems.clear();
      int minNum = _items.length <= onePageItems + start ? _items.length : onePageItems + start;
      for(int i = start; i < minNum; i++) {
        _currentPageItems.add(_items[i]);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ListviewFenye'),
      ),
      body: new Listener(
          onPointerMove: (event) {
            double position = event.position.distance;
            double detal = position - lastDownY;
            if (detal > 0) {
              slipDirection = SlideDirection.up;
            } else {
              slipDirection = SlideDirection.down;
            }
            lastDownY = position;
          },
          onPointerUp: (event) {
            _getMoreData(slipDirection);
          },
          child: new ListView.builder(
            itemCount: _currentPageItems.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text('${_currentPageItems[index]}'),
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
    _items = List.generate(100, (i) => "item $i");
    _currentPageItems = List();
    _currentPageItems.clear();
    for(int i = 0; i < onePageItems; i++) {
      _currentPageItems.add(_items[i]);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}