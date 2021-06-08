import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class TopBarPage extends StatefulWidget {

  @override
  createState() => TopBarPageState();
}

class TopBarPageState extends State<TopBarPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _items;
  List _httpItems;

  @override
  Widget build(BuildContext context) {
    print("_httpItems is " + _httpItems.toString());
    return new Scaffold(
      appBar: new AppBar(
        title: Text('TopBarPage'),
        bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                text: "page1",
              ),
              new Tab(
                text: "page2",
              ),
             ],
          controller: _tabController,),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('${_items[index]}'),
                  );
                }),
            new ListView.builder(
                itemCount: _httpItems == null ? 0 : _httpItems.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('${_httpItems[index]["title"]}'),
                  );
                }),
          ]),

    );

  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _items = List.generate(100, (i) => "item $i");
    loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  loadData() async {
    print("http get data");
    var dataUri = Uri.https('jsonplaceholder.typicode.com', 'posts');
    http.Response response = await http.get(dataUri);
    if(response.statusCode == 200) {
      setState(() {
        _httpItems = json.decode(response.body);
        print("http items count is " + _httpItems.length.toString());
      });
    } else {
      print("http request result is " + response.statusCode.toString());
    }
  }
}