import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../task.dart';

class TaskState2 extends InheritedWidget {

  final String textPage1;
  final Function changeText;

  TaskState2({
    Key? key,
    required this.textPage1,
    required this.changeText,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(TaskState2 oldWidget) {

    var isChanged = oldWidget.textPage1 != textPage1;
    return isChanged;
  }

  static TaskState2? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskState2>();
  }
}
