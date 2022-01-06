import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurveFlyAnim extends StatefulWidget {
  @override
  _CurveFlyAnimState createState() => _CurveFlyAnimState();
}

class _CurveFlyAnimState extends State<CurveFlyAnim>
    with TickerProviderStateMixin {
  late AnimationController _mAnimationControllerAvartar1;
  late CurvedAnimation _offsetCurvedAnimationAvartar1;
  late Animation<double> _sizeAnimationAvartar1;
  bool _avartarShow1 = false;

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

  @override
  void initState() {
    super.initState();
    _mAnimationControllerAvartar1 = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _offsetCurvedAnimationAvartar1 =
        new CurvedAnimation(parent: _mAnimationControllerAvartar1, curve: Interval(0.0, 1.0));
    _sizeAnimationAvartar1 = Tween(begin: 25.0, end: 0.0).animate(CurvedAnimation(
        parent: _mAnimationControllerAvartar1, curve: Interval(0.5, 1.0)));

    //第二个
    _mAnimationControllerAvartar2 = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _offsetCurvedAnimationAvartar2 = new CurvedAnimation(
        parent: _mAnimationControllerAvartar2, curve: Interval(0.0, 1.0));
    _sizeAnimationAvartar2 = Tween(begin: 25.0, end: 0.0).animate(CurvedAnimation(
        parent: _mAnimationControllerAvartar2, curve: Interval(0.5, 1.0)));

    _mAnimationControllerBubble2 = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _offsetCurvedAnimationBubble2 = new CurvedAnimation(
        parent: _mAnimationControllerBubble2, curve: Interval(0.0, 1.0));
    _sizeAnimationBubble2 = Tween(begin: 8.0, end: 0.0).animate(CurvedAnimation(
        parent: _mAnimationControllerBubble2, curve: Interval(0.6, 0.9)));

    //第3个
    _mAnimationControllerAvartar3 = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _offsetCurvedAnimationAvartar3 = new CurvedAnimation(
        parent: _mAnimationControllerAvartar3, curve: Interval(0.0, 1.0));
    _sizeAnimationAvartar3 = Tween(begin: 25.0, end: 0.0).animate(CurvedAnimation(
        parent: _mAnimationControllerAvartar3, curve: Interval(0.5, 1.0)));
    _sizeAnimationBubble3 = Tween(begin: 8.0, end: 0.0).animate(CurvedAnimation(
        parent: _mAnimationControllerAvartar3, curve: Interval(0.6, 0.9)));

    _mAnimationControllerBubble3 = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _offsetCurvedAnimationBubble3 = new CurvedAnimation(
        parent: _mAnimationControllerBubble3, curve: Interval(0.0, 1.0));
    _sizeAnimationBubble3 = Tween(begin: 8.0, end: 0.0).animate(CurvedAnimation(
        parent: _mAnimationControllerBubble3, curve: Interval(0.6, 0.9)));
  }

  double getCurveXL2RValue(double t) {
    if (t >= 0 && t <= 0.3) {
      t = t;
    } else if (t > 0.3 && t <= 1) {
      t = 0.7 - t;
    }
    return -t * 80;
  }

  double getBubbleCurveXL2RValue(double t) {
    if (t >= 0 && t <= 0.35) {
      t = t;
    } else if (t > 0.35 && t <= 1) {
      t = 0.65 - t;
    }
    return -t * 80;
  }

  double getCurveXR2LValue(double t) {
    if (t >= 0 && t <= 0.3) {
      t = t;
    } else if (t > 0.3 && t <= 1) {
      t = 0.7 - t;
    }
    return t * 80;
  }

  double getBubbleCurveXR2LValue(double t) {
    if (t >= 0 && t <= 0.3) {
      t = t;
    } else if (t > 0.3 && t <= 1) {
      t = 0.7 - t;
    }
    return t * 80;
  }

  double getCurveYValue(double t) {
    return -t * 110;
  }

  double getBubbleCurveYValue(double t) {
    return -t * 120;
  }

  Widget _buildAvartarAnimWidget() {
    return Center(
        child: AnimatedBuilder(
      animation: _mAnimationControllerAvartar1, //添加动画
      builder: (context, _) {
        return AnimatedOpacity(
          opacity: 1 - _offsetCurvedAnimationAvartar1.value,
          duration: Duration(milliseconds: 600),
          child: Transform.translate(
            offset: Offset(getCurveXL2RValue(_offsetCurvedAnimationAvartar1.value),
                getCurveYValue(_offsetCurvedAnimationAvartar1.value)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  height: _sizeAnimationAvartar1.value,
                  width: _sizeAnimationAvartar1.value,
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget buildRotationTransition2() {
    return Container(
      height: 100,
      width: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (_avartarShow2)
            AnimatedBuilder(
              animation: _mAnimationControllerAvartar2, //添加动画
              builder: (context, _) {
                return AnimatedOpacity(
                  opacity: 1 - _offsetCurvedAnimationAvartar2.value,
                  duration: Duration(milliseconds: 600),
                  child: Transform.translate(
                    offset: Offset(
                        getCurveXR2LValue(_offsetCurvedAnimationAvartar2.value),
                        getCurveYValue(_offsetCurvedAnimationAvartar2.value)),
                    // 1,0 水平移动 -- 0,1垂直移动
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      height: _sizeAnimationAvartar2.value,
                      width: _sizeAnimationAvartar2.value,
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
                  opacity: 1 - _offsetCurvedAnimationBubble2.value,
                  duration: Duration(milliseconds: 900),
                  child: Transform.translate(
                    offset: Offset(
                        getBubbleCurveXR2LValue(
                            _offsetCurvedAnimationBubble2.value),
                        getBubbleCurveYValue(
                            _offsetCurvedAnimationBubble2.value)),
                    // 1,0 水平移动 -- 0,1垂直移动
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      height: _sizeAnimationBubble2.value,
                      width: _sizeAnimationBubble2.value,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget buildRotationTransition3() {
    return Container(
      height: 100,
      width: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (aVartar3Show)
            AnimatedBuilder(
              animation: _mAnimationControllerAvartar3, //添加动画
              builder: (context, _) {
                return AnimatedOpacity(
                  opacity: 1 - _offsetCurvedAnimationAvartar3.value,
                  duration: Duration(milliseconds: 600),
                  child: Transform.translate(
                    offset: Offset(
                        getCurveXL2RValue(_offsetCurvedAnimationAvartar3.value),
                        getCurveYValue(_offsetCurvedAnimationAvartar3.value)),
                    // 1,0 水平移动 -- 0,1垂直移动
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      height: _sizeAnimationAvartar3.value,
                      width: _sizeAnimationAvartar3.value,
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
                  opacity: 1 - _offsetCurvedAnimationBubble3.value,
                  duration: Duration(milliseconds: 900),
                  child: Transform.translate(
                    offset: Offset(
                        getBubbleCurveXL2RValue(
                            _offsetCurvedAnimationBubble3.value),
                        getBubbleCurveYValue(
                            _offsetCurvedAnimationBubble3.value)),
                    // 1,0 水平移动 -- 0,1垂直移动
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      height: _sizeAnimationBubble3.value,
                      width: _sizeAnimationBubble3.value,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.centerLeft,
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ), //
              Row(
                children: [
                  RaisedButton(
                    child: Text('触发动画'),
                    onPressed: () {
                      _avartarShow1 = true;
                      setState(() {});
                      _mAnimationControllerAvartar1.reset();
                      _mAnimationControllerAvartar1.forward();// 执行动画
                      if(true) {
                        Future.delayed(Duration(milliseconds: 100), () {
                          _showBubbule2 = true;
                          setState(() {});
                          _mAnimationControllerBubble2.reset();
                          _mAnimationControllerBubble2.forward();
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          _avartarShow2 = true;
                          setState(() {});
                          _mAnimationControllerAvartar2.reset();
                          _mAnimationControllerAvartar2.forward();
                        });
                      }
                      if(true) {
                        Future.delayed(Duration(milliseconds: 500), () {
                          _showBubbule3 = true;
                          setState(() {});
                          _mAnimationControllerBubble3.reset();
                          _mAnimationControllerBubble3.forward();
                        });
                        Future.delayed(Duration(milliseconds: 800), () {
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
                  RaisedButton(
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
                height: 200,
              ),
              Container(
                color: Colors.black,
                height: 120,
                width: 80,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    if (_avartarShow1) _buildAvartarAnimWidget(),
                    buildRotationTransition2(),
                    buildRotationTransition3(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
