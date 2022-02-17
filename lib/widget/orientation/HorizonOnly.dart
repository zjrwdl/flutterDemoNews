import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:flutter/services.dart';

class HorizonOnly extends StatefulWidget {

  @override
  createState() => HorizonOnlyState();
}

class HorizonOnlyState extends State<HorizonOnly> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Catalog'),
      ),
      body: Text("test"),
    );

  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //强制横屏
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //强制横屏
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

}