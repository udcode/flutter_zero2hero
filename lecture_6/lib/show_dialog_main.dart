import 'dart:async';

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
        child: ElevatedButton(
          onPressed: () {
            showCustomDialog(context);
          },
          child: Text("Show Custom Dialog"),
        ),
      ),
    );
  }
}

// פונקציה שמציגה דיאלוג מותאם אישית עם הגדרות constraints
void showCustomDialog(BuildContext context) async{
  var size = MediaQuery.of(context).size;
  var res = await showDialog(
    context: context,

  barrierColor: Colors.green.withOpacity(0.5), // צבע של הרקע שמאחורי הדיאלוג
     barrierDismissible: true, // לא ניתן לסגור את הדיאלוג בלחיצה מחוץ לו
   builder: (context){
      // Timer(Duration(seconds: 3), () {
      //   Navigator.of(context).pop(false);
      // });
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 400, // גובה מקסימלי לדיאלוג
            maxWidth: 300,  // רוחב מקסימלי לדיאלוג
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // להתאים את גובה הדיאלוג לתוכן
              children: [
                Text(
                  "This is a custom dialog",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text("You can customize the size, layout, and behavior of this dialog."),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false); // סגירת הדיאלוג ללא פעולה
                      },
                      child: Text("sdfsfs"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true); // סגירת הדיאלוג לאחר פעולה
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Dialog result: $res"),
    ),
  );
}
