import 'package:tencent_flutter_devtools/tencent_flutter_devtools.dart';
import 'dart:ui' as ui show Image;

/// flutter dev tool reporter
class MyDataReporter extends DataReporter {
  @override
  void reportDenseNetRequestWarn(List<String> funcList) {
    // TODO: implement reportDenseNetRequestWarn
  }

  @override
  void reportImageOversizeWarn(String pageName, String imageUrl, String tip, ui.Image? image) {
    // TODO: implement reportImageOversizeWarn
  }

  @override
  void reportMethodChannelWarn(String channelName) {
    // TODO: implement reportMethodChannelWarn
  }

  @override
  void reportNetWorkWarn(String funcName, String tip, ui.Image? image) {
    // TODO: implement reportNetWorkWarn
  }

  @override
  void reportPageLeakPath(String pageName, List<LeakInfo> pathInfo, ui.Image? image) {
    // TODO: implement reportPageLeakPath
  }

  @override
  void reportPageLoadTime(String pageName, int pageLoadTime) {
    // TODO: implement reportPageLoadTime
  }

  @override
  void reportPeakCpu(double cpuRatio, ui.Image? image) {
    // TODO: implement reportPeakCpu
  }

  @override
  void reportPeakMemory(double memoryUsage, ui.Image? image) {
    // TODO: implement reportPeakMemory
  }

  @override
  void reportWidgetTreeWarn(String pageName, List<String> tips) {
    // TODO: implement reportWidgetTreeWarn
  }
}