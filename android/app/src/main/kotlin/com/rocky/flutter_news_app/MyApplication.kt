package com.rocky.flutter_news_app

import android.app.Application
import com.tencent.tencent_flutter_devtools.TencentFlutterDevtoolsPlugin

class MyApplication: Application() {

    init {
        TencentFlutterDevtoolsPlugin.setApplicationContext(this)
    }
}
