import 'package:flutter/cupertino.dart';
import 'package:tencent_flutter_devtools/tencent_flutter_devtools.dart';

// 初始化配置数据
class DevToolsMgr {

  static final DevToolsMgr _instance = DevToolsMgr._();
  static DevToolsMgr get singleton => _instance;
  DevToolsMgr._();

  void onFrameWorkInit() {
    setPageFilter(pageFilter);
    addWidgetRules();
  }

  // ignore: use_setters_to_change_properties
  void setPageFilter(PageFilter filter) {
    PageTrace().pageFilter = filter;
  }

  void addWidgetRules() {
    var defaultRules = WidgetRulesManager.singleton.getDefaultRules(30);
    // defaultRules.add(CustomWidgetRule());
    WidgetRulesManager.singleton.addRules(defaultRules);
    // WidgetRulesManager.singleton.addBlockWidget('TestWidget', 'some reason', 'try something else');
  }

}

/// 页面过滤，忽略某些页面（如预加载页面）
bool pageFilter(Route route) {
  // return route.settings is PreloadPage;
  return false;
}