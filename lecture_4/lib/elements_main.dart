import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  bool isSwitched = false;
bool isChecked = false;

double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Interactive Widgets Example')),
        body: Builder(
          builder: (context) {
            return _getInteractiveWidgets(context);
          }
        ),
      ),
    );
  }
List allowdSliderValues = [0.0, 12.0, 20.0, 100.0, 200.0];
  Widget _getInteractiveWidgets(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(10),
            shadowColor: WidgetStateProperty.all(Colors.red.withOpacity(0.3)),


          ),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('ElevatedButton Pressed')),
          ),
          child: Text('ElevatedButton'),
        ),
        SizedBox(height: 10),
        // OutlinedButton(onPressed: onPressed, child: child),
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(10, 10),
              ),
              BoxShadow(
                color: Colors.red.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),

          child: TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              padding: WidgetStateProperty.all(EdgeInsets.all(0)),
            ),
            onPressed: () => print('TextButton Pressed'),
            child: Text('TextButton'),
          ),
        ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlutterSlider(
      values: [100,200,300,400,1000],
      max: 1000,
      min: 0,



      fixedValues: [FlutterSliderFixedValue(percent: 0, value: 100),
      FlutterSliderFixedValue(percent: 20, value: 200),
      FlutterSliderFixedValue(percent: 40, value: 300),
      FlutterSliderFixedValue(percent: 80, value: 400),FlutterSliderFixedValue(percent: 100, value: 1000)],

      trackBar: FlutterSliderTrackBar(

      inactiveTrackBar: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black12,
      border: Border.all(width: 3, color: Colors.blue),
      ),
      activeTrackBar: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.blue.withOpacity(0.5)
      ),
      ),
        onDragCompleted: (handlerIndex, lowerValue, upperValue) {
          setState(() {
            sliderValue = lowerValue;
          });
        },

      ),
    ),
        SizedBox(height: 10),
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
          ),
          iconSize: 24,
          icon: ClipOval(child: Image.network('https://picsum.photos/250?image=9',fit: BoxFit.contain,
          width: 30,height: 30,)),
          onPressed: () => print('IconButton Pressed'),
        ),
        Switch(
          value: isSwitched,
          inactiveThumbImage: NetworkImage('https://picsum.photos/250?image=30'),
          activeThumbImage: NetworkImage('https://picsum.photos/250?image=9'),


          activeColor: Colors.green,
          onChanged: (value) {
            print('Switch Value: $value');
            setState(() => isSwitched = value);
          },
        ),
        Checkbox(
          value: isChecked,

          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.green;
            }
            return Colors.red;
          }),
          onChanged: (bool? value) => setState(() => isChecked = value!),
        ),
        Theme(
          data: ThemeData(
            sliderTheme: SliderThemeData(
              thumbShape: CustomSliderThumbShape(),
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.green,
              thumbColor: Colors.blue,
              overlayColor: Colors.yellow.withOpacity(0.5),
              valueIndicatorColor: Colors.orange,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          child: Slider.adaptive(

            value: sliderValue,
            min: allowdSliderValues.first,
            max: allowdSliderValues.last,



            label: sliderValue.round().toString(),
            onChanged: (double value) {
              var closestValue = allowdSliderValues.reduce((a, b) {
                return (value - a).abs() < (value - b).abs() ? a : b;
              });
              setState(() => sliderValue = closestValue);
            },
          ),
        ),

        TextField(
          onTapOutside: (focusNode) => FocusScope.of(context).requestFocus(FocusNode()),
          decoration: InputDecoration(labelText: 'Enter Text',
labelStyle: TextStyle(color: Colors.blue),
            floatingLabelBehavior: FloatingLabelBehavior.always,
  hintText: 'Enter Text',

hintStyle: TextStyle(color: Colors.green),

suffix: Column(
  children: [
    SizedBox(height: 30,),
    SizedBox(
      width: 24,
      height: 24,
      child: Icon(Icons.search)),
    ]
),
            prefix: Text('+1'),
          ),
          obscuringCharacter: '&',
          keyboardType: TextInputType.number,
          inputFormatters: [MyInputFormmater()],
          obscureText: false,
          onChanged: (text) => print('TextField: $text'),
        ),
      ],
    );
  }
}


class MyInputFormmater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    //i want to add a - after every 3 digits
    if (newValue.text.length > oldValue.text.length) {
      if (newValue.text.length % 4 == 0) {
        return TextEditingValue(
          text: '${newValue.text}-',
          selection: TextSelection.collapsed(offset: newValue.text.length + 1),
        );
      }
      else{
        return newValue;
      }

    }
    return newValue;
  }
}


class CustomSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(40, 40); // גודל thumb מותאם
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // ציור thumb
    final Paint paint = Paint()..color = Colors.blue;
    canvas.drawCircle(center, 10, paint);

    // ציור טקסט מתחת ל-thumb
    TextSpan span = new TextSpan(
      style: new TextStyle(fontSize: 12, color: Colors.black),
      text: '${value.toStringAsFixed(1)}',
    );

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );

    tp.layout();
    Offset textOffset = Offset(center.dx - tp.width / 2, center.dy + 15); // טקסט מתחת ל-thumb
    tp.paint(canvas, textOffset);
  }
}