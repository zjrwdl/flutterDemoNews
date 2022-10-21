import 'package:flutter/material.dart';
import 'dart:math' as math;

class AvartarBubbleAnim extends StatefulWidget {
  @override
  _AvartarBubbleAnimState createState() => _AvartarBubbleAnimState();
  List<String> avartarList = [];

  AvartarBubbleAnim({
    required this.avartarList,
  });
}

class _AvartarBubbleAnimState extends State<AvartarBubbleAnim>
    with TickerProviderStateMixin {
  late AnimationController _mAnimationControllerAvartar1;
  late CurvedAnimation _offsetCurvedAnimationAvartar1;
  late Animation<double> _sizeAnimationAvartar1;
  bool _avartarShow1 = true;

  late AnimationController _mAnimationControllerAvartar2;
  late CurvedAnimation _offsetCurvedAnimationAvartar2;
  late Animation<double> _sizeAnimationAvartar2;
  bool _avartarShow2 = false;

  late AnimationController _mAnimationControllerBubble2;
  late CurvedAnimation _offsetCurvedAnimationBubble2;
  late Animation<double> _sizeAnimationBubble2;
  bool _showBubbule2 = false;

  late AnimationController _mAnimationControllerAvartar3;
  late CurvedAnimation _offsetCurvedAnimationAvartar3;
  late Animation<double> _sizeAnimationAvartar3;
  bool aVartar3Show = false;

  late AnimationController _mAnimationControllerBubble3;
  late CurvedAnimation _offsetCurvedAnimationBubble3;
  late Animation<double> _sizeAnimationBubble3;
  bool _showBubbule3 = false;

  static const double avartarSzie = 20.0;
  static const double bubbleSzie = 6.0;
  static const int avartarAnimDuration = 900;
  static const int bubbleAnimDuration = 1200;
  static const int animCoordinateX = 15;
  static const int animCoordinateY = 70;
  static const int animCoordinateBubbleY = 80;

  @override
  void initState() {
    super.initState();
    _mAnimationControllerAvartar1 = AnimationController(
      duration: const Duration(milliseconds: avartarAnimDuration),
      vsync: this,
    );
    _offsetCurvedAnimationAvartar1 = CurvedAnimation(
        parent: _mAnimationControllerAvartar1, curve: Interval(0.0, 1.0));
    _sizeAnimationAvartar1 = Tween(begin: avartarSzie, end: 0.0).animate(
      CurvedAnimation(
        parent: _mAnimationControllerAvartar1,
        curve: Interval(0.5, 1.0),
      ),
    );

    //第二个
    _mAnimationControllerAvartar2 = AnimationController(
      duration: const Duration(milliseconds: avartarAnimDuration),
      vsync: this,
    );
    _offsetCurvedAnimationAvartar2 = CurvedAnimation(
      parent: _mAnimationControllerAvartar2,
      curve: Interval(0.0, 1.0),
    );
    _sizeAnimationAvartar2 = Tween(begin: avartarSzie, end: 0.0).animate(
      CurvedAnimation(
        parent: _mAnimationControllerAvartar2,
        curve: Interval(0.5, 1.0),
      ),
    );

    _mAnimationControllerBubble2 = AnimationController(
      duration: const Duration(milliseconds: bubbleAnimDuration),
      vsync: this,
    );
    _offsetCurvedAnimationBubble2 = CurvedAnimation(
      parent: _mAnimationControllerBubble2,
      curve: Interval(0.0, 1.0),
    );
    _sizeAnimationBubble2 = Tween(begin: bubbleSzie, end: 0.0).animate(
      CurvedAnimation(
        parent: _mAnimationControllerBubble2,
        curve: Interval(0.6, 0.9),
      ),
    );

    //第3个
    _mAnimationControllerAvartar3 = AnimationController(
      duration: const Duration(milliseconds: avartarAnimDuration),
      vsync: this,
    );
    _offsetCurvedAnimationAvartar3 = CurvedAnimation(
      parent: _mAnimationControllerAvartar3,
      curve: Interval(0.0, 1.0),
    );
    _sizeAnimationAvartar3 = Tween(begin: avartarSzie, end: 0.0).animate(
      CurvedAnimation(
        parent: _mAnimationControllerAvartar3,
        curve: Interval(0.5, 1.0),
      ),
    );

    _mAnimationControllerBubble3 = AnimationController(
      duration: const Duration(milliseconds: bubbleAnimDuration),
      vsync: this,
    );
    _offsetCurvedAnimationBubble3 = CurvedAnimation(
      parent: _mAnimationControllerBubble3,
      curve: Interval(0.0, 1.0),
    );
    _sizeAnimationBubble3 = Tween(begin: bubbleSzie, end: 0.0).animate(
      CurvedAnimation(
        parent: _mAnimationControllerBubble3,
        curve: Interval(0.6, 0.9),
      ),
    );
  }

  double getCurveXL2RValue(double t) {
    double d = math.cos(t * math.pi * 2);
    return d * animCoordinateX;
  }

  double getBubbleCurveXL2RValue(double t) {
    double d = math.cos(t * math.pi * 2);
    return d * animCoordinateX;
  }

  double getCurveXR2LValue(double t) {
    double d = math.cos(t * math.pi * 2);
    return -d * animCoordinateX;
  }

  double getBubbleCurveXR2LValue(double t) {
    double d = math.cos(t * math.pi * 2);
    return -d * animCoordinateX;
  }

  double getCurveYValue(double t) {
    return -t * animCoordinateY;
  }

  double getBubbleCurveYValue(double t) {
    return -t * animCoordinateBubbleY;
  }

  double getOpacityValue(double t) {
    return 1;
  }

  Widget _buildAvartarAnimWidget() {
    return AnimatedBuilder(
      animation: _mAnimationControllerAvartar1, //添加动画
      builder: (context, _) {
        return AnimatedOpacity(
          opacity: getOpacityValue(_offsetCurvedAnimationAvartar1.value),
          duration: Duration(milliseconds: avartarAnimDuration),
          child: Transform.translate(
            offset: Offset(
              getCurveXL2RValue(_offsetCurvedAnimationAvartar1.value),
              getCurveYValue(_offsetCurvedAnimationAvartar1.value),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: _sizeAnimationAvartar1.value,
                  width: _sizeAnimationAvartar1.value,
                  child: Image.network(
                    widget.avartarList[0],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAvartarBubbleAnimWidget2() {
    return SizedBox(
      height: 100,
      width: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

        ],
      ),
    );
  }

  Widget _buildAvartarBubbleAnimWidget3() {
    return SizedBox(
      height: 100,
      width: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ), //
            Row(
              children: [
                TextButton(
                  child: Text('触发动画'),
                  onPressed: () {
                    _avartarShow1 = true;
                    setState(() {});
                    _mAnimationControllerAvartar1.reset();
                    _mAnimationControllerAvartar1.forward(); // 执行动画
                    if (true) {
                      Future.delayed(Duration(milliseconds: 200), () {
                        _showBubbule2 = true;
                        setState(() {});
                        _mAnimationControllerBubble2.reset();
                        _mAnimationControllerBubble2.forward();
                      });
                      Future.delayed(Duration(milliseconds: 600), () {
                        _avartarShow2 = true;
                        setState(() {});
                        _mAnimationControllerAvartar2.reset();
                        _mAnimationControllerAvartar2.forward();
                      });
                    }
                    if (true) {
                      Future.delayed(Duration(milliseconds: 800), () {
                        _showBubbule3 = true;
                        setState(() {});
                        _mAnimationControllerBubble3.reset();
                        _mAnimationControllerBubble3.forward();
                      });
                      Future.delayed(Duration(milliseconds: 1200), () {
                        aVartar3Show = true;
                        setState(() {});
                        _mAnimationControllerAvartar3.reset();
                        _mAnimationControllerAvartar3.forward();
                      });
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  child: Text('关闭'),
                  onPressed: () {
                    _avartarShow1 = false;
                    _avartarShow2 = false;
                    _showBubbule2 = false;
                    aVartar3Show = false;
                    _showBubbule3 = false;
                    _mAnimationControllerAvartar1.reset();
                    _mAnimationControllerAvartar2.reset();
                    _mAnimationControllerAvartar3.reset();
                    _mAnimationControllerBubble2.reset();
                    _mAnimationControllerBubble3.reset();
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black,
              height: 120,
              width: 180,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  if (_avartarShow1) _buildAvartarAnimWidget(),
                  if (_avartarShow2 && widget.avartarList.length > 1)
                    AnimatedBuilder(
                      animation: _mAnimationControllerAvartar2, //添加动画
                      builder: (context, _) {
                        return AnimatedOpacity(
                          opacity: getOpacityValue(_offsetCurvedAnimationAvartar2.value),
                          duration: Duration(milliseconds: avartarAnimDuration),
                          child: Transform.translate(
                            offset: Offset(
                              getCurveXR2LValue(_offsetCurvedAnimationAvartar2.value),
                              getCurveYValue(_offsetCurvedAnimationAvartar2.value),
                            ),
                            // 1,0 水平移动 -- 0,1垂直移动
                            child: Container(
                              height: _sizeAnimationAvartar2.value,
                              width: _sizeAnimationAvartar2.value,
                              child: Image.network(
                                widget.avartarList[1],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  if (_showBubbule2)
                    AnimatedBuilder(
                      animation: _mAnimationControllerBubble2, //添加动画
                      builder: (context, _) {
                        return AnimatedOpacity(
                          opacity: getOpacityValue(_mAnimationControllerBubble2.value),
                          duration: Duration(milliseconds: bubbleAnimDuration),
                          child: Transform.translate(
                            offset: Offset(
                              getBubbleCurveXR2LValue(
                                _offsetCurvedAnimationBubble2.value,
                              ),
                              getBubbleCurveYValue(
                                _offsetCurvedAnimationBubble2.value,
                              ),
                            ),
                            // 1,0 水平移动 -- 0,1垂直移动
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(color: Colors.white),
                              ),
                              height: _sizeAnimationBubble2.value,
                              width: _sizeAnimationBubble2.value,
                            ),
                          ),
                        );
                      },
                    ),
                  if (aVartar3Show && widget.avartarList.length > 2)
                    AnimatedBuilder(
                      animation: _mAnimationControllerAvartar3, //添加动画
                      builder: (context, _) {
                        return AnimatedOpacity(
                          opacity: getOpacityValue(_offsetCurvedAnimationAvartar3.value),
                          duration: Duration(milliseconds: avartarAnimDuration),
                          child: Transform.translate(
                            offset: Offset(
                              getCurveXL2RValue(_offsetCurvedAnimationAvartar3.value),
                              getCurveYValue(_offsetCurvedAnimationAvartar3.value),
                            ),
                            // 1,0 水平移动 -- 0,1垂直移动
                            child: Container(
                              height: _sizeAnimationAvartar3.value,
                              width: _sizeAnimationAvartar3.value,
                              child: Image.network(
                                widget.avartarList[2],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  if (_showBubbule3)
                    AnimatedBuilder(
                      animation: _mAnimationControllerBubble3, //添加动画
                      builder: (context, _) {
                        return AnimatedOpacity(
                          opacity: getOpacityValue(_offsetCurvedAnimationBubble3.value),
                          duration: Duration(milliseconds: bubbleAnimDuration),
                          child: Transform.translate(
                            offset: Offset(
                              getBubbleCurveXL2RValue(
                                _offsetCurvedAnimationBubble3.value,
                              ),
                              getBubbleCurveYValue(
                                _offsetCurvedAnimationBubble3.value,
                              ),
                            ),
                            // 1,0 水平移动 -- 0,1垂直移动
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(color: Colors.white),
                              ),
                              height: _sizeAnimationBubble3.value,
                              width: _sizeAnimationBubble3.value,
                            ),
                          ),
                        );
                      },
                    ),
                  //_buildAvartarBubbleAnimWidget2(),
                  //_buildAvartarBubbleAnimWidget3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
