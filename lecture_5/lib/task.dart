class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  @override
  operator ==(Object other) {
    return other is Task && other.title == title && other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => title.hashCode;


  @override
  String toString() {
    return 'Task{title: $title, isCompleted: $isCompleted}';
  }


  Task copyWith({String? title, bool? isCompleted}) {
    return Task(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
