import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body:
      // AnimatedContainerExample()
      //     AnimatedOpacityExample()
      //     AnimatedPositionedExample()
      //   AnimatedSwitcherExample()
        Center(child:Text('Hello World', style: TextStyle(fontSize: 30),).animate(autoPlay: true)
            // .move(duration: Duration(seconds: 5), begin: Offset(0, 100),end: Offset(100, 200), curve: Curves.easeIn)
            .shake(
          duration: Duration(seconds: 2),)
            .rotate(duration: Duration(seconds: 3), begin: 0, end: 2 * pi, curve: Curves.easeInOut)
            // .scale(duration: Duration(seconds: 3), begin: Offset(0, 10),end: Offset(5, 20), curve: Curves.easeInOut)
        // )
        )
    // AnimatedCrossFadeExample()
    //   AnimatedGradientColors()
      // Center(child:AnimatedTriangleSize())
    // Center(child:  CustomPaint(
    //     size: Size(400, 400),
    //     painter: GradientPainter(),
    //
    //   ),),
      )
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class CustomPaintExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: CirclePainter(),
    );
  }
}


class GradientPainter extends CustomPainter {
  final double scale;
  final Color color1;
  final Color color2;
  GradientPainter({this.scale = 1.0,this.color1 =Colors.blue,this.color2 = Colors.purple});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [color1, color2],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    // final path = Path()
    //   ..moveTo(size.width * (1 - scale) / 2, size.height)
    //   ..lineTo(size.width / 2, size.height * (1 - scale))
    //   ..lineTo(size.width * (1 + scale) / 2, size.height)
    //   ..close();















    final path = Path()
    ..moveTo(size.width/2 * scale, size.height)
       ..quadraticBezierTo(size.width, size.height/2, size.width/2, size.height)
       ..addRect(Rect.fromLTWH(0, 0, 100* (1 - scale), size.height))
      ..addPolygon([
        Offset(size.width * (1) / 2, size.height),
        Offset(size.width / 2, size.height * (1 - scale)),
        Offset(size.width * (1 + scale) / 2, size.height),
        Offset(size.width * (1 + scale) / 2, size.height/2),
      ], true)
    ..close();

    canvas.drawPath(path, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        children: [
          TextSpan(
            text:String.fromCharCode(CupertinoIcons.delete.codePoint) ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
        text:'xkjfalsdkfjsdkfj\n' ,
        style: TextStyle(
          fontSize: 300 * scale,
          fontFamily: Icons.star.fontFamily,
          color: Colors.blue,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset((size.width / 2 - 50) * (1-scale), (size.height / 2 - 50)* (1-scale)));

// הטקסט לציור
    final text = 'טקסט בחצי עיגול';
    final textStyle2 = TextStyle(
      color: Colors.blue,
      fontSize: 10,
    );
// ציור העיגול
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // חישוב זווית התחלה
    final startAngle = pi; // תחילת הקשת מימין
    final sweepAngle = pi; // אורך חצי העיגול
    final charSpacing = sweepAngle / text.length;

    for (int i = text.length-1; i > 0; i--) {
      var color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(255);

      //shader for gradient




      // חישוב זווית לכל אות (מימין לשמאל)
      final angle = startAngle + i * charSpacing;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      // סיבוב האות בהתאם לזווית
      final index = text.length - i - 1;
      final char = text [index  ];
      final textPainter = TextPainter(
        text: TextSpan(text: char, style: textStyle2.copyWith(color: color)),

        textDirection: TextDirection.rtl, // מימין לשמאל
      )..layout();

      final textOffset = Offset(
        x - textPainter.width / 2,
        y - textPainter.height / 2,
      );
      //apply the paint







      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle + pi / 2); // התאמה לכיוון הקשת
      textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

      canvas.restore();
    }
  }
  @override
  bool shouldRepaint(covariant GradientPainter oldDelegate) =>
  oldDelegate.scale != scale || oldDelegate.color1 != color1 || oldDelegate.color2 != color2;
}
class GradientPaintExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: GradientPainter(),
    );
  }
}
class IconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.star.codePoint),
        style: TextStyle(
          fontSize: 100,
          fontFamily: Icons.star.fontFamily,
          color: Colors.amber,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 2 - 50, size.height / 2 - 50));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class IconPaintExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: IconPainter(),
    );
  }
}

class AnimatedTriangleSize extends StatefulWidget {
  @override
  _AnimatedTriangleSizeState createState() => _AnimatedTriangleSizeState();
}

class _AnimatedTriangleSizeState extends State<AnimatedTriangleSize>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          color: Colors.blue,
          width: _controller.value * 200,
          height: _controller.value * 200,
        );
        return CustomPaint(
          size: const Size(300, 300),
          painter: GradientPainter(scale: _controller.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




class AnimatedGradientColors extends StatefulWidget {
  @override
  _AnimatedGradientColorsState createState() => _AnimatedGradientColorsState();
}

class _AnimatedGradientColorsState extends State<AnimatedGradientColors>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> color1;
  late Animation<Color?> color2;
  late Animation<double> valuesTween;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    color1 = ColorTween(
      begin: Colors.blue,
      end: Colors.orange,
    ).animate(_controller);

    color2 = ColorTween(
      begin: Colors.purple,
      end: Colors.green,
    ).animate(_controller);
    
    valuesTween = Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut) );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {

        return
          Column(children: [
            Container(
              width: valuesTween.value,
              height: valuesTween.value,
              color: Colors.blue,
            ),
          CustomPaint(
          size: const Size(300, 300),
          painter: GradientPainter(
            color1: color1.value!,
            color2: color2.value!,
          ),

        )]
          );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}