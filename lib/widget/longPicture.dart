import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class LongPicture extends StatefulWidget {
  @override
  createState() => LongPictureState();
}

class LongPictureState extends State<LongPicture> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('LongPicture'),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 200,
          alignment: Alignment.center,
          color: Color(int.parse("0xFF42A5F5")),
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 280,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Image (
                        width:200,
                        height: 200,
                        image: AssetImage('images/empty.jpeg'),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd"
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd"
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd"
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd"
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd"
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd"
                "sjdklfjslkdjfklsdjflksjdfkljsdlfkjsdlkfjlksdjflksjdklfjskldjfksjdfkljsdlkfjslkdjflskdjfklsjdlfkjdslkfjksdjflksdjkfljsd",
                style: TextStyle(
                  color: Colors.white,
                ),
                maxLines: 100,
              ),
            ],
          ),
        ),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //强制横屏
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //强制横屏
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }
}
