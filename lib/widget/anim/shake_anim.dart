import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShakeAnim extends StatefulWidget {
  @override
  _ShakeAnimState createState() => _ShakeAnimState();
}

class _ShakeAnimState extends State<ShakeAnim> with SingleTickerProviderStateMixin{
  //平移动画控制器
  late AnimationController mAnimationController;

  @override
  void initState() {
    super.initState();
    mAnimationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    mAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("anim reverse");
        mAnimationController.repeat(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
      }
    });
  }

  Widget buildRotationTransition() {
    return Center(
      child: MeemoRotationTransition(
        //设置动画的旋转中心
        alignment: Alignment.center,
        //动画控制器
        turns: mAnimationController,
        //将要执行动画的子view
        child: Container(
          width: 100,
          height: 100,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100,),//
              Row(
                children: [
                  RaisedButton(
                    child: Text('触发动画'),
                    onPressed: (){
                      mAnimationController.reset();
                      mAnimationController.forward(); // 执行动画
                    },
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    child: Text('关闭'),
                    onPressed: (){
                      mAnimationController.reset();
                    },
                  ),
                ],
              ),

              SizedBox(height: 100,),
              buildRotationTransition(),
            ],
          )
      ),
    );
  }
}

class MeemoRotationTransition extends AnimatedWidget {
  /// Creates a rotation transition.
  ///
  /// The [turns] argument must not be null.
  const MeemoRotationTransition({
    Key? key,
    required Animation<double> turns,
    this.alignment = Alignment.center,
    this.filterQuality,
    this.child,
  }) : assert(turns != null),
        super(key: key, listenable: turns);

  /// The animation that controls the rotation of the child.
  ///
  /// If the current value of the turns animation is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  Animation<double> get turns => listenable as Animation<double>;

  /// The alignment of the origin of the coordinate system around which the
  /// rotation occurs, relative to the size of the box.
  ///
  /// For example, to set the origin of the rotation to top right corner, use
  /// an alignment of (1.0, -1.0) or use [Alignment.topRight]
  final Alignment alignment;

  /// The filter quality with which to apply the transform as a bitmap operation.
  ///
  /// {@macro flutter.widgets.Transform.optional.FilterQuality}
  final FilterQuality? filterQuality;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  double _getAngle(double value) {
    print("value is ${value}");
    if(value >= 0 && value <= 0.25) {
      return (turns.value * math.pi) / 15;
    }else if(value > 0.25 && value <= 0.5){
      return ((0.5 - turns.value) * math.pi) / 15;
    }else if(value > 0.25 && value <= 0.5){
      return -((turns.value - 0.5) * math.pi) / 15;
    }else if(value > 0.5  && value <= 1){
      return -((1 - turns.value) * math.pi) / 15;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _getAngle(turns.value),
      alignment: alignment,
      filterQuality: filterQuality,
      child: child,
    );
  }
}
