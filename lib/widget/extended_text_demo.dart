import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:extended_text_field/extended_text_field.dart';

class ExtendedTextDemo extends StatefulWidget {
  @override
  createState() => ExtendedTextDemoState();
}

class ExtendedTextDemoState extends State<ExtendedTextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('ExtendedTextDemo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ExtendedTextField(
          maxLines: 1000,
         decoration: InputDecoration(
           hintText: "test text",
         ),
        ),
      ),
    );
  }
}