class Task {
  String tiltle;
  bool isDone;
  Task({required this.tiltle, this.isDone = false});

  void toggleTask() {
    isDone = !isDone;
  }
}
