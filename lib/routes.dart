import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/ast/astDemo.dart';
import 'package:flutter_news_app/util/Constants.dart';
import 'package:flutter_news_app/widget/anim/curve_fly_anim.dart';
import 'package:flutter_news_app/widget/anim/shake_anim.dart';
import 'package:flutter_news_app/widget/extended_text_demo.dart';
import 'package:flutter_news_app/widget/longPicture.dart';
import 'package:flutter_news_app/widget/orientation/HorizonOnly.dart';
import 'package:flutter_news_app/widget/web_view/webview_demo.dart';
import 'package:flutter_news_app/web/github/home_page.dart' deferred as web_app;
import 'deferred_widget.dart';

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;

  final WidgetBuilder builder;
}

class RouterConfiguration {
  static List<Path> paths = [
    Path(
      Constants.webGithubExample,
      (context) {
        return DeferredWidget(
            web_app.loadLibrary, () => web_app.GithubHomepage(),
            // ignore: prefer_const_constructors
            placeholder: const DeferredLoadingPlaceholder(name: 'WebApp'));
      },
    ),
    Path(
      Constants.avatarBubbleAnim,
      (context) {
        return new AvartarBubbleAnim(
          avartarList: [
            "https://img0.baidu.com/it/u=2553242400,2080369090&fm=26&fmt=auto",
            "https://img0.baidu.com/it/u=3872011780,2725169074&fm=26&fmt=auto",
            "https://img2.baidu.com/it/u=1813115944,1577678930&fm=26&fmt=auto"
          ],
        );
      },
    ),
    Path(
      Constants.shakeAnim,
      (context) {
        return new ShakeAnim();
      },
    ),
    Path(
      Constants.horizonOnly,
      (context) {
        return new HorizonOnly();
      },
    ),
    Path(
      Constants.longPicture,
      (context) {
        return new LongPicture();
      },
    ),
    Path(
      Constants.astDemo,
      (context) {
        return new AstDemo();
      },
    ),
    Path(
      Constants.extendedTextDemo,
      (context) {
        return new ExtendedTextDemo();
      },
    ),
    Path(
      Constants.webViewExample,
      (context) {
        return new WebViewExample();
      },
    ),
  ];
}
