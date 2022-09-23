import 'package:flutter/material.dart';
import 'package:flutter_news_app/catalog.dart';
import 'package:flutter_news_app/route.dart';
import 'dart:async';
import 'package:tencent_flutter_devtools/tencent_flutter_devtools.dart';

import 'dev_tool/dev_tool_data_reporter.dart';


void main(){
  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = '';
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );
  EventMonitorWidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<Null>>(() async {
    FrameworkCore.init(MyDataReporter()).then((value) {
      runApp(MyHomePage());
    });
  }, (error, stack) {
    log('${error.toString()}\n${stack.toString()}', LogLevel.error);
  }, zoneSpecification: ZoneSpecification(print: (self, parent, zone, line) {
    LogController.singleton.logPrinter(self, parent, zone, line, null);
  }));
}


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    FrameworkCore.onAppInitState(context);
  }

  @override
  void dispose() {
    FrameworkCore.onAppDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouteUtil.wrapPage(Catalog()),
      navigatorObservers: [PageTrace()],
      onGenerateRoute: RouteMgr.onGenerateRoute,
    );
  }
}