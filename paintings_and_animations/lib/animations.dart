import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: _isExpanded ? 200 : 100,
        height: _isExpanded ? 200 : 100,
        decoration: BoxDecoration(
          color:_isExpanded ? Colors.blue : Colors.red,
          shape: _isExpanded ? BoxShape.rectangle : BoxShape.circle,
          // borderRadius: BorderRadius.circular(_isExpanded ? 20 : 0),
        ),

      ),
    );
  }
}


class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedOpacity Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = _opacity == 1.0 ? 0.0 : 1.0;
                });
              },
              child: Text('Toggle Opacity'),
            ),
          ],
        ),
      ),
    );
  }
}



class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() => _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPositioned Example')),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            left: _isMoved ? 200 : 50,
            top: _isMoved ? 300 : 100,
            width: _isMoved ? 200 : 100,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isMoved = !_isMoved;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}


class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSwitcher Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _count % 3 == 0 ?

               Text(
                '$_count',
                key: ValueKey<int>(_count),
                style: TextStyle(fontSize: 50),
               ):
                  _count % 3 == 1 ?
                Container(
                  key: ValueKey<int>(_count),
                  width: 200,
                  height: 200,
                  child: Center(child: Text('$_count')),
                  color: Colors.blue,
                ) :
                Container(
                  key: ValueKey<int>(_count),
                  width: 200,
                  height: 200,
                  child: Center(child: Text('$_count')),
                  color: Colors.green,
                ),
              // child: Text(
              //   '$_count',
              //   key: ValueKey<int>(_count),
              //   style: TextStyle(fontSize: 50),
              // ),
              transitionBuilder: (child, animation) {
                var rotaitionAngle = Tween<double>(begin: 0, end: 2 * pi)
                    .animate(animation);
                return RotationTransition(
                  turns: rotaitionAngle,
                  child: child,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}


class AnimatedCrossFadeExample extends StatefulWidget {
  @override
  _AnimatedCrossFadeExampleState createState() => _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedCrossFade Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: Duration(seconds: 1),
              firstChild: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(child: Text('First')),
              ),
              secondChild: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: Center(child: Text('Second')),
              ),
              crossFadeState: _isFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isFirst = !_isFirst;
                });
              },
              child: Text('Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}

