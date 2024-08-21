class AddTaskDto {
  String title;
  DateTime datetime;
  AddTaskDto({required this.title, required this.datetime});

  Map<String, dynamic> toJson() => {
        'title': title,
        'dueDate': datetime.toIso8601String(),
      };
}
