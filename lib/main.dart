import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/widget/anim/curve_fly_anim.dart';
import 'package:flutter_news_app/widget/anim/offset_anim.dart';
import 'package:flutter_news_app/widget/anim/shake_anim.dart';
import 'package:flutter_news_app/widget/listview_fenye.dart';
import 'package:flutter_news_app/widget/top_bar_page.dart';
import 'dart:async';
import 'package:bugly_crash/bugly.dart';
import 'package:bugly_crash/buglyLog.dart';
import 'dart:io';

/*void main() {
  runApp(MyApp());
}*/

Future<Null> main() async {
  //一、这里配置上报APP未捕获到的异常，业务可以自由决定上报的信息
  FlutterError.onError = (FlutterErrorDetails details) async {
    print("zone current print error");
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  runZonedGuarded<Future<Null>>(() async {
    runApp(MyApp());
  }, (error, stackTrace) async {
    String type = "flutter uncaught error";
    Map<String,String> extraInfo = {"key1":"value1","key2":"value2","key3":"value1"};
    await Bugly.postException(type:type,error: error.toString(),stackTrace: stackTrace.toString(),extraInfo:extraInfo);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    initPlatformState();
    if(Platform.isAndroid){
      initBuglyAndroid();
    }else if(Platform.isIOS){
      initBuglyIos();
    }
  }

  void initBuglyAndroid(){
    //Bugly.setAndroidServerUrl(url: "https://xxxx");
    Bugly.initAndroidCrashReport(appId:"c50a711298",isDebug: false);
    Bugly.setUserId(userId:"androiduser");
    //如果遇到AndroidId采集隐私问题，可以参考https://github.com/BuglyDevTeam/Bugly-Android-Demo
    Bugly.setAndroidDeviceId(deviceId: "test");
    Bugly.setUserSceneTag(userSceneTag: 111437);
    Bugly.setAppVersion(appVersion:"1.9.3");
    Bugly.setAndroidAppChannel(appChannel: "test");
    //bugly自定义日志,可在"跟踪日志"页面查看
    BuglyLog.d(tag:"bugly",content:"debugvalue");
    BuglyLog.i(tag:"bugly",content:"infovalue");
    BuglyLog.v(tag:"bugly",content:"verbosevalue");
    BuglyLog.w(tag:"bugly",content:"warnvalue");
    BuglyLog.e(tag:"bugly",content:"errorvalue");
    //自定义map参数 可在"跟踪数据"页面查看
    Bugly.putUserData(userKey:"userkey1",userValue:"uservalue1");
    Bugly.putUserData(userKey:"userkey2",userValue:"uservalue2");
  }

  void initBuglyIos(){
    //Bugly.initIosCrashReport(appId:"87654c7bfa",debugMode: true,serverUrl: "");
    Bugly.initIosCrashReport(appId:"87654c7bfa",debugMode: true);
    Bugly.setUserSceneTag(userSceneTag: 116852);
    Bugly.setAppVersion(appVersion:"1.9.2");
    Bugly.putUserData(userKey:"userkey1",userValue:"uservalue1");
    Bugly.setUserId(userId:"iosuser");
    BuglyLog.d(tag:"bugly",content:"debugvalue");
    BuglyLog.i(tag:"bugly",content:"infovalue");
    BuglyLog.w(tag:"bugly",content:"warnvalue");
    BuglyLog.v(tag:"bugly",content:"verbosevalue");
    BuglyLog.e(tag:"bugly",content:"errorvalue");
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Bugly.platformVersion;
    } on PlatformException{
      platformVersion = 'Failed to get platform version.';
    }


    //(1)测试APP自己捕获到的异常上报
    try {
      var list = [1,2];
      list[3] = 1;
    } catch (e){
      String type = "flutter caught error";
      Map<String,String> extraInfo = {"key1":"value1","key2":"value2","key3":"value1"};
      await Bugly.postException(type:type,error:"null exception",stackTrace:e.toString(),extraInfo:extraInfo);
    }

    //(2)测试APP未捕获到的异常上报
    //throw 'bugly flutter uncaught error test';
    var list = [1,2];
    list[3] = 1;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body:
      new AvartarBubbleAnim(avartarList: ["https://img0.baidu.com/it/u=2553242400,2080369090&fm=26&fmt=auto","https://img0.baidu.com/it/u=3872011780,2725169074&fm=26&fmt=auto","https://img2.baidu.com/it/u=1813115944,1577678930&fm=26&fmt=auto"],),
    );
  }
}
