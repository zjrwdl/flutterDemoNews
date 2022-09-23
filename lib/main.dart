import 'package:flutter/material.dart';
import 'package:flutter_news_app/catalog.dart';
import 'package:flutter_news_app/route.dart';
import 'dart:async';
import 'package:tencent_flutter_devtools/tencent_flutter_devtools.dart';
import 'dev_tool/dev_tool_data_reporter.dart';
import 'dev_tool/dev_tools_mgr.dart';

void main() {
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
    PlatformDispatcherMgr.instance.init();
    FrameworkCore.init(MyDataReporter()).then((value) {
      DevToolsMgr.singleton.onFrameWorkInit();
      runApp(MyApp());
    });
  }, (error, stack) {
    log('${error.toString()}\n${stack.toString()}', LogLevel.error);
  }, zoneSpecification: ZoneSpecification(print: (self, parent, zone, line) {
    LogController.singleton.logPrinter(self, parent, zone, line, null);
  }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
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
      home: RouteUtil.wrapPage(Catalog()),
      onGenerateRoute: RouteMgr.onGenerateRoute,
      navigatorObservers: [PageTrace()],
    );
  }
}
