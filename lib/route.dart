import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/util/Constants.dart';
import 'package:flutter_news_app/ast/astDemo.dart';
import 'package:flutter_news_app/web/github/home_page.dart';
import 'package:flutter_news_app/widget/anim/curve_fly_anim.dart';
import 'package:flutter_news_app/widget/anim/shake_anim.dart';
import 'package:flutter_news_app/widget/extended_text_demo.dart';
import 'package:flutter_news_app/widget/longPicture.dart';
import 'package:flutter_news_app/widget/orientation/HorizonOnly.dart';
import 'package:flutter_news_app/widget/web_view/webview_demo.dart';
import 'package:tencent_flutter_devtools/tencent_flutter_devtools.dart';
import 'dev_tool/mem_leak_example_page.dart';

class RouteMgr {

  static Route<dynamic>? onGenerateRoute (RouteSettings settings) {
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
    } else if (name == Constants.devToolMemoryLeakExample) {
      return MaterialPageRoute(
        builder: (context) {
          return RouteUtil.wrapPage(MemLeakExamplePage());
        },
      );
    } else if (name == Constants.devToolSetting) {
      return MaterialPageRoute(
        builder: (context) {
          return RouteUtil.wrapPage(DevToolSettingPage());
        },
      );
    }
  }
}