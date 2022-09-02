import 'dart:async';

import 'package:eventplaner/rootwidget.dart';
import 'package:eventplaner/screens/welcomePage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math show sin, pi, sqrt;

class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
    
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "assets/Web 1920 – 1.png",
                width: animation.value * 550,
                height: animation.value * 550,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class CirclePainter extends CustomPainter {
//   CirclePainter(
//       this._animation, {
//         required this.color,
//       }) : super(repaint: _animation);
//   final Color color;
//   final Animation<double> _animation;
//   void circle(Canvas canvas, Rect rect, double value) {
//     final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
//     final Color _color = color.withOpacity(opacity);
//     final double size = rect.width / 2;
//     final double area = size * size;
//     final double radius = math.sqrt(area * value / 4);
//     final Paint paint = Paint()..color = _color;
//     canvas.drawCircle(rect.center, radius, paint);
//   }
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
//     for (int wave = 3; wave >= 0; wave--) {
//       circle(canvas, rect, wave + _animation.value);
//     }
//   }
//   @override
//   bool shouldRepaint(CirclePainter oldDelegate) => true;
// }

class CurveWave extends Curve {
  const CurveWave();
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}
