class Task {
  final int id;
  final String title;
  final String dueDate;
  final bool isComplate;

  Task(
      {required this.id,
      required this.dueDate,
      required this.isComplate,
      required this.title});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      dueDate: json['dueDate'],
      isComplate: json['isComplate'],
    );
  }
}
