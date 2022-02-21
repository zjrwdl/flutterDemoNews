import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/ast/GeneralizingAstVisitorLocal.dart';
import 'dart:core';
import 'package:flutter_news_app/ast/GeneralizeAstVisitorDetail.dart';
import 'package:pub_semver/src/version.dart';

class AstDemo extends StatefulWidget {

  @override
  createState() => AstDemoState();
}

class AstDemoState extends State<AstDemo> {

  //生成AST
  Future generate(String path) async {
    if (path.isEmpty) {
      print("No file found");
    } else {
      try {
        //parse file
        // var parseResult =
        // parseFile(path: path, featureSet: FeatureSet.fromEnableFlags2(flags: [],sdkLanguageVersion: Version.none));
        // var compilationUnit = parseResult.unit;
        // //遍历AST
        // var result = compilationUnit.accept(GeneralizingAstVisitorLocal());

        //parst string
        //String content = 'int a = 1 + 2;';
        //ParseStringResult result2 = parseString(content: content);
        ParseStringResult result2 = parseFile(path: path, featureSet: FeatureSet.fromEnableFlags2(flags: [],sdkLanguageVersion: Version.none));
        CompilationUnit unit = result2.unit;
        unit.accept(GeneralizeAstVisitorDetail());

        print("ast data result is :\n${result2.content}");
      } catch (e) {
        print("ast data result fail: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('AstDemo'),
      ),
      body: MaterialButton(
        minWidth: 150,
        height: 150,
        child: const Text('part ast'),
        onPressed: (){
          print("解析dart file 为 ast");
          generate("/Users/rockypzhang/zhp/dev/project/flutter/app/demo/flutterDemoNews/lib/ast/dartFileCase.dart");
        },
      ),
    );

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

}