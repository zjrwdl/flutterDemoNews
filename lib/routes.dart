import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/ast/astDemo.dart' deferred as ast_demo;
import 'package:flutter_news_app/util/Constants.dart';
import 'package:flutter_news_app/widget/anim/curve_fly_anim.dart'
    deferred as curve_fly_anim;
import 'package:flutter_news_app/widget/anim/shake_anim.dart'
    deferred as shake_anim_app;
import 'package:flutter_news_app/widget/extended_text_demo.dart' deferred as extended_text_demo;
import 'package:flutter_news_app/widget/longPicture.dart' deferred as long_picture;
import 'package:flutter_news_app/widget/orientation/HorizonOnly.dart' deferred as horizon_Demo;
import 'package:flutter_news_app/widget/web_view/webview_demo.dart' deferred as web_view;
import 'package:flutter_news_app/web/github/home_page.dart' deferred as web_app;
import 'package:flutter_news_app/web/flutter_web3/flutter_web3_api.dart' deferred as flutter_web3_app;
import 'package:flutter_news_app/web/wallet_connect/wallet_connect_api.dart' deferred as wallet_connect_app;
import 'package:flutter_news_app/web/metamask_login/metamask_login_home.dart' deferred as metamask_login_home_app;
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
            //web_app.loadLibrary, () => web_app.GithubHomepage(),
            // wallet_connect_app.loadLibrary, () => wallet_connect_app.WalletConnectHome(),
            //flutter_web3_app.loadLibrary, () => flutter_web3_app.FlutterWeb3Home(),
            metamask_login_home_app.loadLibrary, () => metamask_login_home_app.MetaMaskLoginHome(),
            // ignore: prefer_const_constructors
            placeholder: const DeferredLoadingPlaceholder(name: 'WebApp'));
      },
    ),
    Path(
      Constants.avatarBubbleAnim,
      (context) {
        return DeferredWidget(
            curve_fly_anim.loadLibrary,
            () => curve_fly_anim.AvartarBubbleAnim(
                  avartarList: [
                    "https://img0.baidu.com/it/u=2553242400,2080369090&fm=26&fmt=auto",
                    "https://img0.baidu.com/it/u=3872011780,2725169074&fm=26&fmt=auto",
                    "https://img2.baidu.com/it/u=1813115944,1577678930&fm=26&fmt=auto"
                  ],
                ),
            // ignore: prefer_const_constructors
            placeholder: const DeferredLoadingPlaceholder(name: 'WebApp'));
      },
    ),
    Path(
      Constants.shakeAnim,
      (context) {
        return DeferredWidget(
            shake_anim_app.loadLibrary, () => shake_anim_app.ShakeAnim(),
            placeholder:
                const DeferredLoadingPlaceholder(name: 'ShakeAnimApp'));
      },
    ),
    Path(
      Constants.horizonOnly,
      (context) {
        return DeferredWidget(
            horizon_Demo.loadLibrary, () => horizon_Demo.HorizonOnly(),
            placeholder:
            const DeferredLoadingPlaceholder(name: 'HorizonDemo'));
      },
    ),
    Path(
      Constants.longPicture,
      (context) {
        return DeferredWidget(
            long_picture.loadLibrary, () => long_picture.LongPicture(),
            placeholder:
            const DeferredLoadingPlaceholder(name: 'LongPicture'));
      },
    ),
    Path(
      Constants.astDemo,
      (context) {
        return DeferredWidget(
            ast_demo.loadLibrary, () => ast_demo.AstDemo(),
            placeholder: const DeferredLoadingPlaceholder(name: 'WebView'));
      },
    ),
    Path(
      Constants.extendedTextDemo,
      (context) {
        return DeferredWidget(
            extended_text_demo.loadLibrary, () => extended_text_demo.ExtendedTextDemo(),
            placeholder: const DeferredLoadingPlaceholder(name: 'WebView'));
      },
    ),
    Path(
      Constants.webViewExample,
      (context) {
        return DeferredWidget(
            web_view.loadLibrary, () => web_view.WebViewExample(),
            placeholder: const DeferredLoadingPlaceholder(name: 'WebView'));
      },
    ),
  ];
}
