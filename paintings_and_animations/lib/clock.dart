import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ClockScreen()));
}

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomPaint(
          painter: ClockPainter(_currentTime),
          size: Size(300, 300),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime time;
  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // ציור הרקע עם גרדיאנט
    final gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.blue.shade900, Colors.blue.shade400, Colors.blueAccent],
        stops: [0.1, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, gradientPaint);

    // ציור מרכז השעון
    final paintCenterDot = Paint()..color = Colors.white;
    canvas.drawCircle(center, 5, paintCenterDot);

    // ציור מחוגים
    _drawHand(canvas, center, radius * 0.6, time.hour * 30 + time.minute * 0.5, Colors.white, 6);
    _drawHand(canvas, center, radius * 0.8, time.minute * 6, Colors.blueAccent, 4);
    _drawHand(canvas, center, radius * 0.9, time.second * 6, Colors.red, 2);

    // ציור נקודות השעות 12, 3, 6, 9
    _drawHourMarkers(canvas, center, radius);
  }

  void _drawHand(Canvas canvas, Offset center, double length, double angle, Color color, double strokeWidth) {
    final radians = (angle - 90) * pi / 180;
    final handEnd = Offset(center.dx + length * cos(radians), center.dy + length * sin(radians));
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, handEnd, paint);
  }

  void _drawHourMarkers(Canvas canvas, Offset center, double radius) {
    final markerPaint = Paint()..color = Colors.white;
    final markerSize = 8.0;

    final hourPositions = [0, 90, 180, 270]; // 12, 3, 6, 9
    for (final angle in hourPositions) {
      final radians = (angle - 90) * pi / 180;
      final markerCenter = Offset(
        center.dx + (radius - 15) * cos(radians),
        center.dy + (radius - 15) * sin(radians),
      );
      canvas.drawCircle(markerCenter, markerSize, markerPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
