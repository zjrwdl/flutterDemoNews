import 'package:flutter/material.dart';
import 'package:flutter_news_app/ast/astDemo.dart';
import 'package:flutter_news_app/catalog.dart';
import 'package:flutter_news_app/util/Constants.dart';
import 'package:flutter_news_app/web/github/home_page.dart';
import 'package:flutter_news_app/widget/anim/curve_fly_anim.dart';
import 'package:flutter_news_app/widget/anim/shake_anim.dart';
import 'package:flutter_news_app/widget/extended_text_demo.dart';
import 'package:flutter_news_app/widget/longPicture.dart';
import 'package:flutter_news_app/widget/orientation/HorizonOnly.dart';
import 'package:flutter_news_app/widget/web_view/webview_demo.dart';
import 'dart:async';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn = '';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );
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
      onGenerateRoute: (RouteSettings settings) {
        var name = settings.name;
        print("router name is $name");
        if (name == Constants.avatarBubbleAnim) {
          return MaterialPageRoute(
            builder: (context) {
              return new AvartarBubbleAnim(avartarList: ["https://img0.baidu.com/it/u=2553242400,2080369090&fm=26&fmt=auto","https://img0.baidu.com/it/u=3872011780,2725169074&fm=26&fmt=auto","https://img2.baidu.com/it/u=1813115944,1577678930&fm=26&fmt=auto"],);
            },
          );
        } else if (name == Constants.shakeAnim) {
          return MaterialPageRoute(
            builder: (context) {
              return new ShakeAnim();
            },
          );
        } else if (name == Constants.horizonOnly) {
          return MaterialPageRoute(
            builder: (context) {
              return new HorizonOnly();
            },
          );
        } else if (name == Constants.longPicture) {
          return MaterialPageRoute(
            builder: (context) {
              return new LongPicture();
            },
          );
        } else if (name == Constants.astDemo) {
          return MaterialPageRoute(
            builder: (context) {
              return new AstDemo();
            },
          );
        } else if (name == Constants.extendedTextDemo) {
          return MaterialPageRoute(
            builder: (context) {
              return new ExtendedTextDemo();
            },
          );
        } else if (name == Constants.webViewExample) {
          return MaterialPageRoute(
            builder: (context) {
              return new WebViewExample();
            },
          );
        } else if (name == Constants.webGithubExample) {
          return MaterialPageRoute(
            builder: (context) {
              return new GithubHomepage();
            },
          );
        }
      },
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

  @override
  void initState() {
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      //_platformVersion = platformVersion;
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
      new GithubHomepage(),
    );
  }
}
