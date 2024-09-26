import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showAnimatedDialog(context);
              },
              child: Text("Show Custom Animated Dialog"),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                  final anchorPoint = renderBox.localToGlobal(Offset(200, 400));
                  showDialogAtAnchorPoint(context, anchorPoint);
                },
                child: Text("Show Dialog at Anchor Point"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// פונקציה המציגה דיאלוג עם אנימציה מותאמת אישית
void showAnimatedDialog(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
    opaque: false, // מבטיח שהרקע שמאחורי הדיאלוג יישאר שקוף

    barrierDismissible: false, // אפשרות לסגור את הדיאלוג בלחיצה מחוץ לו
    barrierColor: Colors.blue.withOpacity(0.5), // רקע כהה מאחורי הדיאלוג
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return CustomDialogContent(); // תכנים מותאמים לדיאלוג
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      // יצירת אנימציה מותאמת אישית לפתיחת הדיאלוג
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack, // אנימציית יציאה אחורה לפתיחה חלקה
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  ));
}

// תוכן הדיאלוג המותאם אישית
class CustomDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
          maxHeight: 400,
        ),
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Custom Animated Dialog",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "This dialog opens with a custom scale and fade animation.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // סגירת הדיאלוג ללא פעולה
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // סגירת הדיאלוג לאחר פעולה
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




void showDialogAtAnchorPoint(BuildContext context, Offset anchorPoint) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    pageBuilder: (context, animation1, animation2) {
      return Stack(
        children: [
          // Positioned widget to place the dialog at the specific anchor point.
          Positioned(
            left: anchorPoint.dx,
            top: anchorPoint.dy,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 200,
                height: 150,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('This is a dialog'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return FadeTransition(

        opacity: CurvedAnimation(
          parent: animation1,
          curve: Curves.easeInOut,
        ),
        child: ScaleTransition(
          scale: animation1,
          alignment: Alignment.topLeft,
          child: child,
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 20000),
  );

}