import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tencent_flutter_devtools/tencent_flutter_devtools.dart';
import 'static_holder_test.dart';

class MemLeakExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemLeakExamplePageState();
  }
}

class _MemLeakExamplePageState extends State<MemLeakExamplePage> {
  @override
  void initState() {
    super.initState();
    // 静态持有
    StaticHolderTest.hold(this);
    // 单例持有
    SingleInstanceHolderTest.sigleton.hold(this);
    // 超过页面生命周期持有
    Timer(Duration(seconds: 10), () {
      print('hello timer callback hold context: $this');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('内存泄漏示例')),
      body: Center(
        child: Text('返回之后当前页面泄漏'),
      ),
    );
  }
}
