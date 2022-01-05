import 'package:flutter/material.dart';
import 'dart:math' as math;

class OffsetAnim extends StatefulWidget {
  @override
  _OffsetAnimState createState() => _OffsetAnimState();
}

class _OffsetAnimState extends State<OffsetAnim> with SingleTickerProviderStateMixin{
  //平移动画控制器
  late AnimationController mAnimationController;
  //提供一个曲线，使动画感觉更流畅
  late CurvedAnimation offsetCurvedAnimation;
  //平移动画
  late Animation<double> offsetAnim;
  late Animation<double> offsetAnim2;
  late Animation<double> offsetAnim3;
  late Animation<double> offsetAnim4;
  //执行时间  毫秒
  int _milliseconds = 500;
  int playCount = 0;

  @override
  void initState() {
    super.initState();
    mAnimationController = AnimationController(duration: Duration(milliseconds: _milliseconds), vsync: this);
    offsetCurvedAnimation = new CurvedAnimation( parent: mAnimationController, curve: new MyCurve());
    //offsetCurvedAnimation = new CurvedAnimation( parent: mAnimationController, curve: Curves.linear);
    offsetAnim = new Tween(begin: -10.0, end: 10.0).animate(offsetCurvedAnimation);
    //offsetAnim2 = new Tween(begin: 8.0, end: 0.0).animate(offsetCurvedAnimation);
    //offsetAnim3 = new Tween(begin: 0.0, end: -8.0).animate(offsetCurvedAnimation);
    //offsetAnim4 = new Tween(begin: -8.0, end: 0.0).animate(offsetCurvedAnimation);
    // //添加监听
    /*..addListener((){
      // print('object');
    })
    // 状态监听
    ..addStatusListener((status){
      // print("$status"); // 打印状态
      if (status == AnimationStatus.completed) {
        mAnimationController.reset(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
      }
      else if (status == AnimationStatus.dismissed) {
        if (playCount < 1) {
          mAnimationController.forward(); // 重新从头到尾播放
          playCount++;
        } else {
          playCount = 0;
        }
      }
    });*/
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
              RaisedButton(
                child: Text('data'),
                onPressed: (){
                  if (mAnimationController.status == AnimationStatus.completed) {
                    mAnimationController.reset(); // 动画为为完成状态时  重置 否则不可以调用forward
                  }
                  mAnimationController.forward(); // 执行动画
                  //mAnimationController.repeat(min: 1.0,max: 1000.0);
                },
              ),
              SizedBox(height: 100,),
              Container(
                  child: AnimatedBuilder(
                    animation: mAnimationController,//添加动画
                    builder: (context, _) {
                      return Transform.translate(
                        offset: Offset(offsetAnim.value,0),// 1,0 水平移动 -- 0,1垂直移动
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                        ),
                      );
                    },
                  )
              ),
            ],
          )
      ),
    );
  }
}

//自定义 一个曲线  当然 也可以使用SDK提供的 如： Curves.fastOutSlowIn    抖动
class MyCurve extends Curve{
  const MyCurve([this.period = 1]);//抖动频率
  final double period;

  @override
  double transformInternal(double t) {
    print("t is $t");
    final double s = period / 4.0;
    t = (1.2 * t - 1.0) * -1;
    //double d = -1 * math.pow(2.0, 5.0 * t) * math.sin((t - s) * (math.pi * 2.0) / period);
    double d = math.sin((t - s) * (math.pi * 2.5) / period);
    //double d = math.sin(t * (math.pi * 2.0) / period);
    return d;
  }
}