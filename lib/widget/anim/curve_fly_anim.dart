import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurveFlyAnim extends StatefulWidget {
  @override
  _CurveFlyAnimState createState() => _CurveFlyAnimState();
}

class _CurveFlyAnimState extends State<CurveFlyAnim>
    with TickerProviderStateMixin {
  //平移动画控制器
  late AnimationController mAnimationController;
  late CurvedAnimation offsetCurvedAnimation;
  late Animation<double> _sizeAnimation;
  bool aVartar1Show = true;

  late AnimationController mAnimationController2;
  late CurvedAnimation offsetCurvedAnimation2;
  late Animation<double> _sizeAnimation2;
  bool aVartar2Show = true;

  late AnimationController mAnimationControllerBubble2;
  late CurvedAnimation offsetCurvedAnimationBubble2;
  late Animation<double> _sizeAnimationBubble2;
  bool aVartar2ShowBubbule = true;

  late AnimationController mAnimationController3;
  late CurvedAnimation offsetCurvedAnimation3;
  late Animation<double> _sizeAnimation3;
  bool aVartar3Show = false;

  late AnimationController mAnimationControllerBubble3;
  late CurvedAnimation offsetCurvedAnimationBubble3;
  late Animation<double> _sizeAnimationBubble3;
  bool aVartar3ShowBubbule = true;

  @override
  void initState() {
    super.initState();
    mAnimationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    offsetCurvedAnimation =
        new CurvedAnimation(parent: mAnimationController, curve: new MyCurve());
    _sizeAnimation = Tween(begin: 25.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationController, curve: Interval(0.5, 1.0)));
    mAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("anim reverse");
        //mAnimationController.repeat(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
      }
    });

    //第二个
    mAnimationController2 = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    offsetCurvedAnimation2 = new CurvedAnimation(
        parent: mAnimationController2, curve: new MyCurve());
    _sizeAnimation2 = Tween(begin: 25.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationController2, curve: Interval(0.5, 1.0)));

    mAnimationControllerBubble2 = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    offsetCurvedAnimationBubble2 = new CurvedAnimation(
        parent: mAnimationControllerBubble2, curve: new MyCurve());
    _sizeAnimationBubble2 = Tween(begin: 8.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationControllerBubble2, curve: Interval(0.6, 0.9)));

    //第3个
    mAnimationController3 = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    offsetCurvedAnimation3 = new CurvedAnimation(
        parent: mAnimationController3, curve: new MyCurve());
    _sizeAnimation3 = Tween(begin: 25.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationController3, curve: Interval(0.5, 1.0)));
    _sizeAnimationBubble3 = Tween(begin: 8.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationController3, curve: Interval(0.6, 0.9)));

    mAnimationControllerBubble3 = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    offsetCurvedAnimationBubble3 = new CurvedAnimation(
        parent: mAnimationControllerBubble3, curve: new MyCurve());
    _sizeAnimationBubble3 = Tween(begin: 8.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationControllerBubble3, curve: Interval(0.6, 0.9)));
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

  Widget buildRotationTransition() {
    return Center(
        child: AnimatedBuilder(
      animation: mAnimationController, //添加动画
      builder: (context, _) {
        return AnimatedOpacity(
          opacity: 1 - offsetCurvedAnimation.value,
          duration: Duration(milliseconds: 600),
          child: Transform.translate(
            offset: Offset(getCurveXL2RValue(offsetCurvedAnimation.value),
                getCurveYValue(offsetCurvedAnimation.value)),
            // 1,0 水平移动 -- 0,1垂直移动
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
                  height: _sizeAnimation.value,
                  width: _sizeAnimation.value,
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
          if (aVartar2Show)
            AnimatedBuilder(
              animation: mAnimationController2, //添加动画
              builder: (context, _) {
                return AnimatedOpacity(
                  opacity: 1 - offsetCurvedAnimation2.value,
                  duration: Duration(milliseconds: 600),
                  child: Transform.translate(
                    offset: Offset(
                        getCurveXR2LValue(offsetCurvedAnimation2.value),
                        getCurveYValue(offsetCurvedAnimation2.value)),
                    // 1,0 水平移动 -- 0,1垂直移动
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      height: _sizeAnimation2.value,
                      width: _sizeAnimation2.value,
                    ),
                  ),
                );
              },
            ),
          if (aVartar2ShowBubbule)
            AnimatedBuilder(
              animation: mAnimationControllerBubble2, //添加动画
              builder: (context, _) {
                return AnimatedOpacity(
                  opacity: 1 - offsetCurvedAnimationBubble2.value,
                  duration: Duration(milliseconds: 900),
                  child: Transform.translate(
                    offset: Offset(
                        getBubbleCurveXR2LValue(
                            offsetCurvedAnimationBubble2.value),
                        getBubbleCurveYValue(
                            offsetCurvedAnimationBubble2.value)),
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
              animation: mAnimationController3, //添加动画
              builder: (context, _) {
                return AnimatedOpacity(
                  opacity: 1 - offsetCurvedAnimation3.value,
                  duration: Duration(milliseconds: 600),
                  child: Transform.translate(
                    offset: Offset(
                        getCurveXL2RValue(offsetCurvedAnimation3.value),
                        getCurveYValue(offsetCurvedAnimation3.value)),
                    // 1,0 水平移动 -- 0,1垂直移动
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      height: _sizeAnimation3.value,
                      width: _sizeAnimation3.value,
                    ),
                  ),
                );
              },
            ),
          if (aVartar3ShowBubbule)
            AnimatedBuilder(
              animation: mAnimationControllerBubble3, //添加动画
              builder: (context, _) {
                return AnimatedOpacity(
                  opacity: 1 - offsetCurvedAnimationBubble3.value,
                  duration: Duration(milliseconds: 900),
                  child: Transform.translate(
                    offset: Offset(
                        getBubbleCurveXL2RValue(
                            offsetCurvedAnimationBubble3.value),
                        getBubbleCurveYValue(
                            offsetCurvedAnimationBubble3.value)),
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
                      aVartar1Show = true;
                      setState(() {});
                      mAnimationController.reset();
                      mAnimationController.forward();// 执行动画
                      if(true) {
                        Future.delayed(Duration(milliseconds: 100), () {
                          aVartar2ShowBubbule = true;
                          setState(() {});
                          mAnimationControllerBubble2.reset();
                          mAnimationControllerBubble2.forward();
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          aVartar2Show = true;
                          setState(() {});
                          mAnimationController2.reset();
                          mAnimationController2.forward();
                        });
                      }
                      if(true) {
                        Future.delayed(Duration(milliseconds: 500), () {
                          aVartar3ShowBubbule = true;
                          setState(() {});
                          mAnimationControllerBubble3.reset();
                          mAnimationControllerBubble3.forward();
                        });
                        Future.delayed(Duration(milliseconds: 800), () {
                          aVartar3Show = true;
                          setState(() {});
                          mAnimationController3.reset();
                          mAnimationController3.forward();
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
                      aVartar1Show = false;
                      aVartar2Show = false;
                      aVartar2ShowBubbule = false;
                      aVartar3Show = false;
                      aVartar3ShowBubbule = false;
                      mAnimationController.reset();
                      mAnimationController2.reset();
                      mAnimationController3.reset();
                      mAnimationControllerBubble2.reset();
                      mAnimationControllerBubble3.reset();
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
                    if (aVartar1Show) buildRotationTransition(),
                    buildRotationTransition2(),
                    if (aVartar3Show) buildRotationTransition3(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

//自定义 一个曲线  当然 也可以使用SDK提供的 如： Curves.fastOutSlowIn    抖动
class MyCurve extends Curve {
  const MyCurve([this.period = 1]); //抖动频率
  final double period;

  @override
  double transformInternal(double t) {
    return t;
  }
}
