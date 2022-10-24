import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/catalog.dart';
import 'dart:async';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_news_app/routes.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      onGenerateRoute: (RouteSettings settings) {
        var name = settings.name;
        print("router name is $name");
        for (final path in RouterConfiguration.paths) {
          if(settings.name == path.pattern) {
            if (kIsWeb) {
              return NoAnimationMaterialPageRoute<void>(
                builder: path.builder,
                settings: settings,
              );
            } else {
              return MaterialPageRoute<void>(
                builder: path.builder,
                settings: settings,
              );
            }
          }
        }
        return null;
      },
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}

class MyHomePage extends StatefulWidget {

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
    if (!mounted) return;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      new Catalog(),
    );
  }
}
