import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BouncingBallScreen()));
}

class BouncingBallScreen extends StatefulWidget {
  @override
  _BouncingBallScreenState createState() => _BouncingBallScreenState();
}

class _BouncingBallScreenState extends State<BouncingBallScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _positionAnimation = Tween<double>(begin: 300, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuad, // אפקט קפיצה חלק
      ),
    );

    _sizeAnimation = Tween<double>(begin: 50, end: 30).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // דחיסה מהירה בנחיתה
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // כדור קופץ
                Positioned(
                  bottom: _positionAnimation.value,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipPath(
                      clipper: CircleClipper(),
                      child: Container(
                        width: _sizeAnimation.value,
                        height: _sizeAnimation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[300],
                        ),
                      ),
                    ),
                  ),
                ),
                // רצפה
                Positioned(
                  bottom: 4,
                  child: Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.brown,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CircleClipper  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}