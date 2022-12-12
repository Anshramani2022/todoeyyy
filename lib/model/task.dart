class Task {
  final String? task;
  final String? deadline;
  final String? date;
  bool isDone = false;

  Task({this.deadline, this.task, this.date});

  void toggleDone() {
    isDone = !isDone;
  }
}
